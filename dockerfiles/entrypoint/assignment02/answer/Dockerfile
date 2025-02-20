FROM python:slim

WORKDIR /app

# Copy requirements first for better docker layer caching
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

VOLUME /app/data

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

