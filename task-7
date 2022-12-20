create database Supplier;
use Supplier;

create table suppliers(
sid int primary key,
sname char(25),
city char(25)
);

create table parts(
pid int primary key,
pname char(15),
color char(15)
);

create table catalog(
sid int,
pid int,
cost int,
primary key (sid, pid),
foreign key (sid) references suppliers(sid)
on update cascade on delete cascade,
foreign key (pid) references parts(pid)
on update cascade on delete cascade
);

insert into suppliers values 
(10001, 'Acme Widget', 'Bangalore'),
(10002, 'Johns', 'Kolkata'),
(10003, 'Vimal', 'Mumbai'),
(10004, 'Reliance', 'Delhi');

insert into parts values
(20001, 'Book', 'Red'),
(20002, 'Pen', 'Red'),
(20003, 'Pencil', 'Green'),
(20004, 'Mobile', 'Green'),
(20005, 'Charger', 'Black');

insert into catalog values
(10001, 20001, 10),
(10001, 20002, 10),
(10001, 20003, 30),
(10001, 20004, 10),
(10001, 20005, 10),
(10002, 20001, 10),
(10002, 20002, 20),
(10003, 20003, 30),
(10004, 20003, 40);

/*3. Find the pnames of parts for which there is some supplier.*/
select distinct pname from parts p, catalog c where p.pid=c.pid; 

/*4. Find the snames of suppliers who supply every part.*/

select sname from suppliers where sid in
(select sid from catalog c where c.pid = all(select pid from parts));

select sname from suppliers s where sid in
(select sid from catalog c where 
not exists(select pid from parts p where not exists
(select sid from catalog c1 where c1.sid=c.sid and c1.pid=p.pid)));

/*5. Find the snames of suppliers who supply every red part.*/

select sname from suppliers where sid in
(select sid from catalog where pid in(select pid from parts where color='Red'));

/*6. Find the pnames of parts supplied by Acme Widget Suppliers and by no
one else.*/

select pname from parts where pid in
(select pid from catalog where sid in
(select sid from suppliers where sname like 'Acme%'));

/*7. Find the sids of suppliers who charge more for some part than the average
cost of that part (averaged over all the suppliers who supply that part).*/



/*8. For each part, find the sname of the supplier who charges the most for
that part.*/
