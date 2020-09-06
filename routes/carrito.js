var express = require('express');
var router = express.Router();

const carritoController = require('../controllers/carritoController');
const { carrito } = require('../controllers/carritoController');

const auth = require('../middlewares/auth')

router.get('/', auth, carritoController.carrito);
router.post('/delete/:userId', auth, carritoController.eliminar);
router.post('/comprar', auth, carritoController.comprar);
router.post('/:id', auth, carritoController.agregar);

module.exports = router;