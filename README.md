# GRANDATA TEST

## Descripción
El poroposito de este test es resovler los siguientes 3 puntos:
  - Cálculo del Monto Total por Envíos de SMS
  - Generación de Dataset con los 100 Usuarios con Mayor Facturación
  - Histograma de Cantidad de Llamadas por Hora del Día

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

## PREGUNTAS TEORICAS 

## 1. Priorización de Procesos Productivos sobre Análisis Exploratorios

Utilizaría colas de YARN (Yet Another Resource Negotiator) para gestionar y priorizar los recursos. Puedes configurar colas diferentes para procesos productivos y análisis exploratorios, asignando una mayor prioridad y más recursos a las colas de procesos productivos.

Pool de Recursos: En Spark, configurar pools de recursos con diferentes prioridades para asegurar que los trabajos productivos tengan acceso preferente a los recursos.
Estrategia para Administrar la Ejecución Intensiva:

Planificación Temporal: Planificar la ejecución de trabajos intensivos durante horas de baja demanda, como por la noche o los fines de semana.

Dinamización de Recursos: Ajustar dinámicamente la asignación de recursos basándose en la carga de trabajo actual, utilizando herramientas como Cloudera Manager o Ambari para monitorizar y gestionar los recursos.

Limitación de Recursos por Trabajo: Establecer límites en la cantidad de recursos que puede utilizar cada trabajo para evitar que un solo proceso consuma todos los recursos disponibles.

Herramientas de Scheduling:

Apache Airflow: Herramienta de orquestación de flujo de trabajo que permite programar, organizar y monitorizar flujos de trabajo complejos.

## 2. Problemas de Performance en Tablas con Alta Transaccionalidad
Posibles Causas:

Tamaño y Diseño de la Tabla: Tablas demasiado grandes o mal diseñadas pueden dificultar las consultas eficientes.
Particionamiento: Un esquema de particionamiento mal configurado o inexistente puede llevar a una distribución desigual de los datos y a consultas lentas.

Sugerencias para Solucionarlo:

Optimización de Consultas: Revisar y optimizar las consultas para mejorar su eficiencia.
Particionamiento: Implementar o revisar la estrategia de particionamiento de la tabla para asegurar que los datos estén distribuidos de manera eficiente.
Compresión de Datos: Utilizar formatos de almacenamiento que soporten compresión de datos para reducir el tamaño físico de la tabla.

## 3. Configuración de un Clúster Hadoop para Ejecución de Proceso de Spark
Configuraciones en la Sesión de Spark:

- spark.executor.memory: Configurar cada executor para que utilice un máximo de 25 GB (la mitad de los 50 GB disponibles por nodo), lo que podría ser spark.executor.memory=25g.
- spark.executor.cores: Limitar el número de cores por executor, por ejemplo, a 6 si quieres usar la mitad de los 12 cores disponibles por nodo.
- spark.executor.instances para controlar el número total de executors desplegados y asegurar que no se utilicen todos los recursos disponibles.
- Habilitar la asignación dinámica de recursos con spark.dynamicAllocation.enabled=true para permitir que Spark ajuste el número de executors según la carga de trabajo.

Estas configuraciones permitirán que el proceso de Spark utilice aproximadamente la mitad de los recursos del clúster, dejando la otra mitad disponible para otros trabajos. Es importante también considerar la memoria y cores dedicados al driver de Spark (spark.driver.memory, spark.driver.cores) para asegurar un balance adecuado de recursos.


## Contribuir
Si deseas contribuir a este proyecto, por favor, envía un pull request o abre un issue en el repositorio de GitHub para discutir los cambios propuestos.
