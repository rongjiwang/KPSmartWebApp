var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');



/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
});


//---------Add a new mail-----------
router.post('/', function(req, res) {
    var _origin = req.body.origin;
    var _dest = req.body.destination;
    var _freight = req.body.type_freight;
    var _weight = req.body.weight;
    var _volume = req.body.volume;
    console.log(_origin+' '+_dest+' '+_freight+' '+_weight+' '+_volume);
    //incompleted form
    if (_origin=='' || _dest=='' || _freight=='' || _weight=='' ||_volume==''){
        res.render('mail-delivery',
            {signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Please make sure all fields are entered and try again'});
    //duplicate location
    }else if(_origin == _dest){
        res.render('mail-delivery',
            {signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Parcel cannot have the same Origin and Destination!'
            });
    //completed form
    }else {
        var date = queries.getDate();
        res.render('mail-delivery-confirm', {
            signedInUser: queries.getSignedInUser(),
            manager: queries.isManager(),
            mailDelivery: mailDelivery,
            date: date
        });
    }
});

/*
router.post('/confirm', function(req, res){
    res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
    queries.mailDelivery(mailDeliveryInput, function(err, result){
        if(err){
            res.render('index', {message: 'Incorrect Username or Password'});
        } else {
            res.render('welcome', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
        }
    });
});
*/
module.exports = router;
