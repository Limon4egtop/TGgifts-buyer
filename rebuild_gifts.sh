#!/usr/bin/env bash
set -euo pipefail

# Пусть скрипт запускают из /home, но на всякий случай:
BASE_DIR="/home/Gifts-Buyer-master"

echo "⏳ Переходим в каталог проекта: $BASE_DIR"
cd "$BASE_DIR"

echo "🛑 Останавливаем и удаляем старые контейнеры (если есть)..."
docker compose down

echo "🔄 Пересобираем образ и запускаем контейнер в фоне..."
docker compose up -d --build

echo "🧹 Удаляем все остановленные контейнеры..."
docker container prune -f

echo "🧹 Удаляем все неиспользуемые образы..."
docker image prune -f

echo "✅ Готово! Контейнер пересобран и запущен, старые ресурсы удалены."
