var express = require('express');
var router = express.Router();
var queries = require('../queries');

var mailDelivery = {ID:'', origin:'', dest:'', weight:0, volume:0, date:''};


/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
});


/* GET users listing. */
router.post('/', function(req, res) {
    mailDelivery.ID = req.body.parcelID;
    mailDelivery.origin = req.body.parcelOrigin;
    mailDelivery.dest = req.body.parcelDest;
    mailDelivery.weight = req.body.parcelWeight;
    mailDelivery.volume = req.body.parcelVolume;
    if (mailDelivery.ID == '' || mailDelivery.origin == '' || mailDelivery.dest == '' || mailDelivery.weight == 0 || mailDelivery.volume == 0){
        res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager(), message: 'Please make sure all fields are entered and try again'});
    }else if(mailDelivery.dest == mailDelivery.origin){
        res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager(), message: 'Parcel cannot have the same Origin and Destination!'});
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
module.exports = router;
