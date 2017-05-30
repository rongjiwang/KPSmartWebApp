DROP TABLE If Exists Users;

CREATE TABLE Users (
  Username CHAR(20) NOT NULL,
  Password CHAR(10) NOT NULL,
  Manager Boolean
);

INSERT INTO Users(Username, Password, Manager) VALUES
('Jian','jian1',FALSE),
('Dragos','dragos1', FALSE),
('Cameron', 'cameron1',TRUE),
('Kevin', 'kevin1', FALSE),
('Chet', 'chet1', FALSE);