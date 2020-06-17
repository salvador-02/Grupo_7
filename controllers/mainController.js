const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos')

const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

// Cambiar nombres de productos del INDEX con JS.


const controller = {
	root: (req, res) => {
		const productos = productModel.leerJson(producto =>{
			return producto
		})

		const asd = productModel.filterBySomething(producto =>{
			return producto.thematic == 'asd';
		})
        
		return res.render('index', {productos, asd});
	}
};

module.exports = controller;