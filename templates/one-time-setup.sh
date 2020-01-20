#!/usr/bin/env bash
docker-compose up -d --build
docker-compose run node npm ci
docker-compose run node npm run build
docker-compose exec php composer install
echo "Done!"
