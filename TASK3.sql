
Create database BANK;
Use  Bank ;

create table Branch (branch_name varchar(30), branch_city varchar(20), assets real, primary key(branch_name));

insert into Branch values('SBI_Chamrajpet','Bangalore',50000);
insert into Branch values('SBI_ResidencyRoad','Bangalore',10000);
insert into Branch values('SBI_ShivajiRoad','Bombay',20000);
insert into Branch values('SBI_ParliamentRoad','Delhi',10000);
insert into Branch values('SBI_Jantarmantar','Delhi',20000);

create table BankAccount (accno int, branch_name varchar(30), balance real,
primary key (accno),
foreign key (branch_name) references Branch(branch_name));

insert into BankAccount values(1,'SBI_Chamrajpet',2000);
insert into BankAccount values(2,'SBI_ResidencyRoad',5000);
insert into BankAccount values(3,'SBI_ShivajiRoad',6000);
insert into BankAccount values(4,'SBI_ParliamentRoad',9000);
insert into BankAccount values(5,'SBI_Jantarmantar',8000);
insert into BankAccount values(6,'SBI_ShivajiRoad',4000);
insert into BankAccount values(8,'SBI_ResidencyRoad',4000);
insert into BankAccount values(9,'SBI_ParliamentRoad',3000);
insert into BankAccount values(10,'SBI_ResidencyRoad',5000);
insert into BankAccount values(11,'SBI_Jantarmantar',2000);

create table BankCustomer (customer_name varchar(20), customer_street varchar(20),customer_city varchar(20),primary key(customer_name));

insert into BankCustomer values('Avinash', 'Bull_Temple_Road', 'Bangalore');
insert into BankCustomer values('Dineshh', 'Bannergatta_Road', 'Bangalore');
insert into BankCustomer values('Mohan', 'NationalCollege_Road', 'Bangalore');
insert into BankCustomer values('Nikil', 'Akbar_Road', 'Delhi');
insert into BankCustomer values('Ravi', ' Prithviraj_Road', 'Delhi');

create table Depositer(customer_name varchar(20), accno int, 
primary key(customer_name, accno),
foreign key (customer_name) references BankCustomer(customer_name),
foreign key (accno) references BankAccount(accno));

insert into Depositer values('Avinash', 1);
insert into Depositer values('Dineshh', 2);
insert into Depositer values('Nikil', 4);
insert into Depositer values('Ravi', 5);
insert into Depositer values('Avinash', 8);
insert into Depositer values('Nikil', 9);
insert into Depositer values('Dineshh', 10);
insert into Depositer values('Nikil', 11);

create table LOAN (loan_number int, branch_name varchar(30), amount real,
primary key(loan_number),
foreign key (branch_name) references Branch(branch_name));

insert into LOAN values(1,'SBI_Chamrajpet',1000);
insert into LOAN values(2,'SBI_ResidencyRoad',2000);
insert into LOAN values(3,'SBI_ShivajiRoad',3000);
insert into LOAN values(4,'SBI_ParliamentRoad',4000);
insert into LOAN values(5,'SBI_Jantarmantar',5000);

select branch_name,(assets/100000) as assets_in_lakhs from branch;
select customer_name from Depositer,bankaccount where Depositer.accno=bankaccount.accno and branch_name='SBI_ResidencyRoad' having count(branch_name>=2);

create view branch_loan_details as select branch_name,amount from loan;

use database;
