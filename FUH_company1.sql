create database FUH_company1

use FUH_company1--du dung FUH company
create table tblDepartment1
(
depNum int primary key,
depName varchar(50) not null,
mqrSSN varchar(11),
mqrAssDate date
)

create table tblEmployee1
(
empSSN varchar(11) primary key,
empName nvarchar(50) not null,
emAddress nvarchar(50) default N'Đà Nẵng',--N dùng để bắt đầu chữ có dấu
empSalary numeric(9,0),
empSex char(1),
empBoD date,
depNum int, 
supervisorSSN varchar(20),
empStartdate Date,
constraint fk_emp1 foreign key(depNum) references tblDepartment1(depNum)
)

create table tblDependent1
(
depName nvarchar(50),
empSSN varchar(11),
depSex char(1),
depDoB date,
depRelationship nvarchar(10)
constraint pk_dep1 primary key(depName, empSSN)
constraint fk_dep1 foreign key(empSSN) references tblEmployee1(empSSN)
)

create table tblProject1
(
proNum INT primary key,
proName varchar(50),
locNum int,
depNum int,
constraint fk_pro1 foreign key(depNum) references tblDepartment1(depNum)
--    FOREIGN KEY (locNum) REFERENCES tblLocation(locNum),
)

create table tblWorkOn
(
empSSN varchar(11),
proNum int,
workHours int,
primary key(empSSN, proNum),
foreign key(empSSN) references tblEmployee1(empSSN),
foreign key(proNum) references tblProject1(proNum)
)


create table tblLocation1
(
locNum int primary key,
locName nvarchar(50),
)

create table DepLocation1
(
depNum int,
locNum int,
primary key(depNum, locNum),
foreign key(depNum) references tblDepartment1(depNum),
foreign key(locNum) references tblLocation1(locNum),
)