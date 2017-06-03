DROP TABLE IF EXISTS mailDeliveryEvents;

-- TODO: Add more data.

-- Create the table that will store the mail delivery events:
CREATE TABLE mailDeliveryEvents (
    id SERIAL PRIMARY KEY,
    origin CHAR(20),
    destination CHAR(20),
    weight INT,
    volume INT,
    priority CHAR(5) NOT NULL
    CHECK(priority in('high', 'low')),
    status CHAR(10) NOT NULL
    CHECK(status in ('delivered','processing')),
    deliveryTime INT
);

-- Add data to mailDeliveryEvents: (some dummy values)
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Auckland',12.01,34.02,'low','delivered',72);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Auckland',13.07,4.02,'low','delivered',68);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Auckland',15.1,3.02,'low','delivered',82);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Christchurch','Wellington',10.1,3.01,'high','delivered',47);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Taupo','Waikanai',7.1,9.03,'high','delivered',47);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Taupo',13.1,23.01,'low','delivered',70);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Auckland','Wellington',14.1,25.01,'high','delivered',45);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Christchurch','Taupo',7.8,8.68,'low','delivered',84);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Christchurch','Auckland',5.1,23.01,'high','delivered',50);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Dunedin','Wellington',13.1,23.01,'high','delivered',30);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Dunedin',6.1,23.01,'low','delivered',75);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Hamilton',10.1,15.01,'high','delivered',27);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Auckland','Taupo',13.1,19.01,'low','delivered',82);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Wellington','Rotorua',13.1,23.01,'low','delivered',83);
INSERT INTO mailDeliveryEvents (origin,destination,weight,volume,priority,status,deliveryTime) VALUES ('Rotorua','Taupo',3.1,2.01,'high','delivered',23);

-- selecting data from mailDeliveryEvents, show all the rows from the table
SELECT * FROM mailDeliveryEvents;

/*for the business figures, amount of mail:*/
SELECT origin,destination,SUM(weight) AS totalWeight, SUM(volume) AS totalVolume, COUNT(*) AS totalPackagesSent FROM
mailDeliveryEvents GROUP BY origin, destination;

-- work out the average delivery time of all delivered parcels in hours
SELECT ROUND(Avg(deliveryTime),2) AS averageHours FROM maildeliveryevents;

-- work out the average delivery time of all the delivered parcels in days
SELECT ROUND(Avg(deliveryTime)/24,2) AS averageDays FROM maildeliveryevents;
