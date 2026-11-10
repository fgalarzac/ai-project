"""All final figures and numbers; independent checks of P1--P3, deterministic."""
from pathlib import Path
from dataclasses import replace
import csv,json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import sympy as sp
from scipy.optimize import minimize_scalar,brentq
from model import Parameters,solve,profit,regime,risk_slope,opacity,stock,stock_slope
HERE=Path(__file__).resolve().parent
OUT,FIG=HERE/'output',HERE/'figures'
OUT.mkdir(exist_ok=True); FIG.mkdir(exist_ok=True)
CHECKS=[]
def check(x,label):
    if not bool(x): raise RuntimeError(label)
    CHECKS.append(label)
def save(fig,name):
    fig.tight_layout()
    fig.savefig(FIG/f'{name}.pdf',metadata={'CreationDate':None,'ModDate':None})
    fig.savefig(FIG/f'{name}.png',dpi=170)
    plt.close(fig)
def axis(ax,title,x,y):
    ax.set(title=title,xlabel=x,ylabel=y); ax.spines[['top','right']].set_visible(False); ax.grid(alpha=.18)

def main():
    e,g,c,R,q0,u=sp.symbols('e g c R q0 u',real=True)
    pi=(1-q0+g*e)*R-c*e**2/2; z=g*R/c
    check(sp.diff(pi,e,2)==-c,'P1: strict concavity c>0')
    check(sp.simplify(pi-pi.subs(e,z)+c*(e-z)**2/2)==0,'P1: completing square')
    d,a,qbar,rbar=sp.symbols('d a qbar rbar',real=True)
    q=qbar+a*d-g**2*(rbar+d)/c
    check(sp.simplify(sp.diff(q,d)-(a-g**2/c))==0,'P1: interior slope')
    check(sp.diff(qbar+a*d-g*u,d)==a,'P1: capacity slope')
    check(sp.simplify(qbar+a*d-g*(qbar+a*d)/g)==0,'P1: risk floor')
    k,sg,sc=sp.symbols('k sg sc',real=True); hk=sp.exp((2*sg-sc)*k)
    check(sp.simplify(sp.diff(hk,k)/hk-(2*sg-sc))==0,'P2: leverage log derivative')
    w=sp.Function('w')(d); qo=sp.Function('q')(d); m=sp.symbols('m')
    check(sp.simplify(sp.diff((1-w)*m+w*qo,d)-w*sp.diff(qo,d)-sp.diff(w,d)*(qo-m))==0,'P3: stock identity')
    B,B0,eps=sp.symbols('B B0 eps',positive=True); we=B*sp.exp(-eps*d)/(B0+B*sp.exp(-eps*d))
    check(sp.simplify(sp.diff(we,d)+eps*we*(1-we))==0,'P3: volume derivative')
    rng=np.random.default_rng(20261110); maxgap=0.; maxfd=0.; counts={}
    for _ in range(1500):
        dv=float(rng.uniform(-.08,.08))
        p=Parameters(qbar=float(rng.uniform(.015,.8)),a=float(rng.uniform(.03,.7)),g=float(rng.uniform(.03,1.2)),
                     c=float(rng.uniform(.1,4)),capacity=float(rng.uniform(.005,1.5)))
        try: p.validate(dv)
        except ValueError: continue
        ev,qv=solve(dv,p); upper=min(p.capacity,(p.qbar+p.a*dv)/p.g)
        opt=minimize_scalar(lambda x:-profit(x,dv,p),bounds=(0,upper),method='bounded',options={'xatol':1e-13})
        check(opt.success,'P1: independent optimizer converged')
        en=max([0.,upper,opt.x],key=lambda x:profit(x,dv,p)); maxgap=max(maxgap,abs(en-ev))
        check(-1e-12<=qv<=1+1e-12 and 0<=ev<=upper+1e-12,'P1: feasible optimizer')
        rr=regime(dv,p); counts[rr]=counts.get(rr,0)+1
        try:
            if regime(dv-1e-6,p)==rr==regime(dv+1e-6,p) and rr!='kink':
                fd=(solve(dv+1e-6,p)[1]-solve(dv-1e-6,p)[1])/2e-6
                maxfd=max(maxfd,abs(fd-risk_slope(dv,p)))
        except ValueError: pass
    check(maxgap<2e-6,'P1: independent bounded optimizer')
    check(maxfd<2e-8,'P1: finite-difference regime slopes')
    check(all(counts.get(s,0)>10 for s in ['interior','capacity','risk_floor']),'P1: every regime covered')
    check(solve(0,replace(Parameters(),capacity=0))[0]==0,'P1: zero capacity')
    rejected=0
    for p in [Parameters(c=0),Parameters(g=-1),Parameters(capacity=-1),Parameters(qbar=1.1),Parameters(rbar=-1)]:
        try: solve(0,p)
        except ValueError: rejected+=1
    check(rejected==5,'Invalid economic domains fail')
    ks=np.linspace(0,1,1001); ds=np.linspace(-.1,.1,121)
    threshold=np.log(.18/.05)/2
    root=brentq(lambda x:opacity(x).a-opacity(x).g**2/opacity(x).c,0,1)
    check(0<threshold<1 and abs(root-threshold)<1e-12,'P2: independent threshold root')
    betas=np.array([risk_slope(0,opacity(x)) for x in ks])
    check(np.all(np.diff(betas)<0) and betas[0]>0>betas[-1],'P2: unique crossing')
    ee_all=[];qq_all=[]
    for kv in ks:
        p=opacity(kv);ee,qq=solve(ds,p)
        check(np.all(ee>0)&np.all(ee<p.capacity)&np.all(qq>0)&np.all(qq<1),'P2: feasible interior rectangle')
        ee_all.extend(ee);qq_all.extend(qq)
    alt=np.array([risk_slope(0,opacity(x,alternative=True)) for x in ks])
    cap=np.array([risk_slope(0,opacity(x,capacity=.08)) for x in ks])
    check(np.all(alt>0),'P2: worsening technology without reversal')
    check(np.all(cap>0),'P1/P2: capacity removes negative slope')
    fig,axs=plt.subplots(1,2,figsize=(9,3.5))
    axs[0].plot(ks,[opacity(x).a for x in ks],label='Selección a')
    axs[0].plot(ks,[opacity(x).g**2/opacity(x).c for x in ks],label='Evaluación g²/c')
    axs[0].axvline(root,ls=':',color='black');axs[0].legend(frameon=False)
    axis(axs[0],'Fuerzas rivales','Opacidad κ (índice)','Probabilidad / unidad de tasa')
    for vals,label,ls in [(betas,'Tecnología favorable','-'),(alt,'Tecnología que empeora','--'),(cap,'Capacidad limitada',':')]:
        axs[1].plot(ks,vals,label=label,ls=ls)
    axs[1].axhline(0,color='grey',lw=.8);axs[1].legend(frameon=False,fontsize=8)
    axis(axs[1],'El cruce depende de supuestos','Opacidad κ (índice)','Pendiente dq*/dD')
    save(fig,'mechanisms')
    pc=Parameters(qbar=.35,a=.04,g=.4,c=1,capacity=.44)
    pf=Parameters(qbar=.04,a=.04,g=.5,c=1,capacity=1)
    check(abs(pc.c*pc.capacity/pc.g-pc.rbar)<1e-12,'P1: capacity kink at D=0')
    check(risk_slope(-.05,pc)<0<risk_slope(.05,pc),'P1: opposite one-sided slopes')
    check(regime(0,pf)=='risk_floor' and abs(solve(0,pf)[1])<1e-12,'P1: zero-risk boundary')
    fig,axs=plt.subplots(1,2,figsize=(9,3.5))
    for p,label in [(pc,'Capacidad'),(pf,'Piso de riesgo')]:
        ee,qq=solve(ds,p);axs[0].plot(100*ds,ee,label=label);axs[1].plot(100*ds,100*qq,label=label)
    for ax in axs: ax.axvline(0,color='grey',ls=':');ax.legend(frameon=False)
    axis(axs[0],'Esfuerzo óptimo restringido','Precio relativo D (pp anuales)','Esfuerzo (índice)')
    axis(axs[1],'Riesgo de la cohorte','Precio relativo D (pp anuales)','Probabilidad de atraso (%)')
    save(fig,'corners')
    p=opacity(0);bs=risk_slope(0,p);ms=stock_slope(0,p,elasticity=3)
    check(abs(solve(0,p)[1]-9/40)<1e-14 and abs(bs-13/100)<1e-14 and abs(ms+17/500)<1e-14,
          'P3: numerical counterexample agrees with exact rational constants in paper and Lean')
    check(bs>0>ms,'P3: composition counterexample with opposite signs')
    maxstock=0.
    for kv in np.linspace(0,1,51):
        for el in [0.,.5,3.,8.]:
            p=opacity(kv)
            for dv in np.linspace(-.09,.09,25):
                fd=(stock(dv+1e-6,p,elasticity=el)-stock(dv-1e-6,p,elasticity=el))/2e-6
                maxstock=max(maxstock,abs(fd-stock_slope(dv,p,elasticity=el)))
    check(maxstock<1e-8,'P3: independent finite-difference stock slope')
    p=opacity(0);fig,axs=plt.subplots(1,2,figsize=(9,3.5))
    axs[0].plot(100*ds,100*solve(ds,p)[1]);axis(axs[0],'Selección domina en originación','D (pp anuales)','Probabilidad de atraso (%)')
    for el in [0,3]: axs[1].plot(100*ds,100*stock(ds,p,elasticity=el),label=f'Elasticidad ε = {el}')
    axis(axs[1],'La composición cambia el signo','D (pp anuales)','Ratio esperado de cartera (%)')
    axs[1].legend(frameon=False);save(fig,'stock_composition')
    gm=np.linspace(.5,1.8,100);caps=np.linspace(.04,.65,100)
    Z=np.array([[risk_slope(0,replace(opacity(.9),g=opacity(.9).g*x,capacity=ca)) for x in gm] for ca in caps])
    fig,ax=plt.subplots(figsize=(6.5,3.7));im=ax.pcolormesh(gm,caps,Z,cmap='RdBu_r',vmin=-.2,vmax=.2,shading='auto')
    fig.colorbar(im,ax=ax,label='Pendiente dq*/dD')
    axis(ax,'Sensibilidad de tecnología y capacidad (κ=0.9)','Multiplicador de productividad g','Capacidad (índice)');save(fig,'sensitivity')
    with (HERE/'data'/'bcrp_2024_table_2_2.csv').open(encoding='utf-8',newline='') as f: public=list(csv.DictReader(f))
    check(len(public)==4 and [float(x['sep2024']) for x in public]==[9.8,16.3,15.2,4.7],'Public context frozen transcription')
    fig,ax=plt.subplots(figsize=(7.6,3.5))
    for row in public:
        ax.plot(['Set. 2023','Mar. 2024','Set. 2024'],[float(row[x]) for x in ['sep2023','mar2024','sep2024']],marker='o',label=row['segment'])
    axis(ax,'Contexto del sistema financiero peruano','Observación','CAR ajustada por castigos (%)');ax.legend(frameon=False,ncol=2);save(fig,'public_context')
    rates=np.array([.08,.09,.10,.25]);own=.12;base=.0425
    mean_signal=own-rates.mean();median_signal=own-np.median(rates)
    check(abs(own-base-np.mean(rates-base)-mean_signal)<1e-14,'Peer mean cancels common base')
    check(abs(own-base-np.median(rates-base)-median_signal)<1e-14,'Peer median cancels common base')
    check(mean_signal<0<median_signal,'Hypothetical mean/median signal sign changes')
    numbers=dict(threshold=threshold,beta0=float(betas[0]),beta1=float(betas[-1]),min_effort=min(ee_all),max_effort=max(ee_all),
                 min_risk=min(qq_all),max_risk=max(qq_all),max_optimizer_gap=maxgap,max_derivative_gap=maxfd,
                 max_stock_derivative_gap=maxstock,cohort_slope=bs,stock_slope=ms,regime_counts=counts,
                 mean_signal_pp=100*mean_signal,median_signal_pp=100*median_signal,seed=20261110,
                 checks_passed=len(CHECKS),check_families=sorted(set(CHECKS)))
    (OUT/'verification.json').write_text(json.dumps(numbers,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
    macros=dict(threshold=f'{threshold:.3f}',betaZero=f'{betas[0]:.3f}',betaOne=f'{betas[-1]:.3f}',
                riskMin=f'{100*min(qq_all):.2f}',riskMax=f'{100*max(qq_all):.2f}',effortMin=f'{min(ee_all):.3f}',
                effortMax=f'{max(ee_all):.3f}',cohortSlope=f'{bs:.3f}',stockSlope=f'{ms:.3f}')
    (OUT/'numbers.tex').write_text('\n'.join('\\newcommand{\\'+n+'}{'+v+'}' for n,v in macros.items())+'\n',encoding='utf-8')
    print(json.dumps({k:v for k,v in numbers.items() if k!='check_families'},indent=2,ensure_ascii=False))
    print('PASS: P1--P3, corners, counterexamples, sensitivity and five final figures.')
