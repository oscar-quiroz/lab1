#!/bin/bash

time_response=$(curl -o /dev/null -L -qs -w "%{time_total}" www.facebook.com)
time_required=3.5
echo $time_required
echo $time_response

if awk 'BEGIN{exit ARGV[1]>ARGV[2]}' "$time_response" "$time_required"
then
     echo "el tiempo de respuesta es menor que el solicitado"
else
    echo el tiempo es mayor
fi