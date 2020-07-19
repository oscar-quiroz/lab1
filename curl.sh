#!/bin/bash

time_response=$(curl -o /dev/null -L -qs -w "%{time_total}" http://192.168.1.89:8765/)
time_required=0,00899
echo $time_required
echo $time_response

## realizar cada minuto
if awk 'BEGIN{exit ARGV[1]>ARGV[2]}' "$time_response" "$time_required"
then
     echo "################ Peticion realizada.#####################"
    
        
else
    echo " ERROR:: el tiempo de respuesta es mayor al tiempo definido "
    ## conectarse por ssh 
        sshpass -p '123456'  ssh server2@192.168.1.89  ./init.sh ##conectado
        ##./init.sh ----> ejecuta bash que hace pull del ultimo commit y reiniciar server.js
    
        
    ## se reinicia el serverdor remoto.
    echo "#############servicio reiniciado.#####################"
fi