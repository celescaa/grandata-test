# GRANDATA TEST
# Análisis de Eventos de Comunicación

Este proyecto analiza las interacciones entre los usuarios de un servicio de comunicaciones, utilizando un dataset que refleja eventos como llamadas y SMS entre usuarios durante periodos de una hora. Se calcula el monto total facturado por el envío de SMS, se identifica a los 100 usuarios con mayor facturación, y se visualiza la distribución de llamadas a lo largo del día.

## Descripción

Cada registro en el dataset `eventos.csv.gz` muestra los eventos ocurridos durante una hora entera entre un par de usuarios (origen y destino), incluyendo la cantidad de llamadas, la duración total de estas y la cantidad de SMS enviados. Se realiza un análisis para calcular el monto total facturado por el envío de SMS, generar un dataset con los 100 usuarios de mayor facturación por SMS, y crear un histograma de la cantidad de llamadas por hora del día.

## Repositorio de GitHub

El código y los recursos para este proyecto se encuentran disponibles en GitHub:

https://github.com/celescaa/grandata-test/

## Requerimientos Técnicos

- Notebook: Jupyter o Zeppelin
- Framework de procesamiento: Spark v2.3
- Lenguajes de programación: Scala 2.11 o Python 3.6
- Docker y Docker Compose

## Instalación y Ejecución con Docker

Asegúrate de tener Docker y Docker Compose instalados en tu sistema. Para levantar el entorno del proyecto y ejecutar los análisis en contenedores Docker, sigue estos pasos:

1. Clona el repositorio de GitHub:

```bash
git clone https://github.com/celescaa/grandata-test.git
cd grandata-test
```

Construye y levanta los servicios definidos en docker-compose.yml:

```bash
docker-compose up --build
```

Accede a Jupyter Notebook a través del enlace proporcionado en la consola para visualizar y ejecutar los análisis.

## Uso
Dentro de Jupyter Notebook, encontrarás notebooks que contienen el código necesario para:

Cálculo del Monto Total por Envíos de SMS
Generación de Dataset de Usuarios con Mayor Facturación
Histograma de Cantidad de Llamadas por Hora del Día

## Contribuir
Si deseas contribuir a este proyecto, por favor, envía un pull request o abre un issue en el repositorio de GitHub para discutir los cambios propuestos.
