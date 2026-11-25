# Final Validation Report: El precio relativo del crédito como señal de morosidad: evaluación crediticia, restricciones y composición de cartera

Updated: 2026-11-24

## 1. Human Verdict

Las tres proposiciones del artículo se formalizaron con sus condiciones originales. Se comprobó la correspondencia con la fuente mediante revisiones independientes. Las anotaciones humanas siguen pendientes.

## 2. Closeout Status

- Completion status: formalized
- One-sentence recap: Se prueban el óptimo con restricciones, el umbral interior único y la transmisión de riesgo al saldo con composición.

## 3. Source and Scope

Manuscrito de Fabián Matías Galarza Chumbe, 24 de noviembre de 2026, para el curso de IA y modelación económica. La [versión fusionada del artículo](https://github.com/fgalarzac/ai-project/blob/1f26057150da8a1bffbf1fc357f15bd14466a090/paper/paper.pdf) contiene las tres proposiciones principales, sus definiciones y cinco supuestos. Los ejemplos numéricos, las figuras y la agenda empírica son material de interpretación.

## 4. Researcher Summary of Checked Results

| Result | Comparison |
| --- | --- |
| Proposición 1 — Solución global y pendientes por régimen | **Exact** |
| Proposición 2 — Umbral condicional | **Exact** |
| Proposición 3 — Transmisión y composición | **Exact** |

## 5. Remaining Boundaries and Gaps

No quedan cláusulas abiertas en las tres proposiciones. El precio se toma como dado y la contabilidad se interpreta bajo saldos deterministas o de población continua, con evento y maduración compatibles. El artículo no afirma un equilibrio de precios, una relación causal ni una mejora predictiva peruana.

## 6. Additional Assumptions Beyond Paper

None.

## 7. Proof-Strategy Deviations

None.

## 8. Proof Tricks Worth Reusing

La diferencia de pagos compara directamente cada esfuerzo factible con el candidato. En cada régimen estricto se puede derivar la expresión afín activa. En un empate se estudian por separado los dos lados. Para el signo del saldo, factorizar un peso positivo separa la magnitud del efecto de calidad de la composición.

## 9. Generalizations, Conjectures, and Extensions

None.

## 10. Source Clarifications and Exact Readings

None.

## 11. Paper Issues or Caveats

None.

## 12. Detailed Formalization Evidence

`PaperInterface.lean` contiene las tres especificaciones transparentes. `ProofInterface.lean` cierra `proposition1`, `proposition2` y `proposition3` con los tipos exactos. La inspección de axiomas de los endpoints solo encontró `propext`, `Classical.choice` y `Quot.sound`.

Fuente PDF: commit `1f26057150da8a1bffbf1fc357f15bd14466a090`, SHA256 `381af6e7d069af85faca6774b3c07e0f927fced227c284c41cf9b203ac81f4a5`. El [mapa](audit/paper_statement_map.json) fija los pasajes de esa versión. [Fidelidad de las pruebas](audit/source_proof_fidelity.json) registra la comparación de los pasos matemáticos.

## 13. Paper Assumption Provenance

| Supuesto del artículo | Declaración | Alcance |
| --- | --- | --- |
| 1 | `selectionAndDomain` | Riesgo previo en el dominio compacto admisible |
| 2 | `technologyCapacityCost` | Productividad, costo y capacidad del banco |
| 3 | `conditionedPayoff` | Premio positivo y elección condicionada |
| 4 | `crossingConditions` | Continuidad, positividad, monotonía, cruce e interioridad |
| 5 | `stockAccountingConditions` | Saldo anterior positivo y saldo nuevo positivo y diferenciable |

Son condiciones visibles en los tipos; no son axiomas. Las comparaciones independientes están en [el registro de requisitos del modelo](audit/paper_semantic_prerequisites.json).

## 14. Displayed Formula Provenance

| Fórmula | Evidencia |
| --- | --- |
| (1), comparación con pares | `relativePrice` y cancelación demostrada en `relativePrice_eq_rate_gap` |
| (2), pago y elección | `bankProfit`, `feasibleEfforts`, `conditionedContinuationProblem` |
| (3), esfuerzo y riesgo | `proposition1` deriva el candidato factible, el máximo único y las cotas |
| (4), pendientes | `proposition1` deriva las tres fórmulas locales y las laterales |
| (6), cartera | `proposition3` deriva identidad, derivada y reglas de signo |
| (7), saldo exponencial | `proposition3` prueba la derivada especial y la equivalencia de inversión |

La identidad logarítmica (5) es una explicación posterior del criterio suficiente. No se usa como premisa para demostrar el umbral.

## 15. Library Lift Pass

Las construcciones económicas y las pruebas específicas quedan en el paper. Se usa Mathlib para aritmética, orden, continuidad y cálculo. No se introduce un certificado externo de máximo, cruce o derivada: cada uno se obtiene en la prueba.

## 16. DAG Audit

El [diagrama](docs/DependencyDAG.pdf) separa las definiciones y supuestos de los tres resultados. Las flechas van del insumo a la conclusión que lo usa. No muestra lemas de implementación como resultados adicionales.

- Visual inspection: the rendered PDF was visually inspected after separating the two upper nodes. All labels and arrowheads are legible; no nodes or edges overlap.

## 17. Validation Checks

Las tres declaraciones se elaboraron y se inspeccionó su cierre de axiomas. El grafo nativo enlaza cada especificación con una prueba distinta de tipo exacto. La revisión independiente de resultados y requisitos semánticos se conserva en los registros correspondientes. El cierre estricto y las comprobaciones por paper se acreditan por el grafo y las salidas de los verificadores, no por este informe.

## 18. Paper Definitions Checked

Se revisaron 18 componentes vinculados a la fuente: precio relativo y cancelación de la base; problema de continuación; riesgo previo y dominio; tecnología, riesgo posterior, costo y factibilidad; premio, pago y positividad; fuerza de evaluación, diferencia neta y condiciones de cruce; peso de cohorte, saldo en atraso y condiciones contables. Las declaraciones auxiliares para calcular derivadas no amplían el denominador de resultados.

## 19. Named Theorem Statements Checked

### Proposición 1

S1–S3 dan un máximo factible único, identificado con el mínimo del candidato sin restricciones, la capacidad y la cota de probabilidad. El riesgo óptimo es el máximo entre cero y el riesgo previo menos la mejora por evaluación limitada. Se prueban sus cotas, las pendientes interior, de capacidad y de piso, el caso de capacidad cero, la continuidad y las derivadas laterales. Un empate de capacidad admisible muestra que la derivada ordinaria puede no existir.

### Proposición 2

Bajo S1–S4, al precio que conserva interioridad para toda opacidad, existe un umbral único en el intervalo abierto. La pendiente de riesgo es positiva debajo, cero en el umbral y negativa encima. La continuidad y la monotonía estricta de la diferencia selección menos evaluación justifican existencia y unicidad.

### Proposición 3

Bajo S1–S3 y S5, la razón esperada de cartera es el promedio ponderado de los riesgos. En puntos diferenciables, su derivada suma calidad de la cohorte y composición. El signo se conserva con saldo nuevo constante o con composición estrictamente menor que el efecto de calidad no nulo. En el caso exponencial se prueba la fórmula especializada y, con pendiente de cohorte positiva y riesgo nuevo mayor que el anterior, la condición necesaria y suficiente para un signo opuesto.

## 20. Paper-Facing Statement Validator Ledger

| Resultado | Especificación | Revisión vinculada al grafo |
| --- | --- | --- |
| Proposición 1 | `proposition1Spec` | matches |
| Proposición 2 | `proposition2Spec` | matches |
| Proposición 3 | `proposition3Spec` | matches |

La [revisión independiente](audit/v11_raw_source_spec_screening.json) conserva identidad, fecha y razones. El [paquete para revisión humana](docs/HUMAN_REVIEW_PACKET.pdf) mantiene tres filas de resultados; no se ha registrado anotación humana.

## 21. Source-Coverage Audit Ledger

La selección normal abarca 12 presentaciones de fuente: tres resultados y nueve grupos de definiciones o condiciones del modelo. Los tres resultados tienen especificación, prueba y juicio semántico; los nueve grupos enlazan 18 declaraciones semánticas revisadas. El [inventario](audit/paper_statement_map.json) distingue el material de apoyo y de auditoría ampliada, sin convertirlo en resultados adicionales. No se usa un límite condicional para cerrar una proposición incompleta.
