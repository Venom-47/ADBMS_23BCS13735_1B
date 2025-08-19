
--------------EXPERIMENT 03 (SUB-QUERIES)-----------------------------



CREATE TABLE MyEmployees (
    EmpId INT PRIMARY KEY IDENTITY(1,1),
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    City VARCHAR(50),
    Dept_id INT
);


INSERT INTO MyEmployees (EmpName, Gender, Salary, City, Dept_id)
VALUES
('Amit', 'Male', 50000, 'Delhi', 2),
('Priya', 'Female', 60000, 'Mumbai', 1),
('Rajesh', 'Male', 45000, 'Agra', 3),
('Sneha', 'Female', 55000, 'Delhi', 4),
('Anil', 'Male', 52000, 'Agra', 2),
('Sunita', 'Female', 48000, 'Mumbai', 1),
('Vijay', 'Male', 47000, 'Agra', 3),
('Ritu', 'Female', 62000, 'Mumbai', 2),
('Alok', 'Male', 51000, 'Delhi', 1),
('Neha', 'Female', 53000, 'Agra', 4),
('Simran', 'Female', 33000, 'Agra', 3);


create table dept(
	id int unique not null, 
	Dept_Name varchar(20) not null
)

insert into dept values(1, 'Accounts');
insert into dept values(2, 'HR');
insert into dept values(3, 'Admin');
insert into dept values(4, 'Counselling');


--find the second higest salary
select max(salary) 
from 
myEmployees
where salary != 
(select max(salary) from myEmployees);


-- FINDING MAXIMUM NON DUPLICATE VALUE

create table exp3(
id int
);

insert into exp3 (id) values (2),(3),(4),(4),(6),(6),(7),(8),(8);

select max(id) as maxNonDuplicate 
from exp3
where id not in 
(select id from exp3 group by id having count(id)>1);


-- RETURN ID NAME DESCRIPTION OF ALL THE PRODUCTS THAT HAVEN'T SOLD ATLEAST ONCE

CREATE TABLE Devices (
    device_id INT PRIMARY KEY,
    device_name VARCHAR(100) NOT NULL,
    descriptions VARCHAR(255)
);

INSERT INTO Devices (device_id, device_name, descriptions) VALUES
(1, 'Laptop', 'A portable computer for general use.'),
(2, 'Smartphone', 'A mobile device for communication and internet.'),
(3, 'Tablet', 'A portable touchscreen computer.'),
(4, 'Smartwatch', 'A wearable computer in the form of a watch.');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    device_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity_sold INT NOT NULL,
    FOREIGN KEY (device_id) REFERENCES Devices(device_id)
);

INSERT INTO Products (product_id, device_id, unit_price, quantity_sold) VALUES
(101, 1, 1200.00, 50),
(102, 2, 800.00, 150),
(103, 1, 1500.00, 30),
(104, 3, 650.00, 0),
(105, 4, 300.00, 200),
(106, 2, 950.00, 0);

select p.product_id, p.unit_price from products as p
where quantity_sold=0

