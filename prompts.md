# Prompts

Raw prompts and relevant answers used to prepare the topic presentation.

## 1. October 13, 2026 — choose the project direction

**Prompt**

```text
Entiendo. Mi meta es adaptar lo del paper que te he mandado para sacar la nota
más alta. Para tener en cuenta el track A, te adjunto la carpeta en la cual
están los papers que hemos visto en clase. Leélos y coméntame, realísticamente,
cuál es la mejor altenativa.
```

**Relevant answer**

```text
The best option is Track B if the thesis mechanism is narrowed to one bank
problem, one first-order condition, and one candidate proposition. The Track A
fallback is easier to anchor to a course paper, but it is less connected to the
thesis and offers a weaker project-specific contribution.
```

**What I did with it:** Accepted Track B, conditional on replacing the
reduced-form screening term with an explicit optimization problem.

## 2. October 13, 2026 — compare density with the thesis model

**Prompt**

```text
no tiene ese paper muchas ecuaciones? y si modelamos bien lo de mi paper? qué
es mejor? lo digo para entenderlo
```

**Relevant answer**

```text
The number of equations is not the main risk. The risk in the thesis model is
that its sign reversal is asserted rather than derived. If that gap is closed
with a deliberately small model, the thesis adaptation is the stronger option.
```

**What I did with it:** Accepted. The topic model now uses one screening FOC
and one threshold proposition.

## 3. October 13, 2026 — close the model and prepare the topic presentation

**Prompt**

```text
Trabajemos, primero, en cerrar el modelo de mi paper. Ciérralo de la mejor
forma de cara a sacar la máxima nota. Que tenga sentido en base a lo propuesto
(una adaptación). Una vez terminado a detalle! Prepara todo el material
relacionado para el Topic Presentation. Edita mi repositorio:
https://github.com/fgalarzac/ai-project. Me es importante que pienses muy bien
en el modelo.
```

**Relevant answer**

```text
The model is closed as a two-stage bank problem. The bank posts the relative
spread and then chooses screening effort. The first-order condition derives
screening leverage h(kappa)=g(kappa)^2/c(kappa), so the price-quality slope is
a(kappa)-h(kappa). The opacity threshold exists only if selection falls,
screening leverage rises, and the two functions cross at the endpoints.
Higher screening cost alone cannot generate the negative slope.
```

**What I did with it:** Accepted after correcting the original thesis
narrative. The correction is explicit in the README, proposal, slides, code,
speaker notes, and defense Q&A.

## 4. October 13, 2026 — add context and expand to 25 minutes

**Prompt**

```text
De cara a la presentación y al read me, tienes que poner mayor contexto.
Recuerda que le estás explicando a alguien como si este no supiera del tema.
Define cada variable. Haz énfasis en el modelo y explícalo mejor, a detalle.
No uses “deliquency”, ese término está mal. Considera, mejor, 25 minutos de
presentación. Lo de ahora está muy corto. Arma bien la presentación de modo en
el que se pueda lograr los objetivos de la presentación y sacar la mayor nota
posible. Actualiza los demás puntos del repositorio en caso corresponda (de
cara al topic presentation). El modelo debe quedar claro. Genera también los
otros outputs adicionales que hiciste (como guion o preparación de preguntas).
```

**Relevant answer**

```text
The observed outcome is now called the non-performing loan ratio (NPL ratio),
while q0, q, and q* are theoretical default probabilities. The README,
proposal, and 25-minute deck define every index, choice, parameter, and
intermediate object; derive the screening FOC step by step; distinguish
origination risk from a future portfolio stock ratio; and state the model's
non-causal scope. The supporting materials now include a timed Spanish script,
an expanded defense Q&A, and a one-page formula cheat sheet.
```

**What I did with it:** Accepted. The topic materials now assume no prior
knowledge, devote most of the presentation to the agent problem and its
derivation, and use NPL-ratio terminology consistently.
