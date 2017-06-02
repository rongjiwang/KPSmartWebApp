var pg = require('pg');

var signedInUser = '';
var manager = false;
var database = "postgres://postgres:w2sybb57@localhost:5432/cameronmclachlan";


exports.getSignedInUser = function(){
   return signedInUser;
}

exports.getDatabse = function(){
    return database;
}

exports.isManager = function(){
    return manager;
}


exports.login = function(username, password, callback){
    pg.connect(database, function (err, client, done) {
        if (err) {
            console.error('Could not connect to the database.');
            console.error(err);
            callback(err);
            return;
        }

        var query = "SELECT * FROM users WHERE Username = '" + username + "' AND Password='" + password + "';"

        client.query(query, function (error, result) {
            done();
            if (error) {
                console.error('Failed to execute query.');
                console.error(error);
                callback(err);
                return;
            }

            if (result.rows[0] == null){
                callback('error');
                return
            }
            signedInUser = result.rows[0].username;
            manager = result.rows[0].manager;
            console.log(signedInUser);
            callback(null, result.rows[0]);
        });
    });
}

exports.mailDelivery = function(mail, callback){
    pg.connect(database, function (err, client, done) {
        if (err) {
            console.error('Could not connect to the database.');
            console.error(err);
            callback(err);
            return;
        }
        var query = '';

        client.query(query, function(error, result){
            done();
            if(error){
                console.error('Failed to add mail.');
                console.error(error);
                callback(err);
                return;
            }
            callback(null);
        });
    });

}

exports.getDate = function(){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    }
    if(mm<10){
        mm='0'+mm;
    }
    var today = dd+'/'+mm+'/'+yyyy;
    return today;
}