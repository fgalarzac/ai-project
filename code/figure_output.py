"""Publish the same computed figures in Spanish and English."""
from pathlib import Path
import re
import matplotlib.pyplot as plt
from matplotlib.text import Text

TRANSLATIONS = {
    'Selección a': 'Selection a',
    'Evaluación g²/c': 'Screening g²/c',
    'Fuerzas rivales': 'Competing mechanisms',
    'Opacidad κ (índice)': 'Opacity κ (index)',
    'Probabilidad / unidad de tasa': 'Probability / unit of the rate',
    'Tecnología favorable': 'Favourable technology',
    'Tecnología que empeora': 'Deteriorating technology',
    'Capacidad limitada': 'Limited capacity',
    'El cruce depende de supuestos': 'Crossing depends on the assumptions',
    'Pendiente dq*/dD': 'Slope dq*/dD',
    'Capacidad': 'Capacity',
    'Piso de riesgo': 'Risk floor',
    'Esfuerzo óptimo restringido': 'Constrained optimal effort',
    'Precio relativo D (pp anuales)': 'Relative loan rate D (annual pp)',
    'Esfuerzo (índice)': 'Effort (index)',
    'Riesgo de la cohorte': 'Cohort credit risk',
    'Probabilidad de atraso (%)': 'Delinquency probability (%)',
    'Selección domina en originación': 'Selection dominates at origination',
    'D (pp anuales)': 'D (annual pp)',
    'La composición cambia el signo': 'Composition can reverse the sign',
    'Ratio esperado de cartera (%)': 'Expected portfolio ratio (%)',
    'Sensibilidad de tecnología y capacidad (κ=0.9)': 'Technology and capacity sensitivity (κ=0.9)',
    'Multiplicador de productividad g': 'Multiplier of screening productivity g',
    'Capacidad (índice)': 'Capacity (index)',
    'Sistema': 'Financial system',
    'MYPE': 'Micro and small firms',
    'Consumo': 'Consumer loans',
    'Hipotecario': 'Mortgage loans',
    'Set. 2023': 'Sep. 2023',
    'Mar. 2024': 'Mar. 2024',
    'Set. 2024': 'Sep. 2024',
    'Calidad de cartera por segmento, 2023–2024': 'Portfolio quality by segment, 2023–2024',
    'CAR ajustada (%)': 'Adjusted high-risk portfolio (%)',
    'Contraejemplo': 'Counterexample',
    'Peso fijo': 'Fixed weight',
    'Peso de la cohorte nueva w': 'Weight of the new cohort w',
    'Semielasticidad del saldo ε (por unidad de D)': 'Balance semi-elasticity ε (per unit of D)',
    'P3: la inversión exige ε > 1.04 / (1 − w)': 'P3: reversal requires ε > 1.04 / (1 − w)',
}


def english(text):
    if text in TRANSLATIONS:
        return TRANSLATIONS[text]
    return re.sub(r'^Semielasticidad ε = ', 'Semi-elasticity ε = ', text)


def save_figure(fig, directory, name):
    """Preserve data; translate visible text and fit the English labels."""
    directory = Path(directory)
    if name != 'public_context':
        fig.tight_layout()
    meta = {'CreationDate': None, 'ModDate': None}
    fig.savefig(directory / f'{name}.pdf', metadata=meta)
    fig.savefig(directory / f'{name}.png', dpi=180)
    for item in fig.findobj(match=Text):
        item.set_text(english(item.get_text()))
    if name == 'public_context':
        fig.axes[0].set_xticks([0,1,2], ['Sep. 2023','Mar. 2024','Sep. 2024'])
    if name != 'public_context':
        fig.tight_layout()
    fig.savefig(directory / f'{name}_en.pdf', metadata=meta)
    fig.savefig(directory / f'{name}_en.png', dpi=180)
    plt.close(fig)
