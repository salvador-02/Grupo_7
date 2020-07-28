module.exports = (sequelize, dataTypes) => {
    const alias = 'Brand';
    const Brand = sequelize.define('Brand', {
        name:  dataTypes.STRING,
    });
    
    Brand.associate = function(models) {
        Brand.hasMany(models.Product, {
            as: 'products',
            foreignKey: 'brandId'
        })
    }

    return Brand;
}