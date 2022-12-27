create database Airline;

create table flights(
flno int primary key,
departure char(25),
arrival char(25),
distance int,
departs time,
arrives time,
price int
);

create table aircraft(
aid int primary key,
aname char(25),
cruisingrange int);

create table employee(
eid int primary key,
ename char(25),
salary int);

create table certified(
eid int,
aid int,
primary key(eid, aid),
foreign key (eid) references employee(eid) on update cascade on delete cascade,
foreign key (aid) references aircraft(aid) on update cascade on delete cascade
);

insert into flights values (1, 'Bengaluru', 'New Delhi', 500, '6:00', '9:00', 5000),
(2, 'Bengaluru', 'Chennai', 300, '7:00', '8:30', 3000),
(3, 'Trivandrum', 'New Delhi', 800, '8:00', '11:30', 6000),
(4, 'Bengaluru', 'Frankfurt', 10000, '6:00', '23:00', 50000),
(5, 'Kolkata', 'New delhi', 2400, '11:00', '3:30', 9000),
(6, 'Bengaluru', 'Frankfurt', 8000, '9:00', '23:00', 40000);

insert into aircraft values(1, 'Airbus', 2000),
(2, 'Boeing', 700),
(3, 'JetAirways', 550),
(4, 'Indigo', 5000),
(5, 'Boeing', 4500),
(6, 'Airbus', 2200);

insert into employee values (101, 'Avinash', 50000),
(102, 'Lokesh', 60000),	
(103, 'Rakesh', 70000),
(104, 'Santhosh', 82000),
(105, 'Tilak', 5000);

insert into certified values(101, 2),
(101, 4), (101, 5), (101, 6),
(102, 1), (102, 3), (102, 5),
(103, 2), (103, 3), (103, 5), (103, 6),
(104, 6), (104, 1), (104, 3),
(105, 3);

/*1 question*/

select aname from aircraft where aid in 
(select aid from certified c, employee e where e.eid=c.eid and e.salary>=80000);

/* question 2*/

select c.eid, max(a.cruisingrange) from certified c, aircraft a where c.aid=a.aid and c.eid in 
(select eid from certified group by eid having count(eid)>=3)group by eid;

/* question 3 */

select ename from employee where salary <= (
select min(price) from flights where departure='Bengaluru' and arrival='Frankfurt');

/* question 4 */


select a.aid, aname, avg(e.salary) from aircraft a, employee e, certified c where a.aid in
(select aid from aircraft where cruisingrange>=1000) and a.aid=c.aid and c.eid=e.eid group by aid, aname;

/* question 5*/

select ename from employee where eid in 
(select c.eid from certified c, aircraft a where a.aid=c.aid and a.aname='Boeing');

/* question 6 */


select aid from aircraft a, flights f where a.aid=f.flno and a.cruisingrange>
(select distance from flights where departure='Bengaluru' and arrival='New Delhi');
