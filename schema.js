/**
 * Created by kevin on 31/05/2017.
 */
var pg = require('pg')
    , connectionString = process.env.DATABASE_URL
    , client
    , query;

client = new pg.Client(connectionString);
client.connect();
query = client.query('CREATE TABLE Users (Username CHAR(20) NOT NULL,Password CHAR(10) NOT NULL,Manager Boolean);');

query.on('end', function(result) { client.end(); });