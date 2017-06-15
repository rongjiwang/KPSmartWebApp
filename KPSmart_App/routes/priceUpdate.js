var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');


/* GET users listing. */
router.get('/', function(req, res, next) {
    db.any('select * from route where is_active=$1 order by id asc',[true]).then(data => {
        //console.log(data);
        var _location = [], _firm = [], _type = [], _active = [];
        data.forEach(function(item){
            if(!_location.includes(item.origin)){
            _location.push(item.origin);
            }
            if(!_firm.includes(item.transportfirm)){
                _firm.push(item.transportfirm);
            }
            if(!_type.includes(item.deliverytype)){
                _type.push(item.deliverytype);
            }
            if(!_active.includes(item.is_active)){
                _active.push(item.is_active);
            }
        });

        res.render('price-update', {signedInUser: queries.getSignedInUser(), manager: queries.isManager(),
            data: data, _location:_location, _firm:_firm, _type:_type, _active:_active});

    }).catch(error => {
        console.log('Error: ' + error);
    });
});

router.post('/', function(req, res, next){
    console.log(req.body.dist+' '+req.body.origin+' '+req.body.type+' '+req.body.firm);
    let _origin = req.body.origin == ''? 'is not null' : req.body.origin;
    let _dist = req.body.dist == ''? 'is not null' : req.body.dist;
    let _type = req.body.type == ''? 'is not null' : req.body.type;
    let _firm = req.body.firm == ''? 'is not null' : req.body.firm;
    console.log(_origin+' '+_dist+' '+_type+' '+_firm);
    //todo exceptions

    db.any('select * from route where id'+'=1').then(data => {
        console.log(data);
        //res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager(), data:data});

    }).catch(error => {
        console.log('Error: ' + error);
    });
});

module.exports = router;
