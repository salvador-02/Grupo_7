module.exports = (sequelize, dataTypes) => {
    
    const User = sequelize.define('User', {
        name: dataTypes.STRING,
        lastname: dataTypes.STRING,
        email: dataTypes.STRING,
        password: dataTypes.STRING,
        rol: dataTypes.TINYINT,
        username: dataTypes.STRING,
        image: dataTypes.STRING,
    });
    

    User.associate = function(models){
        User.hasMany(models.Cart, {
            as: 'carts',
            foreignKey: 'userId'
        })
    }

    return User;

}