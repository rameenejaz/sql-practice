CREATE DATABASE FanStore;
USE FanStore;
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY, 
    CompanyName VARCHAR(100) NOT NULL,
    TotalFansManufactured INT,
    HQLocation VARCHAR(100),
    City VARCHAR(50),
    isIndustrial BIT,
    YearOfEstablished INT,
    Revenue DECIMAL(15,2),
    CompanySocialMedia VARCHAR(255),
    CompanyContactNumber VARCHAR(20)
);
CREATE TABLE Fans (
    FanID INT PRIMARY KEY,
    CompanyID INT,
    FanName VARCHAR(100),
    FanType VARCHAR(50),
    FanColor VARCHAR(50),
    FanPrice DECIMAL(10,2),
    FanMotor VARCHAR(10),
    FanSize INT,
    IsCopperMade BIT,
    RemoteControlled BIT,
    FanVolts INT,
    FanWatts INT,
    FanServiceValue VARCHAR(50),
    FanSpeed INT,
    FanMinAirDelivered INT,
    IsInverter BIT,
   FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);



DROP TABLE Fans;
DROP TABLE Companies;

CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName VARCHAR(100) NOT NULL,
    TotalFansManufactured INT,
    HQLocation VARCHAR(100),
    City VARCHAR(50),
    IsIndustrial BIT,
    YearOfEstablished INT,
    Revenue DECIMAL(15,2),
    CompanySocialMedia VARCHAR(255),
    CompanyContactNumber VARCHAR(20)
);
CREATE TABLE Fans (
    FanID INT PRIMARY KEY IDENTITY(1,1),
    CompanyID INT,
    FanName VARCHAR(100),
    FanType VARCHAR(50),
    FanColor VARCHAR(50),
    FanPrice DECIMAL(10,2),
    FanMotor VARCHAR(10),
    FanSize INT,
    IsCopperMade BIT,
    RemoteControlled BIT,
    FanVolts INT,
    FanWatts INT,
    FanServiceValue VARCHAR(50),
    FanSpeed INT,
    FanMinAirDelivered INT,
    IsInverter BIT,

    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

INSERT INTO Companies 
(CompanyName, TotalFansManufactured, HQLocation, City, IsIndustrial, YearOfEstablished, Revenue, CompanySocialMedia, CompanyContactNumber)
VALUES
('Pak Fans', 500000, 'Gujrat', 'Gujrat', 1, 1954, 500000000, '@pakfans', '0531234567'),
('Royal Fans', 300000, 'Gujrat', 'Gujrat', 1, 1991, 300000000, '@royalfans', '0539876543'),
('GFC Fans', 450000, 'Gujrat', 'Gujrat', 1, 1954, 450000000, '@gfcfans', '0532223344'),
('Super Asia', 600000, 'Gujranwala', 'Gujranwala', 1, 1975, 900000000, '@superasia', '0551122334'),
('Khursheed Fans', 250000, 'Lahore', 'Lahore', 1, 1965, 250000000, '@khursheedfans', '0421234567'),
('Tamoor Fans', 150000, 'Gujrat', 'Gujrat', 0, 1995, 150000000, '@tamoorfans', '0537654321'),
('Orient Electric', 800000, 'Lahore', 'Lahore', 1, 2000, 1200000000, '@orient', '0429998888'),
('Boss Fans', 200000, 'Lahore', 'Lahore', 0, 1998, 180000000, '@bossfans', '0421122112'),
('National Fans', 170000, 'Karachi', 'Karachi', 1, 1987, 200000000, '@nationalfans', '0213344556'),
('Starco Fans', 130000, 'Gujrat', 'Gujrat', 0, 2005, 120000000, '@starcofans', '0534433221'),
('SK Fans', 220000, 'Sialkot', 'Sialkot', 1, 1992, 210000000, '@skfans', '0523344556'),
('Al-Hafeez Fans', 90000, 'Gujrat', 'Gujrat', 0, 2010, 80000000, '@alhafeezfans', '0538899001'),
('Crescent Fans', 140000, 'Faisalabad', 'Faisalabad', 1, 1980, 170000000, '@crescentfans', '0412233445'),
('Galaxy Fans', 110000, 'Multan', 'Multan', 0, 2008, 100000000, '@galaxyfans', '0619988776'),
('Classic Fans', 95000, 'Gujrat', 'Gujrat', 0, 2012, 70000000, '@classicfans', '0536677889');

INSERT INTO Fans 
(CompanyID, FanName, FanType, FanColor, FanPrice, FanMotor, FanSize, IsCopperMade, RemoteControlled, FanVolts, FanWatts, FanServiceValue, FanSpeed, FanMinAirDelivered, IsInverter)
VALUES
(1, 'Pak Ceiling Deluxe', 'Ceiling', 'White', 8500, 'AC', 56, 1, 0, 220, 75, 'Good', 350, 220, 0),
(1, 'Pak Exhaust Pro', 'Exhaust', 'Black', 6500, 'AC', 12, 1, 0, 220, 60, 'Average', 300, 180, 0),
(2, 'Royal Smart DC', 'Ceiling', 'Brown', 16000, 'DC', 56, 1, 1, 220, 35, 'Excellent', 400, 250, 1),
(3, 'GFC Classic', 'Ceiling', 'White', 9000, 'AC', 56, 1, 0, 220, 80, 'Good', 360, 230, 0),
(4, 'Super Asia Exhaust', 'Exhaust', 'Grey', 7000, 'AC', 10, 0, 0, 220, 65, 'Average', 290, 170, 0),
(5, 'Khursheed Premium', 'Ceiling', 'Golden', 18000, 'DC', 56, 1, 1, 220, 40, 'Excellent', 420, 260, 1),
(6, 'Tamoor Economy', 'Ceiling', 'White', 5500, 'AC', 48, 0, 0, 220, 90, 'Normal', 300, 200, 0),
(7, 'Orient Aero DC', 'Ceiling', 'Black', 20000, 'DC', 56, 1, 1, 220, 30, 'Excellent', 450, 270, 1),
(8, 'Boss Pedestal', 'Pedestal', 'Blue', 7500, 'AC', 18, 0, 0, 220, 100, 'Good', 380, 210, 0),
(9, 'National Wall Fan', 'Wall', 'White', 6000, 'AC', 16, 1, 0, 220, 85, 'Average', 340, 190, 0),
(10, 'Starco Ceiling Plus', 'Ceiling', 'Brown', 10000, 'AC', 56, 1, 1, 220, 70, 'Good', 370, 240, 0),
(11, 'SK Industrial Pro', 'Industrial', 'Grey', 22000, 'AC', 60, 1, 0, 220, 120, 'Heavy Duty', 500, 300, 0),
(12, 'Al Hafeez Budget', 'Ceiling', 'White', 5200, 'AC', 48, 0, 0, 220, 95, 'Normal', 290, 180, 0),
(13, 'Crescent DC Max', 'Ceiling', 'Black', 17000, 'DC', 56, 1, 1, 220, 38, 'Excellent', 410, 255, 1),
(14, 'Galaxy Exhaust', 'Exhaust', 'White', 5800, 'AC', 12, 0, 0, 220, 60, 'Average', 280, 160, 0),
(15, 'Classic Remote Fan', 'Ceiling', 'Silver', 12000, 'AC', 56, 1, 1, 220, 75, 'Good', 360, 225, 0),
(3, 'GFC AC Deluxe', 'Ceiling', 'White', 9500, 'AC', 56, 1, 0, 220, 85, 'Good', 365, 235, 0),
(4, 'Super Asia DC', 'Ceiling', 'Brown', 15500, 'DC', 56, 1, 1, 220, 45, 'Excellent', 405, 245, 1),
(2, 'Royal Exhaust', 'Exhaust', 'White', 7200, 'AC', 10, 1, 0, 220, 65, 'Good', 295, 175, 0),
(7, 'Orient Industrial X', 'Industrial', 'Black', 25000, 'AC', 60, 1, 0, 220, 130, 'Heavy Duty', 520, 320, 0),
(5, 'Khursheed Wall Fan', 'Wall', 'White', 8000, 'AC', 16, 1, 0, 220, 88, 'Good', 345, 200, 0);

--Question 1:
SELECT * FROM Companies

--Question 2:
SELECT * FROM Fans;

--Question 3:
SELECT f.*, c.CompanyName FROM Fans f JOIN Companies c ON f.CompanyID=c.CompanyID;

--Question 4:
SELECT DISTINCT c.CompanyName From Companies c Join Fans f ON c.CompanyID=f.CompanyID GROUP BY c.CompanyName HAVING COUNT(DISTINCT f.FanMotor)=2;

--Question 5:
SELECT f.*, c.CompanyName From Fans f JOIN Companies c ON f.CompanyID=c.CompanyID WHERE f.IsCopperMade=1;

--Question 6:
SELECT f.*, c.CompanyName FROM Fans f JOIN Companies c ON f.CompanyID=c.CompanyID WHERE F.FanType='Exhaust';

--Question 7:
SELECT f.*, c.CompanyName FROM Fans f JOIN Companies c ON f.CompanyID=c.CompanyID WHERE F.FanPrice>15000;

--Question 8:
SELECT f.*, c.CompanyName FROM Fans f JOIN Companies c ON f.CompanyID=c.CompanyID WHERE f.FanPrice BETWEEN 5000 AND 12000;

--QUESTION 9:
SELECT CompanyName, HQLocation FROM Companies WHERE City = 'Gujrat';

--QUESTION 10:
SELECT TOP 1 c.CompanyName, COUNT(f.FanID) AS TotalVariety FROM Companies c JOIN Fans f ON c.CompanyID=c.CompanyID GROUP BY c.CompanyName ORDER by TotalVariety DESC;

--QUESTION 11:
SELECT f.*, c.CompanyName FROM Fans f JOIN Companies c ON f.CompanyID=c.CompanyID WHERE c.IsIndustrial=1;

