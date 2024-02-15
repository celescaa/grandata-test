# GRANDATA TEST

## Descripción
El poroposito de este test es resolver los siguientes 3 puntos:
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

Accede a Jupyter Notebook a través del enlace proporcionado en la consola para visualizar y ejecutar los análisis. Seguramente la salida sea la siguiente:

http://127.0.0.1:8888/lab


## Uso
Dentro de Jupyter Notebook, encontrarás dos carpetas con la informacion necesaria, son las siguientes:

- /work: se crea por default con el la imagen de jupyter pero esta vacia 
- /data: contiene los archivos events.csv.gs y free_sms_destination.csv.gs 
- /notebooks: que contienen el código necesario para la resolucion del problema dado. Si se ejecuta el codigo te daran el siguiente resultado:

- Cálculo del Monto Total por Envíos de SMS:
  
            +-----------+
            |costo_total|
            +-----------+
            |  1696022.5|
            +-----------+

- Generación de Dataset de los 100 Usuarios con Mayor Facturación con el ID hasheado con md5:

            +--------------------+-------+
            |           ID_SOURCE|  costo|
            +--------------------+-------+
            |911914c7729eedbdf...|18573.0|
            |bd180b7811395cbce...|13508.0|
            |14a0660ae2f5d1868...| 4070.0|
            |16c222aa19898e505...| 1707.0|
            |bc97b32ee2abb9c18...| 1292.5|
            |6a57072949dbc409c...| 1026.0|
            |f5a45e33602ea62f9...| 1023.5|
            |e9d076deb3451cc49...| 1015.5|
            |1b2e80021b5fc82bf...|  892.0|
            |159e1f3d6ff0e7c3c...|  714.5|
            |4e321438558549248...|  702.0|
            |aeb3135b436aa5537...|  680.0|
            |496ce5f942d15eefb...|  652.0|
            |beed13602b9b0e6ec...|  626.5|
            |aa35b36e4d1395542...|  616.0|
            |e87c495061191f4df...|  611.5|
            |2823f4797102ce1a1...|  610.5|
            |11b921ef080f77360...|  605.5|
            |13d8d90116cbacd3a...|  603.5|
            |49159f42b0f043d6d...|  592.5|
            +--------------------+-------+
  
- Histograma de Cantidad de Llamadas por Hora del Día

  <img width="970" alt="image" src="https://github.com/celescaa/grandata-test/assets/11966708/7785c344-1c5a-4ba8-86cd-ef947dab461c">




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

