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
# Cambio de nuevo al usuario predeterminado
USER jovyan

# Expone el puerto de Jupyter Notebook
EXPOSE 8888

# Ejecuta Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
