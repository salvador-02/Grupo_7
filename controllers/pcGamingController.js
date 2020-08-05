const { Product } = require('../database/models');
const jsonModel = require('../models/jsonModel');
const productModel = jsonModel('productos');


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

	edit: (req, res) => {
		Product.findByPk(req.params.productId)
		.then(product =>{
			return res.render('editProduct', {product})
		})
	},

	save: (req, res) => {

			Product.findByPk(req.params.productId)
			.then(product => {

				const _body = req.body;

				_body.name = req.body.name;
				_body.description = req.body.description;
				_body.price = req.body.price;
				_body.descuento = req.body.descuento;
				_body.categoryId = req.body.categoryId;
				_body.brandId = req.body.brandId;
				_body.img = req.file.filename;
				


				return Product.update({
					name: _body.name,
					description: _body.description,
					price: _body.price,
					descuento: _body.descuento,
				} , 
				{ 
					where: {
						id: req.params.productId
					}
				}).then(product => {
					product = _body;
					// return res.render('editProduct', {product});
					return res.redirect('/pc-gaming' )
				})
			})
	},

	delete: (req,res) => {
		
		Product.destroy({

			where: { 
				id : req.params.productId 
			}
		}).then((product) => {

			return res.redirect('/pc-gaming')

		}).catch( e => console.log(e))
	},

	create: (req, res) => {

		return res.render('createProduct')

	},

	saveCreate: (req, res) => {

		const _body = req.body;

				_body.name = req.body.name;
				_body.description = req.body.description;
				_body.price = req.body.price;
				_body.descuento = req.body.descuento;
				_body.brandId = req.body.brandId;
				_body.categoryId = req.body.categoryId;
				_body.stock = req.body.stock;
				_body.img = req.file.filename;

	
			Product.create(_body)
				.then( product => {
					console.log(_body);
					
					return res.redirect('/pc-gaming');
				})
				.catch(err => {
					console.log(err);
				})
		}
	
};


module.exports = controller;