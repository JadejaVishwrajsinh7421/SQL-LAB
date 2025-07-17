--Lab 7 Perform SQL queries for Aggerate function and group by (without having)  
-- Part – A: 

use CSE_3A_127
CREATE TABLE EMP( 
EID  INT, 
EName VARCHAR(25), 
Department VARCHAR(25) ,
Salary INT ,
JOININGDATE DATE,
City VARCHAR(25) ,
GENDER VARCHAR(20));

INSERT INTO EMP VALUES
(101 ,'Rahul', 'Admin' ,56000 ,'1990-01-01', 'Rajkot' ,'MALE'),
(102 ,'Hardik', 'IT' ,18000 ,'1990-09-25', 'Ahmedabad' ,'MALE'),
(103 ,'Bhavin', 'HR' ,25000 ,'1991-05-14', 'Baroda' ,'MALE'),
(104 ,'Bhoomi', 'Admin' ,39000 ,'1991-02-08', 'Rajkot' ,'FEMALE'),
(105 ,'Rohit', 'IT' ,17000 ,'1990-07-23', 'Jamnagar' ,'MALE'),
(106 ,'Priya', 'IT' ,9000 ,'1990-10-18', 'Ahmedabad' ,'FEMALE'),
(107 ,'Bhoomi', 'HR' ,34000 ,'1991-12-25', 'Rajkot' ,'FEMALE')

SELECT *
FROM EMP

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 
SELECT MAX(SALARY) AS 'Maximum',MIN(SALARY) AS 'Minimum'
FROM EMP
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively. 
SELECT SUM(SALARY) AS 'Total_Sal',AVG(SALARY) AS 'Average_Sal'
FROM EMP

--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(EName) AS 'Total_employees'
FROM EMP

--4. Find highest salary from Rajkot city. 
SELECT MAX(SALARY) AS 'Maximum'
FROM EMP
WHERE CITY = 'Rajkot'
 
--5. Give maximum salary from IT department. 
SELECT MAX(SALARY) AS 'Maximum'
FROM EMP
WHERE Department = 'IT'

--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(ENAME) AS 'JOINING_DATE'
FROM EMP
WHERE JOININGDATE >='1991-02-08'

--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS 'Average_ADMIN'
FROM EMP
WHERE Department = 'Admin'

--8. Display total salary of HR department. 
SELECT SUM(SALARY) AS 'SUM_SALARY_HR'
FROM EMP
WHERE Department = 'HR'

--9. Count total number of cities of employee without duplication. 
SELECT COUNT( DISTINCT CITY) AS 'CITY'
FROM EMP
--10. Count unique departments. 
SELECT COUNT( DISTINCT Department) AS 'DEPT'
FROM EMP
--11. Give minimum salary of employee who belongs to Ahmedabad. 
SELECT MIN(SALARY) AS 'Minimum'
FROM EMP
WHERE CITY ='Ahmedabad'

--12. Find city wise highest salary. 
SELECT MAX(SALARY) AS 'MAX_SAL',Department
FROM EMP
GROUP BY Department
--13. Find department wise lowest salary. 
SELECT MIN(SALARY) AS 'MIN_SAL',Department
FROM EMP
GROUP BY Department

--14. Display city with the total number of employees belonging to each city. 
SELECT COUNT(ENAME) AS 'Total_employees',CITY
FROM EMP
GROUP BY CITY
--15. Give total salary of each department of EMP table. 
SELECT SUM(Salary) AS 'Total_SALARY',Department
FROM EMP
GROUP BY Department

--16. Give average salary of each department of EMP table without displaying the respective department name
SELECT AVG(Salary) AS 'Total_SALARY'
FROM EMP
GROUP BY Department
 
--17. Count the number of employees for each department in every city.
SELECT COUNT(CITY) AS 'NO_OF_EMP1_DEPT_CITY',Department
FROM EMP
GROUP BY Department

--18. Calculate the total salary distributed to male and FEMALE employees. 
SELECT SUM(Salary) AS 'GENDER_SALARY',GENDER
FROM EMP
GROUP BY GENDER

--19. Give city wise maximum and minimum salary of FEMALE employees. 
SELECT MAX(Salary) AS 'FEMALE_MAX_SALARY',MIN(Salary) AS 'FEMALE_MIN_SALARY'
FROM EMP
WHERE GENDER = 'FEMALE'

--20. Calculate department, city, and gender wise average salary. 
SELECT AVG(Salary) AS 'AVG_SAL_GEN_CITY',Department,CITY,GENDER
FROM EMP
GROUP BY Department,CITY,GENDER

--Part – B: 
--1. Count the number of employees living in Rajkot.
SELECT COUNT(EName) AS 'EMP_RAJKOT'
FROM EMP
WHERE CITY = 'Rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
SELECT MAX(SALARY) - MIN(SALARY) AS 'DIFFERENCE'
FROM EMP

--3. Display the total number of employees hired before 1st January, 1991. 
SELECT COUNT(ENAME) AS 'JOINING_DATE'
FROM EMP
WHERE JOININGDATE <'1991-01-01'

--Part – C: 
--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(EName) AS 'EMP_'
FROM EMP
WHERE CITY  IN ('Rajkot','Baroda')

--2. Display the total number of employees hired before 1st January, 1991 in IT department. 
SELECT COUNT(ENAME) AS 'JOINING_DATE'
FROM EMP
WHERE JOININGDATE < '1991-01-01' AND Department = 'IT'

--3. Find the Joining Date wise Total Salaries.
SELECT SUM(SALARY) AS 'SUM_SAL' , JOININGDATE
FROM EMP
GROUP BY JOININGDATE 

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT MAX(SALARY),department,CITY
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY department,CITY

