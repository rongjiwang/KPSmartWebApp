var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');

/* global vars*/
var _location = [], _firm = [], _type = [], _active = [];

/* GET users listing. */
router.get('/', function (req, res, next) {
    if(queries.getSignedInUser()==''){
        res.render('index');
        return;
    }
    db.any('select * from route order by id asc')
        .then(data => {

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

            res.render('route-management', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                data: data,
                _location: _location,
                _firm: _firm,
                _type: _type,
                _active: _active
            });
        })
        .catch(error => {
            console.log('Error: ' + error);
        });
});


router.post('/', function (req, res, next) {
    // cast text to postgres style
    let origin = req.body.origin == '' ? ' is not null' : '=\'' + req.body.origin + '\'';
    let dest = req.body.dest == '' ? ' is not null' : '=\'' + req.body.dest + '\'';
    let type = req.body.type == '' ? ' is not null' : '=\'' + req.body.type + '\'';
    let firm = req.body.firm == '' ? ' is not null' : '=\'' + req.body.firm + '\'';
    let active = req.body.active == '' ? ' is not null' : '=\'' + req.body.active + '\'';

    let query = 'select * from route where origin' + origin + ' and destination' + dest + '' +
        ' and deliverytype' + type + ' and transportfirm' + firm + ' and is_active' + active + ' order by id asc';

    db.any(query)
        .then(data => {
            // console.log(data.length);
            var message = data.length == 0 ? 'Please, Choose options from drop-down menu, try again.' : '';
            res.render('route-management', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                data: data,
                _location: _location,
                _firm: _firm,
                _type: _type,
                _active: _active,
                message: message
            });

        })
        .catch(error => {
            console.log('Error: ' + error);
            res.render('route-management', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                data: data,
                _location: _location,
                _firm: _firm,
                _type: _type,
                _active: _active,
                message: message
            });
        });
});
module.exports = router;
