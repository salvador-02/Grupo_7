const { Cart, Item, Product, } = require('../database/models');
const item = require('../database/models/item');

const controller = {

    carrito: (req, res) =>{
		var subTotal = 0;
		Item.findAll({
			where: {
				state: 1,
				userId: req.session.user.id
			}
		}).then( items => {
			items.forEach(item => {
				subTotal = subTotal - item.totalPrice;
				
			})
			subTotal = Math.abs(subTotal);
			subTotal = subTotal.toFixed(2)

			return res.render( 'carrito', {items, subTotal} )
		})

	},
	
	agregar: function(req, res) {

		 Product.findByPk(req.body.productId)
		 .then(product => {
			return Item.create( {
				price: product.price - (product.price * product.descuento / 100),	
				quantity: req.body.quantity,
				state: 1,
				totalPrice: (product.price - (product.price * product.descuento / 100)) * req.body.quantity,
				name: product.name,
				img: product.img,
				userId: req.session.user.id,
				cartId: null,
			})

		 }).then(() => res.redirect('/carrito'))
		
	},

	eliminar: function(req, res) {
		Item.destroy({
			where: {
				id: req.body.itemId
			},
			force: true,
			
		}).then( () => res.redirect('/carrito')).catch(function (e) {
			console.log(e)
		})
	},

	comprar: function(req, res) {
		let totalPrice = 0;

		Item.findAll({
			where: {
				state: 1,
				userId: req.session.user.id
			}
		}).then( items => {
			// items.forEach( item => {
			// 	totalPrice = totalPrice + item.subTotal
			// });
			totalPrice = items.reduce((total, item) => total += Number(item.totalPrice), 0)
			return Cart.findOne({
				order: [['createdAt', 'DESC']]
			});
		}).then(cart => {
			let obj = {
				orderNumber: cart ? cart.orderNumber + 1 : 1000,
				total: totalPrice,
				userId: req.session.user.id,
			}

			return Cart.create(obj)
		}).then(cart => {
			
			return Item.update({
				state: 0,
				cartId: cart.id,
			},{
				where: {
					userId: req.session.user.id,
					state: 1
				}
			})
		}).then(() => res.redirect('/')).catch(e => console.log(e))
	}
};



module.exports = controller;