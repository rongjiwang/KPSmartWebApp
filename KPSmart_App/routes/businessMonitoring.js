var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');

/* global vars*/
var _location = [], _firm = [], _type = [], _active = [],
    _revAndExpen, _average;

/* GET users listing. */
router.get('/', function (req, res, next) {
    if (queries.getSignedInUser() == '') {
        res.render('index');
        return;
    }
    /* update mail status */
    let _query = 'update mail set is_arrived=true where arrive_date <= current_date';
    db.any(_query)
        .then(() => {
            console.log('Mail Updated to date');
        })
        .catch(error => {
            console.log('ERROR: ' + error);
        });

    queries.getRevenueAndExpenditure(function (err, resultA) {
        if (err) {
            console.log(err);
        } else {
            _revAndExpen = resultA;
            queries.getAverageDays(function (err, resultB) {
                if (err) {
                    console.log(err);
                } else {
                    _average = resultB;
                    queries.getMailDeliveries(function (err, resultC) {
                        if (err) {
                            console.log(err);
                        } else {

                            // Filter Search Feature
                            db.any('select * from route where is_active=$1 order by id asc', [true])
                                .then(data => {
                                    //console.log(data);
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
                                        if (!_active.includes(item.is_active)) {
                                            _active.push(item.is_active);
                                        }
                                    });
                                    console.log(queries);
                                    res.render('business-monitoring', {
                                        signedInUser: queries.getSignedInUser(),
                                        manager: queries.isManager(),
                                        data: data,
                                        _location: _location,
                                        _firm: _firm,
                                        _type: _type,
                                        _active: _active,
                                        routes: resultA,
                                        avgDays: resultB,
                                        mailDeliveries: resultC,
                                        queries: queries
                                    });
                                })
                                .catch(error => {
                                    console.log('Error: ' + error);
                                });
                        }
                    });
                }
            });
        }
    });
});

/* Filtering */
router.post('/', function (req, res, next) {
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
    console.log(origin + ' ' + dest + ' ' + status);
    let query = 'select * from route right join mail on route.id=mail.route_id ' +
        'where route.origin' + origin + ' and route.destination' + dest +
        ' and mail.is_arrived' + status + ' and route.is_active= ' + true + ' order by mail.id asc';

    db.any(query)
        .then(data => {
            // console.log(data.length);
            var message = data.length == 0 ? 'Please, Choose options from drop-down menu, try again.' : '';
            //console.log(data);
            res.render('business-monitoring', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                data: data,
                _location: _location,
                _firm: _firm,
                _type: _type,
                _active: _active,
                routes: _revAndExpen,
                avgDays: _average,
                //display it in your format, Cam
                mailDeliveries: data,
                message: message,
                queries: queries

            });
        })
        .catch(error => {
            console.log('Error: ' + error);
            res.render('business-monitoring', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                data: data,
                _location: _location,
                _firm: _firm,
                _type: _type,
                _active: _active,
                message: message,
                queries: queries

            });
        });
});
module.exports = router;