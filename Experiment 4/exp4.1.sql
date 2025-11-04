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

BEGIN
$$
    IF employee_marks >= 85 THEN
        RETURN 'Distinction';
    ELSIF employee_marks >= 70 THEN
        RETURN 'First Class';
    ELSIF employee_marks >= 50 THEN
        RETURN 'Second Class';
    ELSE
        RETURN 'Fail';
    END IF;
END;
$$