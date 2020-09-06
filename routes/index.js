var express = require('express');
var router = express.Router();

const mainController = require('../controllers/mainController');

router.get('/', mainController.root);
router.get('/results', mainController.search);

module.exports = router;
