const { Product } = require('../database/models');
const { Op } = require('sequelize');

const controller = {
	root: (req, res) => {

		Product.findAll({
			where: { 
				descuento: 50 
			}
		}).then((product) => {
			
			return res.render('index', { product });

		}).catch( e => console.log(e))
 
	},

	search: (req , res) => {
		Product.findAll({
			where: {
				name: {
					[Op.substring]: req.query.searchBar
				}
			},
			limit: 12
		})
		.then(product => {
			return res.render( 'pc-gaming', { product, search: req.query.searchBar })
		})
	}
};

module.exports = controller;