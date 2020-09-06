module.exports = (sequelize, dataTypes) => {
    const alias = 'Product';
    const Product = sequelize.define('Product', {
        name:  dataTypes.STRING,
        description: dataTypes.STRING,
        categoryId: dataTypes.INTEGER,
        price: dataTypes.DECIMAL,
        brandId: dataTypes.TINYINT,
        img: dataTypes.STRING,
        stock: dataTypes.INTEGER,
        descuento: dataTypes.INTEGER
    });

    Product.associate = function(models) {
        
        Product.belongsTo(models.Category, {
            as: 'category',
            foreignKey: 'categoryId'
        }),

        Product.belongsTo(models.Brand, {
            as: 'brand',
            foreignKey: 'brandId'
        })

    }
  
    return Product;

}