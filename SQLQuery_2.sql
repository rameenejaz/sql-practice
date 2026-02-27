CREATE DATABASE dreamHome;
GO;
USE dreamHome;
GO;
CREATE TABLE Branch (
    branchNo CHAR(4) PRIMARY KEY ,
    Street VARCHAR(20),
    City CHAR(20),
    PostCode VARCHAR(10)
);

CREATE TABLE Staff (
    staffNo VARCHAR(8),
    fName CHAR(10),
    LName CHAR(10),
    Position CHAR(20),
    Gender CHAR(2),
    DOB DATE,
    Salary DECIMAL(10,2),
    BranchNo CHAR(4),

    FOREIGN KEY (BranchNo) REFERENCES Branch(BranchNo)
);

INSERT INTO Branch(branchNo, Street, City, PostCode) VALUES
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
('B002', '56 Clover Dr', 'London', 'NW10 6EU');

INSERT INTO Staff (staffNo, fName, lName, position, Gender, DOB, salary, branchNo) VALUES
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01', 30000, 'B005'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', 12000, 'B003'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', 18000, 'B003'),
('SA9',  'Mary', 'Howe', 'Assistant', 'F', '1970-02-19', 9000,  'B007'),
('SG5',  'Susan', 'Brand', 'Manager', 'F', '1940-06-03', 24000, 'B003'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-01-13', 9000,  'B005');

Select * FROM Branch;
SELECT * FROM Staff;
