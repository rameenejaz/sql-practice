-- Submitted By: Rameen Muzammil Ejaz 
-- Reg #: (FA24-BSE-160)
-- Section: A


CREATE DATABASE T20worldcup2026;
USE T20worldcup2026;

CREATE TABLE teamDetails (
    teamID INT PRIMARY KEY ,
    teamName VARCHAR(50) NOT NULL,
    fullTimeMember BIT NOT NULL,          
    lastWorldCupStanding INT,
    lastWorldCupWinner BIT NOT NULL      
);

CREATE TABLE playersDetail (
    playerID INT PRIMARY KEY,
    playerName VARCHAR(50) NOT NULL,
    jerseyNo INT,
    speciality VARCHAR(50),
    battingStyle VARCHAR(50),
    bowlingStyle VARCHAR(50),
    DOB DATE,
    matchesPlayed INT,
    teamID INT,
    FOREIGN KEY (teamID) REFERENCES teamDetails(teamID)
);

INSERT INTO teamDetails
(teamID,teamName, fullTimeMember, lastWorldCupStanding, lastWorldCupWinner)
VALUES
(1,'Pakistan', 1, 2, 0),
(2,'India', 1, 1, 1),
(3,'Australia', 1, 4, 0),
(4,'England', 1, 3, 0),
(5,'New Zealand', 1, 5, 0);

INSERT INTO playersDetail VALUES
-- Pakistan Players (teamID = 1)
(1, 'Shaheen', 10, 'Fast Bowler', 'Left-hand bat', 'Left-arm fast', '2000-04-06', 60, 1),
(2, 'Babar', 56, 'Batsman', 'Right-hand bat', NULL, '1994-10-15', 95, 1),
(3, 'Farhan', 99, 'Opener', 'Right-hand bat', NULL, '1998-03-20', 30, 1),
(4, 'Rizwan', 16, 'Wicketkeeper', 'Right-hand bat', NULL, '1992-06-01', 85, 1),

-- India Players (teamID = 2)
(5, 'Virat', 18, 'Batsman', 'Right-hand bat', 'Right-arm medium', '1988-11-05', 115, 2),
(6, 'Hardik', 33, 'All Rounder', 'Right-hand bat', 'Right-arm fast', '1993-10-11', 80, 2),
(7, 'Rohit', 45, 'Opener', 'Right-hand bat', NULL, '1987-04-30', 130, 2),

-- Australia Players (teamID = 3)
(8, 'Warner', 31, 'Opener', 'Left-hand bat', NULL, '1986-10-27', 105, 3),
(9, 'Rashid', 19, 'Bowler', 'Right-hand bat', 'Leg break', '1998-09-20', 70, 3),
(10, 'Maxwell', 32, 'All Rounder', 'Right-hand bat', 'Off spin', '1988-10-14', 90, 3),

-- England Players (teamID = 4)
(11, 'Buttler', 63, 'Wicketkeeper', 'Right-hand bat', NULL, '1990-09-08', 88, 4),
(12, 'Moeen', 28, 'All Rounder', 'Left-hand bat', 'Off spin', '1987-06-18', 75, 4),

-- New Zealand Players (teamID = 5)
(13, 'Williamson', 22, 'Batsman', 'Right-hand bat', 'Off spin', '1990-08-08', 100, 5),
(14, 'Boult', 18, 'Fast Bowler', 'Right-hand bat', 'Left-arm fast', '1989-07-22', 92, 5),
(15, 'Conway', 88, 'Wicketkeeper', 'Left-hand bat', NULL, '1991-07-08', 65, 5);


--Question 1:
SELECT teamName FROM teamDetails;

--Question 2:
SELECT * FROM playersDetail;

--Question 3
SELECT teamName, lastWorldCupStanding FROM teamDetails;

--Question 4:
SELECT teamName, lastWorldCupWinner FROM teamDetails WHERE lastWorldCupWinner=1;

--Questions 5:
SELECT t.teamName, p.playerName FROM playersDetail p JOIN teamDetails t ON p.teamID=t.teamID WHERE p.jerseyNo=99; 

--Question 6:
SELECT t.teamName, p.playerName FROM playersDetail p JOIN teamDetails t ON p.playerName=t.teamName WHERE p.playerName='Farhan';

--Question 7:
SELECT p.playerName, t.* FROM playersDetail p JOIN teamDetails t ON p.teamID = t.teamID WHERE p.playerName='Shaheen';

--Question 8:
SELECT COUNT(*) AS TotalWicketPlayers FROM playersDetail p JOIN teamDetails t ON p.teamID=t.teamID WHERE t.teamName='Pakistan' AND p.speciality='Wicketkeeper';

--Question 9:
SELECT p.playerName, t.* FROM playersDetail p JOIN teamDetails t ON p.teamID=t.teamID WHERE p.speciality='Opener';

--Question 10:
SELECT p.playerName, t.* FROM playersDetail p JOIN teamDetails t ON p.teamID=t.teamID WHERE p.speciality='All rounder';

--Question 11:
SELECT p.playerName, t.teamName FROM playersDetail p JOIN teamDetails t ON p.teamID=t.teamID WHERE p.battingStyle='leg break';

--Question 12:
SELECT p.playerName, t.teamName FROM playersDetail p JOIN teamDetails t ON p.teamID=t.teamID WHERE p.bowlingStyle='Off spin';

--Question 13:
SELECT p.playerName, t.teamName FROM playersDetail p JOIN teamDetails t ON p.teamId=t.teamID WHERE p.battingStyle='Lead-hand bat';