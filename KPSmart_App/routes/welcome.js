var express = require('express');
var router = express.Router();
var queries = require('../queries');


/* GET users listing. */
router.get('/', function (req, res, next) {
    if(queries.getSignedInUser()==''){
        res.render('index');
        return;
    }
    res.render('welcome', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
});

module.exports = router;