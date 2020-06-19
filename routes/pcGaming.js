var express = require('express');
var router = express.Router();

const pcGamingController = require('../controllers/pcGamingController');

router.get('/', pcGamingController.root);

router.get('/:category', pcGamingController.byCategory);
router.get('/detail/:productId', pcGamingController.detail)


module.exports = router;
