module.exports = (sequelize, dataTypes) => {
    const alias = 'Cart';
    const Cart = sequelize.define('Cart', {
        orderNumber: dataTypes.INTEGER,
        total: dataTypes.DECIMAL,
        userId: dataTypes.TINYINT,
    }, {
        tableName: 'cart'
    });

    Cart.associate = function(models) {
        Cart.hasMany(models.Item, {
            as: 'items',
            foreignKey: 'cartId'
        }),

        Cart.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'userId'
        })


    }

    return Cart;
}