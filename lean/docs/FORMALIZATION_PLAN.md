# Plan y alcance de la formalización

La fuente es el paper fusionado en el commit `1f26057150da8a1bffbf1fc357f15bd14466a090`, del 24 de noviembre de 2026. Se seleccionan sus tres proposiciones, los cinco supuestos y las definiciones que los gobiernan. Los ejemplos, simulaciones y párrafos de interpretación apoyan esas proposiciones; no añaden resultados al denominador.

## Orden matemático

1. Definir el precio relativo como diferencia frente al promedio simple de pares. El banco mantiene precio y tecnología fijos al comparar esfuerzos.
2. Construir riesgo previo, riesgo después de evaluar, costo cuadrático, premio y conjunto factible. Las restricciones evitan esfuerzo negativo y probabilidades negativas.
3. Probar P1: factibilidad del candidato, comparación con cualquier esfuerzo admisible, unicidad y fórmula del riesgo. Derivar las tres expresiones por régimen y tratar capacidad cero, continuidad y derivadas laterales.
4. Probar P2: continuidad y descenso estricto de la diferencia entre selección y evaluación, cruce de extremos, cero interior único y signos. Usar la interioridad para identificar esa diferencia con la derivada del riesgo.
5. Probar P3: sumar saldos en atraso, dividir por saldo total positivo y derivar. Separar calidad y composición, verificar conservación del signo y especializar al saldo exponencial para obtener la condición exacta de inversión.

## Organización y comprobación

`Model.lean` contiene las definiciones y condiciones; `PaperInterface.lean`, un enunciado transparente por proposición; `ProofInterface.lean`, una prueba distinta del tipo exacto de cada enunciado. Los módulos de optimización, cálculo, umbral, composición y ejemplo de empate contienen el apoyo de las demostraciones.

Se reutiliza Mathlib para orden, aritmética, continuidad, compacidad y cálculo. No se introduce una biblioteca externa ni un certificado que suponga el máximo, el cruce o una fórmula derivada. La revisión del texto fuente, la comparación semántica independiente y la compilación son capas diferentes. El grafo aceptado y las salidas oficiales determinan el cierre vigente; este plan no lo certifica.

No se pretende demostrar equilibrio de precios, causalidad ni mejora predictiva peruana. La contabilidad se interpreta para el mismo evento y horizonte, con los supuestos de saldo y maduración explícitos del paper. La revisión humana no se sustituye por una anotación automática.
