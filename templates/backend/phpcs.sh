#!/bin/bash
docker-compose exec backend php vendor/bin/phpcs "$@"
