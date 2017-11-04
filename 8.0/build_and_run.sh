#!/bin/bash

./run_before_image_creation.sh

CONTAINER=odoo8
IMAGE=ubuntudoo-it:8
docker stop $CONTAINER
docker rm $CONTAINER
docker build -t $IMAGE .
docker run -p 8069:8069 --name odoo8 --link db:db -t ubuntudoo-it:8

IP=$(echo $(hostname -I) | cut -d' ' -f 1)
echo "App is running on:"
echo "http://$IP/"

