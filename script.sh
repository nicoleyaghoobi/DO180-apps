#!/bin/bash
podman pull quay.io/redhattraining/nginx:1.17
podman stop official-nginx
podman rm official-nginx
podman images 
podman run --name official-nginx -d -p 8080:80 quay.io/redhattraining/nginx:1.17
podman cp official-nginx:/usr/share/nginx/html/index.html /tmp/index.html
echo "Shir" >> /tmp/index.html
podman cp /tmp/index.html official-nginx:/usr/share/nginx/html/index.html
curl localhost:8080
