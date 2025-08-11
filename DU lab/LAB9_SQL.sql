USE CSE_3A_127
--lAB 9 SOL Implement SQL In-built functions (Math, String, and Date Functions)
--Math functions 
--Part – A: 
--1. Display the result of 5 multiply by 30. 
SELECT (5*30)

--2. Find out the absolute value of -25, 25, -50 and 50. 
SELECT ABS(-25),ABS(25),ABS(-50),ABS(50)

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 
SELECT CEILING(25.2),CEILING(25.7),CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
SELECT FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
SELECT (5%2),(5%3)

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
SELECT POWER(3,2),POWER(4,3)

--7. Find out the square root of 25, 30 and 50. 
SELECT SQRT(25),SQRT(30),SQRT(50)

--8. Find out the square of 5, 15, and 25. 
SELECT SQUARE(5),SQUARE(15),SQUARE(25)

--9. Find out the value of PI. 
SELECT PI()

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points. 
SELECT ROUND(157.732,2),ROUND(157.732,0),ROUND(157.732,-2)

--11. Find out exponential value of 2 and 3. 
SELECT EXP(2),EXP(3)

--12. Find out logarithm having base e of 10 and 2. 
SELECT LOG (10),LOG(2)

--13. Find out logarithm having base b having value 10 of 5 and 100. 
SELECT LOG (5,10),LOG(100,10)

--14. Find sine, cosine and tangent of 3.1415. 
SELECT SIN(PI()),COS(PI()),TAN(PI())

--15. Find sign of -25, 0 and 25. 
SELECT SIGN(-25),SIGN(0),SIGN(25)

--16. Generate random number using function.
SELECT RAND()

--Part – B: 
--Create and insert the following records in the EMP_MASTER table. 
CREATE TABLE EMP_MASTER(
EmpNo INT ,
EmpName VARCHAR(20),
JoiningDate DATE ,
Salary DECIMAL(7,2) ,
Commission INT, 
City VARCHAR(20),
DeptCode  VARCHAR(5)
)

INSERT INTO EMP_MASTER VALUES
(101 , 'Keyur' , '2002-5-30' , 12000.00 , 4500 , 'Rajkot' , '3@g' ),
(102 , 'Hardik' , '2004-2-15' , 14000.00 , 2500 , 'Ahmedabad' , '3@'),
(103 , 'Kajal' , '2006-3-14' , 15000.00 , 3000 , 'Baroda' , '3-GD'),
(104 , 'Bhoomi' , '2005-6-23' , 12500.00 , 1000 , 'Ahmedabad' , '1A3D'),
(105 , 'Harmit' , '2004-2-15' , 14000.00 , 2000 , 'Rajkot' , '312A');

SELECT *
FROM EMP_MASTER
--DROP TABLE EMP_MASTER

--1. Display the result of Salary plus Commission.
SELECT SALARY+COMMISSION 
FROM EMP_MASTER

--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2),CEILING(35.7),CEILING(-55.2)

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT FLOOR(55.2), FLOOR(35.7), FLOOR(-55.2)

--4. Find out remainder of 55 divided by 2 and 55 divided by 3. 
SELECT (55%2) , (55%3)

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power. 
SELECT POWER(23,2) ,POWER (14,3)

--Part – C: 
--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000. 
SELECT SALARY+COMMISSION 
FROM EMP_MASTER
WHERE  SALARY+COMMISSION >15000

--2. Find the details of employees whose commission is more than 25% of their salary. 
SELECT * 
FROM EMP_MASTER
WHERE COMMISSION > SALARY*0.25

--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater than 15000. 
SELECT * 
FROM EMP_MASTER
WHERE JOININGDATE < '2005-01-01' AND (SALARY+COMMISSION) >15000

--4. Find employees whose total earnings (Salary + Commission) are at least double their salary. 
SELECT *
FROM EMP_MASTER 
WHERE (SALARY+COMMISSION) >2*SALARY

--String functions 
--Part – A: 
--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
SELECT LEN(NULL),LEN('   hello     '),LEN(Blank)

--2. Display your name in lower & upper case. 
SELECT LOWER('VISHWRAJ'),UPPER('jadeja')

--3. Display first three characters of your name. 
SELECT LEFT('VISHWRAJ',3)

--4. Display 3rd to 10th character of your name. 
SELECT SUBSTRING('VISHWRAJSINHJADEJA',3,7)

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 
SELECT REPLACE('abc123efg','123','XYZ'), REPLACE('abcabcabc','C','5')

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII('0'),ASCII('9')

--7. Write a query to display character based on number 97, 65,122,90,48,57. 
SELECT CHAR(97),CHAR(65),CHAR(122),CHAR(90),CHAR(48),CHAR(57)

--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
SELECT LTRIM('               hello world  ')

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘. 
SELECT RTRIM(' hello world  ')

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
SELECT SUBSTRING('SQL Server',1,4) , RIGHT('SQL Server',5)

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
SELECT CONVERT(NUMERIC ,'1234.54556' ) ,CAST(1234.56 AS NUMERIC)
--12. Write a query to convert a float 10.58 to integer (Use cast and convert function). 
SELECT CAST(10.58 AS INT ),CONVERT(10.58  AS INT)
--13. Put 10 space before your name using function. 
SELECT SPACE(10)+'VISHWRAJSINH'

--14. Combine two strings using + sign as well as CONCAT (). 
SELECT 'VISHWRAJSINH'+'JADEJA',CONCAT_WS('_','VISHWRAJSINH','JADEJA')

--15. Find reverse of “Darshan”. 
SELECT REVERSE('Darshan')

--16. Repeat your name 3 times. 
SELECT REPLICATE('JADEJA',3)

--Part – B: Perform following queries on EMP_MASTER table. 

--1. Find the length of EMP Name and City columns.
SELECT LEN(EmpName) AS EMP_NAME_LEN ,LEN(CITY) AS CITY_LEN
FROM EMP_MASTER

--2. Display EMP Name and City columns in lower & upper case. 
SELECT LOWER(EMPNAME) AS EMP_NAME_LOWER ,UPPER(EMPNAME) AS EMP_NAME_LOWER
FROM EMP_MASTER

--3. Display first three characters of EMP Name column. 
SELECT SUBSTRING(EMPNAME,1,3)
FROM EMP_MASTER

--4. Display 3rd to 10th character of city column. 
SELECT SUBSTRING(City,3,7)
FROM EMP_MASTER

--5. Write a query to display first 4 & Last 5 characters of EMP Name column. 
SELECT LEFT(EmpName,4),RIGHT(EmpName,5)
FROM EMP_MASTER

--Part – C: Perform following queries on EMP_MASTER table. 

--1. Put 10 space before EMP Name using function. 

--2. Combine EMP Name and city columns using + sign as well as CONCAT (). 
SELECT EMPNAME +CITY 
FROM EMP_MASTER

SELECT CONCAT_WS(' ',EmpName,CITY)
FROM EMP_MASTER

--3. Combine all columns using + sign as well as CONCAT (). 
SELECT CONCAT_WS(' ',EMPNO,EmpName,JOININGDATE,CITY,Salary,Commission,DeptCode)
FROM EMP_MASTER

SELECT CONVERT(CHAR,EMPNO)+EMPNAME+CONVERT(CHAR,JOININGDATE)+CITY+CONVERT(CHAR,Salary)+CONVERT(CHAR,Commission)+DeptCode
FROM EMP_MASTER

--4. Combine the result as < EMP Name > Lives in <City>. 
SELECT EMPNAME+' '+'LIVES IN'+' '+CITY 
FROM EMP_MASTER

--5. Combine the result as ‘EMP no of < EMP Name> is <EmpNo> . 
SELECT EMPNAME+' '+'IS'+' '+CONVERT(CHAR,EMPNO) 
FROM EMP_MASTER

--6. Retrieve the names of all employee where the third character of the Name is a vowel. 
SELECT EMPNAME
FROM EMP_MASTER
WHERE EMPNAME LIKE '__[A,E,I,O,U]%'

--7. Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that starts with 'R'. 
SELECT EMPNAME+CITY 
FROM EMP_MASTER
WHERE EMPNAME LIKE '%r'AND CITY LIKE 'R%'

--Date Functions 
--Part – A: 

--1. Write a query to display the current date & time. Label the column Today_Date. 
SELECT GETDATE()

--2. Write a query to find new date after 365 day with reference to today. 
SELECT GETDATE()+365

--3. Display the current date in a format that appears as may 5 1994 12:00AM. 
SELECT LOWER(DATENAME(month, GETDATE())) + ' ' + 
       CAST(DAY(GETDATE()) AS VARCHAR) + ' ' + 
       CAST(YEAR(GETDATE()) AS VARCHAR) + ' ' + 
       RIGHT(CONVERT(VARCHAR, GETDATE(), 100), 7) AS FormattedDate

--4. Display the current date in a format that appears as 03 Jan 1995. 
SELECT CAST (DAY(GETDATE())AS VARCHAR)+' ' +SUBSTRING(DATENAME(month, GETDATE()),1,3)+' '+ CAST(YEAR(GETDATE()) AS VARCHAR) 

--5. Display the current date in a format that appears as Jan 04, 96. 
SELECT CAST (DAY(GETDATE())AS VARCHAR)+' ' +SUBSTRING(DATENAME(month, GETDATE()),1,3)+','+ CAST((DATEPART(YY,GETDATE())) AS VARCHAR)

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 
SELECT DATEDIFF(MONTH,' 31-Dec-08 ','31-Mar-09')

--7. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
SELECT DATEDIFF(HOUR,' 25-Jan-12 7:00 ','26-Jan-12 10:30')

--8. Write a query to extract Day, Month, Year from given date 12-May-16. 
SELECT CAST (DAY('12-May-16')AS VARCHAR)++' '+ CAST (MONTH('12-May-16')AS VARCHAR)+' '+CAST (YEAR('12-May-16')AS VARCHAR)

--9. Write a query that adds 5 years to current date. 
SELECT DATEADD(YY,5,GETDATE())

--10. Write a query to subtract 2 months from current date. 
SELECT DATEADD(MONTH,-2,GETDATE())

--11. Extract month from current date using datename () and datepart () function. 
SELECT DATEPART(MONTH,GETDATE())

SELECT DATENAME(MONTH,GETDATE())

--12. Write a query to find out last date of current month. 
SELECT EOMONTH(GETDATE())

--13. Calculate your age in years and months. 
SELECT DATEDIFF(MONTH,'4-12-2006',GETDATE())
SELECT DATEDIFF(YEAR,'4-12-2006',GETDATE())

--Part – B: Perform following queries on EMP_MASTER table.  

--1. Write a query to find new date after 365 days with reference to JoiningDate. 
SELECT DATEADD(DAY,365,JOININGDATE)
FROM EMP_MASTER

--2. Write a query to find out total number of months between JoiningDate and 31-Mar-09. 
SELECT DATEDIFF(MONTH,JOININGDATE,'31-MAR-2009')
FROM EMP_MASTER

--3. Write a query to find out total number of years between JoiningDate and 14-Sep-10. 
SELECT DATEDIFF(YEAR,JOININGDATE,'14-Sep-10 ')
FROM EMP_MASTER


--Part – C: Perform following queries on EMP_MASTER table. 

--1. Write a query to extract Day, Month, Year from JoiningDate. 
SELECT CAST(DATEPART(DAY,JOININGDATE) AS VARCHAR)+' '+
 CAST(DATEPART(MONTH,JOININGDATE)AS VARCHAR)+' '+
CAST(DATEPART(YEAR,JOININGDATE)AS VARCHAR) AS RESULT
FROM EMP_MASTER

--2. Write a query that adds 5 years to JoiningDate. 
SELECT DATEADD(YY,5,JOININGDATE)
FROM EMP_MASTER

----3. Write a query to subtract 2 months from JoiningDate. 
SELECT  DATEADD(MONTH,-2,JoiningDate)
FROM EMP_MASTER

--4. Extract month from JoiningDate using datename () and datepart () function. 
SELECT DATENAME(MONTH,JOININGDATE)
FROM EMP_MASTER

SELECT DATEPART(MONTH,JOININGDATE)
FROM EMP_MASTER

--5. Select employee who joined between the 1st and 15th of any month in any year. 
SELECT EMPNAME,JoiningDate
FROM EMP_MASTER
WHERE  DATEPART(DAY,JoiningDate) IN (1,15)

--6. Find employee whose JoiningDate is the last day of any month. 
SELECT EMPNAME ,JOININGDATE
FROM EMP_MASTER
WHERE JoiningDate = EOMONTH(JoiningDate)

--7. List employee whose JoiningDate is during a leap year. 
--MOST CONFUSUSING QUERY 
SELECT EMPNAME,JOININGDATE
FROM EMP_MASTER
WHERE ISDATE(CONCAT(YEAR(JOININGDATE),'-02-29'))=1

