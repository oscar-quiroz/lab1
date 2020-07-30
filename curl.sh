#!/bin/bash
time_req=1,850

while true; do
time_res=$(curl -o /dev/null -L -qs -w "%{time_total}" http://192.168.1.89:8765/)
echo "tiempo requerido de respuesta: "  $time_req
echo "tiempo de respuesta real:      "  $time_res

echo 

sleep 5 ##cada 5 segundos.
## realizar cada minuto
if awk 'BEGIN{exit ARGV[1]>ARGV[2]}' "$time_res" "$time_req"
then
     echo "################ Peticion realizada.#####################"
else
    echo "#### ERROR:: el tiempo de respuesta es mayor al tiempo definido ####"
    echo
    ## conectarse por ssh 
        sshpass -p '123456'  ssh -o StrictHostKeyChecking=no server2@192.168.1.89  'cd lab1;git pull; pm2 restart server.js' ##conectado
        ##./init.sh ----> ejecuta bash que hace pull del ultimo commit y reiniciar server.js
    echo
    ## se reinicia el serverdor remoto.
    echo "############# servicio reiniciado. #####################"
fi
done