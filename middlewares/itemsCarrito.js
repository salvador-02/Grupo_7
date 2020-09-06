const { Item } = require('../database/models');

module.exports = (req, res, next) => {
  if (req.session.user) {

    res.locals.itemsCarrito = 0
    Item.findAll({
      where: {
        state: 1,
        userId: req.session.user.id,
      }
    }).then(items => {
  
      res.locals.itemsCarrito = items.length
  
      return next()
    })

  } else {

    return next()

  }



    
}
