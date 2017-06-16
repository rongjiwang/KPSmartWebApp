    //---Init---
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

//-----Routes directions---
var index = require('./routes/index');
var logout = require('./routes/logout');
var welcome = require('./routes/welcome');
var priceUpdate = require('./routes/priceUpdate');
var mailDelivery = require('./routes/mailDelivery');
var businessMonitoring = require('./routes/businessMonitoring');
var transportCostUpdate = require('./routes/transportCostUpdate');
var routeManagement = require('./routes/routeManagement');
var routeInfo = require('./routes/routeInfo');
var routeCost = require('./routes/routeCost');
var routePrice = require('./routes/routePrice');
var decisionSupport = require('./routes/decisionSupport');

var app = express();

//---view engine setup---
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

//---Middleware---
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

//---Join directory---
app.use(express.static(path.join(__dirname, 'public')));

//---Routes---
app.use('/', index);
app.use('/logout', logout);
app.use('/welcome', welcome);
app.use('/mailDelivery', mailDelivery);
app.use('/priceUpdate', priceUpdate);
app.use('/businessMonitoring', businessMonitoring);
app.use('/transportCostUpdate', transportCostUpdate);
app.use('/routeManagement', routeManagement);
app.use('/routeInfo', routeInfo);
app.use('/routeCost', routeCost);
app.use('/routePrice', routePrice);
app.use('/decisionSupport', decisionSupport);



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

function loggedInUser(req, res, next){
    res.locals.signedInUser = queries.getSignedInUser();
    res.locals.isManager = queries.isManager();
    console.log(res.locals.signedInUser);
    next();
}

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
