'use strict';
const http = require('http');
var port = 8765;

const server = http.createServer(function (req, res) {
    var num = generateRandomNumber(1000, 2700);
    console.log(`tiempo minimo de respuesta: ${num}`);
    res.setTimeout( num , ()=>{
        res.writeHead(200, {'content-type': 'text/plain'});
        res.end('Hola Mundo');
    });

});

function generateRandomNumber(min, max) {
    return Math.random() * (max - min) + min;
  }

server.listen(port);
console.log(`Servidor escuchando por el puerto ${port}`);