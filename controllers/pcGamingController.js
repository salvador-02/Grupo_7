const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos')

const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

// const controller = {
// 	root: (req, res) => {
// 		res.render('pc-Gaming');
// 	}
// };

const controller = {
	root: (req, res) => {
		const productos = productModel.leerJson(producto =>{
			return producto
		})

		// const category_mouse = productModel.filterBySomething(producto =>{
		// 	return producto.category == 'mouse';
		// })
        
		return res.render('pc-gaming', {productos});
	},

	byCategory: (req, res) =>{
		const all = productModel.leerJson(producto =>{
			return producto
		})

		const productos = productModel.filterBySomething(producto => {
			return producto.category == req.params.category;
		})

		return res.render('pc-gaming', {productos})

	},

	detail: (req, res) => {
		const product = productModel.findById(req.params.productId)

		return res.render('detail', {product})
	},

};


module.exports = controller;