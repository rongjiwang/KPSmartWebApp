DROP TABLE IF EXISTS mailDeliveryEvents;

-- TODO: EXTRA COLUMNS in mailDeliveryEvents: status (delivered or not), TIME STAMP (in days)
-- TODO: Add more data.


-- Create the table that will store the mail delivery events:
CREATE TABLE mailDeliveryEvents (
    id SERIAL PRIMARY KEY,
    origin CHAR(20),
    destination CHAR(20),
    weight INT,
    volume INT,
    priority CHAR(20),
    status CHAR(10) NOT NULL
    -- this is to make sure that status can only be delivered or processing, no other options
    CHECK(status in ('delivered','processing')),
    -- in days
    deliveryTime INT
);

-- Add data to mailDeliveryEvents: (some dummy values)
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Auckland',12.01,34.02,'low','delivered',5);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Auckland',13.07,4.02,'low','delivered',4);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Auckland',15.1,3.02,'low','delivered',4);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Christchurch','Wellington',10.1,3.01,'high','delivered',2);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Taupo','Waikanai',7.1,9.03,'high','delivered',2);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Taupo',13.1,23.01,'low','delivered',3);


-- selecting data from mailDeliveryEvents, show all the rows from the table
SELECT * FROM mailDeliveryEvents;

/*for the business figures, amount of mail:*/
SELECT origin,destination,SUM(weight) AS totalWeight, SUM(volume) AS totalVolume, COUNT(*) AS totalPackagesSent FROM
mailDeliveryEvents GROUP BY origin, destination;

-- work out the average delivery time of all delivered parcels
SELECT ROUND(Avg(deliveryTime),2) AS averageDeliveryTime FROM maildeliveryevents;