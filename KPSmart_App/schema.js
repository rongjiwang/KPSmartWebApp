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
query = client.query('CREATE TABLE ROUTE(' +
    'id serial primary key,' +
    'origin varchar(30),' +
    'destination varchar(30),' +
    'by_van boolean,' +
    'van_travel_time int,' +
    'van_cost_per_kg_customer real,' +
    'van_basecost_per_day_business int,' +
    'by_air boolean,' +
    'air_travel_time int,' +
    'air_cost_per_kg_customer real,' +
    'air_basecost_per_day_business int,' +
    'is_active boolean' +
    ');');

query = client.query('CREATE TABLE MAIL(' +
    'id serial primary key,' +
    'cost real,' +
    'weight real,' +
    'volume real,' +
    'send_date date,' +
    'arrive_date date,' +
    'is_arrived boolean,' +
    'route_id int references ROUTE(id)' +
    ');');


query.on('end', function(result) { client.end(); });
