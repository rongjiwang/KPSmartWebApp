DROP TABLE If Exists Users;
DROP TABLE If Exists MAIL;
DROP TABLE If Exists ROUTE;

CREATE TABLE Users (
  Username CHAR(20) NOT NULL,
  Password CHAR(10) NOT NULL,
  Manager Boolean
);

CREATE TABLE ROUTE(
    id serial primary key,
    origin varchar(30),
    destination varchar(30),
    cost_per_kg_customer real,
    cost_per_volume_customer real,
    cost_per_kg_business real,
    cost_per_volume_business real,
    priority varchar(10),
    deliveryType varchar(20),
    travel_time int,
    transportFirm varchar(20),
    is_active boolean
    );

CREATE TABLE MAIL(
    id serial primary key,
    cost real,
    weight real,
    volume real,
    send_date date,
    arrive_date date,
    is_arrived boolean,
    route_id int references ROUTE(id)
);

-- generate a table that shows the company cost per gram and cubic cm, next to each of the mail delivery events:


INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Queens Town',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Hamilton',0.6,0.6,0.3,0.3,'Low','ship',6,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Tauranga',0.5,0.5,0.2,0.2,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Auckland',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Queens Town',0.6,0.6,0.4,0.4,'Low','ship',7,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Hamilton',0.6,0.6,0.3,0.3,'High','air',6,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Tauranga',0.5,0.5,0.2,0.2,'High','air',3,'Air NZ',true
);

INSERT INTO MAIL VALUES(
    DEFAULT,15,2,3,current_date,current_date+3,false,1
);

INSERT INTO MAIL VALUES(
    DEFAULT,25,2,3,current_date,current_date+1,false,2
);

INSERT INTO MAIL VALUES(
    DEFAULT,15,2,3,current_date,current_date+5,false,2
);

INSERT INTO Users(Username, Password, Manager) VALUES
('Jian','jian1',true),
('Dragos','dragos1', true),
('Cameron', 'cameron1',true),
('Kevin', 'kevin1', true),
('Chet', 'chet1', true);

/*

Querries

-- RevenueAndExpenditure Table
CREATE VIEW revenueAndExpenditure AS (
SELECT r.id AS RouteID, r.origin AS Origin ,r.destination AS Destination,
m.weight AS Weight, m.volume AS Volume, r.deliveryType AS DeliveryType,
r.cost_per_kg_customer, r.cost_per_volume_customer,
r.cost_per_kg_business, r.cost_per_volume_business,
m.weight * r.cost_per_kg_customer + m.volume * r.cost_per_volume_customer AS revenue,
m.weight * r.cost_per_kg_business + m.volume * r.cost_per_volume_business AS expenditure
FROM mail m JOIN route r
ON m.route_id = r.id);

SELECT * FROM revenueAndExpenditure;

CREATE VIEW TotalsPerRoute AS (select RouteID, Origin, Destination, DeliveryType, SUM (weight * cost_per_kg_customer + volume * cost_per_volume_customer) as total_revenue,
SUM (weight * cost_per_kg_business + volume * cost_per_volume_business) as total_expenditure from revenueAndExpenditure GROUP BY RouteID, Origin, Destination, DeliveryType ORDER BY RouteID);

CREATE VIEW BusinessMonitoringA AS (SELECT * FROM TotalsPerRoute);

select sum(total_revenue) from TotalsPerRoute AS totalRevenue;

SELECT * FROM BusinessMonitoringA; -- The table for RevenueAndExpenditure


-- AverageDeliveryTimes Table
SELECT ROUND(Avg(arrive_date - send_date),2) AS averageDays FROM mail;

CREATE VIEW averageDeliveryDays AS (
SELECT r.id AS RouteID, r.origin AS Origin ,
r.destination AS Destination, r.deliveryType AS DeliveryType,
m.send_date, m.arrive_date,
m.arrive_date - m.send_date AS deliveryTime
FROM mail m JOIN route r
ON m.route_id = r.id);
*/



SELECT r.id, r.origin, r.destination,r.deliveryType AS DeliveryType, ROUND(Avg(m.arrive_date - m.send_date),2) AS averageDays
FROM mail m JOIN route r ON m.route_id = r.id GROUP BY r.id;


DROP VIEW revenueAndExpenditure CASCADE;

DROP VIEW averageDeliveryDays CASCADE;