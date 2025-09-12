CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Salary INT,
    Marks INT
);
INSERT INTO Department VALUES
(1, 'IT'), (2, 'HR'), (3, 'Finance');

INSERT INTO Employee VALUES
(1, 'John', 1, 12000, 88),
(2, 'Alice', 2, 9000, 72),
(3, 'Bob', 1, 6000, 55),
(4, 'Sarah', 3, 15000, 95),
(5, 'David', 2, 7000, 65),
(6, 'Tom', 1, 8000, 45);

SELECT
    EmpID,
    Name,
    Marks,
    CASE
        WHEN Salary >= 12000 THEN 'platinum'
        WHEN Marks >= 8000 THEN 'gold '
        ELSE 'silver'
    END AS Class
FROM
    Employee;