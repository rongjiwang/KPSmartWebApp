DROP TABLE IF EXISTS mailDeliveryEvents;

-- TODO: EXTRA COLUMNS in mailDeliveryEvents: status (delivered or not), TIME STAMP (If delivered == true some random value, else 0 or NULL)
-- TODO: Add more data.


-- Create the table that will store the mail delivery events:
CREATE TABLE mailDeliveryEvents (id SERIAL PRIMARY KEY, origin CHAR(20), destination CHAR(20),
weight INT, volume INT, priority CHAR(20));

-- Add data to mailDeliveryEvents: (some dummy values)
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority) VALUES ('Wellington','Auckland',12.01,34.02,'low');
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority) VALUES ('Wellington','Auckland',13.07,4.02,'low');
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority) VALUES ('Wellington','Auckland',15.1,3.02,'low');
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority) VALUES ('Christchurch','Wellington',10.1,3.01,'high');
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority) VALUES ('Taupo','Waikanai',7.1,9.03,'high');
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority) VALUES ('Wellington','Taupo',13.1,23.01,'low');


-- selecting data from mailDeliveryEvents, show all the rows from the table
SELECT * FROM mailDeliveryEvents;

/*for the business figures, amount of mail:*/
SELECT origin,destination,SUM(weight) AS totalWeight, SUM(volume) AS totalVolume, COUNT(*) AS totalPackagesSent FROM 
mailDeliveryEvents GROUP BY origin, destination;


