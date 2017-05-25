--DROP TABLE availableRoutes;

-- the available routes, and amount of money it costs to use the routes, depending on the priority:
CREATE TABLE availableRoutes (
    id SERIAL PRIMARY KEY,
    origin CHAR,
    destination CHAR,
    pricePerGram INT,
    pricePerCubicCM INT,
    priority CHAR
);

-- some dummy values for all the available routes, as well as their costs:
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Wellington","Auckland",10,5,"low");
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Wellington","Auckland",22,19,"high");

INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Christchurch","Wellington",12,2,"low"); 
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Christchurch","Wellington",42,14,"high"); 

INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Taupo","Waikanai",13,4,"low");  
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Taupo","Waikanai",21,14,"high");  

INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Wellington","Taupo",13,5,"low");  
INSERT INTO availableRoutes (origin,destination,pricePerGram,pricePerCubicCM,priority) VALUES ("Wellington","Taupo",23,15,"high");  

-- for customer price updates:
UPDATE availableRoutes SET pricePerGram = 10, pricePerCubicCM = 12 WHERE 
origin = "Wellington" AND destination = "Auckland" AND priority = "low";

/*for the business figures, total revenue:*/
-- Display the total amount of money made from each of the mail delivery events:
SELECT SUM(weight*pricePerGram + volume*pricePerCubicCM) AS totalRevenue FROM mailDeliveryEvents,availableRoutes WHERE
 mailDeliveryEvents.priority == availableRoutes.priority AND 
 mailDeliveryEvents.origin == availableRoutes.origin AND 
 mailDeliveryEvents.destination == availableRoutes.destination;
