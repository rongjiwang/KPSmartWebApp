var express = require('express');
var router = express.Router();
var queries = require('../queries');


/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('route-management', {signedInUser: queries.getSignedInUser()});
});

module.exports = router;
