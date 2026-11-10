# Diagnóstico antes de modificar (10 de noviembre de 2026)

Repositorio: fgalarzac/ai-project. Rama remota `apoyo`, commit inicial
6462a960d2687a84c4369c2d23b4c8e25385ea5a. Clon nuevo, árbol limpio.
La copia de octubre, en `main` con archivos no seguidos, se conserva intacta.
`main` remoto contiene dos commits que no están en apoyo; se revisará la
integración sin reemplazar el trabajo previo ni escribir directamente en main.

Consigna vigente: issue 7, actualización 2026-10-15. Leída completa, incluidos
comentarios, cronograma, flujo Lean y política de compilación.
PDF de investigación: 24 páginas, incluidos tres anexos y referencias.

| Requisito oficial | Estado inicial | Archivo | Cambio decidido | Verificación |
|---|---|---|---|---|
| Repositorio público, enlace registrado | Cumplido | issuecomment-6157914408 | Conservar | Consulta GitHub |
| Rama, PR y merge | Parcial | apoyo | Trabajar en apoyo y abrir PR a main | Git y API |
| README de una página | Parcial: demasiado extenso | README.md | Resumir con condiciones y estados reales | Lectura |
| Propuesta de 2–4 páginas y slides tema | Avance propio | proposal/, slides/topic.* | Conservar fuentes y recompilar; identificar versión histórica | Compilación y conteo |
| Paper 8–20 páginas, 11pt, 1 pulgada | Pendiente: plantilla de trabajador con IA | paper/paper.tex | Reemplazar íntegramente por modelo bancario | PDF, páginas y fuentes |
| Proposición propia y prueba completa | Parcial en propuesta | proposal/model_notes.md | Probar solución global, umbral condicional y vínculo flujo-stock | Pruebas algebraicas y código |
| Modelo claro y coherente | Parcial | propuesta y README | Resolver restricciones, distinguir precio dado y equilibrio | Auditoría de condiciones |
| Simulaciones de cada resultado | Parcial: solo interior de una calibración | code/verify.py | Optimización independiente, esquinas, sensibilidad, contraejemplos | Ejecución con fallos obligatorios |
| Evidencia y bibliografía | Parcial | PDF y references.bib | Verificar fuentes primarias; no reutilizar cifras sin base entregada | Registro de fuentes |
| Presentación final de unos 30 minutos | Pendiente: plantilla | slides/final.tex | Español, construcción gradual, Lean y preguntas | PDF y guía cronometrada |
| Lean propio con flujo vigente | Pendiente: placeholder | lean/ | Inspeccionar AppliedModelingLib y ejecutar lo disponible; informar bloqueos | Log de chequeo, sin inventar certificación |
| Manuscrito real completo | Pendiente: placeholder | hand/ | Guía tipográfica exhaustiva para escribir personalmente | Lista de páginas requeridas |
| Registro IA crudo y adjudicación | Parcial | prompts.md | Conservar historia y registrar esta sesión sin inventar revisión humana | Cruce paper/prompts |
| Cuatro PDF compilados y workflow intacto | Parcial: PDF finales son ejemplos | cuatro rutas oficiales | Compilar y revisar; no tocar build.yml | SHA-256 y compilación |

## Juicios económicos iniciales

1. La propuesta y el tema son adaptación propia de selección y evaluación;
   paper y slides finales siguen siendo ejemplo de esfuerzo de un trabajador.
2. El plan usa promedio simple excluyendo al banco y el repositorio usa
   mediana. Se elige el promedio como principal para mantener el estimando del
   plan; mediana será sensibilidad. Cancelar una base común no elimina fondeo,
   composición, exposición al ciclo ni poder de mercado heterogéneos.
3. La FOC interior es correcta, pero no es solución global del problema con
   capacidad y probabilidades. Se añadirá e <= q0/g y se resolverán las esquinas.
4. El umbral requiere cruce y monotonía: opacidad no implica g creciente ni
   eficacia g²/c creciente. El caso g decreciente y c creciente debe mostrarse.
5. q* es riesgo de una cohorte. El enlace NPL=alpha+rho q*+u supone lo que se
   necesita demostrar. Se sustituye por contabilidad explícita de cohortes y
   un término de composición que puede invertir el signo.
6. La etapa de precios no está caracterizada en equilibrio. El trabajo final
   resolverá la decisión de evaluación condicionada en D y lo dirá desde el
   resumen. No equiparará derivadas estructurales con coeficientes predictivos.
7. No se entregó la base ni los scripts separados del PDF. Sus cifras de
   cobertura, varianza, correlaciones y morosidad 2026 quedan no verificadas.
   Treinta días útiles tampoco equivalen a un mes sin superposición.

## Referencia de organización

Se inspecciona Arriola123456/ai-project como comparación de claridad,
integración de números generados por código, declaraciones de hipótesis,
contraejemplos y trazabilidad Lean. Su informe declara población finita,
auditorías semánticas no ejecutadas y agente diferente al exigido. No es una
plantilla de resultados que copiar. La nota de 18 es información del usuario,
no fue comprobada y no permite inferir razones de evaluación.

## Decisión

Un modelo pequeño de evaluación con restricciones y una extensión contable
flujo-stock aportan más que imponer una reversión por opacidad. Se mantendrá
el umbral como resultado suficiente condicionado y se mostrará su fragilidad.
Se prioriza que el autor pueda explicar las tres proposiciones y sus límites.
