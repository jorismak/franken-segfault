#!/bin/bash

exec docker buildx build --load --tag franken-segfault:latest .
