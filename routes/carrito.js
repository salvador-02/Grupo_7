var express = require('express');
var router = express.Router();

const carritoController = require('../controllers/carritoController');

router.get('/', carritoController.carrito);
router.post('/:id', carritoController.agregar);

module.exports = router;