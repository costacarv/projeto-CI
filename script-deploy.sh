#!/bin/bash

set -e

echo "==> Carregando nova imagem..."
docker load -i vollmed-api.tar

echo "==> Removendo arquivo temporário..."
rm -f vollmed-api.tar

echo "==> Preparando Docker Compose..."
cp docker-compose-prod.yaml docker-compose.yaml

echo "==> Derrubando versão anterior..."
docker compose down || true

echo "==> Removendo imagens Docker não utilizadas..."
docker image prune -a -f

echo "==> Subindo nova versão..."
docker compose up -d

echo "==> Status:"
docker compose ps
