USE CSE_3A_127

--Lab 10 Implement SQL View 

-- Part – A: Views 
 
 CREATE TABLE STUDENT_INFO(
  RNo INT,
  Name VARCHAR(10),
  Branch  VARCHAR(3),
  SPI DECIMAL(4,2),
  Bklog  INT )

  INSERT INTO STUDENT_INFO VALUES
  (101,'Raju','CE',8.80,0),
  (102,'Amit','CE',2.20,3),
  (103,'Sanjay','ME',1.50,6),
  (104,'Neha','EC',7.65,1),
  (105,'Meera','EE',5.52,2),
  (106,'Mahesh','EC',4.50,3)

  SELECT *
  FROM STUDENT_INFO

--1. Create a view Personal with all columns. 
CREATE VIEW  VM_PERSONAL
AS
SELECT *
FROM STUDENT_INFO

SELECT * 
FROM VM_PERSONAL

--2. Create a view Student_Details having columns Name, Branch & SPI.
CREATE VIEW  VM_STUDENTDETAIL
AS
SELECT NAME,BRANCH,SPI
FROM STUDENT_INFO

SELECT * 
FROM VM_STUDENTDETAIL

--3. Create a view AcademicData having columns RNo, Name, Branch. 
CREATE VIEW VM_ACDDATA
AS
SELECT RNO,NAME,BRANCH
FROM STUDENT_INFO

SELECT *
FROM VM_ACDDATA

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2. 
CREATE VIEW VM_BKLOG
AS
SELECT *
FROM STUDENT_INFO
WHERE Bklog >2

SELECT *
FROM VM_BKLOG

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters. 
CREATE VIEW VM_PAT
AS 
SELECT RNO,NAME,BRANCH
FROM STUDENT_INFO
WHERE NAME LIKE '____'

SELECT *
FROM VM_PAT

--6. Insert a new record to AcademicData view. (107, Meet, ME) 
INSERT INTO STUDENT_INFO VALUES (108,'MISHA','CE',7.20,1)

INSERT INTO VM_ACDDATA VALUES (107,'HEET','CE',)
SELECT *
FROM VM_ACDDATA


--7. Update the branch of Amit from CE to ME in Student_Details view. 
UPDATE VM_STUDENTDETAIL
SET BRANCH ='ME'
WHERE NAME ='AMIT'

SELECT *
FROM VM_STUDENTDETAIL

SELECT *
FROM STU_INFO ---- NOT CHANGE IN PARENT TABLE ONLT IN VIEW TABLE SAME RESULT HAPPEN IN UPDATE DELETE OPTERATIONS----

--8. Delete a student whose roll number is 104 from AcademicData view. 
DELETE FROM VM_ACDDATA
WHERE RNO =104

SELECT *
FROM VM_ACDDATA

--9. Create view for the student whose name starts with M and ends with a, having SPI more than 6 and backlog less than 2. 
CREATE VIEW VM_NAME
AS 
SELECT *
FROM STUDENT_INFO
WHERE NAME LIKE 'M%a'AND SPI > 6 AND Bklog<2

DROP VIEW VM_NAME

SELECT *
FROM VM_NAME

--10. Create the view for the students whose name contains vowel.
CREATE VIEW VM_VOWEL
AS 
SELECT *
FROM STUDENT_INFO
WHERE NAME LIKE '%[A,E,I,O,U]%'

SELECT *
FROM VM_VOWEL

--Part – B: 

--1. Create a view that displays information of all students whose SPI is above 8.5 
CREATE VIEW VM_SPI
AS
SELECT *
FROM STUDENT_INFO
WHERE SPI >8.5

SELECT *
FROM VM_SPI

--2. Create a view that displays 0 backlog students. 
CREATE VIEW VM_BG
AS
SELECT *
FROM STUDENT_INFO
WHERE Bklog =0

SELECT *
FROM VM_BG

--3. Create a view Computerview that displays CE branch data only. 

CREATE VIEW VM_CE
AS
SELECT *
FROM STUDENT_INFO
WHERE BRANCH ='CE'

SELECT *
FROM VM_CE
--Part – C: 

--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC. 
CREATE VIEW Result_EC
AS 
SELECT NAME, SPI
FROM STUDENT_INFO
WHERE SPI<5 AND BRANCH = 'EC'

SELECT *
FROM Result_EC

--2. Update the result of student MAHESH to 4.90 in Result_EC view. 
UPDATE Result_EC
SET SPI = 4.90
WHERE NAME = 'MAHESH'

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5. 
CREATE VIEW Result_VG
AS
SELECT RNO,NAME,BKLOG
FROM STUDENT_INFO
WHERE NAME LIKE 'M%' AND Bklog >5

SELECT *
FROM Result_VG

--4. Drop Computerview form the database.
DROP VIEW Result_EC

