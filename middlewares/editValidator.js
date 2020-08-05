const { body } = require('express-validator');
const path = require('path');


module.exports = {
    edit: [
        body('image')
        .bail()
        .custom((value, {req}) => {

            if (req.file) {
                const acceptedExtensions = ['.jpg', '.jpeg', '.png'];
                const ext = path.extname(req.file.originalname);
            if (acceptedExtensions.includes(ext)) {
                    return true;
                } else {
                    return false;
                }
            }
        }).withMessage('Extension invalida'),
    ]
}