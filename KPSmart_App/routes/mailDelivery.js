var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');

/* Global vars */
var total_cost = 0,_weight = 0,_volume = 0,days = 0,route_id = -1, _origin ='', _dest = '', _freight = '';
/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('mail-delivery', {signedInUser: queries.getSignedInUser(), manager: queries.isManager()});
});


//---------Add a new mail-----------
router.post('/', function(req, res) {
     _origin = req.body.origin;
     _dest = req.body.destination;
     _freight = req.body.type_freight;
     _weight = req.body.weight;
     _volume = req.body.volume;
    if(_freight == 'Van (3-7 working days)'){_freight = 'van';}
    if(_freight == 'Air (1-3 working days)'){_freight = 'air';}
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
    //negitive numbers
    }else if(Number(_weight)<=0 || Number(_volume)<=0) {
        res.render('mail-delivery',
            {signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Please, weight or volume only accept positive value.'
            });
    //undefined freight
    }else if(_freight != 'van' && _freight != 'air') {
        res.render('mail-delivery',
            {signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Please, choose one of the available freight.'
            });
    }else {
        //database search for that route with same origin and destination
        /*db.any('select * from route where origin=$1 and destination=$2',
            [_origin, _dest])
            .then(data => {
                // per kg cost
                //total_cost = _freight=='van'?data[0].van_cost_per_kg_customer : data[0].air_cost_per_kg_customer;
                // total_cost = total_cost*_weight*_volume;
                //days = _freight=='van'?data[0].van_travel_time : data[0].air_travel_time;
                //route_id = data[0].id;

                //let_is_active = data[0].is_active;

                //if route disable , then redirect user
                //if(!_is_active){

                }
                res.render('mail-delivery-confirm', {
                    signedInUser: queries.getSignedInUser(),
                    manager: queries.isManager(),
                    origin:_origin,
                    dest:_dest,
                    freight:_freight,
                    weight:_weight,
                    volume:_volume,
                    send_date:new Date(),
                    travel_date:days,
                    cost:total_cost
                });

            })
            .catch(error =>{
                console.log('Error:',error);
                res.render('mail-delivery',
                    {message:'Please, Choose the locations from options, try again.'});
            });*/
        //todo show the route is disabled, show the common transaction route
        //todo if success, then add mail to the mail list, show in green success message
    }
});


router.post('/confirm', function(req, res){/*
    db.one('insert into mail values(default,$1,$2,$3,current_date,current_date+$4,$5,$6) returning *',
        [total_cost,_weight,_volume,days,false,route_id])
        .then(data =>{
            //console.log('success');
            //console.log(total_cost+' '+_weight+' '+_volume+' '+days+' '+route_id+' '+ _origin+' '+ _dest+' '+ _freight);
            res.render('receipt', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                _id:data.id,
                origin:_origin,
                dest:_dest,
                freight:_freight,
                weight:_weight,
                volume:_volume,
                send_date:new Date(),
                arrive_date:data.arrive_date,
                routeid:route_id,
                cost:total_cost
            });
        })
        .catch(error => {
            console.error('Error:',error);

        });*/
});

module.exports = router;
