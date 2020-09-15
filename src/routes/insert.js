const express = require('express');
const { Router } = require('express');
const router = express.Router();

const mysqlConnection = require('../database')

// Listando data de todos los procesos
router.post('/list/proceso_fecha/', (req, res) => {
    //const { id } = req.params;
    mysqlConnection.query('SELECT * FROM proceso_fecha', (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

//Añadir producto
router.post('/i/producto/', (req, res) => {
    const { nombre } = req.body;
    mysqlConnection.query('INSERT INTO producto (NOMBRE) VALUES (?)',[nombre] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});


//Añadir tipo_proceso
router.post('/i/tipo_proceso/', (req, res) => {
    const { nombre } = req.body;
    mysqlConnection.query('INSERT INTO TIPO_PROCESO (NOMBRE) VALUES (?)',[nombre] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

//Añadir fecha
router.post('/i/fecha/', (req, res) => {
    const { mes, anio } = req.body;
    mysqlConnection.query('INSERT INTO FECHA (MES,ANIO) VALUES (?,?)',[mes,anio] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

//Añadir unidades almacen
router.post('/i/almacen/', (req, res) => {
    const { Fecha_idFecha,Producto_idProducto,unidades} = req.body;
    mysqlConnection.query('INSERT INTO ALMACEN (Fecha_idFecha,Producto_idProducto,unidades) VALUES (?,?,?)',[Fecha_idFecha,Producto_idProducto,unidades] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

//Añadir  PROCESO_FECHA
router.post('/i/proceso_fecha/', (req, res) => {
    const { Fecha_idFecha,tipo_proceso_idtipo_proceso,uiipp,uprod,UAg,UTT,UTNT,UIFPP,UPERDIDAS,MD_inicio,MO_inicio,CIF_inicio,porcentaje_MD_inicial,porcentaje_costos_de_conversion_inicial,porcentaje_MD_final,porcentaje_Costos_de_conversion_final,inv_inicial_recibido } = req.body;
    mysqlConnection.query('INSERT INTO PROCESO_FECHA (Fecha_idFecha,tipo_proceso_idtipo_proceso,uiipp,uprod,UAg,UTT,UTNT,UIFPP,UPERDIDAS,MD_inicio,MO_inicio,CIF_inicio,porcentaje_MD_inicial,porcentaje_costos_de_conversion_inicial,porcentaje_MD_final,porcentaje_Costos_de_conversion_final,inv_inicial_recibido) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',[Fecha_idFecha,tipo_proceso_idtipo_proceso,uiipp,uprod,UAg,UTT,UTNT,UIFPP,UPERDIDAS,MD_inicio,MO_inicio,CIF_inicio,porcentaje_MD_inicial,porcentaje_costos_de_conversion_inicial,porcentaje_MD_final,porcentaje_Costos_de_conversion_final,inv_inicial_recibido] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});


//Añadir  MANO_DE_OBRA
router.post('/i/mano_de_obra/', (req, res) => {
    const { Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op} = req.body;
    mysqlConnection.query('INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES (?,?,?,?,?)',[Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

//Añadir  MATERIAL_DIRECTO
router.post('/i/costo_material_directo/', (req, res) => {
    const { Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op} = req.body;
    mysqlConnection.query('INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES (?,?,?,?,?)',[Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

//Añadir  CIF
router.post('/i/cif/', (req, res) => {
    const { Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op} = req.body;
    mysqlConnection.query('INSERT INTO cif (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES (?,?,?,?,?)',[Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op] ,(err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});


module.exports = router;