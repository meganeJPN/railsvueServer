#!/bin/bash

echo 'waiting for postgres to be connectable...'
until pg_isready -h db; do
    echo 'waiting for postgres to be connectable...'
    sleep 1
done
echo 'postgres is up!'
