// one url

docker-compose run --rm ingestor \
  python ingest_data.py \
    --user root \s
    --password root \
    --host pgdatabase \
    --port 5432 \
    --db ny_taxi \
    --tb your_table_name \
    --url YOUR_PARQUET_URL_HERE

// multiple urls

for url in \
  https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-01.parquet \
  https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-02.parquet \
  https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-03.parquet \
  https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-04.parquet \
  https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-05.parquet; do

  docker-compose run --rm ingestor \
    python ingest_data.py \
      --user root \
      --password root \
      --host pgdatabase \
      --port 5432 \
      --db ny_taxi \
      --tb yellow_tripdata \
      --url "$url"

done