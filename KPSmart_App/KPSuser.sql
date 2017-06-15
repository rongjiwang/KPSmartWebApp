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

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Hamilton',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Auckland',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Hamilton',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Rotorua',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',1,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',8,'Ship NZ',true
);




INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Christchurch',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Dunedin',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
);




INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Wellington',0.6,0.6,0.4,0.4,'Low','van',3,'Van NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Rotorua',0.6,0.6,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',4,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true
);



INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Auckland',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',8,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Wellington',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Auckland',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',4,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true
);







INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Auckland',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Rotorua',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',8,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Wellington',0.6,0.6,0.4,0.4,'Low','van',1,'Van NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Auckland',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Rotorua',0.5,0.5,0.2,0.2,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true
);






INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Hamilton',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Dunedin',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
);






INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Christchurch',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Hamilton',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Christchurch',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
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
('Cameron', 'cameron1',true),
('Kevin', 'kevin1', true),
('Chet', 'chet1', true);