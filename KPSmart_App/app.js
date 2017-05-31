var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var index = require('./routes/index');
var users = require('./routes/users');
var welcome = require('./routes/welcome');
var priceUpdate = require('./routes/priceUpdate');
var mailDelivery = require('./routes/mailDelivery');
var businessMonitoring = require('./routes/businessMonitoring');
var transportCostUpdate = require('./routes/transportCostUpdate');
var routeManagement = require('./routes/routeManagement');



var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

//app.use('*', loggedInUser);

app.use('/', index);
app.use('/welcome', welcome);
app.use('/users', users);
app.use('/mailDelivery', mailDelivery);
app.use('/priceUpdate', priceUpdate);
app.use('/businessMonitoring', businessMonitoring);
app.use('/transportCostUpdate', transportCostUpdate);
app.use('/routeManagement', routeManagement);


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
