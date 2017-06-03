DROP TABLE If Exists Users;
-- create the table for all the clerks and manager
CREATE TABLE Users (
  UserID SERIAL PRIMARY KEY,
  Username CHAR(20) NOT NULL,
  Password CHAR(10) NOT NULL,
  Manager Boolean
);
-- input dummy values into the table
INSERT INTO Users(Username, Password, Manager) VALUES('Jian','jian1',FALSE);
INSERT INTO Users(Username, Password, Manager) VALUES('Dragos','dragos1', FALSE);
INSERT INTO Users(Username, Password, Manager) VALUES('Cameron', 'cameron1',TRUE);
INSERT INTO Users(Username, Password, Manager) VALUES('Kevin', 'kevin1', FALSE);
INSERT INTO Users(Username, Password, Manager) VALUES('Chet', 'chet1', FALSE);

-- show all the users
SELECT * from Users;

-- show all the manager
SELECT * FROM Users WHERE manager = TRUE;