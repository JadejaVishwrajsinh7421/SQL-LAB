--Lab 6Perform SQL queries for Like operator 
-- Part – A: 
--Create following table using query according to the definition. 
USE CSE_3A_127
CREATE TABLE STUDENT( 
StuID INT, 
FirstName VARCHAR(25), 
LastName VARCHAR(25) ,
Website VARCHAR(50) ,
City VARCHAR(25) ,
Address VARCHAR(100));

INSERT INTO STUDENT VALUES
(1011,'Keyur ','Patel','Techonthenet.com ','Rajkot','A-303 ''‘Vasant Kunj’'', Rajkot'),
(1022,'Hardik','Shah','digminecraft.com ','Ahmedabad','"Ram Krupa", Raiya Road '),
(1033,'Kajal','Trivedi','bigactivities.com ','Baroda','Raj bhavan plot, near garden'),
(1044,'Bhoomi','Gajera','checkyourmath.com ','Ahmedabad','“Jig''s Home”, Narol  '),
(1055,'Harmit','Mitel','@me.darshan.com ','Rajkot','B-55, Raj Residency '),
(1066,'Ashok','Jani',NULL,'Baroda','A502, Club House Building');

SELECT * 
FROM STUDENT
DROP TABLE STUDENT 

--From the above given tables perform the following queries (LIKE Operation): 


--1. Display the name of students whose name starts with ‘k’. 
SELECT FirstName
FROM STUDENT
WHERE FirstName like 'k%'

--2. Display the name of students whose name consists of five characters. 
SELECT FirstName
FROM STUDENT
WHERE FirstName like '_____'

--3. Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters. 
SELECT FIRSTNAME,LASTNAME
FROM STUDENT
WHERE City like '_____A' 

--4. Display all the students whose last name ends with ‘tel’.
SELECT LASTNAME
FROM STUDENT
WHERE LASTNAME LIKE '%tel'


--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’. 
SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'HA%T'

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’. 
SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'K_Y%'

--7. Display the name of students having no website and name consists of five characters. 
SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '_____' AND Website IS NULL  

--8. Display all the students whose last name consist of ‘jer’.
SELECT LASTNAME
FROM STUDENT
WHERE LASTNAME LIKE '%jer%'

--9. Display all the students whose city name starts with either ‘r’ or ‘b’. 
SELECT FIRSTNAME ,CITY 
FROM STUDENT 
WHERE CITY LIKE 'R%' OR CITY LIKE 'B%'


--10. Display all the name students having websites. 
SELECT *
FROM STUDENT 
WHERE WEBSITE IS NOT NULL

--11. Display all the students whose name starts from alphabet A to H. 
SELECT *
FROM STUDENT 
WHERE FIRSTNAME LIKE  '[A-H]%'

--12. Display all the students whose name’s second character is vowel. 
SELECT *
FROM STUDENT 
WHERE LASTNAME LIKE '_[A,E,I,O,U]%'

--13. Display the name of students having no website and name consists of minimum five characters. 
SELECT *
FROM STUDENT
WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____%'

--14. Display all the students whose last name starts with ‘Pat’.   
SELECT *
FROM STUDENT 
WHERE  LASTNAME LIKE 'PAT%'

--15. Display all the students whose city name does not starts with ‘b’. 
SELECT *
FROM STUDENT 
WHERE CITY NOT LIKE'B%'

.--16. Display all the students whose student ID ends with digit. 
SELECT *
FROM STUDENT
WHERE STUID LIKE '%[0-9]'

--17. Display all the students whose address does not contain any digit.
SELECT *
FROM STUDENT
WHERE Address NOT LIKE '%[0-9]%'

--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either 
--'math' or 'science'. Ensure that their city does not start with 'B'. 
SELECT *
FROM STUDENT 
WHERE  FIRSTNAME LIKE 'B%' AND LASTNAME LIKE '%A' AND WEBSITE LIKE '%[MATH,SCIENCE]%' AND CITY NOT LIKE 'B%'

--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their 
--website should be either null or contain 'com'. 
SELECT *
FROM STUDENT 
WHERE LASTNAME = 'SHAH' AND CITY LIKE '%D' AND WEBSITE LIKE '%[NULL,COM]'

--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must 
--have a website containing '.com'. 
SELECT *
FROM STUDENT
WHERE FIRSTNAME LIKE '[A,E,I,O,U][a,e,i,o,u]%' AND CITY LIKE 'R%' AND WEBSITE LIKE '%COM'
--Part – B: 

--1. Display all the students whose name’s second character is vowel and of and start with H.
SELECT *
FROM STUDENT
WHERE FIRSTNAME LIKE 'H[a,e,i,o,u]%'

--2. Display all the students whose last name does not ends with ‘a’. 
SELECT *
FROM STUDENT
WHERE LASTNAME NOT LIKE '%A'

--3. Display all the students whose first name starts with consonant. 
SELECT *
FROM STUDENT
WHERE FIRSTNAME NOT LIKE '[a,e,i,o,u]%'

--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their 
--website contains 'tech' or they live in a city starting with 'R'. 
SELECT *
FROM STUDENT 
WHERE  (FIRSTNAME LIKE 'K%' )AND (LASTNAME LIKE '%TEL') AND( WEBSITE LIKE '%TECH%') OR  CITY LIKE 'R%'

--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They 
--must have a website that ends with '.com' and their first name should not start with 'A'. 
SELECT *
FROM STUDENT 
WHERE address LIKE '%_' AND  CITY LIKE '[RB]%' AND WEBSITE LIKE '%.COM' AND FIRSTNAME NOT LIKE 'a%'
--Part – C: 

--1. Display all the students whose address contains single quote or double quote. 
SELECT *
FROM STUDENT 
WHERE ADDRESS LIKE '%[''"]%'
--2. Find students whose city does not contain the letter 'S' and their address contains either single or double 
--quotes. Their last name should start with 'P' and they must have a website that contains 'on'. 
SELECT *
FROM STUDENT 
WHERE CITY NOT  LIKE '%S%' AND ADDRESS LIKE '%[''"]%' AND LASTNAME LIKE 'P%' AND WEBSITE LIKE '%ON%'
