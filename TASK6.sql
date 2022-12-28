create database Employee;
use Employee;

create table dept (
deptno int primary key,
dname char(25),
dloc char(25)
);

create table employee(
empno int,
ename char(25),
mgrno int,
hiredate varchar(10),
sal int,
deptno int,
primary key(empno, deptno),
foreign key (deptno) references dept(deptno)
on update cascade on delete cascade
);

create table incentives(
empno int,
incentive_date varchar(10),
incentive_amount int,
primary key (empno),
foreign key (empno) references employee(empno)
on update cascade on delete cascade
);

create table project(
pno int primary key,
ploc char(25),
pname char(25)
);

create table assigned_to(
empno int,
pno int,
job_role char(25),
primary key (empno, pno),
foreign key (empno) references employee(empno)
on update cascade on delete cascade,
foreign key (pno) references project(pno)
on update cascade on delete cascade
);

insert into dept values (),
(),
(),
(),
();
insert into employee values (),
(),
(),
(),
();
insert into incentives values (),
(),
(),
(),
();
insert into project values (),
(),
(),
(),
();
insert into assigned_to values (),
(),
(),
(),
();

/*3. Retrieve the employee numbers of all employees who work on
project located in Bengaluru, Hyderabad, or Mysuru*/

select empno from employee where empno in 
(select empno from assigned_to a, project p where a.pno=p.pno 
and p.ploc in ('Bengaluru', 'Hyderabad', 'Mysuru'));

select empno from employee where empno in 
(select empno from assigned_to a inner join project p on a.pno=p.pno 
where p.ploc in ('Bengaluru', 'Hyderabad', 'Mysuru'));

/*4.Get Employee ID’s of those employees who didn’t receive incentives*/

select empno from emplyoee where empno not in (select empno from incentives);

/*5. Write a SQL query to find the employees name, number, dept,
job_role, department location and project location who are working for
a project location same as his/her department location.*/

select e.ename, e.empno, d.dname, d.dloc, p.ploc, a.job_role from employee e 
inner join dept d on e.deptno=d.deptno
inner join assigned_to a on e.empno=a.empno 
inner join project p on a.pno=p.pno where p.ploc=d.dloc;
