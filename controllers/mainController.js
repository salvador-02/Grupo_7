const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos')

const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

// Cambiar nombres de productos del INDEX con JS.


const controller = {
	root: (req, res) => {
		const productos = productModel.leerJson(producto =>{
			return producto
		})

		const product_index = productModel.filterBySomething(producto =>{
			return producto.descuento == 50;
		})
 
		return res.render('index', {productos, product_index});
	},
};

module.exports = controller;