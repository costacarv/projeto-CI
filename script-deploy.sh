#!/bin/bash

set -e

echo "==> Carregando imagem da API..."
docker load -i vollmed-api.tar

echo "==> Preparando Docker Compose..."
cp docker-compose-prod.yaml docker-compose.yaml

echo "==> Derrubando containers antigos..."
docker compose down || true

echo "==> Subindo nova versão..."
docker compose up -d

echo "==> Containers em execução:"
docker compose ps

echo "==> Deploy concluído."
