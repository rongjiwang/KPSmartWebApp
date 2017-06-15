var express = require('express');
var router = express.Router();
var queries = require('../queries');


/* GET users listing. */
router.get('/', function (req, res, next) {
    queries.getBusinessMonitoringA(function (err, resultA) {
        if (err) {
            console.log(err);
        } else {
            queries.getBusinessMonitoringB(function (err, resultB) {
                if (err) {
                    console.log(err);
                } else {
                    console.log("A: " + resultA);
                    console.log("B: " + resultB);

                    res.render('business-monitoring', {
                        signedInUser: queries.getSignedInUser(),
                        manager: queries.isManager(),
                        routes: resultA,
                        avgDays: resultB
                    });
                }
            });
        }
    });
});

module.exports = router;