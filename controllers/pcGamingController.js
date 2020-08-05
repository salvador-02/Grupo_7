const { Product } = require('../database/models');
const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos')


const controller = {
	root: (req, res) => {

		const productList = Product.findAll().then((product) => {
			
			return res.render('pc-gaming', { product });

		}).catch( e => console.log(e))

	},

	byCategory: (req, res) => {

		const productList = Product.findAll({
			where: {
				categoryId: req.params.category
			}
		}).then((product) => {

			return res.render('pc-gaming', { product });

		}).catch( e => console.log(e))

	},


	detail: (req, res) => {

		const productDetail = Product.findOne({

			where: { 
				id : req.params.productId 
			}
		}).then((product) => {

			return res.render('detail', { product })

		}).catch( e => console.log(e))

	},

};


module.exports = controller;