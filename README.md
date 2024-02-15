# GRANDATA TEST

## Descripción
El poroposito de este test es resolver los siguientes 3 puntos:
  - Cálculo del Monto Total por Envíos de SMS
  - Generación de Dataset con los 100 Usuarios con Mayor Facturación
  - Histograma de Cantidad de Llamadas por Hora del Día
  - Preguntas Teoricas
    
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

- Utilizaría colas de YARN para gestionar y priorizar los recursos. Configuraria dos colas diferentes, una para procesos productivos y otra para los análisis exploratorios, asignando una mayor prioridad y más recursos a las colas de procesos productivos.


- Planificaria la ejecución de los procesos que requieren mas recursos durante horas de baja demanda, asigandole los recursos necesarios para su ejecucion correcta. Estableceria límites en la cantidad de recursos que puede utilizar cada tarea para evitar que un solo proceso consuma todos los recursos disponibles.
Como erramienta de scheduling conozco Apache Airflow, que te permite programar y organizar tus tareas para que corran a preferencia de las necesidades, es decir, horarios, dependencias, etc.


## 2. Problemas de Performance en Tablas con Alta Transaccionalidad

-  Una causa puede ser que no este particionada la tabla , o que se haya configurado mal el particionamiento, provocando una distribución desigual de los datos y a consultas lentas.
- Que la estructura de la tabla no sea la correcta, es decir, una mal diseño de modelado de datos, por ejemplo que no tenga una pk definida y cuando se joineo con esa tabla provoque multiplicacion de datos, o que se haya construido como un stock cuando deberia ser guardar por particion los sucesos del dia.


- Revisar la estrategia de particionamiento de la tabla para asegurar que los datos estén distribuidos de manera eficiente. Una manera seria que el campo de particion sea la fecha de la transaccion.
- Revisar que las consultas que se hagan a la tabla no este haciendo un full scan.
- Revisar que la construccion de la tabla sea adecuada para la explotacion analitica que se hace a diario.
- Utilizar formatos de almacenamiento que soporten compresión de datos para reducir el tamaño físico de la tabla.

## 3. Configuración de un Clúster Hadoop para Ejecución de Proceso de Spark

- Configurar cada executor para que utilice un máximo de 25 GB (la mitad de los 50 GB disponibles por nodo), lo que podría ser spark.executor.memory=25g.
- Limitar el número de cores por executor, por ejemplo, a 6 si quieres usar la mitad, spark.executor.cores=12
- spark.executor.instances para controlar el número total de executors desplegados y asegurar que no se utilicen todos los recursos disponibles.
- Habilitar la asignación dinámica de recursos con spark.dynamicAllocation.enabled=true para permitir que Spark ajuste el número de executors según la carga de trabajo.

Estas configuraciones permitirán que el proceso de Spark utilice aproximadamente la mitad de los recursos del clúster, dejando la otra mitad disponible para otros trabajos. Es importante también considerar la memoria y cores dedicados al driver de Spark (spark.driver.memory, spark.driver.cores) para asegurar un balance adecuado de recursos.

