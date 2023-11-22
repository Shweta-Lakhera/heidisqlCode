# DDL Commands - CREATE, ALTER, DROP, TRUNCATE, RENAME

/*Data Definition Language actually consists of the SQL commands that can be used to define the database schema. 
It simply deals with descriptions of the database schema and is used to create and modify the structure of database objects in the database.
DDL is a set of SQL commands used to create, modify, and delete database structures but not data. */

/*Create a db -- Follow normalization -- reduce rendundacy

1NF - Atomicity (Single Value), Primary Key

2NF - 1NF , Functional Dependency, Foreign Key

3NF - 2NF, No transive Dependency */

-- Create Database
CREATE DATABASE college;
USE college;
# Create table on set primary key
CREATE TABLE student(
							rollno INT(10) PRIMARY KEY,
							firstname VARCHAR(20) not NULL,
							lastname VARCHAR(25) NOT NULL,
							dob DATE NOT NULL,
							city VARCHAR(15),
							cid INT NOT NULL);
							
DESC student;

CREATE TABLE course(
							courseid INT(5) PRIMARY KEY,
							coursename VARCHAR(15) NOT NULL,
							fees FLOAT NOT NULL,
							email VARCHAR(25) NOT NULL UNIQUE);

DESC course;