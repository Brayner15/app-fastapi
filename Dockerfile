# Usa una imagen base de Python
FROM python:3.11.3-bullseye

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo requirements.txt al directorio de trabajo
COPY requirements.txt .

# Instala las dependencias
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copia el contenido del directorio app en el directorio de trabajo
COPY app /app

# Configura el comando por defecto para ejecutar la aplicación con uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
