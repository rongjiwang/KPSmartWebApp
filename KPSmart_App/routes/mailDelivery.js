var express = require('express');
var router = express.Router();
var queries = require('../queries');

var mailDeliveryInput = {ID:'', origin:'', dest:'', weight:0, volume:0};


/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
});


/* GET users listing. */
router.post('/', function(req, res) {
    mailDeliveryInput.ID = req.body.parcelID;
    mailDeliveryInput.origin = req.body.parcelOrigin;
    mailDeliveryInput = req.body.parcelDest;
    mailDeliveryInput.weight = req.body.parcelWeight;
    mailDeliveryInput.volume = req.body.parcelVolume;
    res.render('mail-delivery-confirm', {signedInUser: queries.getSignedInUser(), manager: queries.isManager(), mailDelivery: mailDeliveryInput});

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
