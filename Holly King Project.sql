CREATE DATABASE Hollys_Hotel;

Use Hollys_Hotel;

CREATE TABLE Customer (
Customer_ID int primary key NOT NULL auto_increment, 
Title varchar(10),
First_Name varchar(20), 
Last_Name varchar(20));

CREATE TABLE Customer_Address (
Customer_ID int NOT NULL, 
House_Number_Name varchar(20), 
Road_Name varchar(20), 
City varchar(20),  
Postcode varchar(20), 
foreign key (Customer_ID) references customer(Customer_ID));

CREATE TABLE Customer_Contact (
Customer_ID int NOT NULL, 
Mobile_Number varchar(11) NOT NULL, 
Alternative_Phone varchar(11), 
Email_Address varchar(30), 
Preferred_Contact varchar(5), 
foreign key (Customer_ID) references customer(Customer_ID)); 

Create table Bedrooms (
Room_Number int primary key not null, 
Max_Pax int, 
Bed_Type enum('Single', 'Double', 'Twin', 'Interchangeable','Family','DBLandSB'), 
Room_Type enum('Standard', 'Delux', 'Suit'), 
Pets boolean); 

CREATE TABLE Bedroom_Packages (
Package_ID enum('RO', 'BB', 'DBB', '2NB', 'AFT', 'Fizz') not null primary key,
Package_Name varchar(50),
Single_Supplement boolean,
Supplement_cost int, 
Restrictions varchar(50));

Create Table Bedroom_Bookings (
Customer_ID int NOT NULL, 
Arrival_Date date, 
Duration int, 
Room_Number int NOT null, 
Package_ID enum('RO', 'BB', 'DBB', '2NB', 'AFT', 'Fizz'), 
Pax int, 
Cost float(5,2), 
foreign key(customer_ID) references customer(Customer_ID), 
foreign key(Room_Number) references Bedrooms(Room_Number),
foreign key(Package_ID) references Bedroom_Packages(Package_ID)); 

Create Table FB_Packages (
FB_ID varchar(50) NOT NULL PRIMARY KEY, 
Package_Name varchar(50), 
restrictions varchar(50), 
Location varchar(50));

Create table FB_Bookings (
Customer_ID int, 
FB_ID varchar(50), 
Date date, 
time time, 
Pax int, 
prepaid boolean, 
foreign key(customer_ID) references customer(Customer_ID), 
foreign key(FB_ID) references FB_Packages(FB_ID));

Insert into Customer(Title, First_Name, Last_Name) values (
'Mr','Robert','White'), (
'Ms', 'Penny','Beer'), (
'Miss','Gina','Jones'), (
'Mr','Charlie','Glover'), (
'Mrs','Chloe','McKenzie'), (
'Mr', 'Jacob', 'Smith'), (
'Ms', 'Emily', 'Williams'), (
'Mrs', 'Alice', 'Taylor'), (
'Dr', 'Ian', 'Davies'), (
'Miss', 'Sophie', 'Brown'), (
'Mr', 'Shaun', 'Wilson'), (
'Sir', 'Thomas', 'Evans'), (
'Mr', 'Mike', 'Thomas'), (
'Miss', 'Ella', 'Johnson'), (
'Dr', 'Olivia', 'Roberts'), (
'Mr', 'Leo', 'Walker'), (
'Ms', 'Emily', 'Wright'), (
'Sir', 'William', 'Robinson'), (
'Mr', 'Henry', 'Thomson'), (
'Sir', 'Oscar', 'Hughes'), (
'Sir', 'Arthur', 'Edwards'), (
'Mr', 'Jasper', 'Green'), (
'Miss', 'Daisie', 'Wood'), (
'Ms', 'Jessica', 'Harris'), (
'Miss', 'Rosie', 'Wallace'), (
'Dr', 'Theodore' , 'Clarke'), (
'Mr', 'Oliver' , 'Smith'), (
'Ms', 'Charlotte', 'Hayer'), (
'Miss', 'Isla', 'Miller'), ('Mr', 'Milo', 'Evans');

insert into customer_address(customer_ID,house_number_name,road_name,City,postcode) values (
1, '139A', 'UPPER_LISTBURN_ROAD','BELFAST','BT10_0LH'),(
2, 'UNIT_1','VINCENT_WORKS','HOPE_VALLEY','S33_9HG'),(
3, '13','HILL_ST','WREXHAM', 'LL14_1LN'),(
4, '5','REYNOLDS_ROAD','CRAWLEY', 'RH11_7HA'),(
5, '1A', 'SEA_ROAD','SKEGNESS','PE24_5SJ'),(
6, '17', 'ST_MARYS_WAY','CHESHAM','HP5_1HR'),(
7,'21','CHANTRY_ST','ANDOVER','SP10_1RL'),(
8, '8', 'CHILSTON_RD', 'TUNBRIDGE_WELLS' ,'TN4_9LT'),(
9, 'THE_OLD_RAILWAY_YARD', 'FISHWICK_STREET','ROCHDALE','OL16_5NA'),(
10, '20', 'MAUNSIDE','MANSFIELD','NG18_5GU'),(
11, '6', 'HIGH_STREET','NORWICH', 'NG12_9AN'),(
12, '4','LONDON_ROAD','BIGGLESWADE','SG18_8ED'),(
13, '200', 'The_Mall', 'Harrow','HA3_9TT'),(
14,'31' ,'Tewkesbury_Rd', 'London', 'W13_0UJ'),(
15,'96', 'Halliwick_Road', 'London','N10_1AB'),(
16,'56', 'High_St', 'Staines-Upon-Thames', 'TW18_4DY'),(
17,'2','Balmoral_Close', 'Stone','ST15_0ES'),(
18,'17A' ,'Stilebrook_Road', 'Olney', 'MK46_5EA'),(
19,'70' ,'Birmingham_Rd', 'Rowley_Regis', 'B65_9BA'),( 
20, '1', 'Outwood_Farm_Close', 'Billericay','CM11_2ND'),(
21,'1', 'Elgin_Avenue', 'Holmes_chapel','CW4_7JE'),(
22,'7', 'Astral_Road', 'Hessle','HU13_9DD'),(
23,'3_Trentside_Cottages', 'Derby_Road', 'Swarkestone','DE73_7GW'),(
24,'8' ,'Highfield_Crescent', 'Westwoodside','DN9_2DF'),(
25,'1_Church_Farm_Barns', 'Back_Lane', 'Great_Bircham','PE31_6XJ'),(
26,'3','Chittleburn_Hill', 'Brixton','PL8_2BH'),(
27,'13', 'Glyn_Terrace', 'Borth_Y_Gest','LL49_9UD'),(
28,'21', 'Dulwich_Grange', 'Bratton','TF5_0ED'),(
29,'5', 'Kinnard_Square', 'Owston_Ferry','DN9_1AN'),(30,'17', 'Wharncliffe_Gardens', 'London','SE25_6DG');

Insert into customer_contact(customer_ID, mobile_number, alternative_phone, email_address, preferred_contact) values (
1, '07965621570', '07715800226', 'robbie.white@hotmail.co.uk','email'), (
2, '07956228173', '07789892426', 'pbeer@gmail.com', 'Phone'),(
3, '07721878605', '07005144574', 'ginajone35@yahoo.com','email'), (
4, '07831910595', '07086044068', 'gloverc@email.co.uk','Phone'),(
5, '07750607257', '07959082393', 'chloemckenzie@hotmail.com','Phone'),(
6, '07742928196',NULL, 'jacob123smith@gmail.co.uk','email'), (
7, '07962713083', '07920954486','emwilliams@hotmail.co.uk','Phone'),(
8, '07026792804', '07032741597','aliceinwonderland@yahoo.co.uk','email'), (
9, '09755067189',NULL,'iandavies543@hotmail.com','Phone'),(
10,'09744725907', '07701591032', 'sophiexxxbrown@hotmail.com','Phone'),(
11,'07962953176', '07086879798','shaunwilson678@gmail.com','email'), (
12,'07906492504',NULL,'thommyevans8549@yahoo.co.uk','Phone'),(
13,'07057784089', '07707407560','mikessthomas567@gmail.com','Phone'),(
14,'07906563098',NULL,'johnsonella1@hotmail.co.uk','email'), (
15,'07052319505',NULL,'olivia.roberts@gmail.co.uk','Phone'),(
16,'07704661805',NULL,'leowalker87@email.com','Phone'),(
17,'07717762210', '07879102935','emily1wright@hotmail.co.uk','email'), (
18,'07864129314', '07927247027','willrobinson@hotmail.co.uk','Phone'),(
19,'07889021567', '07024417933','thompsonhenry43@yahoo.co.uk','email'), (
20,'07774435943',NULL,'oscar.hughes@gmail.com','Phone'),(
21,'07038480642', '07830275562','arthuredwards6@hotmail.co.uk','Phone'),(
22,'07704606236', '07730229692','jaspergreen@emial.co.uk','Phone'),(
23,'07867937738', '07024314500','daisiemaywood@yahoo.co.uk', 'Phone'),(
24,'07039706677',NULL,'jessieharris@hotmail.com','email'), (
25,'07903791907', '07013803373','rosie.wallace@gmail.com', 'Phone'),(
26,'07877125369',NULL,'theoclarke@hotmail.co.uk', 'Phone'),(
27,'07054530967', '07768911369','olliesmith49504@yahoo.co.uk','email'), (
28,'07818683031',NULL,'charlottehayer@hotmail.co.uk','Phone'),(
29,'07017306479', NULL,'islamiller7@gmial.co.uk', 'Phone'),(
30,'07977375324', '07962836661', 'milo.evans@hotmail.com', 'email');

insert into bedrooms(room_number,max_pax,bed_type,room_type,pets) values (
1,1,'Single','Standard', True),(
2,2,'Double','Standard',False),(
3,2,'Interchangeable','Delux',False),(
4,2,'Double','Delux',False),(
5,3,'DBLandSB','Delux',True),(
6,3,'DBLandSB','Delux',True),(
7,2,'Double','Delux',True),(
8,1,'Single','Standard',True),(
9,2,'Interchangeable','Suit',False),(
10,2,'Double','Standard',False),(
11,2,'Twin','Standard',False),(
12,2,'Interchangeable','Delux',True),(
14,2,'Double','Standard',False),(
15,2,'Interchangeable','Suit', False),(
16,2,'Twin','Delux',False),(
17,2,'Interchangeable','Delux',False),(
18,2,'Twin','Standard',False),(
19,3,'DBLandSB','Suit',False),(
20,1,'Single','Standard',True),(
21, 3, 'DBLandSB','Suit',False),(
22,2,'Interchangeable','Delux', True),(
23,3,'DBLandSB','Delux',True),(
24,4,'Family','Standard',False),(
25,4,'Family','Delux',False),(
26,4,'Family','Delux',False),(
27,4,'Family','Standard',True),(
28,4,'Family','Standard',True),(
29,4,'Family','Standard',False),(
30,4,'Family','Delux',False),(
31,4,'Family','Delux',False),(
32,4,'Family','Standard',False),(
33,4,'Family','Delux',True);

insert into bedroom_packages(package_ID,Package_name,single_supplement,supplement_cost,restrictions) values (
'RO','Room_Only',false,0,null),(
'BB','Bed_and_Breakfast',false,null,null	),(
'DBB','Dinner_Bed+Breakfast',true,20,null),(
'2NB','Two_Night_Break',true,30,'Excludes_BH'),(
'AFT','Afternoon_Tea_Getaway',true,25,'excludes_weekends_BH'),(
'FIZZ','Friday_Fizz',true,30,'Only_friday');

insert into	bedroom_bookings(customer_ID,arrival_date,duration,room_number,package_id,Pax,cost) values (
1,'2021-08-06', 2, 30,'2nb',4,400),(
1,'2021-02-14',1, 19, 'DBB',2,130),(
2,'2021-12-24',3,6,'DBB',2,600),(
3,'2021-05-07',2,17,'2NB',2,300),(
4,'2021-05-28',1,19,'fizz',2,125),(
5,'2021-07-03',1,16,'DBB',2,180),(
6,'2021-04-06',3,8,'DBB',1,280),(
7,'2021-08-06', 3, 5, 'BB', 3, 270),(
8,'2021-07-20',1,8,'DBB',1,110),(
9,'2021-08-31',1,4,'aft',2,120),(
10,'2021-11-03',3,24,'bb',4,350),(
12,'2021-11-23',1,1,'bb',1,90),(
11,'2021-02-10',1,6,'DBB',2,150),(
13,'2021-08-06', 1,16, 'AFT',2,120), (
14,'2021-09-21',2,21, '2NB',2,240),(
15,'2021-09-29',1,27,'RO',4,100),(
16,'2021-05-13',1,17,'aft',2,125),(
17,'2021-04-25',5,20,'DBB',1,480),(
18,'2021-09-05',5,10,'RO',1,450),(
19,'2021-08-06',1,22,'Fizz',2,125),(
19,'2021-12-20',2,2,'BB',2,170),(
20,'2021-08-29',1,14,'DBB',2,100),(
22,'2021-06-25',1,2,'Fizz',2,130),(
2,'2021-12-03',1,19,'aft',2,125),(
2,'2021-08-06',1,20,'RO',1,90),(
5,'2021-04-05',2,22,'BB',2,150),(
29,'2021-08-27',4,5,'dbb',2,360),(
28,'2021-01-21',1,22,'bb',2,90),(
26,'2021-08-06',1,27, 'BB',4, 110),(
30,'2021-02-14',2,24,'2NB',4,330),(
30,'2021-02-05',1,9,'bb',2,175),(
30,'2021-12-31',1,9,'dbb',2,200);

Insert into fb_packages(FB_ID,Package_name,restrictions,location) values (
'AFT', 'Afternoon_Tea', 'excludes_Bank_Holidays','lounge'),(
'BRK', 'Breakfast', 'before_10am', 'Forest_room'),(
'CT','Cream_Tea','excludes_Bank_Holidays','lounge'),(
'SAFT', 'Sparkling_Afternoon_tea','excludes_Bank_Holidays','lounge'),(
'DD','Dinner','After_6pm','Glasshouse'),(
'LNC','Lunch', '12_to_5', 'Bar'),(
'CAFT','Cheese_Afternoon_tea', 'excludes_Bank_Holidays','lounge'),(
'Do','Drinks_Only',null, 'Bar');

insert into fb_bookings(customer_id,fb_ID,date,time,pax,prepaid) values (
1,'dd','2021-08-06','19:00',4,true),(
1,'dd','2021-02-14','20:00',2,true),(
2,'dd','2021-12-24','19:30',2,true),(
3,'dd','2021-05-07','18:00',2,true),(
4,'dd','2021-05-28','17:15',2,true),(
5,'dd','2021-07-03','19:15',2,true),(
6,'dd','2021-04-06','19:30',1,true),(
8,'dd','2021-07-20','21:00',1,true),(
9,'aft','2021-08-31','13:00',2,true),(
11,'dd','2021-02-10','20:45',2,true),(
13,'AFT','2021-08-06','14:00',2,true),(
14,'dd','2021-09-21','20:00',2,true),(
16,'aft','2021-05-13','13:30',2,true),(
17,'dd','2021-04-25','20:00',1,true),(
19,'dd','2021-08-06','18:00',2,true),(
20,'dd','2021-08-29','17:30',2,true),(
22,'dd','2021-06-25','18:45',2,true),(
2,'aft','2021-12-03','15:00',2,true),(
29,'dd','2021-08-27','20:00',2,true),(
30,'dd','2021-02-14','20:30',4,true),(
30,'dd','2021-12-31','21:00',2,true),(
12,'do','2021-10-02','17:00',6,False),(
16,'caft','2021-09-25','14:00',5, false),(
18, 'lnc','2021-05-13','13:00',2, false), (
1,'ct','2021-08-07','13:00',4,false),(
2,'brk','2021-08-07','07:00',1,false),(
13,'saft','2021-10-02','14:00',6,false);

select customer.First_name, customer.Last_name, customer_contact.mobile_number, fb_bookings.date, fb_bookings.time, fb_packages.Package_name, fb_bookings.prepaid, fb_packages.location from 
customer inner join customer_contact on customer.customer_ID = customer_contact.customer_id 
inner join fb_bookings on fb_bookings.customer_id = customer.customer_ID
inner join fb_packages on fb_packages.FB_Id = fb_bookings.fb_id 
where fb_bookings.date='2021-08-06' order by fb_bookings.time asc;

delimiter //
create function Children_visiting(pax int)
returns varchar(20)
deterministic 
begin
declare children_visiting varchar(20);
if pax>=3 then set children_visiting='No';
elseif (pax<2) then set children_visiting='No';
elseif(pax<3 and pax>=2) then set children_visiting='maybe';
end if;
return (children_visiting);
end //

delimiter ;
select customer_id, arrival_date, pax,children_visiting(pax)from bedroom_bookings;

select * from Customer where customer_id in (select customer_id from bedroom_bookings where arrival_date='2021-08-06');

delimiter //
create procedure New_bedroom_booking(In customer_ID int,
In Arrival_date date,
in duration int,
in room_number int, 
in package_id enum('RO', 'BB', 'DBB', '2NB', 'AFT', 'Fizz'),
in pax int,
in cost float(5,2))
begin insert into bedroom_bookings(customer_id, arrival_date, duration, room_number,package_id,pax,cost) 
values (customer_id, arrival_date, duration, room_number,package_id,pax,cost);
END//

delimiter ;

Call new_bedroom_booking (29, '2021-06-21',1,17,'Fizz',2, 125);

create table bedroom_booking_changes (
change_id int  primary key NOT NULL auto_increment,
customer_id int not null,
Arrival_Date date, 
Duration int, 
Room_Number int NOT null, 
Package_ID enum('RO', 'BB', 'DBB', '2NB', 'AFT', 'Fizz'), 
Pax int, 
Cost float(5,2), 
updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);

delimiter //
create trigger trg_bedroom_changes after insert on bedroom_bookings 
for each row
begin 
insert into bedroom_booking_changes (customer_id,arrival_date,duration,room_number,package_id, pax,cost, updated_at,operation)
select new.customer_id,new.arrival_date,new.duration,new.room_number,new.package_id, new.pax,new.cost, current_timestamp(), 'ins';
end // 

create trigger trg_bedroom_delete before delete on bedroom_bookings 
for each row 
begin 
insert into bedroom_booking_changes (customer_id,arrival_date,duration,room_number,package_id, pax,cost, updated_at,operation)
 SELECT old.customer_id,old.arrival_date,old.duration,old.room_number,old.package_id, old.pax, old.cost, current_timestamp(), 'DEL' ;
end// 

delimiter ;



insert into bedroom_bookings(customer_ID,arrival_date,duration,room_number,package_id,Pax,cost) values (
21,'2021-01-01',1,1,'bb',1,100);



insert into bedroom_bookings(customer_ID,arrival_date,duration,room_number,package_id,Pax,cost) values (
27,'2020-11-19',1,1,'bb',1,100);

create event delete_past_bedbookings 
on schedule at current_timestamp() + interval 1 day 
on completion preserve 
do delete
from bedroom_bookings where arrival_date < current_timestamp();

create view Full_customer_details as
select customer.customer_ID, customer.first_name, customer.Last_name, 
customer_address.house_number_name, customer_address.postcode, 
customer_contact.mobile_number, customer_contact.email_address
from customer inner join customer_contact on customer.customer_id=customer_contact.customer_id
inner join customer_address on customer_contact.customer_id= customer_address.customer_id 
order by customer.customer_id asc;

create view FB_bookings_and_contact_info as
select
fb_bookings.date, FB_bookings.time, fb_bookings.Pax,
fb_packages.Package_Name,
customer.first_name, customer.Last_name, 
customer_address.house_number_name, customer_address.postcode, 
customer_contact.mobile_number, customer_contact.email_address
from fb_packages inner join fb_bookings on fB_packages.fb_id=fb_bookings.fb_id 
left join customer on fb_bookings.customer_id=customer.customer_id 
inner join customer_contact on customer.customer_id=customer_contact.customer_id
inner join customer_address on customer_contact.customer_id= customer_address.customer_id 
order by fb_bookings.date asc;

select * from FB_bookings_and_contact_info where first_name='robert';

select count(bedroom_bookings.customer_id), customer.first_name, customer.last_name
from bedroom_bookings inner join customer on bedroom_bookings.customer_id=customer.customer_id 
group by bedroom_bookings.customer_ID 
having count(bedroom_bookings.customer_id)>=2;