FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p instance static/qr

RUN chmod 755 instance static/qr

EXPOSE 8000

CMD ["python", "app.py"]