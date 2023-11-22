SELECT * FROM employee;
SELECT lastname FROM employees;
SELECT employeeNumber,lastName;
#----------------------------------------------------------------
-- Filter Records

#MySQL WHERE clause

-- The WHERE clause allows you to specify a search condition for the rows 
-- returned by a query.
# Syntax :
/*  SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;  */

SELECT employeeNumber,lastname,firstname,jobTitle,email from employees;

-- Display Sales rep's in the organization
SELECT employeeNumber,lastname,firstname,jobTitle,email from employees WHERE jobTitle='Sales Rep';

SELECT * FROM orderdetails;
-- Display orders with quantity greater then 50
SELECT * FROM orderdetails WHERE quantityOrdered >=50;

/* The search_condition is a combination of one or more predicates using the 
logical operator AND, OR and NOT.

AND- All conditions should be TRUE
OR - Any one of the conditions should be TRUE.
NOT - Negate the Condition .
 */

/* Example uses the WHERE clause to find employees whose job titles are 
Sales Rep and office codes are 1 */

SELECT employeeNumber,lastname,firstname,jobTitle,email,officeCode 
	from employees 
		WHERE jobTitle='Sales Rep' AND officeCode=1;
		
SELECT * FROM orderdetails 
	WHERE quantityOrdered >=50 AND priceEach > 100;
	
-- OR operator
 -- query finds employees whose job title is Sales Rep or employees who 
 -- locate the office with office code 1:
SELECT employeeNumber,lastname,firstname,jobTitle,email,officeCode 
	from employees 
		WHERE jobTitle='Sales Rep' OR officeCode=1;
		
		-- The BETWEEN operator returns TRUE if a value is in a range of values:
 
 -- Syntax: expression BETWEEN low AND high
 
 -- query finds employees who locate in offices whose office code is from 1 to 3:
SELECT employeeNumber,lastname,firstname,jobTitle,email,officeCode 
	from employees 
		WHERE officeCode BETWEEN 1 AND 3;

-- query to list orders done in the first quarter of 2004 .
SELECT * FROM orders; 

SELECT * FROM orders WHERE shippedDate BETWEEN '2004-01-01' AND '2004-03-31';

# MySQL WHERE with the LIKE operator
 
 /* The LIKE operator evaluates to TRUE if a value matches a specified pattern. 
 To form a pattern, you use % and _ wildcards. 
 The % wildcard matches any string of zero or more characters 
 while the _ wildcard matches any single character. */
 
 -- query finds employees whose last names end with the string 'son':
 SELECT employeeNumber,lastname,firstname,jobTitle,email
	from employees WHERE lastname LIKE '%son';

SELECT employeeNumber,lastname,firstname,jobTitle,email
	from employees WHERE lastname LIKE 'B%';

SELECT employeeNumber,lastname,firstname,jobTitle,email
	from employees WHERE lastname LIKE 'B%' OR firstname LIKE 'S%';	
	
SELECT employeeNumber,lastname,firstname,jobTitle,email
	from employees WHERE firstname LIKE '_arry';	
	
SELECT employeeNumber,lastname,firstname,jobTitle,email
	from employees WHERE firstname LIKE 'A%';	

-- NOT -- Negates the condition
SELECT employeeNumber,lastname,firstname,jobTitle,email
	from employees WHERE firstname NOT LIKE 'A%';	
	
#MySQL WHERE clause with the IN operator

-- The IN operator returns TRUE if a value matches any value in a list.
-- Syntax
-- value IN (value1, value2,...)

-- IN condition is used to help reduce the need to use multiple OR conditions in a 
-- SELECT, INSERT, UPDATE, or DELETE statement.

SELECT employeeNumber,lastname,firstname,jobTitle,email,officeCode 
	from employees 
		WHERE -- officeCode =1 OR officeCode =5 OR officeCode =7;
		officeCode IN(1,5,7) ORDER BY officecode;
		
SELECT * FROM customers WHERE contactLastName IN ('Young','Smith');

SELECT * FROM customers WHERE contactLastName NOT IN ('Taylor','Brown');
#MySQL WHERE  clause with the IS NULL operator
-- Null -> Absence of Data or Data is missing

/* To check if a value is NULL or not, you use the IS NULL operator, 
not the equal operator (=). The IS NULL operator returns TRUE if a value is NULL.

Syntax: 
value IS NULL  */ 		
		
-- Display employees who doesn't have Managers allocated		
SELECT employeeNumber,lastname,firstname,jobTitle,email,reportsTo 
	from employees WHERE reportsTo IS NULL;	
		
SELECT * FROM orders WHERE comments IS NULL;	

SELECT * FROM orders WHERE comments="";	 -- not considered as NULL

SELECT * FROM customers WHERE phone=0;   -- not considered as NULL

#WHERE clause with comparison operators
-- >, <, >=, <=, =, <> or != (not equals)

SELECT firstname,lastname,jobtitle from employees where jobtitle <> 'Sales Rep';

SELECT lastname, firstname, officeCode FROM employees
WHERE officecode > 5;

#---------------------------------------------------------------------------------
#MySQL ORDER BY clause
-- When you use the SELECT statement to query data from a table, 
-- the result set is not sorted. It means that the rows in the result set can 
-- be in any order.

-- To sort the result set, you add the ORDER BY clause to the SELECT statement
/* Syntax:
SELECT   select_list FROM    table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;  */

SELECT contactLastName, contactFirstName FROM customers;

-- sorts in ascending order
SELECT contactLastName, contactFirstName FROM customers ORDER BY contactLastName;

-- sort in descending order
SELECT * FROM products;

SELECT productCode, productName, buyPrice FROM products ORDER BY buyPrice DESC;

# MySQL GROUP BY clause
 -- The GROUP BY clause groups a set of rows into a set of summary rows by values 
 -- of columns or expressions. The GROUP BY clause returns one row for each group. 
 -- In other words, it reduces the number of rows in the result set.
 
 /* You often use the GROUP BY clause with aggregate functions such as SUM, AVG, 
 MAX, MIN, and COUNT. The aggregate function that appears in the SELECT clause 
 provides information about each group. */
 
 /* Syntax: 
 SELECT c1, c2,..., cn, aggregate_function(ci)
FROM table
WHERE where_conditions
GROUP BY c1 , c2,...,cn; */


SELECT STATUS FROM orders;

SELECT STATUS FROM orders GROUP BY STATUS;

SELECT STATUS ,COUNT(*) AS Total FROM orders GROUP BY STATUS;

SELECT COUNT(*) 'Total Orders' FROM orders;

SELECT quantityInStock FROM products;

SELECT sum(quantityInStock) 'Total Quantity' FROM products;


SELECT productLine,quantityInStock FROM products;

 /* The GROUP BY clause is often used with an aggregate function to perform calculation and 
return a single value for each subgroup. */
-- Query to find sum of quantity of Products
SELECT productLine,sum(quantityInStock) FROM products GROUP BY productLine;

SELECT orderdate FROM orders;

SELECT YEAR(orderdate) AS Year, COUNT( orderNumber) FROM orders GROUP BY YEAR DESC;

SELECT orderNumber,SUM(quantityOrdered * priceEach) as Total from orderDetails
group by orderNumber;
 

-- Query to display total no. of customers from each city

SELECT * FROM customers;

 SELECT city , COUNT(*) "Total Customers" from customers group by city;

# SQL Joins
-- A join is a method of linking data between one (self-join) or 
-- more tables based on values of the common column between the tables.

/* MySQL supports the following types of joins:

Inner join
Left join
Right join
Cross join */

-- Inner Join - Returns only matching records from 2 tables

/* SELECT3
    select_list
FROM t1
INNER JOIN t2 ON join_condition1
INNER JOIN t3 ON join_condition2ac
...; */

-- Query to display employeeCode, firstName & city of employees

SELECT * FROM employees;
SELECT * FROM offices;

SELECT employeeNumber, firstName,city FROM employees e
	INNER JOIN offices o
		ON e.officeCode=o.officeCode;
		
-- Query to display productCode and productName from the products table.
-- and  textDescription of product lines from the productlines table.

SELECT productCode, productName, textDescription from products p
	INNER JOIN productlines pl
		ON p.productLine=pl.productLine;
		
SELECT productCode, productName, textDescription from products
	INNER JOIN productlines
		ON products.productLine=productlines.productLine;

-- USING clause -  If joined fields of both tables have same name

SELECT employeeNumber,firstName,city,country FROM employees
	INNER JOIN offices USING(officeCode);

# Design a query to display custNo, custName, SalesRepName of the customer

SELECT * FROM customers;
SELECT * FROM employees;

SELECT customerNumber,customerName, CONCAT(firstName,' ',lastName) 'Sales Rep'
	FROM customers c
		INNER JOIN employees e
			ON c.salesRepEmployeeNumber=e.employeeNumber;
# DDL Commands - CREATE, ALTER, DROP, TRUNCATE, RENAME

/*Data Definition Language actually consists of the SQL commands that can be used to define the database schema. 
It simply deals with descriptions of the database schema and is used to create and modify the structure of database objects in the database.
DDL is a set of SQL commands used to create, modify, and delete database structures but not data. */

/*Create a db -- Follow normalization -- reduce rendundacy

1NF - Atomicity (Single Value), Primary Key

2NF - 1NF , Functional Dependency, Foreign Key

3NF - 2NF, No transive Dependency */

-- Create Database
CREATE DATABASE