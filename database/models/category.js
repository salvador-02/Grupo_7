module.exports = (sequelize, dataTypes) => {
    const alias = 'Category';
    const Category = sequelize.define('Category', {
        name:  dataTypes.STRING,
        description: dataTypes.STRING,
    });

    Category.associate = function(models) {
        Category.hasMany(models.Product, {
            as: 'products',
            foreignKey: 'productId'
        })
    }

    return Category;
}