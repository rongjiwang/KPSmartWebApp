var express = require('express');
var router = express.Router();
var queries = require('../queries');


/* GET users listing. */
router.get('/', function(req, res, next) {
    queries.getBusinessMonitoringA(function(err, result){
        if(err){
            console.log(err);
        } else {
            res.render('business-monitoring', {signedInUser: queries.getSignedInUser(), manager: queries.isManager(), routes: result});
        }
    });
});

module.exports = router;