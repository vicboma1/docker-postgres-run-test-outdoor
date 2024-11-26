#!/bin/bash
set -e

echo "Esperando a que PostgreSQL inicie..."
until pg_isready -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}"; do
  sleep 2
done

echo "Ejecutando scripts de DDL..."
for file in /scripts/ddl/*.sql; do
  echo "Ejecutando $file..."
  PGPASSWORD="${DB_PASSWORD}" psql -h "${DB_HOST}"  -p "${DB_PORT}" -U "${DB_USER}" -d "${DB_NAME}" -f "$file"
done

echo "Ejecutando scripts de DML..."
for file in /scripts/dml/*.sql; do
  echo "Ejecutando $file..."
  PGPASSWORD="${DB_PASSWORD}" psql -h "${DB_HOST}"  -p "${DB_PORT}" -U "${DB_USER}" -d "${DB_NAME}" -f "$file"
done

echo "Se ejecutaron las llamadas a la carpetas DDL y DML respectivamente"
exec "$@"
