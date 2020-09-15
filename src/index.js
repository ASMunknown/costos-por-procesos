const express = require('express')
const app = express();

// Configuración
app.set('port', process.env.PORT || 3000);


// Middleware 
app.use(express.json());

// Rutas
app.use(require('./routes/manoDeObra'))

// Inicio del servidor.
app.listen(app.get('port'), ()=>{
    console.log('Server on port ', app.get('port'))
})