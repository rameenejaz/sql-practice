create database dreamHome2;
GO
use dreamHome2;

create table branch(
branchNo varchar(100) primary key NOT NULL,
street varchar(100),
city varchar(100),
postCode varchar(100)

)


 insert into Branch ( branchNo , street,city,postcode)
values ( 'B005', '22 Deer rd ', 'London','SW1 4EH') ,
( 'B007', '22 Deer rd ', 'Aberdeen','AB2 35U') ,
( 'B003', '16 Argyll St ', 'Glasgow','G11 9QX') ,
( 'B004', '163 Manse Rd ', 'Bristol ','BS99 1NZ') ,
( 'B002', '56 Clover Dr', 'London','NW10 6EU')


create table staff(

staffNo varchar(100) primary key ,
fname varchar (100),
lName varchar(100),
position varchar(100),
sex char,
DOB date,
salary money,
branchNo varchar(100) foreign key REFERENCES branch(branchNo)

)

 insert into staff(staffNo,fName,lName,position,sex,DOB,salary,branchNo)values('SL21','John','White','Manager','M','1-Oct-45',30000.00,'B005'),
('SG37','Ann','Beech','Assistant','F','10-Nov-60',12000.00,'B003'),
('SG14','David','Ford','Supervisor','M','24-Mar-58',18000.00,'B003'),
('SA9','Mary','Howe','Assistan','F','19-Feb-70',9000.00,'B007'),
('SG5','Susan','Brand','Manager','F','3-Jun-40',24000.00,'B003'),
('SL41','Julie','Lee','Assistan','F','13-Jun-65',9000.00,'B005')


create table privateOwner(

ownerNo varchar(100) primary key,
fNAme varchar(100),
lname varchar(100),
address varchar(100),
telNo varchar(100),
eMail varchar(100),
password varchar(100),

)

insert into privateOwner(ownerNo,fName,lName,address,telNo,eMail,password)values('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX','01224-861212','john.kay@gmail.com','********'),
('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX','0141-357-7419','cfarrel@gmail.com','********'),
('CO40','Tina','Murphy','63 Well St, Glasgow G42','0141-943-1728','tinam@hotmail.com','********'),
('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR','0141-225-7025','tony.shaw@ark.com','********')


create table propertyForRent(
propertyNo varchar(100) primary key,
street varchar(100),
city varchar(100),
postCode varchar(100),
type varchar(100),
rooms int,
rent money,
ownerNo varchar(100) foreign key REFERENCES privateOwner(ownerNo) ,
staffNo varchar(100) foreign key REFERENCES staff(staffNo) ,
branchNo varchar(100) foreign key REFERENCES branch(branchNo)

)

insert into PropertyForRent ( propertyNo , street,city,postcode,type,rooms,rent,ownerNo,staffNo,branchNo)
values ('PA14','16 Holhead','Aberdeen','Ab7 5SU','House',6,650,'CO46','SA9','B007'),
 ('PL94','16 Argyll St ','London','NW2','Flat',4,400,'CO87','SL41','B005'),
 ('PG4','6 Lawerence St','Glassgow','G11 9QX','Flat',3,350,'CO40',Null,'B003'),
 ('PG36','Manor Rd','Glassgow','G11 4QX','Flat',3,375,'CO93','SG37','B003'),
 ('PG21','18 Dale Rd','Glassgow','G12','House',5,600,'CO87','SG37','B003'),
 ('PG16','5 Novar St','Glassgow','G12 9AX','Flat',4,450,'CO93','SG14','B003')

create table client(

clientNo varchar(100) primary key,
fName varchar(100),
lName varchar(100),
telNo varchar(100),
prefType varchar(100),
maxRent money,
eMail varchar(100)

)

insert into client(clientNo,fName,lName,telNo,prefType,maxRent,eMail) values('CR76','John','Kay','0207-774-5632','Flat',425,'john.kay@gmail.com'),
('CR56','Aline','Stewart','0141-848-1825','Flat',350,'astewart@hotmail.com'),
('CR74','Mike','Ritchie','01475-392178','House',750,'mritchie01@yahoo.co.uk'),
('CR62','Mary','Tregear','01224-196720','Flat',600,'maryt@hotmail.co.uk')


create table viewing(

clientNO varchar(100) foreign key REFERENCES client(clientNo),
propertyNO varchar(100) foreign key REFERENCES propertyForRent(propertyNo) ,
primary key (clientNo,propertyNo),
viewDate date,
comment varchar(100)

)

 insert into Viewing ( clientNo ,propertyNo,viewDate,comment)
 values ( 'CR56','PA14','24-May-13','too small'),
 ( 'CR76','PG4','20-Apr-13','too remote'),
 ( 'CR56','PG4','26-May-13',Null),
 ( 'CR62','PA14','14-May-13','no dining room'),
 ( 'CR56','PG36','28-Apr-13',Null)

create table registration(

clientNo varchar(100) foreign key REFERENCES client(clientNo),
branchNo varchar(100) foreign key REFERENCES branch(branchNo),
primary key (clientNo,branchNo),
staffNo varchar(100) foreign key REFERENCES staff(staffNo),
dateJoined date

)

 insert into Registration ( clientNo ,branchNo, staffNo,dateJoined)
 values ('CR76','B005','Sl41','2-Jan-13'),
 ('CR56','B003','SG37','11-Apr-12'),
 ('CR74','B003','SG37','16-Nov-11'),
 ('CR62','B007','SA9','7-Mar-12')


 --Task 1
 --Question 1: Retrieve data for branch "B005"
SELECT b.branchNo, b.street, b.city, s.staffNo, s.fName, s.lName,s.POSITION
FROM branch b JOIN staff s ON b.branchNo=s.branchNo WHERE b.branchNo='B005';

 --Question 2: Retrieve data from branch table for "London" city.
SELECT b.branchNo, b.street, b.city, s.staffNo, s.fName, s.lName,s.POSITION
FROM branch b JOIN staff s ON b.branchNo=s.branchNo WHERE b.city='London';

--Question 3: Fetch data for branch number "B003" and "B005".
SELECT b.branchNo, b.street, b.city, s.staffNo, s.fName, s.lName,s.POSITION
FROM branch b JOIN staff s ON b.branchNo=s.branchNo WHERE b.branchNo IN ('B005', 'B003');

--Question 4: Can you list down the city names where the branches are existed.
SELECT DISTINCT city FROM branch;

--Question 5: Detail of staff members have more than 18000 salary.
SELECT b.branchNO, b.street, b.city, s.staffNo, s.fName, s.lName, s.POSITION 
FROM branch b JOIN staff s ON b.branchNo=s.branchNo WHERE s.salary=18000;

--Question 6: Can you generate the list of male staff members.
SELECT staffNo, fName, lName, position, salary, branchNo FROM staff WHERE sex='M';

--Question 7:Please provide a list of managers names with their branch numbers.
SELECT fName, lName, branchNo FROM staff WHERE [position]='Manager';

--Question 8: Detail of private owners.
SELECT * FROM privateOwner;

--Question 9: Detail of properties available for rent.
SELECT * FROM propertyForRent;

--Question 10: Can you display staff names in ascending order. 
SELECT fName, lName from staff ORDER BY fName ASC;

--Question 11: Detail of employees whose salary between 9000 and 18000.
SELECT b.branchNO, b.street, b.city, s.staffNo, s.fName, s.lName, s.POSITION 
FROM branch b JOIN staff s ON b.branchNo=s.branchNo WHERE s.salary BETWEEN 9000 AND 18000;

--Question 12: Detail of employees from branch B003 and b005.
SELECT staffNo, fName, lName, position, sex, DOB, salary, branchNo FROM staff
WHERE branchNo IN ('B003','B005');


--Task 2:
--Question 1: Show properties that are owned by the owner "CO87".
SELECT * FROM propertyForRent WHERE ownerNo='CO87';

--Question 2: Display the Properties address that were registered by staff number "SG37".
SELECT street, city, postCode FROM propertyForRent WHERE staffNo='SG37'

--Question 3: Can you display number of room against each flat.
SELECT propertyNo, rooms FROM propertyForRent WHERE type='Flat'

--Question 4: Is there any properties having rent less than 500.
SELECT propertyNo, street, city, rent FROM propertyForRent WHERE rent<500;

--Question 5: Can you display the client name, number and email of those clients whose choice is flat.
SELECT clientNo, fName, lName, eMail, prefType FROM client WHERE prefType='Flat'

--Question 6:Details of owners in ascending order by their name.
SELECT * FROM privateOwner ORDER BY fname ASC

--Question 7: How many properties are viewed.
SELECT COUNT (propertyNo) AS totalPropertiesViewed FROM viewing;

--Question 8: Detail of registration table.
SELECT * FROM registration;

--Question 9: Display the total number of staff in this system.   
SELECT COUNT (staffNo) AS totalStaffMembers FROM staff;

--Question 10: Detail of staff members who born after 1960.
SELECT * FROM staff WHERE DOB>'31-Dec-1960' ;

--Question 11: Change branch "B005" from London to Bristol.
UPDATE branch SET city='Bristol' WHERE branchNo='B005'

--Question 12: Change "B005" from Bristol to London.
UPDATE branch SET city='London' WHERE branchNo='B005'

--Question 13: Name of those properties that are not handled by any staff member.
SELECT propertyNo, street, city FROM propertyForRent WHERE staffNo IS NULL;

--Question 14: Name of those owner name whose name starts with character " J".
SELECT fName, lName FROM privateOwner WHERE fName LIKE 'J%'

--Question 15: Is there property number that is viewed by client but not give any comment.
SELECT clientNo, propertyNo,viewDate, comment FROM viewing WHERE comment IS NULL;

--Question 16: Can you display the number of employees in each branch. 
SELECT branchNo, COUNT (*) AS totalEmployees FROM staff GROUP BY branchNo;




--Task 3: 
--Question 1: Show the average salary of all employees.
SELECT AVG(salary) AS averageSalary FROM staff

--Question 2: Show the average salary of employees from branch B005.
SELECT fName, lName, branchNo, AVG(salary) AS averageSalary FROM staff WHERE branchNo='B005'