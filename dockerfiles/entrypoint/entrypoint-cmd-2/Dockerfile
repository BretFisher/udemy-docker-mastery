FROM python:slim
USER www-data
WORKDIR /var/www/html
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENTRYPOINT ["./startup.sh"]
CMD ["python", "app.py"]
