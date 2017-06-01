var express = require('express');
var router = express.Router();
var queries = require('../queries');

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('route-cost-update', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
});
module.exports = router;
