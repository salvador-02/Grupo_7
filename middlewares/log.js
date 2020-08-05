const json = require("../models/jsonModel");
// const User = json("users");
const { User } = require('../database/models');


module.exports = (req, res, next) => {

  
  res.locals.user = false;

  if(req.session.user){

    res.locals.user = req.session.user;

    return next();
    
  } else if(req.cookies.email) {

    // Buscamos al usuario

    User.findOne(
      {
        where: {
          email : req.cookies.email
         }
      }).then(user => {
        // Sacamos los datos sensibles
      delete user.password;

      // Lo guardamos en sesion
      req.session.user = user;

      // Mandamos datos a la vista
      res.locals.user = user;
      // Continuamos
      return next();

      })

  } else {
    return next();
  }
}