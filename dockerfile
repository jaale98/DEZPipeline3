FROM python:3.9-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
       gcc \
       libpq-dev \
       curl \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ingest_data.py .

CMD ["tail", "-f", "/dev/null"]