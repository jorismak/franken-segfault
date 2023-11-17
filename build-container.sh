#!/bin/bash

echo This assumes you have done a local composer install!

exec docker buildx build --load --tag franken-segfault:latest .
