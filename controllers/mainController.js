const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos')
const { Product } = require('../database/models');

// Cambiar nombres de productos del INDEX con JS.

const controller = {
	root: (req, res) => {

		const product_index = Product.findAll({
			where: { 
				descuento: 50 
			}
		}).then((product) => {
			
			return res.render('index', { product });

		}).catch( e => console.log(e))

		// const product_index = productModel.filterBySomething(producto =>{
		// 	return producto.descuento == 50;
		// })
 
		
	},
};

module.exports = controller;