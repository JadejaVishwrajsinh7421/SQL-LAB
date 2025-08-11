USE CSE_3A_127

SELECT * FROM AUTHOR
SELECT *FROM PUBLISHER
SELECT * FROM BOOK

--Part – A:

--1. List all books with their authors. 
SELECT AUTHOR.AUTHORNAME,BOOK.TITLE
FROM AUTHOR
INNER JOIN BOOK
ON AUTHOR.AUTHORID = BOOK.AUTHORID 

--2. List all books with their publishers. 
SELECT 
	PUBLISHER.PUBLISHERNAME,BOOK.TITLE
FROM PUBLISHER
INNER JOIN BOOK
ON PUBLISHER.PUBLISHERID = BOOK.PUBLISHERID 

--3. List all books with their authors and publishers.
SELECT 
	PUBLISHER.PUBLISHERNAME,BOOK.TITLE,AUTHOR.AUTHORNAME
FROM 
	PUBLISHER 
JOIN BOOK
ON 
	PUBLISHER.PUBLISHERID = BOOK.PUBLISHERID 
JOIN AUTHOR
ON 
	AUTHOR.AUTHORID = BOOK.AUTHORID 

--4. List all books published after 2010 with their authors and publisher and price. 
SELECT 
	PUBLISHER.PUBLISHERNAME,BOOK.TITLE,AUTHOR.AUTHORNAME,BOOK.PRICE
FROM 
	PUBLISHER 
JOIN BOOK
ON 
	PUBLISHER.PUBLISHERID = BOOK.PUBLISHERID 
JOIN AUTHOR
ON 
	AUTHOR.AUTHORID = BOOK.AUTHORID 

WHERE BOOK.PUBLICATIONYEAR > 2010

--5. List all authors and the number of books they have written. 
SELECT 
	AUTHOR.AUTHORNAME,COUNT(TITLE) AS COUNTNAME
FROM 
	AUTHOR
JOIN
	BOOK
ON AUTHOR.AUTHORID = BOOK.AUTHORID 

GROUP BY AUTHORNAME


--6. List all publishers and the total price of books they have published. 
SELECT 
	PUBLISHER.PUBLISHERNAME,SUM(BOOK.PRICE)
FROM
	PUBLISHER
JOIN 
	BOOK
ON 
	PUBLISHER.PUBLISHERID = BOOK.PublisherID

GROUP BY PUBLISHERNAME

--7. List authors who have not written any books. 
SELECT 
	AUTHOR.AuthorName,BOOK.AUTHORID
FROM 
	AUTHOR
LEFT JOIN 
	BOOK
ON 
	AUTHOR.AUTHORID = BOOK.AUTHORID

WHERE BOOK.AUTHORID IS NULL		

--8. Display total number of Books and Average Price of every Author. 
SELECT 
	COUNT(BOOK.BOOKID) ,AVG(BOOK.PRICE),AUTHORNAME
FROM 
	AUTHOR
JOIN 
	BOOK
ON 
	AUTHOR.AUTHORID = BOOK.AUTHORID
GROUP BY AUTHORNAME

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest. 
SELECT 
PUBLISHER.PUBLISHERNAME,COUNT(BOOK.TITLE)
FROM PUBLISHER
JOIN BOOK
ON 
PUBLISHER.PUBLISHERID = BOOK.PublisherID
GROUP BY PUBLISHERNAME

ORDER BY COUNT(BOOK.TITLE) DESC

--10. Display number of books published each year. 
SELECT 
COUNT(BOOK.TITLE) AS BOOKCOUNT,PUBLICATIONYEAR,BOOK.TITLE
FROM BOOK
JOIN PUBLISHER
ON PUBLISHER.PUBLISHERID = BOOK.PublisherID

GROUP BY PUBLICATIONYEAR,TITLE
ORDER BY PUBLICATIONYEAR

--Part – B: 

--1. List the publishers whose total book prices exceed 500, ordered by the total price. 
SELECT 
	PUBLISHER.PUBLISHERNAME,SUM(BOOK.PRICE)
FROM
	PUBLISHER
JOIN 
	BOOK
ON 
	PUBLISHER.PUBLISHERID = BOOK.PublisherID

GROUP BY PUBLISHERNAME
HAVING SUM(BOOK.Price) > 500
ORDER BY SUM(BOOK.PRICE)

--2. List most expensive book for each author, sort it with the highest price. 
SELECT  DISTINCT AuthorName ,MAX(BOOK.PRICE)
FROM BOOK
JOIN AUTHOR
ON 	AUTHOR.AUTHORID = BOOK.AUTHORID
GROUP BY AuthorName
ORDER BY MAX(BOOK.PRICE) DESC
 
--Part – C: Create table as per following schema with proper validation and try to insert data which violate your validation. 

--1. Create table
-- COUNTRY TABLE
CREATE TABLE Country_NAME (
    Cid INT ,
    Cname VARCHAR(50) 
);

-- STATE TABLE
CREATE TABLE State_NAME (
    Sid INT,
    Sname VARCHAR(50),
    Cid INT
);

-- DISTRICT TABLE
CREATE TABLE District_NAME (
    Did INT,
    Dname VARCHAR(50) ,
    Sid INT,
);

-- CITY TABLE
CREATE TABLE City_NAME (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) ,
    Did INT ,
);

-- DEPARTMENT TABLE
CREATE TABLE Dept_info (
    Did INT ,
    Dname VARCHAR(50) 
);

-- EMPLOYEE TABLE
CREATE TABLE Emp_NAME (
    Eid INT,
    Ename VARCHAR(50),
    Salary DECIMAL(10, 2),
    Experience INT,
    Did INT,
    Cid INT 
);



--2. Insert 5 records in each table. 

-- INSERT DATA

-- COUNTRY
INSERT INTO Country_NAME(Cid, Cname) VALUES
(30, 'India'),
(31, 'USA'),
(32, 'Canada'),
(33, 'Australia'),
(34, 'UK');

-- STATE
INSERT INTO State_NAME(Sid, Sname, Cid) VALUES
(1101, 'Gujarat', 30),
(1102, 'California', 31),
(1103, 'Ontario', 32),
(1104, 'New South Wales', 33),
(1105, 'England', 34);

-- DISTRICT
INSERT INTO District_NAME(Did, Dname, Sid) VALUES
(1, 'Rajkot', 1101),
(2, 'Los Angeles', 1102),
(3, 'Toronto', 1103),
(4, 'Sydney', 1104),
(5, 'London', 1105);

-- CITY_NAME
INSERT INTO City_NAME(Cid, Cname, Did) VALUES
(30, 'Rajkot City', 1),
(31, 'LA Downtown', 2),
(32, 'Toronto City',3),
(33, 'Sydney City', 4),
(34, 'London City', 5);

-- DEPT_NAME
INSERT INTO Dept_info (Did, Dname) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

-- EMP_NAME
INSERT INTO Emp_NAME (Eid, Ename, Salary, Experience, Did, Cid) VALUES
(101, 'Amit', 50000, 5, 1, 30),
(102, 'Neha', 60000, 7, 2, 31),
(103, 'Raj', 45000, 3, 3, 32),
(104, 'Sita', 70000, 10, 3, 33),
(105, 'John', 55000, 4, 5, 34);
DROP TABLE Country_NAME
SELECT *
FROM Emp_NAME
SELECT *
FROM Dept_info
SELECT *
FROM City_NAME
SELECT *
FROM District_NAME
SELECT *
FROM State_NAME
SELECT *
FROM Country_NAME

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 
SELECT Emp_NAME.ENAME,Salary,Experience,City_NAME.Cname,Dept_info.Dname,state_name.sname,country_name.cname
FROM  EMP_NAME
JOIN DEPT_INFO
ON EMP_NAME.DID =DEPT_INFO.DID

JOIN CITY_NAME
ON CITY_NAME.DID = DEPT_INFO.DID

JOIN District_NAME
ON DISTRICT_NAME.DID = DEPT_INFO.DID

JOIN STATE_NAME
ON STATE_NAME.SID =DISTRICT_NAME.SID

JOIN COUNTRY_NAME 
ON COUNTRY_NAME.CID = City_NAME.CID


