# DML Operations

-- The INSERT statement allows you to insert one or more rows into a table. 
-- The following illustrates the syntax of the INSERT statement:

/*INSERT INTO table(c1,c2,...)
VALUES (v1,v2,...); */

DESC course;

INSERT INTO course VALUES(101,"computerscience",5000.00,"cse@mycollege.com");
INSERT INTO course VALUES(102,"Electronics",7000.00,"ec@mycollege.com");
INSERT INTO course VALUES(103,"mECHANICAL",5800.00,"mech@mycollege.com");
INSERT INTO course VALUES(104,"eLECTRICAL",9900.00,"ele@mycollege.com");

SELECT * FROM course;
INSERT INTO course VALUES(105,"IP",5000.00,"ip@mycollege.com");
DESC student;

INSERT INTO student VALUES(1001,"shweta","rani","2001-02-07","bhiwani",101);
INSERT INTO student VALUES(1002,"jungkook","jeon","1995-09-07","bhiwani",101);
INSERT INTO student VALUES(1003,"jimin","park","1997-12-09","bhiwani",107);
INSERT INTO student VALUES(1004,"suga","min","1998-11-11","bhiwani",101);
INSERT INTO student VALUES(1005,"jin","kim","1999-12-05","bhiwani",109);
INSERT INTO student VALUES(1006,"taehueng","kim","1994-12-07","bhiwani",101);
INSERT INTO student VALUES(1007,"tanmay","shrma","1995-02-02","bhiwani",107);
INSERT INTO student VALUES(1008,"diya","shrma","1996-10-08","bhiwani",107);
INSERT INTO student VALUES(1009,"satish","kumar","1991-05-07","bhiwani",109);
INSERT INTO student VALUES(1010,"sourabh","kumar","2000-06-06","bhiwani",109);

SELECT * FROM student;

#Update Statement

/*
The UPDATE statement updates data in a table. 
It allows you to change the values in one or more columns of a single row or multiple rows.

 syntax of the UPDATE statement:

UPDATE  table_name 
SET 
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition];
*/

SELECT * FROM course;
UPDATE course SET fees=8000 WHERE courseid=101;
UPDATE course SET fees=5000,email="royalmaech@mycollege.com" WHERE courseid=103;

#create a new table based on existing table
CREATE TABLE course_copy AS SELECT * FROM course;

SELECT * FROM course_copy;

# DELETE statement
 /*To delete data from a table, you use the MySQL DELETE statement. 
 syntax of the DELETE statement:

DELETE FROM table_name
WHERE condition;  */

DELETE FROM course_copy WHERE courseid=105;
USE classicmodels;
CREATE TABLE employeesbackup AS SELECT * FROM employees;
SELECT * FROM employeesbackup;

DELETE FROM employeesbackup WHERE officeCode=4;

#drop statement deletes tables
DROP TABLE employeesbackup;






















