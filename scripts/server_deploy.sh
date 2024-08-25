#!/bin/bash

# Function to deploy the server
deploy_server(){
    docker-compose -f docker-compose.yml run --rm my_app python manage.py makemigrations
    docker-compose -f docker-compose.yml run --rm my_app python manage.py migrate
    docker-compose -f docker-compose.yml run --rm my_app python manage.py collectstatic --noinput
    docker-compose -f docker-compose.yml run --rm my_app python manage.py sample
}

echo "Do you want to deploy the server? (yes/no)"
read answer

if [ "$answer" = "yes" ]; then
    docker compose -f docker-compose.yml down
    docker system prune -a --volumes -f
    docker compose -f docker-compose.yml build
    deploy_server
else
    echo "Server deployment aborted"
fi

if [ "$answer" = "yes" ]; then
    docker compose -f docker-compose.yml up -d
else
    echo "Server deployment aborted"
fi