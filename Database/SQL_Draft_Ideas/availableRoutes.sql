DROP TABLE If EXISTS availableRoutes;

-- the available routes, and amount of money it costs to use the routes, depending on the priority:
CREATE TABLE availableRoutes (
    id SERIAL PRIMARY KEY,
    origin CHAR(20),
    destination CHAR(20),
    pricePerGram INT,
    pricePerCubicCM INT,
    companyCostPerGram INT,
    companyCostPerCubicCM INT,
    priority CHAR(20)
);

-- some dummy values for all the available routes, as well as their costs:
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Wellington','Auckland',10,5,3,7,'low');
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Wellington','Auckland',22,19,2,3,'high');

INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Christchurch','Wellington',12,2,2,5,'low');
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Christchurch','Wellington',42,14,5,3,'high');

INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Taupo','Waikanai',13,4,5,8,'low');
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Taupo','Waikanai',21,14,6,4,'high');

INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Wellington','Taupo',13,5,4,5,'low');
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,priority) VALUES ('Wellington','Taupo',23,15,12,7,'high');

-- for customer price updates:
UPDATE availableRoutes SET pricePerGram = 10, pricePerCubicCM = 12 WHERE
origin = 'Wellington' AND destination = 'Auckland' AND priority = 'low';

SELECT * FROM availableRoutes;

/*for the business figures, total revenue:*/
-- Display the total amount of money made from each of the mail delivery events:
SELECT SUM(weight*pricePerGram + volume*pricePerCubicCM) AS totalRevenue FROM mailDeliveryEvents,availableRoutes WHERE
 mailDeliveryEvents.priority = availableRoutes.priority AND
 mailDeliveryEvents.origin = availableRoutes.origin AND
 mailDeliveryEvents.destination = availableRoutes.destination;

 -- total expenditure:
SELECT availableRoutes.origin, availableRoutes.destination, SUM(companyCostPerGram*weight) AS total_Amount_Spent_For_Weight,
SUM (companyCostPerCubicCM*volume) AS total_Amount_Spent_For_Volume,
SUM(companyCostPerGram*weight+companyCostPerCubicCM*volume) AS Total_Amount_Spent
FROM availableRoutes,mailDeliveryEvents
GROUP BY availableRoutes.origin,availableRoutes.destination
