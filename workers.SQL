#This script creates tables with worker information and answers queries
#posed about it by the website techbeamers.com


CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
		
		CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

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
 
 ------------------------------------------------------------------------------
#Questions, and corresponding answers about data in the tables
 
#Write An SQL Query To Fetch “FIRST_NAME” From Worker Table 
#Using The Alias Name As <WORKER_NAME>
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;
 
#Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case
SELECT upper(FIRST_NAME) FROM Worker;
 
#Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
SELECT DISTINCT DEPARTMENT FROM Worker;
 
#Write An SQL Query To Print The First Three Characters Of  FIRST_NAME 
#From Worker Table.
SELECT substring(FIRST_NAME, 1, 3) FROM Worker;
 
#Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First 
#Name Column ‘Amitabh’ From Worker Table.
SELECT INSTR(FIRST_NAME, BINARY'a') 
FROM Worker 
WHERE FIRST_NAME = 'Amitabh';
 
#Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing 
#White Spaces From The Right Side.
SELECT RTRIM(FIRST_NAME) 
FROM Worker;
 
#Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing 
#White Spaces From The Left Side.
SELECT LTRIM(DEPARTMENT) 
FROM Worker;
 
#Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker 
#Table And Prints Its Length.
SELECT DISTINCT LENGTH(DEPARTMENT) 
FROM Worker;
 
#Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing 
#‘A’ With ‘a’.
SELECT REPLACE(FIRST_NAME, 'A', 'a') 
FROM Worker;

#Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into 
#A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME)
AS COMPLETE_NAME
FROM Worker;

#Write An SQL Query To Print All Worker Details From The Worker Table Order By 
#FIRST_NAME Ascending.
SELECT *
FROM Worker
ORDER BY FIRST_NAME ASC;

#Write An SQL Query To Print All Worker Details From The Worker Table Order By 
#FIRST_NAME Ascending And DEPARTMENT Descending.
SELECT *
FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

#Write An SQL Query To Print Details For Workers With The First Name As “Vipul” 
#And “Satish” From Worker Table.
SELECT *
FROM Worker
WHERE FIRST_NAME IN ('Vipul','Satish');

#Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” 
#And “Satish” From Worker Table.
SELECT *
FROM Worker
WHERE FIRST_NAME NOT IN ('Vipul','Satish');

#Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As 
#“Admin”.
SELECT *
FROM Worker
WHERE DEPARTMENT LIKE 'Admin%';

#Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME 
#Contains ‘A’.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a%';

#Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME 
#Ends With ‘A’.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a';

#Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME 
#Ends With ‘h’ And Contains Six Alphabets.
SELECT * 
FROM Worker
WHERE FIRST_NAME LIKE '_____h';

#Write An SQL Query To Print Details Of The Workers Whose SALARY 
#Lies Between 100000 And 500000.
SELECT *
FROM Worker
WHERE SALARY BETWEEN 10000 AND 50000;

#Write An SQL Query To Print Details Of The Workers Who Have Joined 
#In Feb’2014.
SELECT * 
FROM Worker 
WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2;

#Write An SQL Query To Fetch The Count Of Employees Working In The 
#Department ‘Admin’.
SELECT COUNT(*)
FROM Worker 
WHERE DEPARTMENT = 'Admin';

#Write An SQL Query To Fetch Worker Names With Salaries >= 50000 
#And <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME)
AS Worker_Name, Salary
FROM Worker
WHERE WORKER_ID IN
(SELECT WORKER_ID FROM Worker
WHERE SALARY BETWEEN 50000 AND 100000);

#Write An SQL Query To Fetch The No. Of Workers For Each Department 
#In The Descending Order.
SELECT COUNT(WORKER_ID) No_Of_Workers
FROM Worker
GROUP BY DEPARTMENT
ORDER BY No_Of_Workers DESC;

#Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE IN ('Manager');

#Write An SQL Query To Fetch Duplicate Records Having Matching Data In 
#Some Fields Of A Table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

#Write An SQL Query To Show Only Odd Rows From A Table.
SELECT * 
FROM Worker 
WHERE MOD (WORKER_ID, 2) <> 0;

#Write An SQL Query To Show Only Even Rows From A Table.
SELECT * 
FROM Worker 
WHERE MOD (WORKER_ID, 2) = 0;

#Write An SQL Query To Fetch Intersecting Records Of Two Tables.
(SELECT * 
FROM Worker)
INTERSECT
(SELECT * 
FROM WorkerClone);

#Write An SQL Query To Show Records From One Table That Another 
#Table Does Not Have.
SELECT * 
FROM Worker
MINUS
SELECT * 
FROM Title;

#Write An SQL Query To Show The Current Date And Time.
SELECT CURDATE();

#Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
SELECT *
FROM Worker 
ORDER BY Salary DESC LIMIT 10;
