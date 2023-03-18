--DB CREATION
CREATE DATABASE ORG; 

----------------------------------------------------------------------------------------------------------------------------
--TABLE-1 CREATION
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Worker ( 
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25), 
LAST_NAME CHAR(25), 
SALARY INT, 
JOINING_DATE DATETIME, 
DEPARTMENT CHAR(25) 
); 

--SELECT QUERY
select * from worker;

--TRUNCATE TABLE
truncate table worker;

--INSERTING RECORDS
INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
(001, 'Monika', 'Arora', 100000, '2009-02-14 09:00:00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '2009-02-14 09:00:00', 'Admin'), 
(003, 'Vishal', 'Singhal', 300000, '2009-02-14 09:00:00', 'HR'), 
(004, 'Amitabh', 'Singh', 500000, '2009-02-14 09:00:00', 'Admin'), 
(005, 'Vivek', 'Bhati', 500000, '2009-02-14 09:00:00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2009-02-14 09:00:00', 'Account'), 
(007, 'Satish', 'Kumar', 75000, '2009-02-14 09:00:00', 'Account'), 
(008, 'Geetika', 'Chauhan', 90000, '2009-02-14 09:00:00', 'Admin'); 

----------------------------------------------------------------------------------------------------------------------------
--TABLE-2 CREATION
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Bonus ( 
WORKER_REF_ID INT, 
BONUS_AMOUNT INT, 
BONUS_DATE DATETIME, 
FOREIGN KEY (WORKER_REF_ID)REFERENCES Worker(WORKER_ID)ON DELETE CASCADE 
); 

--SELECT QUERY
select * from Bonus;

--TRUNCATE TABLE
truncate table Bonus;

--INSERTING RECORDS
INSERT INTO Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '2016-02-20'),
(002, 3000, '2016-06-11'), 
(003, 4000, '2016-02-20'), 
(001, 4500, '2016-02-20'), 
(002, 3500, '2016-06-11'); 

----------------------------------------------------------------------------------------------------------------------------
--TABLE-3 CREATION
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Title ( 
WORKER_REF_ID INT, 
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME, 
FOREIGN KEY (WORKER_REF_ID) 
REFERENCES Worker(WORKER_ID) 
ON DELETE CASCADE 
); 

--SELECT QUERY
select * from Title;

--TRUNCATE TABLE
truncate table Title;

--INSERTING RECORDS
INSERT INTO Title 
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'), 
(002, 'Executive', '2016-06-11 00:00:00'), 
(008, 'Executive', '2016-06-11 00:00:00'), 
(005, 'Manager', '2016-06-11 00:00:00'), 
(004, 'Asst. Manager', '2016-06-11 00:00:00'), 
(007, 'Executive', '2016-06-11 00:00:00'), 
(006, 'Lead', '2016-06-11 00:00:00'), 
(003, 'Lead', '2016-06-11 00:00:00'); 

----------------------------------------------------------------------------------------------------------------------------
--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>. 
----------------------------------------------------------------------------------------------------------------------------
SELECT FIRST_NAME AS WORKER_NAME FROM Worker
----------------------------------------------------------------------------------------------------------------------------
--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case. 
----------------------------------------------------------------------------------------------------------------------------
SELECT UPPER(FIRST_NAME)AS UPPER_CASED_NAMES FROM Worker
----------------------------------------------------------------------------------------------------------------------------
--Q-3. Write an SQL query to fetch unique values of DEPARTMENTfromWorker table. 
----------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT(DEPARTMENT) FROM Worker
----------------------------------------------------------------------------------------------------------------------------
--Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table. 
----------------------------------------------------------------------------------------------------------------------------
SELECT SUBSTRING(FIRST_NAME,1,3) FROM Worker
----------------------------------------------------------------------------------------------------------------------------
--Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
----------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT(DEPARTMENT),LEN (DEPARTMENT) AS LENTH FROM Worker
----------------------------------------------------------------------------------------------------------------------------
--Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAMEfrom Worker table into a single column COMPLETE_NAME. Aspacechar should separate them. 
----------------------------------------------------------------------------------------------------------------------------
SELECT CONCAT(CONCAT(FIRST_NAME,''),LAST_NAME) AS COMPLETE_NAME FROM Worker 
----------------------------------------------------------------------------------------------------------------------------
--Q-7. Write an SQL query to print details for Workers with the first nameas “Vipul” and “Satish” from Worker table. 
----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Worker WHERE FIRST_NAME='VIPUL' OR FIRST_NAME='SATISH'
----------------------------------------------------------------------------------------------------------------------------
--Q-8. Write an SQL query to print details of Workers with DEPARTMENTname as “Admin”. 
----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Worker WHERE DEPARTMENT='ADMIN'
----------------------------------------------------------------------------------------------------------------------------
--Q-9. Write an SQL query to print details of the Workers whoseFIRST_NAME ends with ‘a’. 
----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%A'
----------------------------------------------------------------------------------------------------------------------------
--Q-10. Write an SQL query to print details of the Workers whoseFIRST_NAME contains ‘a’.
----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%A%'
