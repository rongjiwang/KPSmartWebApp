var pg = require('pg');

var signedInUser = 'Brah';
var manager = false;
var database = process.env.DATABASE_URL || "postgres://postgres:w2sybb57@localhost:5432/cameronmclachlan";


exports.getSignedInUser = function(){
   console.log('brah' + signedInUser);
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

        client.query("SELECT * FROM users WHERE Username = '" + username + "' AND Password='" + password + "';", function (error, result) {
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
