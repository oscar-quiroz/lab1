'use strict';
const http = require('http');


const server = http.createServer(function (req, res) {
    var num = getRandomArbitrary(1000, 2700);
     console.log(num);
    res.setTimeout( num , ()=>{
        res.writeHead(200, {'content-type': 'text/plain'});
        res.end('Hola Mundo');
    });

});

function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
  }

server.listen(8765);