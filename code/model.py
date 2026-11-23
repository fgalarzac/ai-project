"""Conditional screening. Annual decimal rates, arbitrary balance units.
No data fitting or equilibrium pricing is implemented here.
"""
from dataclasses import dataclass
import numpy as np

@dataclass(frozen=True)
class Parameters:
    qbar: float = .28
    a: float = .18
    g: float = float(np.sqrt(.05))
    c: float = 1.
    capacity: float = .5
    rbar: float = 1.10

    def validate(self,d):
        primitives=[self.qbar,self.a,self.g,self.c,self.capacity,self.rbar]
        if not np.all(np.isfinite(primitives)) or not 0<self.qbar<1:
            raise ValueError('Finite primitives and reference probability strictly in (0,1) required')
        if self.a<=0 or self.g<=0 or self.c<=0 or self.capacity<0:
            raise ValueError('a,g,c positive; capacity nonnegative')
        prices=np.asarray(d,dtype=float)
        if not prices.size or not np.all(np.isfinite(prices)):
            raise ValueError('At least one finite price required')
        q0=self.qbar+self.a*prices
        if not np.all((q0>=0)&(q0<=1)):
            raise ValueError('Applicant probability outside [0,1]')
        if not np.all(self.rbar+prices>0):
            raise ValueError('Gross payoff must be positive')

def solve(d,p=Parameters()):
    p.validate(d)
    q0=p.qbar+p.a*np.asarray(d)
    upper=np.minimum(p.capacity,q0/p.g)
    effort=np.minimum(p.g*(p.rbar+np.asarray(d))/p.c,upper)
    return effort,q0-p.g*effort

def profit(e,d,p=Parameters()):
    return (1-p.qbar-p.a*np.asarray(d)+p.g*np.asarray(e))*(p.rbar+np.asarray(d))-p.c*np.asarray(e)**2/2

def regime(d,p=Parameters(),tol=1e-9):
    p.validate(d)
    q0=p.qbar+p.a*d
    upper=min(p.capacity,q0/p.g)
    z=p.g*(p.rbar+d)/p.c
    if p.capacity==0: return 'no_capacity'
    if abs(z-upper)<tol or abs(p.capacity-q0/p.g)<tol: return 'kink'
    if z<upper: return 'interior'
    return 'capacity' if p.capacity<q0/p.g else 'risk_floor'

def risk_slope(d,p=Parameters()):
    r=regime(d,p)
    if r=='kink': raise ValueError('Use one-sided derivatives at kinks')
    return p.a-p.g**2/p.c if r=='interior' else 0. if r=='risk_floor' else p.a

def opacity(k,alternative=False,capacity=.5):
    return Parameters(a=.18*np.exp(-.8*k),g=np.sqrt(.05)*np.exp((-.4 if alternative else .8)*k),
                      c=np.exp(.4*k),capacity=capacity)

def _cohort_weight(d,legacy,new,old_risk,elasticity):
    """Exponential-balance case of S5; elasticity is the semielasticity epsilon."""
    if (not np.all(np.isfinite([legacy,new,old_risk,elasticity])) or
        legacy<=0 or new<=0 or not 0<=old_risk<=1 or elasticity<0):
        raise ValueError('Positive finite balances, valid old risk and nonnegative epsilon required')
    with np.errstate(over='raise',invalid='raise'):
        try:
            b=new*np.exp(-elasticity*np.asarray(d))
            total=legacy+b
        except FloatingPointError as exc:
            raise ValueError('Balance outside floating-point range') from exc
    if not np.all(np.isfinite(b)) or not np.all(b>0) or not np.all(np.isfinite(total)):
        raise ValueError('New balance must remain finite and strictly positive')
    return b/total


def stock(d,p=Parameters(),legacy=4.,new=1.,old_risk=.10,elasticity=0.):
    q=solve(d,p)[1]; w=_cohort_weight(d,legacy,new,old_risk,elasticity)
    return (1-w)*old_risk+w*q

def stock_slope(d,p=Parameters(),legacy=4.,new=1.,old_risk=.10,elasticity=0.):
    q=solve(d,p)[1]; w=_cohort_weight(d,legacy,new,old_risk,elasticity)
    return w*(risk_slope(d,p)-elasticity*(1-w)*(q-old_risk))
