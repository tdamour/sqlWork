--Project 2 Query 
--Tim DaMour 
--CIS 111 Henry Ford College 
--Taught by Ali  Kawsan 
 
--Script for Project2--Database Creation 
--Sweet Aunt May's Database 
 
--If Statment if object_id equals NOT NULL then drop database and then create the database 
use master 
if db_id('CIS111_TimDaMour') is NOT NULL 
drop database CIS111_TimDaMour; 

--This command creates my database SweetAuntMays which my data tables, among other things for the purpose of this report 
create database CIS111_TimDaMour
Go

Use CIS111_TimDaMour

--this creates my first table Items 
create table Items
(ItemID int primary key identity, 
DescriptionItems varchar(50) Not Null,
Company varchar(50) Not Null, 
PurchasePrice Decimal Not Null, 
SalesPrice Decimal Not Null, 
Stock int Not Null, 
SellRate int Not Null); 


--creates my Personnel Table
create table Personnel 
(PersonnelID int primary key identity,
Job varchar(50) not Null, 
Name varchar(50) Not Null, 
WorksForID int Not Null, 
PartOrFullTime char Not Null, 
Salary Decimal Not Null); 

--creates my Contacts Table 
create table Contacts 
(ContactID int primary key identity,
PersonnelID int Foreign Key References Personnel(PersonnelID), 
PersonnelIDAddress varchar(50) Not Null, 
City Varchar(50) Not Null, 
PersonnelState varchar(4) Not Null, 
Email varchar(50) Null, 
PhoneNumber varchar(50) Null); 


--Creates my Equipment Table 
--had to change some of my column names due to being reserved. 
create table Equipment
(EquipmentID int primary key identity, 
PersonnelID int foreign key references Personnel(PersonnelID), 
EquipmentDescription varchar(50) Not Null,
IntialCost decimal Not Null, 
AgeInMonths int Not Null, 
DeprecationRate int Not Null, 
DeprecationYear int Not nUll, 
DeprecationTotal decimal Not Null); 

--This adds a new column, for example this adds EquipmentID to my Items Table 
alter table Items
add EquipmentID int Not Null;
--This makes the newly added EquipmentID a Foreign Key in the Items table 
alter table Items
ADD Foreign Key (EquipmentID)
References Equipment(EquipmentID)

--and for fun this drops a column 
--alter table Personnel 
--drop Column WorksForID;
--********************************************************************--

--script that inserts data into tables 

use CIS111_TimDaMour
Go

--This creates values and data for Items Table 
select * from Items; 
insert into Items(DescriptionItems,Company,PurchasePrice,SalesPrice,Stock,SellRate) 
Values('Cheerios','General Mills',1.50,1.25,50,20,2),
('Ham','Big Thick Meats',10.00,8.99,50,20,4),
('Milk','Red Pill',4.00,3.00,50,13,4),
('Chili Beans','Hormel',6.00,3.00,50,13,2),
('White Bread','Dirty Joes Bread',0.49,0.49,50,13,2),
('Cambell Soup','Cambell',2.00,1.50,50,11,2),
('Apple','Grandma',5.50,5.0,50,11,5),
('Firewood','Dirty Joes Wood',7.00,5.99,50,11,5),
('Bacon Bits','Hormel',5.00,2.50,50,11,5),
('Marshmellows','Puffpuff',4.00,3.50,50,11,5); 




--This creates values and data for Equipments Table 
--added deprecation year and deprecation total for views 
select * from Equipment 
insert into Equipment
Values(8,'Cash Register',250.00,12,4,2019,0),
(2,'Stock Shelf(3 each)',2000.00,12,4,2019,0),
(5,'Refrigerator',250.00,6,4.50,2020,0),
(4,'Crates(5 each)',200.00,12,4,2019,0),
(10,'Cash Register',250.00,12,4,2019,0); 


--This inserts data into the personnel table...
insert into Personnel
Values('Owner','Tim',0,'F',40.00),
('Shift 1 Supervisor','Will',1,'F',12.00),
('Shift 2 Supervisor','Billybob',1,'F',11.00),
('Worker 1','Mark',2,'F',8.00),
('Worker 2','Andrea',2,'F',8.00),
('Accountant','Andre',3,'P',12.00),
('Stock','Jared',2,'P',7.50),
('Cashier','Janet',3,'P',7.50),
('Butcher','Waldo',2,'P',7.50),
('Cashier','Emily',3,'P',7.50); 

--This creates values and data for Contact Table 
insert into Contacts
Values
(1,'578 Big Boss Lane', 'Dearborn','MI','boss@gmail.com','(313)555-9021'),
(2,'666 Hot Avenue','Dearborn','MI','will@hotmail.com','(313)555-5343'),
(3,'776 Freedom St.','Canton','MI','mike76@gmail.com','(734)444-8949'),
(4,'0889 Kaiser St','Taylor','MI','mark@yahoo.com','(313)980-4353'),
(5,'3321 Terry St','Oak Park','MI','andrea@gmail.com','(708)042-8888'),
(6,'943 Yellow Ave.','Novi','MI','andrew@outlook.com','(248)777-5454'),
(7,'310 Hallow St','Westland','MI','jared@yahoo.com','(313)874-9049'),
(8,'890 Nine St','Romulus','MI','Janet@aol.com','(734)665-7894'),
(9,'999 Nelson','Plymouth','MI','waldo@outlook.com','(734)674-9033'),
(10,'555 Fifth Ave.','Canton','MI','emily@gmail.com','(734)221-4365'); 


--NOTE:switch phone number from int to varchar for the report--- 



--**********************************************--
--Project2 triggers, stored procedures and the two view codes 

--View for Payroll and group by WorksForID 
create view Payroll 
as 
select Name, Salary,WorksForID
from Personnel 
group by WorksForID 


--Views for Asset In
create view AssetsInv
as
select EquipmentID, EquipmentDescription, IntialCost, DeprecationYear  
from Equipment 


--Trigger 

select * from Personnel 
--trigger that checks the accuary of the data submission for employee pay if they are a supervisor then the pay is a yearly sum
--however if they are not, then the hourly will show. 
create trigger EmployeePay
on Personnel 
as
if(Job='Shift 1 Supervisor' or Job='Shift 2 Supervisor')
Begin 
update Salary
set Salary=Salary * 40 * 52
End 

--Stored Procedure
use CIS111_TimDaMour;
if OBJECT_ID('spItemsCopy') is NOT NULL
drop proc spItemsCopy;
go

--Stored procedure that will show the total monetary amount broken up by each descirption. 
create proc spItemsCopy
@Description varchar(50),
@totalMonetaryAmount money Output
as 
select @totalMonetaryAmount=(SalesPrice * Stock)
from Items 
where DescriptionItems >= @Description; 



--and that's the jest of the database script report for sweetAuntMays---