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
        if self.a<=0 or self.g<=0 or self.c<=0 or self.capacity<0:
            raise ValueError('a,g,c positive; capacity nonnegative')
        q0=self.qbar+self.a*np.asarray(d)
        if not np.all((q0>=0)&(q0<=1)):
            raise ValueError('Applicant probability outside [0,1]')
        if not np.all(self.rbar+np.asarray(d)>0):
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

def stock(d,p=Parameters(),legacy=4.,new=1.,old_risk=.10,elasticity=0.):
    if legacy<=0 or new<=0 or not 0<=old_risk<=1: raise ValueError('Invalid portfolio')
    q=solve(d,p)[1]; b=new*np.exp(-elasticity*np.asarray(d)); w=b/(legacy+b)
    return (1-w)*old_risk+w*q

def stock_slope(d,p=Parameters(),legacy=4.,new=1.,old_risk=.10,elasticity=0.):
    q=solve(d,p)[1]; b=new*np.exp(-elasticity*d); w=b/(legacy+b)
    return w*(risk_slope(d,p)-elasticity*(1-w)*(q-old_risk))
