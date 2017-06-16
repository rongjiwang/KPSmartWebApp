var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');
var eventlogger = require('../eventlogger');


/* global vars */
var id;

/* GET users listing. */
router.get('/:id', function (req, res, next) {
    id = req.params.id;
    db.any('select * from route where id=$1', [id]).then(data => {
        console.log(data);
        res.render('route-info', {
            signedInUser: queries.getSignedInUser(),
            manager: queries.isManager(),
            data: data
        });

    }).catch(error => {
        console.log('Error: ' + error);
    });
});

router.post('/', function (req, res, next) {
    if(queries.getSignedInUser()==''){
        res.render('index');
        return;
    }
    console.log(req.body.active);
    db.any('update route set is_active=$1 where id=$2'
        , [req.body.active, id])
        .then(() => {
            db.any('select * from route where id=$1', [id]).then(data => {
                    res.render('route-info', {
                        signedInUser: queries.getSignedInUser(),
                        manager: queries.isManager(),
                        data: data,
                        message: 'Route availability update successful!'
                    });
                    var routeChange = {id: id};
                    if(!data[0].is_active){
                        eventlogger.logEvent(routeChange, 'discontinue');
                    }else{
                        eventlogger.logEvent(routeChange, 'continue');
                    }

}
            ).catch(error => {
                console.log('Error: (Inner) ' + error);
            });


        }).catch(error => {
        console.log('Error: (Outer) ' + error);
    });
});

module.exports = router;
