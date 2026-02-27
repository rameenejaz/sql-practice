CREATE DATABASE studentGame;
USE studentGame;
CREATE TABLE Games (
    GameName VARCHAR(20) PRIMARY KEY NOT NULL,
    description VARCHAR(200)
);
CREATE TABLE studentsDetail(
    regNo CHAR(12) PRIMARY KEY,
    fName CHAR(10),
    lName CHAR(10),
    Street VARCHAR(100),
    City VARCHAR(25),
    PostCode VARCHAR(20),
    DOB Date,
    Email VARCHAR(50),
    PhoneNo VARCHAR(14),
    GameName VARCHAR(20),
    Award VARCHAR(20),
    isCaptain BIT DEFAULT 0,
    Department VARCHAR(50)
    FOREIGN KEY (GameName) REFERENCES Games(GameName)
);

INSERT INTO Games VALUES
('Cricket', 'Outdoor team sport'),
('Football', 'Team sport played with feet'),
('Basketball', 'Indoor sport'),
('Badminton', 'Racket sport');

INSERT INTO studentsDetail VALUES
('2021-CS-001', 'Ali', 'Khan', 'Street 1', 'Lahore', '54000',
 '2004-05-10', 'ali@gmail.com', '03001234567',
 'Cricket', 'Best Batsman', 1, 'CS'),

('2021-CS-002', 'Sara', 'Ahmed', 'Street 2', 'Karachi', '75000','2006-03-15', 'sara@gmail.com', '03007654321',
 'Football', NULL, 0, 'IT'),

('2021-CS-003', 'Hamza', 'Ali', 'Street 3', 'Lahore', '54000', '2002-09-20', 'hamza@gmail.com', '03001112222',
 'Basketball', 'MVP', 0, 'SE'),

('2021-CS-004', 'Ayesha', 'Malik', 'Street 4', 'Islamabad', '44000', '2003-01-12', 'ayesha@gmail.com', '03003334444',
 'Badminton', NULL, 0, 'CS');


-- QUESTION 1(LIST OF CRICKET PLAYERS)
SELECT regNo, fName FROM studentsDetail WHERE gameName = 'Cricket';

-- QUESTION 2 (FOOTBALL TEAM UNDER 19)
SELECT regNo, fName, lName FROM studentsDetail WHERE GameName='FOOTBALL'
AND DATEDIFF(YEAR, DOB, GETDATE())<19;

-- Question 3 (TEAMS WITH DIFFERENT CITIES)
SELECT City, GameName, COUNT(*) AS TotalPlayers FROM studentsDetail GROUP BY City, GameName;

-- QUESTION 4 (CRICKET TEAM W DIFF DEPARTMENTS)
SELECT Department, COUNT (*) AS TotalPlayers FROM studentsDetail WHERE GameName='Cricket' GROUP BY Department;

--QUESTION 5(BASKETBALL TEAMS OVER AND UNDER 20)
SELECT regNo, fName,
CASE 
    WHEN DATEDIFF(YEAR, DOB, GETDATE()) > 20 THEN 'Over 20'
    ELSE 'Under 20'
END AS AgeGroup
FROM studentsDetail
WHERE GameName = 'Basketball';


-- Question 6 (Players with distinction/awards)
SELECT regNo, fName, lName, Award FROM studentsDetail WHERE Award IS NOT NULL

--QUESTION 7 (WHO PERFORMED AS CAPTAIN)
SELECT regNo, fName, lName FROM studentsDetail WHERE isCaptain=1;

--QUESTION 8(TOTAL PLAYERS WITH BADMINTON CHOICE)
SELECT COUNT(*) AS TotalBadmintonPlayers FROM studentsDetail WHERE gameName='Badminton'

--QUESTION 9 (IS THERE A PLAYER IN NO GAME?)
SELECT GameName FROM GAMES WHERE GameName NOT IN (
    SELECT GameName FROM studentsDetail
);