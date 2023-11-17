#!/bin/bash

MERCURE_KEY=changemechangeechangemechangemec
WORKERS=8
LOCAL_HTTPPORT=280
LOCAL_HTTPSPORT=2443

exec docker run \
    -it \
    --rm \
    -e FRANKENPHP_CONFIG="worker ./public/index.php $WORKERS" \
    -e APP_RUNTIME='Runtime\FrankenPhpSymfony\Runtime' \
    -e MERCURE_PUBLISHER_JWT_KEY=$MERCURE_KEY \
    -e MERCURE_SUBSCRIBER_JWT_KEY=$MERCURE_KEY \
    -p $LOCAL_HTTPPORT:80 \
    -p $LOCAL_HTTPSPORT:443 \
    --name franken-segfault \
    --network mybridge \
    franken-segfault:latest
