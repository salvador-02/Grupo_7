const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos')


const controller = {
	login: (req, res) => {

		return res.render('login');
    },
    
};

module.exports = controller;