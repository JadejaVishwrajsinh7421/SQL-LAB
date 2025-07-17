--Alter, Rename Operation 
-- lab 5
USE CSE_3A_127;
--Part – A: 
--Use Deposit table of lab-1. 
 
--DEPOSIT 
--Column_Name DataType 
--ACTNO INT 
--CNAME VARCHAR(50) 
--BNAME VARCHAR(50) 
--AMOUNT DECIMAL(8,2) 
--ADATE DATETIME 
 
--From the above given tables perform the following queries (ALTER, RENAME Operation): 
--1. Add two more columns City VARCHAR (20) and Pincode INT. 
	ALTER TABLE DEPOSITE
	ADD  CITY VARCHAR(20), PINCODE INT ;

	SELECT *
	FROM DEPOSITE

--2. Add column state VARCHAR(20). 
	ALTER TABLE DEPOSITE
	ADD STATE VARCHAR(20)

	SELECT *
	FROM DEPOSITE

--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
	ALTER TABLE DEPOSITE
	ALTER  COLUMN CNAME VARCHAR (35)

	SELECT *
	FROM DEPOSITE

--4. Change the data type DECIMAL to INT in amount Column. 
	ALTER TABLE DEPOSITE
	ALTER  COLUMN AMOUNT INT 

	SELECT *
	FROM DEPOSITE

--5. Delete Column City from the DEPOSIT table. 
	ALTER TABLE DEPOSITE
	DROP COLUMN CITY

	SELECT *
	FROM DEPOSITE

--6. Rename Column ActNo to ANO. 
	SP_RENAME 'DEPOSITE.ACTNO','ANO'

	SELECT *
	FROM DEPOSITE
--7. Change name of table DEPOSIT to DEPOSITDETAIL
	SP_RENAME 'DEPOSITE','DEPOSITDETAIL'

	SELECT *
	FROM DEPOSITDETAIL
. 
--Part – B: 
--1. Rename Column ADATE to AOPENDATE OF DEPOSITDETAIL table. 
	SP_RENAME 'DEPOSITDETAIL.ADATE','AOPENDATE'

	SELECT *
	FROM DEPOSITDETAIL

--2. Delete Column AOPENDATE from the DEPOSITDETAIL table. 
	ALTER TABLE  DEPOSITDETAIL
	DROP COLUMN   AOPENDATE 

	SELECT *
	FROM DEPOSITDETAIL

--3. Rename Column CNAME to CustomerName.
	SP_RENAME 'DEPOSITDETAIL.CNAME' , 'CustomerName.'

	SELECT *
	FROM DEPOSITDETAIL

--4. Add Column country.
	ALTER TABLE DEPOSITDETAIL
	ADD COUNTRY VARCHAR(30)

	SELECT *
	FROM DEPOSITDETAIL

--Part – C: 

--Create following table using query according to the definition. 
--STUDENTDETAIL 
--Column_Name DataType 
--Enrollment_No VARCHAR(20) 
--Name VARCHAR(25) 
--CPI DECIMAL(5,2) 
--Birthdate DATETIME 

CREATE TABLE STUDENTDETAIL (
Enrollment_No VARCHAR(20),
Name VARCHAR(25) ,
CPI DECIMAL(5,2) ,
Birthdate DATETIME);

SELECT *
FROM STUDENTDETAIL

--From the above given tables perform the following queries (ALTER, RENAME Operation): 
--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null). 
	ALTER TABLE STUDENTDETAIL
	ADD City VARCHAR (20) NOT NULL,Backlog INT NULL

	SELECT *
	FROM STUDENTDETAIL

--2. Add column department VARCHAR (20) Not Null.
	ALTER TABLE STUDENTDETAIL
	ADD DEPARTMENT  VARCHAR(20)

	SELECT *
	FROM STUDENTDETAIL

--3. Change the size of NAME column of studentDETAIL from VARCHAR (25) to VARCHAR (35). 
	ALTER TABLE STUDENTDETAIL
	ALTER  COLUMN NAME VARCHAR(35)

	SELECT *
	FROM STUDENTDETAIL

--4. Change the data type DECIMAL to INT in CPI Column. 
	ALTER TABLE STUDENTDETAIL
	ALTER  COLUMN CPI INT

	SELECT *
	FROM STUDENTDETAIL

--5. Delete Column City from the studentDETAIL table.
	ALTER TABLE STUDENTDETAIL
	DROP COLUMN City

	SELECT *
	FROM STUDENTDETAIL
--6. Rename Column Enrollment_No to ENO. 
	SP_RENAME 'STUDENTDETAIL.Enrollment_No ' ,'ENO'

	SELECT *
	FROM STUDENTDETAIL

--7. Change name of table studentDETAIL to STUDENT_MASTER.
	SP_RENAME 'STUDENTDETAIL','STUDENTMASTER'
		
	SELECT *
	FROM STUDENTMASTER


--	DELETE, Truncate, Drop Operation 
--Part – A: 


 
--DEPOSIT_DETAIL 
--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.  
DELETE FROM DEPOSIT_DETAIL
WHERE AMOUNT<=4000

SELECT *
FROM DEPOSIT_DETAIL

--2. Delete all the accounts CHANDI BRANCH. 
DELETE FROM DEPOSIT_DETAIL
WHERE BNAME='CHANDI'

SELECT *
FROM DEPOSIT_DETAIL

--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105. 
DELETE FROM DEPOSIT_DETAIL
WHERE ANO BETWEEN 102 AND 105

SELECT *
FROM DEPOSIT_DETAIL

--4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’ 
DELETE FROM DEPOSIT_DETAIL
WHERE BNAME IN ('AJNI','POWAI')

SELECT *
FROM DEPOSIT_DETAIL

--5. Delete all the accounts whose account number is NULL.
DELETE FROM DEPOSIT_DETAIL
WHERE ANO IS NULL 

SELECT *
FROM DEPOSIT_DETAIL

--6. Delete all the remaining records using Delete command. 
DELETE FROM DEPOSIT_DETAIL 

SELECT *
FROM DEPOSIT_DETAIL

--7. Delete all the records of Deposit_Detail table. (Use Truncate) 
TRUNCATE TABLE  DEPOSIT_DETAIL

SELECT *
FROM DEPOSIT_DETAIL

--8. Remove Deposit_Detail table. (Use Drop) 
 DROP TABLE DEPOSIT_DETAIL


--Part – B: 
--Create following table using query according to the definition
CREATE TABLE EMPLOYEE_MASTER (
EmpNo INT ,
EmpName VARCHAR(25) ,
JoiningDate DATETIME ,
Salary DECIMAL (8,2),
City VARCHAR(20) );

INSERT INTO EMPLOYEE_MASTER VALUES
(101, 'Keyur', '2002-01-05', 12000.00 , 'Rajkot'),
(102, 'Hardik', '2004-02-15', 14000.00 , 'Ahmedabad'),
(103, 'Kajal', '2006-03-14', 15000.00 , 'Baroda'),
(104, 'Bhoomi', '2005-06-23', 12500.00 , 'Ahmedabad'),
(105, 'Harmit', '2004-02-15', 14000.00  , 'Rajkot'),
(106, 'Mitesh', '2001-09-25', 5000.00 , 'Jamnagar'),
(107, 'Meera', NULL, 7000.00, 'Morbi'),
(108, 'Kishan', '2003-02-06', 10000.00 , NULL);

SELECT *
FROM EMPLOYEE_MASTER ;


--From the above given tables perform the following queries (DELETE Operation): 
--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.  
DELETE FROM EMPLOYEE_MASTER
WHERE Salary >= 14000

SELECT *
FROM EMPLOYEE_MASTER ;

--2. Delete all the Employees who belongs to ‘RAJKOT’ city. 
DELETE FROM EMPLOYEE_MASTER
WHERE CITY ='RAJKOT'

SELECT *
FROM EMPLOYEE_MASTER ;

--3. Delete all the Employees who joined after 1-1-2007. 
DELETE FROM EMPLOYEE_MASTER
WHERE JoiningDate > '2007-01-01'

SELECT *
FROM EMPLOYEE_MASTER ;

--4. Delete the records of Employees whose joining date is null and Name is not null.
DELETE FROM EMPLOYEE_MASTER
WHERE (JoiningDate IS NULL) AND   (EMPNAME IS NOT NULL)

SELECT *
FROM EMPLOYEE_MASTER ;

--5. Delete the records of Employees whose salary is 50% of 20000. 
DELETE FROM EMPLOYEE_MASTER
WHERE Salary  = 1000;

SELECT *
FROM EMPLOYEE_MASTER ;

--6. Delete the records of Employees whose City Name is not empty.
DELETE FROM EMPLOYEE_MASTER
WHERE CITY IS NOT NULL

SELECT *
FROM EMPLOYEE_MASTER ;
--7. Delete all the records of Employee_MASTER table. (Use Truncate) 
TRUNCATE TABLE  EMPLOYEE_MASTER

SELECT *
FROM EMPLOYEE_MASTER ;
--8. Remove Employee_MASTER table. (Use Drop) 
DROP TABLE Employee_MASTER

SELECT *
FROM EMPLOYEE_MASTER ;


