var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');


/* global vars*/
var _location = [], _firm = [], _type = [], _active, _critical, _rev;

/* GET users listing. */
router.get('/', function (req, res, next) {
    if(queries.getSignedInUser()==''){
        res.render('index');
        return;
    }else if(queries.isManager()==false){
        res.render('/');
        return;
    }
    /* update mail status */
    let _query = 'update mail set is_arrived=true where arrive_date <= current_date';
    db.any(_query)
        .then(()=>{
        console.log('Mail Updated to date');
    })
    .catch(error => {
        console.log('ERROR: '+error);
    });



    queries.getCriticalRoutes(function(err, resultA){
        if(err){
            console.log(err);
        } else {
            _critical = resultA;
            queries.getRevenueAndExpenditure(function(err, resultB){
                console.log(resultB);
                if(err){
                    console.log(err);
                } else {
                    _rev = resultB;
                    db.any('select * from route where is_active=$1 order by id asc', [true])
                        .then(data => {
                        //console.log("data: " + data);
                        data.forEach(function (item) {
                        if (!_location.includes(item.origin)) {
                            _location.push(item.origin);
                        }
                        if (!_firm.includes(item.transportfirm)) {
                            _firm.push(item.transportfirm);
                        }
                        if (!_type.includes(item.deliverytype)) {
                            _type.push(item.deliverytype);
                        }
                    });
                    res.render('decision-support', {
                        signedInUser: queries.getSignedInUser(),
                        manager: queries.isManager(),
                        data: data,
                        _location: _location,
                        _firm: _firm,
                        _type: _type,
                        criticalRoutes: resultA,
                        routes: resultB,
                        queries: queries
                    });
                })
                }
            });
        }
    });
});


/* Filtering */
router.post('/', function (req, res, next) {
    //console.log(req.body);

    // cast text to postgres style
    let origin = req.body.origin == '' ? ' is not null' : '=\'' + req.body.origin + '\'';
    let dest = req.body.dest == '' ? ' is not null' : '=\'' + req.body.dest + '\'';

    let status = req.body.status;
    if (req.body.status == 'In Transit') {
        status = false;
    }
    if (req.body.status == 'Delivered') {
        status = true;
    }
    status = req.body.status == '' ? ' is not null' : '=\'' + status + '\'';
    //let type = req.body.type == '' ? ' is not null' : '=\'' + req.body.type + '\'';
    //let firm = req.body.firm == '' ? ' is not null' : '=\'' + req.body.firm + '\'';
    //console.log(origin +' '+dest+' '+status);
    let query = 'select * from route natural join mail ' +
        'where origin' + origin + ' and destination' + dest +
        ' and is_arrived'+status+ ' and is_active= ' + true + ' order by id asc';

    db.any(query)
        .then(data => {
        // console.log(data.length);
        var message = data.length == 0 ? 'Please, Choose options from drop-down menu, try again.' : '';
    //console.log(data);
    res.render('decision-support', {
        signedInUser: queries.getSignedInUser(),
        manager: queries.isManager(),
        data: data,
        _location: _location,
        _firm: _firm,
        _type: _type,
        _active: _active,
        routes:_revAndExpen,
        avgDays:_average,
        //display it in your format, Cam
        routes:data,
        message: message,
        queries: queries

    });
})
    .catch(error => {
        console.log('Error: ' + error);
    res.render('decision-support', {
        signedInUser: queries.getSignedInUser(),
        manager: queries.isManager(),
        data: data,
        _location: _location,
        _firm: _firm,
        _type: _type,
        _active: _active,
        routes:data,
        message: message,
        queries: queries

    });
});
});
module.exports = router;