# Imagen base con Python y Spark 
FROM jupyter/pyspark-notebook

# Instalo las dependencia que necesito para las querys
RUN pip install pandas matplotlib

# Copio los archivos del dataset y scripts a la imagen
COPY ./data /home/jovyan/data
COPY ./notebooks /home/jovyan/notebooks

# Cambio de usuario para crear el directorio para los archivos parquet y darle permisos
USER root
RUN mkdir -p /home/jovyan/data/parquet && \
    chmod 777 /home/jovyan/data/
# Cambiar de nuevo al usuario predeterminado, si es necesario
USER jovyan

# Opcional: Configura el entorno de Spark si es necesario
#ENV SPARK_HOME=/usr/local/spark
#ENV PATH=$PATH:$SPARK_HOME/bin
# ADD spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf

# Opcional: Configura el entorno de Jupyter si es necesario
#ENV JUPYTER_ENABLE_LAB=yes

# Expone el puerto de Jupyter Notebook
EXPOSE 8888

# Ejecuta Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
