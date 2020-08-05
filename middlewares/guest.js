module.exports = (req, res, next) => {
    if(req.session.user.rol == 0){
        return next();
    } else {
        return res.redirect('/');
    }
}