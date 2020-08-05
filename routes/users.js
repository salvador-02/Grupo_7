const express = require('express');
const router = express.Router();
const path = require('path');
const multer = require('multer');


const usersController = require('../controllers/usersController');
// const { check } = require('express-validator');
const validator = require('../middlewares/validator');
const { login } = require('../controllers/usersController');
const { locals } = require('../app');

// Multer Avatar

  var storage = multer.diskStorage({ 
    destination: (req, file, cb) => {
    cb(null, path.resolve( __dirname, '../public/avatar'));
    
    
    },
    filename: (req, file, cb) => {
      cb(null, file.fieldname + "-" + Date.now() + path.extname(file.originalname));
    },
  });
  
  var upload = multer({ 
        storage: storage,
        fileFilter: (req, file ,cb) => {
            const acceptedExtensions = ['.jpg', '.jpeg', '.png'];
            const ext = path.extname(file.originalname);

            if(!acceptedExtensions.includes(ext)) {
                req.file = file;
            }
            cb(null, acceptedExtensions.includes(ext))
        }
    });

    // Login middlewares validators

    let checkLogin = function(req, res, next) {
      if(req.session.user) {
        return res.redirect('/');
      } else {
        return next();
      }
    };
  
    let checkProfile = function(req, res, next) {
      if(!req.session.user) {
        return res.redirect('/');
      } else {
        return next();
      }
    };

    //
  

// Get Requests
router.get('/login', checkLogin , usersController.login);
router.get('/register', checkLogin, usersController.register);
router.get('/profile', checkProfile, usersController.profile);
router.get('/edit',checkProfile, usersController.edit);


// Post Requests
router.post('/register', upload.single('avatar'), validator.register, usersController.processRegister);
router.post('/loginIn', validator.login, usersController.processLogin);
router.post('/logout', usersController.logOut);
router.post('/edit', upload.single('avatar'),  usersController.update);


module.exports = router;
