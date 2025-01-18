# Dockerized Exim SMTP Relay

## Summary
Quick and easy SMTP relay using Exim. Primarily created to work with Sendgrid, but may work for other SMTP services too.

## How To Use
1. clone this repo
2. edit the variables in `start.sh`
3. if you need to edit additional Exim configuration options, do so in the `entrypoint.sh` script
4. build and start the container via `./start.sh`
5. stop the running container via `./stop.sh`