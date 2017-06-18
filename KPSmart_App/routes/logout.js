var express = require('express');
var router = express.Router();
var queries = require('../queries');


/* GET users listing. */
router.get('/', function (req, res, next) {
    queries.resetSignedInUser()=='';
    queries.resetManager()==false;
    console.log('got here');
    res.render('index');

});

module.exports = router;