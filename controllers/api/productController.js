const { Product } = require('../../database/models');

const productController = {
	list: (req, res) => {

		Product.findAll().then((products) => {
            let response = {
                meta: {
                    status: 200,
                    total: products.length,
                    url: "/api/products"
                },
                data: products
            };
			res.json(response)

		}).catch( e => console.log(e))

    }
};
    
module.exports = productController;