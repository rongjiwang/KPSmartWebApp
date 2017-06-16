var express = require('express');
var router = express.Router();
var queries = require('../queries');

var pg = require('pg');

// Different for everyPerson
var database = "postgres://postgres:w2sybb57@localhost:5432/cameronmclachlan";

pg.connect(database, function (err) {
    if (err) {
        console.error('Could not connect to the database.');
        console.error(err);
        return;
    }
    console.log('Connected to database.');
});

/* GET index page. */
router.get('/', function(req, res, next) {
    res.render('index');
});


/* POST login page */
router.post('/', function(req, res) {
    var username = req.body.username;
    var password = req.body.password;
    queries.login(username, password, function(err, result){
        if(err){
            res.render('index', {message: 'Incorrect Username or Password'});
        } else {
            res.render('welcome', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
        }
    });
});


module.exports = router;
