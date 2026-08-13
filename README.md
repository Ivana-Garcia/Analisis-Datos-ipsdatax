# 📊 Análisis Comercial, Rentabilidad y Modelado DAX — IPS DATAX

![Portada del Proyecto]("dashboard.png")

## 📌 Introducción y Objetivos
Este proyecto consiste en un **análisis comercial integral** sobre el rendimiento de ventas, costos operativos y margen de rentabilidad por sucursal. 

El objetivo principal es transformar datos transaccionales sin procesar en **información estratégica** para la toma de decisiones empresariales, respondiendo preguntas clave de negocio como:
  * ¿Cuáles son los meses y sucursales con mayor utilidad neta?
  * ¿Qué mercado/ciudad genera el margen de ganancia más alto?
  * ¿Quiénes son los gerentes líderes en desempeño comercial?
  * ¿Cómo evoluciona el nivel de ventas respecto a períodos anteriores?

---

## 🛠️ Tecnologías y Herramientas Utilizadas
  * **Base de Datos / Motor SQL:** MySQL (Extracción, uniones `JOIN`, agregaciones y consultas complejas).
  * **Business Intelligence:** Power BI Desktop (Modelado relacional, lenguaje DAX, Inteligencia de Tiempo y Visualización interactiva).
  * **Fuentes de Datos:** Archivos CSV transaccionales (Ventas, Costos, Productos, Sucursales).
  * **Documentación:** Markdown & GitHub.

---

## 1. Consultas y Manipulación de Datos en SQL (MySQL)
Se construyeron consultas SQL enfocadas en la consolidación y cruce de datos relacionales:

 * Uniones de tablas (INNER JOIN / LEFT JOIN) entre ventas, costos, productos y sucursales.

 * Agregaciones (SUM, GROUP BY, ORDER BY) para determinar utilidades por periodo y por sucursal.

---

## 2. Modelado de Datos y Medidas Avanzadas en Power BI (DAX)
Se diseñaron indicadores clave de rendimiento (KPIs) e inteligencia de negocio usando DAX:

📈 Inteligencia de Tiempo (Crecimiento Mes Anterior):
Cálculo del delta de ventas comparado contra el mes inmediato anterior:

``` Ventas_Mes_Anterior = 
CALCULATE(
    SUM(Ventas[Monto]),
    PREVIOUSMONTH(Calendario[Fecha]))
```

---

🏆 Identificación del Top 3 Gerentes:
  Filtro dinámico con TOPN y SUMMARIZE para evaluar los gerentes con mayor utilidad generada en el último mes auditado.

📍 Ciudad de Mayor Rentabilidad:
  Determinación del mercado geográfico líder utilizando SELECTCOLUMNS y agregaciones de margen neto.
--- 
📈 Dashboard e Insights Principales
💡 Conclusiones del Análisis:

* Rendimiento Geográfico: Identificación de las sucursales con mayor margen de ganancia versus aquellas con altos costos operativos.

* Evolución Temporal: Análisis de estacionalidad en las ventas para optimizar la toma de decisiones en meses de menor facturación.

* Liderazgo Comercial: Evaluación de la gestión por gerencia mediante la comparativa directa de volumen y margen neto.

---

🎓 Certificación y Contexto
Este trabajo fue desarrollado como proyecto final del Curso de Análisis de Datos impartido por IPS DATAX (50 horas de formación académica práctica en Excel, SQL, Power BI y Python).
