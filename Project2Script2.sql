--Project 2 Query 
--Tim DaMour 
--CIS 111 Henry Ford College 
--Taught by Ali  Kawsan 
  
Use SweetAuntMays; --uses the database 

--script that inserts data into tables 

--This creates values and data for Items Table 
select * from Items; 
insert into Items
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
select * from Equipment 
insert into Equipment
Values(8,'Cash Register',250.00,12,4,2019,0),
(2,'Stock Shelf(3 each)',2000.00,12,4,2019,0),
(5,'Refrigerator',250.00,6,4.50,2020,0),
(4,'Crates(5 each)',200.00,12,4,2019,0),
(10,'Cash Register',250.00,12,4,2019,0); 

select * from Equipment

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
select * from Contacts
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

--switch phone number from int to varchar for the report--- 


