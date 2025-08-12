--Lab 14 Perform SQL queries for Set operator and, Subqueries  

-- Sub Queries 
CREATE TABLE STUDENT_DATA(
ROLL INT,
NAME VARCHAR(20),
CITY VARCHAR(20),
DID INT
)

CREATE TABLE DEPARTMENT(
DID INT,
DNAME VARCHAR(20),
)
CREATE TABLE ACAD(
ROLL INT,
SPI DECIMAL(3,2),
BKLOG INT
)

INSERT INTO STUDENT_DATA VALUES
(101,'Raju','Rajkot',10),
(102,'Amit','Ahmedabad',20),
(103,'Sanjay','Baroda',40),
(104,'Neha','Rajkot',20),
(105,'Meera','Ahmedabad',30),
(106,'Mahesh','Baroda',10)

INSERT INTO DEPARTMENT VALUES
(10,'Computer'),
(20,'Electrical'),
(30,'Mechanical'),
(40,'Civil')

INSERT INTO ACAD VALUES
(101,8.8,0),
(102,9.2,2),
(103,7.6,1),
(104,8.2,4),
(105,7.0,2),
(106,8.9,3)

--Part – A: 

--1. Display details of students who are from computer department. 
SELECT * 
FROM STUDENT_DATA
WHERE DID = (
	SELECT DID
	FROM DEPARTMENT
	WHERE DNAME = 'COMPUTER')

--2. Displays name of students whose SPI is more than 8. 
SELECT NAME 
FROM STUDENT_DATA
WHERE ROLL IN (
	SELECT ROLL
	FROM ACAD
	WHERE SPI > 8)

--3. Display details of students of computer department who belongs to Rajkot city.
SELECT * 
FROM STUDENT_DATA
WHERE  CITY = 'RAJKOT' AND DID = (
	SELECT DID
	FROM DEPARTMENT
	WHERE DNAME = 'COMPUTER')

--4. Find total number of students of electrical department. 
SELECT COUNT(ROLL) AS ELEC_STU
FROM STUDENT_DATA
WHERE DID =(
	SELECT DID
	FROM DEPARTMENT
	WHERE DNAME = 'ELECTRICAL')

--5. Display name of student who is having maximum SPI. 
SELECT NAME ,ROLL
FROM STUDENT_DATA
WHERE ROLL=  (
	SELECT TOP 1 ROLL 
	FROM ACAD
	ORDER BY SPI DESC
	)

-- *******METHOD 2*************--
SELECT NAME
FROM STUDENT_DATA
WHERE ROLL = (
    SELECT ROLL
    FROM ACAD
    WHERE SPI = (
        SELECT MAX(SPI)
        FROM ACAD
    )
);

--6. Display details of students having more than 1 backlog. 
SELECT *
FROM  STUDENT_DATA
WHERE ROLL IN (
	SELECT ROLL
	FROM ACAD
	WHERE BKLOG >1
	)

--Part – B: 

--1. Display name of students who are either from computer department or from mechanical department. 
SELECT NAME
FROM STUDENT_DATA
WHERE DID IN(
	SELECT DID
	FROM DEPARTMENT
	WHERE DNAME IN('mechanical','COMPUTER'))

--2. Display name of students who are in same department as 102 studying in. SELECT NAME 
SELECT NAME 
FROM STUDENT_DATA
WHERE DID IN (
	SELECT DID
	FROM STUDENT_DATA
	WHERE ROLL  = 102)

--Part – C: 
--***************************ALL C QYUES ARE IMP*****************************--

--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
SELECT NAME 
FROM STUDENT_DATA
WHERE ROLL IN (
	SELECT ROLL
	FROM ACAD
	WHERE SPI > 9 ) 
AND DID = (
	SELECT DID 
	FROM DEPARTMENT
	WHERE DNAME = 'ELECTRICAL' 
	)

--2. Display name of student who is having second highest SPI.
--*************************HIGHEST 2ND SPI  *********************---
SELECT NAME 
FROM STUDENT_DATA
WHERE ROLL = (
	SELECT TOP 1 ROLL
	FROM ACAD
		WHERE   SPI < (
        SELECT MAX(SPI)
        FROM ACAD)
		ORDER BY ROLL DESC

)

--*************************HIGHEST 3ND SPI  *********************---
SELECT NAME 
FROM STUDENT_DATA
WHERE ROLL = (
	SELECT  TOP 1 ROLL
	FROM ACAD
		WHERE   SPI < (
        SELECT MAX(SPI)
        FROM ACAD)
)

--3. Display city names whose students SPI is 9.2 
SELECT CITY 
FROM STUDENT_DATA
WHERE ROLL IN (
	SELECT ROLL
	FROM ACAD
	WHERE SPI = 9.2)
	
--4. Find the names of students who have more than the average number of backlogs across all students. 
SELECT NAME 
FROM STUDENT_DATA
WHERE ROLL IN (
	SELECT ROLL
	FROM ACAD
	WHERE BKLOG > (
		SELECT AVG(BKLOG)
		FROM ACAD
		)
	)
--5. Display the names of students who are in the same department as the student with the highest SPI.
SELECT CITY,NAME
FROM STUDENT_DATA
WHERE CITY IN (
	SELECT DISTINCT CITY
	FROM STUDENT_DATA
	WHERE ROLL =   (
		SELECT TOP 1 ROLL
		FROM ACAD
		WHERE   SPI = (
			SELECT MAX(SPI)
			FROM ACAD
		)
	)
)

--SET Operators 

--Part – A: 

--Create below two tables as per following data.

CREATE TABLE COMPUTER (
ROLLNO INT,
NAME VARCHAR(10)
)
CREATE TABLE ELECTRICAL(
ROLLNO INT,
NAME VARCHAR(10) )

INSERT INTO COMPUTER VALUES
(101,'Ajay'),
(109,'Haresh'),
(115,'Manish');

INSERT INTO ELECTRICAL VALUES
(105,'Ajay'),
(107,'Mahesh'),
(115,'Manish');

--1. Display name of students who is either in Computer or in Electrical. 
SELECT NAME 
FROM COMPUTER
UNION
SELECT NAME
FROM ELECTRICAL

--2. Display name of students who is either in Computer or in Electrical including duplicate data. 
SELECT NAME 
FROM COMPUTER
UNION ALL
SELECT NAME
FROM ELECTRICAL

--3. Display name of students who is in both Computer and Electrical. 
SELECT NAME 
FROM COMPUTER
INTERSECT
SELECT NAME
FROM ELECTRICAL

--4. Display name of students who are in Computer but not in Electrical. 
SELECT NAME 
FROM COMPUTER
EXCEPT
SELECT NAME
FROM ELECTRICAL

--5. Display name of students who are in Electrical but not in Computer. 
SELECT NAME
FROM ELECTRICAL
EXCEPT
SELECT NAME 
FROM COMPUTER

--6. Display all the details of students who are either in Computer or in Electrical. 
SELECT *
FROM ELECTRICAL
UNION
SELECT * 
FROM COMPUTER

--7. Display all the details of students who are in both Computer and Electrical. 
SELECT *
FROM ELECTRICAL
INTERSECT
SELECT * 
FROM COMPUTER

--Part – B: 

--Create below two tables as per following data. 
CREATE TABLE EMP_DATA(
EID INT,
Name VARCHAR(10)
)
CREATE TABLE CUSTOMER(
CID INT,
Name VARCHAR(10)
)

INSERT INTO EMP_DATA VALUES
(1 ,'Ajay'),
(9,'Haresh'),
(5,'Manish')

INSERT INTO CUSTOMER VALUES
(5 ,'Ajay'),
(7,'Mahesh'),
(5,'Manish')

--1. Display name of persons who is either Employee or Customer. 
SELECT NAME 
FROM EMP_DATA
UNION
SELECT NAME
FROM CUSTOMER


--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT NAME 
FROM EMP_DATA
UNION ALL
SELECT NAME
FROM CUSTOMER

--3. Display name of persons who is both Employee as well as Customer. 
SELECT NAME 
FROM EMP_DATA
INTERSECT
SELECT NAME
FROM CUSTOMER

--4. Display name of persons who are Employee but not Customer. 
SELECT NAME 
FROM EMP_DATA
EXCEPT
SELECT NAME
FROM CUSTOMER

--5. Display name of persons who are Customer but not Employee. 
SELECT NAME
FROM CUSTOMER
EXCEPT
SELECT NAME 
FROM EMP_DATA
--Part – C:  

--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only.

 --1. Display name of persons who is either Employee or Customer. 
SELECT EID 
FROM EMP_DATA
UNION
SELECT CID
FROM CUSTOMER


--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT EID
FROM EMP_DATA
UNION ALL
SELECT CID
FROM CUSTOMER

--3. Display name of persons who is both Employee as well as Customer. 
SELECT EID 
FROM EMP_DATA
INTERSECT
SELECT CID
FROM CUSTOMER

--4. Display name of persons who are Employee but not Customer. 
SELECT EID 
FROM EMP_DATA
EXCEPT
SELECT CID
FROM CUSTOMER

--5. Display name of persons who are Customer but not Employee. 
SELECT CID
FROM CUSTOMER
EXCEPT
SELECT EID 
FROM EMP_DATA
