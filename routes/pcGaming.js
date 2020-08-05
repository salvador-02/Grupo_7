var express = require('express');
var router = express.Router();
const path = require('path');
const multer = require('multer');

const pcGamingController = require('../controllers/pcGamingController');
const adminValidator = require('../middlewares/admin');
const validator = require('../middlewares/validator');



var storage = multer.diskStorage({ 
    destination: (req, file, cb) => {
    cb(null, path.resolve( __dirname, '../public/images'));
    
    
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



router.get('/', pcGamingController.root);
router.get('/:category', pcGamingController.byCategory);
router.get('/detail/:productId', pcGamingController.detail);
router.get('/edit/:productId',  pcGamingController.edit);
router.get('/delete/:productId', pcGamingController.delete);
router.get('/product/create', pcGamingController.create);

router.post('/edit/:productId',  pcGamingController.save);
router.post('/product/create', upload.single('img'), pcGamingController.saveCreate);


module.exports = router;
