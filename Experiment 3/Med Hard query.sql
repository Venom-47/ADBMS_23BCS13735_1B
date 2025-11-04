
create database Subquery;
use Subquery;

CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4,'SAM',60000,2),
(4,'MAX',90000,1);


SELECT d.dept_name,e.name,e.salary
FROM
employee as e
INNER JOIN
department as d
on
e.department_id = d.id

Where e.salary in 
(
    select max(salary)
    from
    employee as e2
    where 
    e2.department_id = e.department_id
)
order by e.salary Desc





create table a (
empid int,
ename varchar(50),
salary int
);

create table b (
empid int,
ename varchar(50),
salary int
);

insert into a (empid,ename,salary) values
(1,'aa',1000),
(2,'bb',300);

insert into b(empid,ename,salary) values
(2,'bb',400),
(3,'cc',100);

select empid,ename,Min(salary)
from
(select * from
a
union all
select * from
b) as result

group by empid,ename






