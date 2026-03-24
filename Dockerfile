# Imagen base
FROM python:3.12

# Evita problemas de buffer
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Directorio de trabajo
WORKDIR /app

# Copiar dependencias
COPY requirements.txt /app/

# Instalar dependencias
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiar proyecto
COPY . /app/

# Puerto
EXPOSE 8000

# Migraciones (opcional pero recomendado)
RUN python manage.py migrate

# Ejecutar servidor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]