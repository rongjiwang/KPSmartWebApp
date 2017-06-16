DROP TABLE If Exists Users CASCADE;
DROP TABLE If Exists mail CASCADE;
DROP TABLE If Exists route CASCADE;


-- Table for all the users of the system, users either have manager priveleges or clerk privleges
CREATE TABLE Users (
  Username CHAR(20) NOT NULL,
  Password CHAR(10) NOT NULL,
  Manager Boolean
);


-- Table for all the routes around New Zealand, locations for routes include:
    -- Wellingotn
    -- Christchurch
    -- Auckland
    -- Palmerston North
    -- Dunedin
    -- Rotorua
    -- Hamilton
CREATE TABLE Route(
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

-- Table for all mail Deliveries in the system, contains a route_id that refrences the route the mail Delivery is for
CREATE TABLE mail(
    id serial primary key,
    cost real,
    weight real,
    volume real,
    send_date date,
    arrive_date date,
    is_arrived boolean,
    route_id int references ROUTE(id)
);


-- Insert all Routes into Database
INSERT INTO ROUTE VALUES
    (DEFAULT,'Wellington','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Wellington','Hamilton',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Wellington','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Wellington','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true),
    (DEFAULT,'Wellington','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Wellington','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Wellington','Auckland',0.5,0.5,0.6,0.6,'Low','van',3,'Van NZ',true),
    (DEFAULT,'Wellington','Hamilton',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true),
    (DEFAULT,'Wellington','Rotorua',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true),
    (DEFAULT,'Wellington','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',1,'Van NZ',true),
    (DEFAULT,'Wellington','Christchurch',0.3,0.3,0.5,0.5,'Low','ship',7,'Ship NZ',true),
    (DEFAULT,'Wellington','Dunedin',0.4,0.4,0.5,0.5,'Low','ship',8,'Ship NZ',true),
    (DEFAULT,'Hamilton','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Hamilton','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Hamilton','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Hamilton','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true),
    (DEFAULT,'Hamilton','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Hamilton','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Hamilton','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true),
    (DEFAULT,'Hamilton','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true),
    (DEFAULT,'Hamilton','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true),
    (DEFAULT,'Hamilton','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true),
    (DEFAULT,'Hamilton','Christchurch',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true),
    (DEFAULT,'Hamilton','Dunedin',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true),
    (DEFAULT,'Auckland','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Auckland','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Auckland','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Auckland','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true),
    (DEFAULT,'Auckland','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Auckland','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Auckland','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true),
    (DEFAULT,'Auckland','Wellington',0.6,0.6,0.4,0.4,'Low','van',3,'Van NZ',true),
    (DEFAULT,'Auckland','Rotorua',0.6,0.6,0.3,0.3,'Low','van',3,'Van NZ',true),
    (DEFAULT,'Auckland','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',4,'Van NZ',true),
    (DEFAULT,'Auckland','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true),
    (DEFAULT,'Auckland','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true),
    (DEFAULT,'Rotorua','Hamilton',0.5,0.5,0.6,0.6,'High','air',1,'Air NZ',true),
    (DEFAULT,'Rotorua','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Rotorua','Auckland',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Rotorua','Palmerston North',0.5,0.5,0.7,0.7,'High','air',1,'Air NZ',true),
    (DEFAULT,'Rotorua','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Rotorua','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Rotorua','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',8,'Ship NZ',true),
    (DEFAULT,'Rotorua','Wellington',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true),
    (DEFAULT,'Rotorua','Auckland',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true),
    (DEFAULT,'Rotorua','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',4,'Van NZ',true),
    (DEFAULT,'Rotorua','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true),
    (DEFAULT,'Rotorua','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true),
    (DEFAULT,'Palmerston North','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Palmerston North','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Palmerston North','Auckland',0.6,0.6,0.7,0.7,'High','air',1,'Air NZ',true),
    (DEFAULT,'Palmerston North','Rotorua',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true),
    (DEFAULT,'Palmerston North','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Palmerston North','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Palmerston North','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',8,'Ship NZ',true),
    (DEFAULT,'Palmerston North','Wellington',0.6,0.6,0.4,0.4,'Low','van',1,'Van NZ',true),
    (DEFAULT,'Palmerston North','Auckland',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true),
    (DEFAULT,'Palmerston North','Rotorua',0.5,0.5,0.2,0.2,'Low','van',2,'Van NZ',true),
    (DEFAULT,'Palmerston North','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true),
    (DEFAULT,'Palmerston North','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true),
    (DEFAULT,'Christchurch','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Christchurch','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Christchurch','Rotorua',0.4,0.4,0.6,0.6,'High','air',1,'Air NZ',true),
    (DEFAULT,'Christchurch','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true),
    (DEFAULT,'Christchurch','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Christchurch','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Christchurch','Auckland',0.5,0.5,0.6,0.6,'Low','ship',10,'Ship NZ',true),
    (DEFAULT,'Christchurch','Wellington',0.6,0.6,0.7,0.7,'Low','ship',6,'Ship NZ',true),
    (DEFAULT,'Christchurch','Rotorua',0.6,0.6,0.8,0.8,'Low','ship',7,'Ship NZ',true),
    (DEFAULT,'Christchurch','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true),
    (DEFAULT,'Christchurch','Hamilton',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true),
    (DEFAULT,'Christchurch','Dunedin',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true),
    (DEFAULT,'Dunedin','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Dunedin','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Dunedin','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Dunedin','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true),
    (DEFAULT,'Dunedin','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true),
    (DEFAULT,'Dunedin','Christchurch',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true),
    (DEFAULT,'Dunedin','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true),
    (DEFAULT,'Dunedin','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true),
    (DEFAULT,'Dunedin','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true),
    (DEFAULT,'Dunedin','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true),
    (DEFAULT,'Dunedin','Hamilton',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true),
    (DEFAULT,'Dunedin','Christchurch',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true);




-- Loop to generate some random mail deliveries
DO
$do$
BEGIN
    FOR i IN 1..83 LOOP
        DECLARE
            a integer := round((CAST((1 + (random() * 20)) AS numeric)),0);
        BEGIN
            FOR j IN 1..a LOOP
                DECLARE
                    -- Generate a random weight and volume
                    weight integer := round((CAST((1 + (random() * 6)) AS numeric)),0);
                    volume integer := round((CAST((1 + (random() * 5) + (weight/2)) AS numeric)),0);

                    -- Generate a random send and arrival date
                    send_date date := current_date - CAST(round((CAST((1 + (random() * 100)) AS numeric)),0)AS integer);
                    --arrive_date date := send + round((CAST(1 + (random() * 10) AS numeric)),0);
                    arrive_date date := send_date + CAST(round((CAST((1 + (random() * 10)) AS numeric)),0)AS integer);

                    is_arrived boolean := (arrive_date < current_date);

                    -- Generate a random cost depending on assign kg/volume costs
                    cost_per_kg_customer numeric := CAST(random() AS numeric);
                    cost_per_volume_customer numeric := CAST(random() AS numeric);
                    cost integer := round((CAST( cost_per_kg_customer * cost_per_volume_customer * weight * volume AS numeric)),0);

                BEGIN
                    -- Finally insert into mail table
                    INSERT INTO MAIL VALUES
                        (DEFAULT, cost, weight, volume, send_date, arrive_date, is_arrived, i);
                END;
            END LOOP;
        END;
    END LOOP;
END
$do$;

-- Insert users into database
INSERT INTO Users(Username, Password, Manager) VALUES
    ('Jian','jian1',false),
    ('Dragos','dragos1', false),
    ('Cameron', 'cameron1',true),
    ('Kevin', 'kevin1', false),
    ('Chet', 'chet1', false);