#!/bin/bash

time_response=$(curl -o /dev/null -L -qs -w "%{time_total}" http://192.168.1.89:8765/)
time_required=0,009321
echo $time_required
echo $time_response

if awk 'BEGIN{exit ARGV[1]>ARGV[2]}' "$time_response" "$time_required"
then
     echo "el tiempo de respuesta es menor que el solicitado"
else
    echo el tiempo es mayor
fi