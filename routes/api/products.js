var express = require('express');
var router = express.Router();
var moviesAPIController = require('../../controllers/api/productController')

router.get('/', moviesAPIController.list)

module.exports = router;