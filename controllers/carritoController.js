const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos')

const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

const controller = {
	// root: (req, res) => {
        
	// 	return res.render('carrito');
    // },
    carrito: (req, res) =>{
		const all = productModel.leerJson(producto =>{
			return producto
		})

		const productos = productModel.filterBySomething(producto => {
			return producto.carrito == true; 
		})

		return res.render('carrito', {productos})
    }

};


module.exports = controller;