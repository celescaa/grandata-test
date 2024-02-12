# Usa una imagen base con Python y Spark preinstalados
FROM jupyter/pyspark-notebook

# Opcional: Instala Scala si es que no está en la imagen y es necesario
# USER root
# RUN apt-get update && apt-get install -y scala

# Opcional: Instala cualquier otra dependencia que puedas necesitar
RUN pip install pandas matplotlib

# Copia los archivos del dataset y scripts de análisis a la imagen
# Asegúrate de que estos directorios existan en tu contexto de Docker
COPY ./data /home/jovyan/data
COPY ./notebooks /home/jovyan/notebooks

# Opcional: Configura el entorno de Spark si es necesario
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$SPARK_HOME/bin
# ADD spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf

# Opcional: Configura el entorno de Jupyter si es necesario
ENV JUPYTER_ENABLE_LAB=yes

# Expone el puerto de Jupyter Notebook
EXPOSE 8888

# Ejecuta Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
