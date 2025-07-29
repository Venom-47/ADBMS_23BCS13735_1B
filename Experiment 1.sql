
/*
                         Organizational Hierarchy Explorer (medium)

You are a Database Engineer at TalentTree Inc., an enterprise HR analytics platform that stores employee data, including their reporting relationships. The company maintains a centralized Employee relation that holds:Each employee’s ID, name, department, and manager ID (who is also an employee in the same table).
Your task is to generate a report that maps employees to their respective managers, showing:
The employee’s name and department
Their manager’s name and department (if applicable)
This will help the HR department visualize the internal reporting hierarchy.

*/



CREATE DATABASE EXP1;

USE EXP1;

CREATE TABLE Employee(
	EmpID INT PRIMARY KEY,
	Ename VARCHAR(50),
	Department VARCHAR(50),
	ManagerID INT
	);

INSERT INTO Employee(EmpID, Ename, Department, ManagerID) values
(1,'Alice', 'HR', null),
(2,'Bob', 'Finance', 1),
(3,'Charlie', 'IT', 1),
(4,'David', 'Finance', 2),
(5,'Eve', 'IT', 3),
(6,'Frank', 'HR', 1);

Alter Table Employee 
add Constraint Fk_Employee foreign key (ManagerID)
references Employee(EmpID)

Select e1.Ename as 'Employee Name',e1.Department as 'Employee Department', e2.Ename As 'Manager name', e2.Department as 'Manager Department'
from 
Employee as e1
left outer join 
Employee as e2
on e1.ManagerID = e2.EmpID;


/*
	                         Financial Forecast Matching with Fallback Strategy (hard)

You are a Data Engineer at FinSight Corp, a company that models Net Present Value (NPV) projections for investment decisions. Your system maintains two key datasets:
Year_tbl: Actual recorded NPV’s of various financial instruments over different years:
        ID: Unique Financial instrument identifier.
        YEAR: Year of record
        NPV: Net Present Value in that year

Queries_tbl: A list of instrument-year pairs for which stakeholders are requesting NPV values:
         ID: Financial instrument identifier
         YEAR: Year of interest.

Find the NPV of each query from the Queries table. Return the output order by ID and Year in the sorted form.
However, not all ID-YEAR combinations in the Queries table are present in the Year_tbl. If an NPV is missing for a requested combination, assume it to be 0 to maintain a consistent financial report.

*/

-- Create Year_tbl (holds actual NPV values)
CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

-- Create Queries table (requested values)
CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

-- Insert data into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

-- Insert data into Queries
INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

select q.*, ISNULL(y.NPV,0) as NPV
from 
Queries as q
left outer join 
Year_tbl as y
on 
q.ID = y.ID and q.YEAR = y.YEAR

