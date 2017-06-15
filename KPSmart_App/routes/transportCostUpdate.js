var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');


/* GET users listing. */
router.get('/', function(req, res, next) {
    db.any('select * from route where is_active=$1 order by id asc',[true]).then(data => {
        res.render('transport-cost-update', {signedInUser: queries.getSignedInUser(), manager: queries.isManager(), data: data});

    }).catch(error => {
        console.log('Error: ' + error);
    });
});

module.exports = router;
