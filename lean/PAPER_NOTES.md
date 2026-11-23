# Orientación para leer las pruebas

- **P1:** primero verificar que el mínimo de las tres cotas sea factible. Comparar su beneficio con el de cualquier otro esfuerzo admisible. Después derivar la fórmula del riesgo en cada régimen y comprobar los empates con derivadas laterales.
- **P2:** separar el cruce continuo de la condición de interioridad. La primera parte da un cero único de la pendiente neta; la segunda permite identificar esa pendiente con la derivada de riesgo.
- **P3:** sumar saldos en atraso y dividir por el saldo total positivo. Al diferenciar, el término de composición cambia cuando varía el peso de la cohorte nueva. El caso exponencial da una desigualdad exacta para la inversión de signo.

Ver [las especificaciones](PaperInterface.lean), [las pruebas](ProofInterface.lean) y [el informe](FINAL_VALIDATION_REPORT.md). El artículo validado se fija en `25f0b0c7df040e2b04d78064b30949492cd4472f`.
