FROM python:3.11-slim

COPY app.py /app.py
CMD ["python", "/app.py"]
