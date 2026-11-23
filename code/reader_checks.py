"""Additional source-domain and P3 frontier checks, preserving the 4018 baseline."""
from dataclasses import replace
from fractions import Fraction
from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from model import Parameters, solve, stock, stock_slope, opacity


def main():
    root=Path(__file__).resolve().parent
    passed=[]
    def require(condition,label):
        if not condition: raise RuntimeError(label)
        passed.append(label)
    # These formerly could pass the q0-at-D check despite violating S1.
    for qbar,d in [(0.,.1),(-.1,1.),(1.,-.1),(1.1,-1.)]:
        try: solve(d,replace(Parameters(),qbar=qbar))
        except ValueError: rejected=True
        else: rejected=False
        require(rejected,'S1 rejects inadmissible reference probability '+str(qbar))
    for field,value in [('c',float('nan')),('g',float('inf')),('capacity',float('inf'))]:
        try: solve(0,replace(Parameters(),**{field:value}))
        except ValueError: rejected=True
        else: rejected=False
        require(rejected,'Finite primitive '+field)
    for price in [float('nan'),float('inf'),[]]:
        try: solve(price)
        except ValueError: rejected=True
        else: rejected=False
        require(rejected,'Finite nonempty price '+str(price))
    for fn in [stock,stock_slope]:
        for args in [dict(legacy=0),dict(new=0),dict(old_risk=1.1),dict(elasticity=-1),dict(new=float('inf'))]:
            try: fn(0,**args)
            except ValueError: rejected=True
            else: rejected=False
            require(rejected,'S5 domain '+fn.__name__+' '+str(args))
    q,m,beta,w,epsilon=map(Fraction,['9/40','1/10','13/100','1/5','3'])
    cutoff=beta/((1-w)*(q-m))
    require(w*(beta-epsilon*(1-w)*(q-m))==Fraction(-17,500),'Exact P3 counterexample')
    require(cutoff==Fraction(13,10),'Exact epsilon cutoff at weight one fifth')
    # Change the balance ratio to realize each w at D=0. Verify both sides and
    # the equality frontier through the independently implemented ledger slope.
    for weight in np.linspace(.05,.85,17):
        edge=float(beta)/((1-weight)*float(q-m))
        legacy=(1-weight)/weight
        for multiplier,expected in [(.75,1),(1.,0),(1.25,-1)]:
            slope=stock_slope(0,opacity(0),legacy=legacy,new=1,elasticity=edge*multiplier)
            require(abs(slope)<1e-12 if expected==0 else slope*expected>0,
                    f'P3 frontier w={weight:.2f}, epsilon/cutoff={multiplier:.2f}')
    weights=np.linspace(.01,.85,250)
    edges=float(beta/(q-m))/(1-weights)
    fig,ax=plt.subplots(figsize=(7,3.7))
    ax.fill_between(weights,0,np.minimum(edges,6),color='#dce8f0',label="M' > 0")
    ax.fill_between(weights,np.minimum(edges,6),6,color='#f4dfd0',label="M' < 0")
    ax.plot(weights,edges,color='#183754',lw=1.8,label="M' = 0")
    ax.scatter([.2,.2],[3,0],color=['#b65f29','#183754'],zorder=3)
    ax.annotate('Contraejemplo',(.2,3),xytext=(.3,3.7),arrowprops=dict(arrowstyle='->'))
    ax.annotate('Peso fijo',(.2,0),xytext=(.28,.55),arrowprops=dict(arrowstyle='->'))
    ax.set(xlim=(0,.85),ylim=(0,6),xlabel='Peso de la cohorte nueva w',
           ylabel='Semielasticidad del saldo ε (por unidad de D)',
           title='P3: la inversión exige ε > 1.04 / (1 − w)')
    ax.legend(frameon=False,ncol=3,loc='upper left')
    fig.tight_layout()
    fig.savefig(root/'figures/composition_frontier.pdf',metadata={'CreationDate':None})
    fig.savefig(root/'figures/composition_frontier.png',dpi=180)
    plt.close(fig)
    demo=opacity(0);demo_effort,demo_risk=solve(0,demo)
    result={'additional_checks_passed':len(passed),'checks':passed,
            'worked_example':{'q0':demo.qbar,'R':demo.rbar,'effort':float(demo_effort),
                'probability_effort_bound':demo.qbar/demo.g,'q_star':float(demo_risk),
                'selection_change_for_one_pp':.01*demo.a,
                'evaluation_change_for_one_pp':.01*demo.g**2/demo.c,
                'net_risk_change_for_one_pp':.01*(demo.a-demo.g**2/demo.c)},
            'epsilon_cutoff_at_w_0_2':str(cutoff),'counterexample_slope':str(Fraction(-17,500)),
            'frontier':'epsilon = 1.04/(1-w); beta_D=0.13, q*-m0=0.125',
            'historical_baseline_checks':4018,'scope':'Same model and Proposition 3; no empirical fitting'}
    (root/'output/reader_verification.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(f'PASS: {len(passed)} additional checks; P3 frontier and source-domain validation.')


if __name__=='__main__':
    main()
