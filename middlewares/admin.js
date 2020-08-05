module.exports = (req, res, next) => {
    if(req.session.user.rol == 1){
        return next();
    } else {
        return res.redirect('/');
    }
}