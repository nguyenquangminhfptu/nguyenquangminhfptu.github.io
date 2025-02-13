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

INSERT INTO tblDepartment1 (depNum, depName, mqrSSN, mqrAssDate)
VALUES 
(1, N'Phòng Phần mềm trong nước', '30121050037', '2003-01-10'),
(2, N'Phòng Phần mềm nước ngoài', '30121050142', '2005-01-06'),
(3, N'Phòng Giải pháp mạng truyền thông', '30121050254', '2000-01-01'),
(4, N'Phòng Dịch vụ chăm sóc khách hàng', '30121050295', '2008-01-07'),
(5, N'Phòng Nghiên cứu và phát triển', '30121050184', '2006-01-12');

INSERT INTO tblLocation1 (locNum, locName)
VALUES 
(1, N'TP Hà Nội'),
(2, N'TP Hải Phòng'),
(3, N'TP Đà Nẵng'),
(4, N'TP Huế'),
(5, N'TP Hồ Chí Minh'),
(6, N'TP Cần Thơ');


insert into DepLocation1(depNum, locNum)
values
(1, 1), 
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 3),
(4, 5),
(5, 1),
(5, 2),
(5, 4);


INSERT INTO tblEmployee1 (empSSN, empName, emAddress, empSalary, empSex, empBoD, depNum, supervisorSSN, empStartdate)
VALUES 
('30121050001', N'Mai Duy An', N'Long An', 30000, 'F', '1968-02-17', 1, '30121050037', '2000-01-10'),
('30121050015', N'Huỳnh Mai Anh', N'TP. Hồ Chí Minh', 58000, 'F', '1963-05-04', 1, '30121050004', '2005-01-14'),
('30121050027', N'Nguyễn Thùy Quỳnh Anh', N'Nam Định', 91000, 'F', '1977-04-10', 1, '30121050004', '2005-02-15'),
('30121050037', N'Tôn Thị Lan Anh', N'Vũng Tàu', 78000, 'F', '1978-10-28', 1, '30121050037', '2004-04-25'),
('30121050038', N'Võ Việt Anh', N'Khánh Hòa', 110000, 'M', '1974-10-14', 1, '30121050037', '2006-05-30'),
('30121050049', N'Vũ Huy Hoàng Anh', N'TP. Hồ Chí Minh', 83000, 'M', '1955-06-17', 2, '30121050038', '2005-10-03'),
('30121050009', N'Tân Nguyễn Phương Bình', N'TP. Hồ Chí Minh', 78000, 'M', '1957-06-07', 2, '30121050038', '2006-12-15'),
('30121050010', N'Trần Thiên Bảo', N'TP. Hồ Chí Minh', 114000, 'M', '1957-06-02', 2, NULL, '2006-10-25'),
('30121050142', N'Nguyễn Hoàng Dũng', N'TP. Hồ Chí Minh', 114000, 'M', '1955-07-08', 3, '30121050142', '2006-12-15'),
('30121050108', N'Lê Hoàng Linh Giang', N'Huế', 59000, 'F', '1977-02-14', 3, '30121050184', '2007-05-30'),
('30121050180', N'Trần Ngọc Hạnh', N'TP. Hồ Chí Minh', 90000, 'F', '1963-07-08', 3, '30121050184', '2007-06-15'),
('30121050214', N'Nguyễn Thị Minh Hương', N'Thanh Hóa', 70000, 'F', '1980-08-02', 3, '30121050184', '2007-09-12'),
('30121050254', N'Bùi Thị Thu Hương', N'TP. Hà Nội', 117000, 'F', '1970-07-10', 4, '30121050254', '2008-06-15'),
('30121050295', N'Phạm Thị Ngọc Hảo', N'Gia Lai', 86000, 'F', '1973-04-23', 4, '30121050254', '2008-06-25'),
('30121050294', N'Hoàng Hạnh', N'TP. Đà Nẵng', 73000, 'F', '1971-06-06', 4, '30121050295', '2008-07-10'),
('30121050296', N'Nguyễn Thị Như Hồng', N'Cần Thơ', 69000, 'F', '1978-11-09', 5, '30121050295', '2008-07-15'),
('30121050305', N'Đỗ Thị Thùy Hương', N'Sông Bé', 78000, 'F', '1970-08-06', 5, '30121050295', '2008-07-20'),
('30121050306', N'Trương Thanh Tân', N'TP. Hải Phòng', 46000, 'M', '1978-12-01', 5, '30121050295', '2008-07-30'),
('30121050314', N'Nguyễn Đăng Hiếu', N'TP. Hà Nội', 46000, 'M', '1970-08-07', 5, '30121050295', '2008-09-05'),
('30121050418', N'Võ Phạm Minh Hưng', N'TP. Hồ Chí Minh', 36000, 'M', '1971-07-10', 5, '30121050295', '2008-10-02'),
('30121050982', N'Võ Hiệp Hòa', N'Đồng Nai', 95000, 'M', '1970-02-03', 3, '30121050254', '2008-11-24');


insert into tblProject1(proNum, proName, locNum, depNum)
values
(1, 'ProjectA',1, 3),
(2, 'ProjectB',1, 2),
(3, 'ProjectC',3, 2),
(4, 'ProjectD', 2, 1),
(5, 'ProjectE',5, 4);

insert into tblWorkOn(empSSN, proNum, workHours) values
('3012150027', 1, 7),
('3012150027', 2, 5),
('3012150035', 3, 7),
('3012150035', 4, 15),
('3012150037', 5, 10),
('3012150050', 2, 10),
('3012150058', 5, 10),
('3012150060', 3, 21),
('3012150062', 4, 17),
('3012150064', 2, 8),
('3012150065', 1, 12),
('3012150065', 3, 12),
('3012150065', 5, 12),
('3012150158', 3, 12),
('3012150254', 1, 40),
('3012150254', 2, 40),
('3012150254', 3, 40),
('3012150254', 4, 40),
('3012150254', 5, 40),
('3012150322', 1, 30);



INSERT INTO tblDependent1 VALUES (N'Bùi Phương Ngọc', '30121050180', 'M', '1967-03-30', N'Chồng')  
INSERT INTO tblDependent1 VALUES (N'Đoàn Minh Đạo', '30121050038', 'M', '1962-10-04', N'Chồng')
INSERT INTO tblDependent1 VALUES (N'Hà Mỹ Duyên', '30121050037', 'F', '1980-06-15', N'Vợ')  
INSERT INTO tblDependent1 VALUES (N'Hồ Đức Trung Hữu', '30121050158', 'M', '1960-04-16', N'Chồng')  
INSERT INTO tblDependent1 VALUES (N'Huỳnh Thị Ngọc Diệp', '30121050049', 'F', '1970-06-13', N'Vợ') 
INSERT INTO tblDependent1 VALUES (N'Nguyễn Thạc Hải', '30121050254', 'M', '1970-09-17', N'Chồng')
INSERT INTO tblDependent1 VALUES (N'Nguyễn Thị Minh Hà', '30121050184', 'F', '1980-03-06', N'Em') 
INSERT INTO tblDependent1 VALUES (N'Nguyễn Thị Minh Hằng', '30121050060', 'F', '1965-01-04', N'Vợ') 
INSERT INTO tblDependent1 VALUES (N'Nguyễn Thị Thu Hằng', '30121050142', 'F', '1969-03-30', N'Vợ') 
INSERT INTO tblDependent1 VALUES (N'Nguyễn Thị Thùy Dung', '30121050027', 'F', '1953-10-01', N'Mẹ') 
INSERT INTO tblDependent1 VALUES (N'Phạm Nguyên Dũng', '30121050015', 'M', '1965-04-16', N'Chồng')
INSERT INTO tblDependent1 VALUES (N'Phan Thành Đăng', '30121050035', 'M', '1970-02-24', N'Chồng')  
INSERT INTO tblDependent1 VALUES (N'Vương Thị Kim Cúc', '30121050004', 'F', '1978-03-20', N'Em')


DELETE FROM tblDependent1;  -- Xóa dữ liệu bảng phụ trước
DELETE FROM tblEmployee1;   -- Sau đó xóa bảng chính
