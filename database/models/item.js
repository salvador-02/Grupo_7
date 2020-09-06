module.exports = (sequelize, dataTypes) => {
    const alias = 'Item';
    const Item = sequelize.define('Item', {
        quantity: dataTypes.INTEGER,
        userId: dataTypes.INTEGER,
        cartId: dataTypes.INTEGER,
        state: dataTypes.TINYINT,
        price: dataTypes.DECIMAL,
        totalPrice: dataTypes.DECIMAL,
        name:  dataTypes.STRING,
        img: dataTypes.STRING,
    });

    Item.associate = function(models) {

        Item.belongsTo(models.Cart, {
            as: 'cart',
            foreignKey: 'cartId'
        })
    }

    return Item;
}