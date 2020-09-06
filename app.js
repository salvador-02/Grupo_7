var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
const multer = require('multer');

const { Sequelize } = require('sequelize');


const indexRouter = require('./routes/index');
const usersRouter = require('./routes/users');
const pcGamingRouter = require('./routes/pcGaming');
//Api Products
const apiProductsRouter = require('./routes/api/products');

const carritoRouter = require('./routes/carrito');
const log = require('./middlewares/log')
const itemsCarrito = require('./middlewares/itemsCarrito')

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(session( { 
  secret:'miapp',
  resave: true,
  saveUninitialized: true
 } ));

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(log);
app.use(itemsCarrito);

app.use('/', indexRouter);
app.use('/pc-gaming', pcGamingRouter);
app.use('/users', usersRouter);
app.use('/carrito', carritoRouter);
app.use('/register', usersRouter);
// Apis
app.use('/api/products', apiProductsRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});



module.exports = app;
