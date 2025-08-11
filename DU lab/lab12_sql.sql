USE CSE_3A_127
--LAB11 Implement SQL Joins  

--Part – A: 
--1. Combine information from Person and Department table using cross join or Cartesian product. 
SELECT *
FROM PERSON1
CROSS JOIN Dept1
--2. Find all persons with their department name 
 SELECT PERSON1.PersonName,Dept1.DepartmentName
 FROM PERSON1
 JOIN Dept1
 ON DEPT1.DepartmentID= PERSON1.DepartmentID

--3. Find all persons with their department name & code. 
 SELECT PERSON1.PersonName,Dept1.DepartmentName,DepartmentCode
 FROM PERSON1
 JOIN Dept1
 ON DEPT1.DepartmentID= PERSON1.DepartmentID

--4. Find all persons with their department code and location. 
 SELECT PERSON1.PersonName,DepartmentCode,Location
 FROM PERSON1
 JOIN Dept1
 ON DEPT1.DepartmentID= PERSON1.DepartmentID

--5. Find the detail of the person who belongs to Mechanical department. 
 SELECT *
 FROM PERSON1
 JOIN Dept1
 ON DEPT1.DepartmentID= PERSON1.DepartmentID
 WHERE DEPT1.DepartmentCode='ME'

--6. Final person’s name, department code and salary who lives in Ahmedabad city.  
SELECT PERSONNAME,Dept1.DepartmentCode,SALARY
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
WHERE CITY='Ahmedabad'

--7. Find the person's name whose department is in C-Block. 
 SELECT PERSONNAME
 FROM PERSON1
 JOIN Dept1
 ON DEPT1.DepartmentID= PERSON1.DepartmentID
 WHERE DEPT1.Location ='C-Block'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT PERSONNAME,Dept1.DepartmentName,SALARY
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
WHERE CITY ='Jamnagar'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
SELECT *
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
WHERE DepartmentName='CIVIL' AND  JOININGDATE >'2001-08-01'

--10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days. 
SELECT PERSONNAME,JOININGDATE
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
WHERE DATEDIFF(DAY,JOININGDATE,GETDATE()) > 365

--11. Find department wise person counts. 
SELECT COUNT(PERSONID),Dept1.DepartmentName
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
GROUP BY DepartmentName

--12. Give department wise maximum & minimum salary with department name. 
SELECT MIN(SALARY) AS MINMUM,MAX(SALARY) AS MAXIMUM,Dept1.DepartmentName
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
GROUP BY DepartmentName

--13. Find city wise total, average, maximum and minimum salary. 
SELECT MIN(SALARY) AS MINMUM,MAX(SALARY) AS MAXIMUM,AVG(SALARY) AS AVERG,SUM(SALARY) AS TOTAL,CITY
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
GROUP BY CITY

--14. Find the average salary of a person who belongs to Ahmedabad city. 
SELECT AVG(SALARY) AS AHEM
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
WHERE CITY = 'Ahmedabad'

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column) 
SELECT PERSONNAME+ ' lives in ' + CITY + ' and works in ' +Dept1.DepartmentName+' Department. '
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID

--Part – B: 

--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column) 
SELECT PERSONNAME+ ' earns ' + CAST(SALARY AS VARCHAR) + ' FROM ' +Dept1.DepartmentName+' Department monthly.'
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID

--2. Find city & department wise total, average & maximum salaries. 
SELECT CITY,DepartmentName,SUM(SALARY) AS TOTAL,AVG(SALARY) AS AVER,MAX(SALARY) AS MAXIMUM
FROM PERSON1
JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
GROUP BY CITY,DepartmentName
--3. Find all persons who do not belong to any department. 
SELECT PERSONNAME
FROM PERSON1
FULL JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
WHERE Dept1.DepartmentID IS NULL

--4. Find all departments whose total salary is exceeding 100000. 
SELECT  Dept1.DepartmentName,SUM(SALARY)
FROM PERSON1
FULL JOIN Dept1
ON DEPT1.DepartmentID= PERSON1.DepartmentID
GROUP BY DepartmentName
HAVING SUM(SALARY) > 100000