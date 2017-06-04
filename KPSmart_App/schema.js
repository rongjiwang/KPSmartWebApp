var pg = require('pg').native
    , connectionString = process.env.DATABASE_URL
    , client
    , query;

client = new pg.Client(connectionString);
client.connect();

//----------User Account Table---------
query = client.query('CREATE TABLE Users (' +
    'Username CHAR(20) NOT NULL,' +
    'Password CHAR(10) NOT NULL,' +
    'Manager Boolean)'
);

//---------Buiness Routes Table--------
//query = client.query('');




query.on('end', function(result) { client.end(); });
