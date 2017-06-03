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

-----------------------
--** TOTAL REVENUE **--
-----------------------

CREATE VIEW revenueTable AS (
SELECT m.origin AS mail_Origin ,m.destination AS mail_Destination,m.weight AS mail_Weight,
m.volume AS mail_Volume,a.pricePerGram,a.pricePerCubicCM, a.priority,
m.weight*a.pricePerGram + m.volume*a.pricePerCubicCM AS revenue
FROM mailDeliveryEvents m JOIN availableRoutes a
ON m.origin = a.origin AND m.destination = a.destination AND a.priority = m.priority);

SELECT * FROM revenueTable;

CREATE VIEW totalRevenueTablePerRoute AS (select mail_origin, mail_destination, SUM (mail_weight*pricePerGram + mail_volume*pricePerCubicCM) as total_revenue
from revenueTable GROUP BY mail_origin, mail_destination ORDER BY total_revenue);

SELECT * FROM totalRevenueTablePerRoute;

select sum(total_revenue) from totalRevenueTablePerRoute AS totalRevenue;
---------------------------
--** TOTAL EXPENDITURE **--
---------------------------

-- generate a table that shows the company cost per gram and cubic cm, next to each of the mail delivery events:
CREATE VIEW expenditureTable AS (
SELECT m.origin AS mail_Origin ,m.destination AS mail_Destination,m.weight AS mail_Weight,
m.volume AS mail_Volume,a.companyCostPerGram,a.companyCostPerCubicCM, a.priority,
m.weight*a.companyCostPerGram + m.volume*a.companyCostPerCubicCM AS cost
FROM mailDeliveryEvents m JOIN availableRoutes a
ON m.origin = a.origin AND m.destination = a.destination AND a.priority = m.priority);

-- showing the view generated above:
SELECT * FROM expenditureTable;

-- from that view, compute the total company expenditure per each route:
select mail_origin, mail_destination, SUM (mail_weight*companyCostPerGram + mail_volume*companyCostPerCubicCM) as total_company_expenditure
from expenditureTable GROUP BY mail_origin, mail_destination ORDER BY total_company_expenditure;

