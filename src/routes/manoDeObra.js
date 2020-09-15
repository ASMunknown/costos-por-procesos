const express = require('express');
const { Router } = require('express');
const router = express.Router();

const mysqlConnection = require('../database')

// Listando data de todos los procesos
router.get('/proceso_fecha/all', (req, res) => {
    mysqlConnection.query('SELECT * FROM proceso_fecha', (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});


// Listando data de todos los procesos
router.get('/proceso_fecha/:tipo_proceso_idtipo_proceso', (req, res) => {
    const { tipo_proceso_idtipo_proceso } = req.params;
    mysqlConnection.query('SELECT * FROM proceso_fecha WHERE tipo_proceso_idtipo_proceso = ?',[tipo_proceso_idtipo_proceso], (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

/*
router.get('/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('SELECT * FROM employee WHERE id = ?',[id], (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});
*/


module.exports = router;