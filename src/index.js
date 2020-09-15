const express = require('express')
const app = express();

// Configuración
app.set('port', process.env.PORT || 3000);


// Middleware 

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  });  
app.use(express.json());

// Rutas
app.use(require('./routes/manoDeObra'));
app.use(require('./routes/insert'))

// Inicio del servidor.
app.listen(app.get('port'), ()=>{
    console.log('Server on port ', app.get('port'))
})