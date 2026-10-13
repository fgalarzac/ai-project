"""Verify the topic model's screening FOC and opacity-threshold proposition.

Run from the repository root:

    python code/verify.py

The script fails if a symbolic identity, threshold sign, monotonicity claim,
interiority condition, or probability bound used in the topic proposal fails.
It writes a diagnostic table and the figure used in the topic slides.
"""
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import sympy as sp

HERE = Path(__file__).resolve().parent
(HERE / "output").mkdir(exist_ok=True)
(HERE / "figures").mkdir(exist_ok=True)


# 1. Symbolic solution of the continuation screening problem.
q_bar, a, g, c, r_bar, d, e, fixed_cost = sp.symbols(
    "q_bar a g c r_bar d e fixed_cost", positive=True
)
q0 = q_bar + a * d
repayment = r_bar + d
profit = (1 - q0 + g * e) * repayment - fixed_cost - c * e**2 / 2
foc = sp.diff(profit, e)
soc = sp.diff(profit, e, 2)
e_star = sp.solve(foc, e)[0]
q_star = sp.simplify(q0 - g * e_star)
beta = sp.simplify(sp.diff(q_star, d))

assert sp.simplify(foc - (g * repayment - c * e)) == 0
assert soc == -c
assert sp.simplify(e_star - g * repayment / c) == 0
assert sp.simplify(q_star - (q_bar + a * d - g**2 * repayment / c)) == 0
assert sp.simplify(beta - (a - g**2 / c)) == 0
print(f"symbolic e* = {e_star}; SOC = {soc}; dq*/dD = {beta}")


# 2. Transparent calibration. Opacity lowers sorting and raises screening
# leverage, while screening cost is itself allowed to rise.
KAPPA = np.linspace(0.0, 1.0, 1001)
D_GRID = np.linspace(-0.10, 0.10, 81)

A0, S_A = 0.18, 0.80
G0, S_G = np.sqrt(0.05), 0.80
C0, S_C = 1.00, 0.40
Q_BAR, R_BAR, E_MAX = 0.28, 0.90, 0.50


def selection(kappa: np.ndarray) -> np.ndarray:
    """Adverse-selection slope a(kappa)."""
    return A0 * np.exp(-S_A * kappa)


def information_gain(kappa: np.ndarray) -> np.ndarray:
    """Marginal quality gain g(kappa) from screening effort."""
    return G0 * np.exp(S_G * kappa)


def screening_cost(kappa: np.ndarray) -> np.ndarray:
    """Marginal-cost shifter c(kappa)."""
    return C0 * np.exp(S_C * kappa)


def leverage(kappa: np.ndarray) -> np.ndarray:
    """Screening leverage h(kappa) = g(kappa)^2 / c(kappa)."""
    return information_gain(kappa) ** 2 / screening_cost(kappa)


a_values = selection(KAPPA)
h_values = leverage(KAPPA)
beta_values = a_values - h_values

# Closed-form threshold for the exponential calibration.
S_H = 2 * S_G - S_C
kappa_star = np.log(A0 / (G0**2 / C0)) / (S_A + S_H)
assert 0.0 < kappa_star < 1.0
assert beta_values[0] > 0 and beta_values[-1] < 0
assert np.all(np.diff(a_values) < 0)
assert np.all(np.diff(h_values) > 0)
assert np.all(np.diff(beta_values) < 0)
assert abs(selection(kappa_star) - leverage(kappa_star)) < 1e-12


# 3. Check the maintained interiority and probability restrictions on a grid.
rows = []
for kappa in KAPPA:
    a_val = float(selection(kappa))
    g_val = float(information_gain(kappa))
    c_val = float(screening_cost(kappa))
    h_val = float(leverage(kappa))
    for d_val in D_GRID:
        repayment_val = R_BAR + d_val
        e_val = g_val * repayment_val / c_val
        q0_val = Q_BAR + a_val * d_val
        q_val = q0_val - h_val * repayment_val
        rows.append(
            {
                "kappa": kappa,
                "D": d_val,
                "a": a_val,
                "g": g_val,
                "c": c_val,
                "h": h_val,
                "beta": a_val - h_val,
                "e_star": e_val,
                "q0": q0_val,
                "q_star": q_val,
            }
        )

table = pd.DataFrame(rows)
assert table["e_star"].between(0.0, E_MAX, inclusive="neither").all()
assert table["q0"].between(0.0, 1.0, inclusive="neither").all()
assert table["q_star"].between(0.0, 1.0, inclusive="neither").all()

diagnostics = pd.DataFrame(
    {
        "quantity": [
            "kappa_star",
            "beta_at_kappa_0",
            "beta_at_kappa_1",
            "minimum_e_star",
            "maximum_e_star",
            "minimum_q_star",
            "maximum_q_star",
        ],
        "value": [
            kappa_star,
            beta_values[0],
            beta_values[-1],
            table["e_star"].min(),
            table["e_star"].max(),
            table["q_star"].min(),
            table["q_star"].max(),
        ],
    }
)
diagnostics.to_csv(HERE / "output" / "opacity_threshold.csv", index=False)


# 4. Figure: the crossing of the two mechanisms and the implied slope.
fig, axes = plt.subplots(1, 2, figsize=(8.2, 3.25))
blue = "#2457A6"
orange = "#D97706"
dark = "#25324A"

axes[0].plot(KAPPA, a_values, lw=2.2, color=blue, label=r"selection $a(\kappa)$")
axes[0].plot(KAPPA, h_values, lw=2.2, color=orange, label=r"screening $h(\kappa)$")
axes[0].axvline(kappa_star, color=dark, lw=1.0, ls="--")
axes[0].set_xlabel(r"opacity $\kappa$")
axes[0].set_ylabel("marginal effect")
axes[0].legend(frameon=False, fontsize=8)

axes[1].plot(KAPPA, beta_values, lw=2.4, color=dark)
axes[1].axhline(0.0, color="0.55", lw=0.9)
axes[1].axvline(kappa_star, color=dark, lw=1.0, ls="--")
axes[1].text(
    kappa_star,
    axes[1].get_ylim()[1] * 0.78,
    rf"  $\kappa^*={kappa_star:.2f}$",
    fontsize=8,
    color=dark,
)
axes[1].set_xlabel(r"opacity $\kappa$")
axes[1].set_ylabel(r"$\beta(\kappa)=\partial q^*/\partial D$")

for ax in axes:
    ax.spines[["top", "right"]].set_visible(False)
    ax.tick_params(labelsize=8)

fig.tight_layout()
fig.savefig(HERE / "figures" / "opacity_threshold.pdf", bbox_inches="tight")
fig.savefig(HERE / "figures" / "opacity_threshold.png", dpi=180, bbox_inches="tight")
plt.close(fig)

print(
    "OK: threshold kappa* = "
    f"{kappa_star:.4f}; wrote code/output/opacity_threshold.csv and "
    "code/figures/opacity_threshold.{pdf,png}"
)
