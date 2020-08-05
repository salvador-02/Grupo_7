const { body } = require('express-validator');
const path = require('path');
const bcrypt = require('bcryptjs');

// Middlewares propios
const { User } = require('../database/models');

module.exports = {
  register: [
    //Name
    body("name")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail(),
    //Lastname
    body("lastname")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail(),
    //Username
    body("username")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .custom((value) => {
        return User.findOne( {
          where: { username: value }
        }).then((user) => {
          if (user) {
            return Promise.reject("Nombre de usuario en uso")
        }
      })
    }),
    //Img
    body('image')
      .custom((value, { req })=>{
       
        if (req.file) {
          return true;
        } else {
          return false
        }
      }).withMessage('Imagen obligatoria')
      .bail()
      .custom((value, {req}) => {
        const acceptedExtensions = ['.jpg', '.jpeg', '.png'];
        const ext = path.extname(req.file.originalname);
        if (acceptedExtensions.includes(ext)) {
          return true;
        } else {
          return false;
        }
      })
      .withMessage('Extension invalida'),
    // Email
    body("email")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .isEmail()
      .withMessage("Debes ingresar un email válido")
      .bail()
      .custom((value) => {
        return User.findOne( {
          where: {
            email: value
          }
        }).then((user) => {
          if (user) {
            return Promise.reject("Email en uso")
        }
      })
    }),
    // Password
    body("password")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .isLength({ min: 3 })
      .withMessage("La contraseña debe tener al menos 3 carácteres"),
    // Retype password
    body("retypePassword")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .custom((value, { req }) => req.body.password === value)
      .withMessage("Las contraseñas no coinciden"),
  ],
  
  login: [
    body("email")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .custom(( value, { req } ) => {
        return User.findOne( { 
          where: { email: value }
        }).then((user) => {
          if (user) {
            if (bcrypt.compareSync(req.body.password, user.password) == false ) {

              return Promise.reject("Email o contraseña invalidos");

            }
          } else {

            return Promise.reject("Email o contraseña invalidos");
          }
        })
      }),
    body("password").notEmpty().withMessage("Campo obligatorio"),
  ],
};

