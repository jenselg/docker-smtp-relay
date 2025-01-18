#!/bin/bash



# Options (YOU CAN EDIT THESE SAFELY)
RELAY_PORT=2525 # Change this to the port you want to use for this relay service
SMTP_PORT=587 # Change this to the port your SMTP server uses
SMTP_USER=apikey # Change this to your SMTP username
SMTP_PASS=SOMEPASSWORD # Change this to your SMTP password
SMTP_HOST=smtp.sendgrid.net # Change this to your SMTP server



# Build and start (DO NOT EDIT)
echo ""
echo "********************************************************"
echo "Building and starting the docker-smtp-relay container..."
echo "********************************************************"
echo ""
docker build -t docker-smtp-relay . && \
docker run -d \
           -e SMTP_PORT=${SMTP_PORT} \
           -e SMTP_USER=${SMTP_USER} \
           -e SMTP_PASS=${SMTP_PASS} \
           -e SMTP_HOST=${SMTP_HOST} \
           --rm -p ${RELAY_PORT}:25 --name docker-smtp-relay docker-smtp-relay
echo ""