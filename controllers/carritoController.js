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
	},
	
	agregar: function(req, res) {
		let producto = productModel.findById(req.params.id)
		if(!producto.carrito){
			producto.carrito = true
		}

		productModel.edit(producto, req.params.id)

		return res.redirect('/carrito');
	}

};


module.exports = controller;