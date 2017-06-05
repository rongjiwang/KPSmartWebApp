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

    by_van boolean,
    van_travel_time int,
    van_cost_per_kg_customer real,
    van_basecost_per_day_business int,
    by_air boolean,

    air_travel_time int,
    air_cost_per_kg_customer real,
    air_basecost_per_day_business int,
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

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Auckland',true,3,5,20,true,1,10,100,true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Queens Town',false,0,0,0,true,2,10,120,true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Hamilton',false,0,0,0,true,2,15,150,true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Tauranga',true,4,6,30,true,1,12,120,true
);

INSERT INTO MAIL VALUES(
    DEFAULT,15,2,3,current_date,current_date+3,false,1
);

INSERT INTO MAIL VALUES(
    DEFAULT,25,2,3,current_date,current_date+1,false,2
);

INSERT INTO Users(Username, Password, Manager) VALUES
('Jian','jian1',true),
('Dragos','dragos1', true),
('Cameron', 'cameron1',TRUE),
('Kevin', 'kevin1', true),
('Chet', 'chet1', true);