CREATE DATABASE lab8; --1
CREATE TABLE salesman(
salesman_id INT PRIMARY KEY,
name VARCHAR(255),
city VARCHAR(255),
commission FLOAT
);
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
cust_name VARCHAR(255),
city VARCHAR(255),
grade NUMERIC,
salesman_id INT REFERENCES salesman
);
CREATE TABLE orders(
ord_no INT PRIMARY KEY,
purch_amt NUMERIC,
ord_date DATE,
customer_id INT REFERENCES customers,
salesman_id INT REFERENCES salesman
); --2

CREATE ROLE junior_dev LOGIN; --3

CREATE VIEW salesman_NY AS SELECT * FROM salesman WHERE city=='New York'; --4

CREATE VIEW order_SM_Cust AS SELECT s.name, c.cust_name from salesman as s INNER JOIN customers as c USING (c.customer_id=orders.customer_id AND s.salesman_id= orders.salesman_id); --5
GRANT ALL PRIVILEGES ON order_SM_Cust TO junior_dev; --5

CREATE VIEW cust_High AS SELECT * FROM customers ORDER BY grade DESC NULLS LAST LIMIT 1 OFFSET 0; --6
GRANT SELECT ON PRIVILEGES ON cust_High TO junior_dev; --6

CREATE VIEW cnt_SM AS SELECT city, count(salesman_id) FROM salesman GROUP BY city; --7

CREATE VIEW SM_More1Cust AS SELECT * FROM salesman s INNER JOIN customers c USING(salesman_id) group by salesman_id HAVING (count(*)>1); --8

CREATE ROLE intern;  --9
REASSIGN OWNED BY junior_dev to intern; --9