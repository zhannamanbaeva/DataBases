CREATE DATABASE lab5;

CREATE TABLE customers5(
  customer_id INTEGER,
  cust_name VARCHAR(100),
  city VARCHAR(100),
  grade INTEGER,
  salesman_id INTEGER
);

INSERT INTO customers5 VALUES
                              (3002, 'Nick Rimando', 'New York', 100, 5001),
                              (3005,'Graham Zusi', 'California', 200, 5002),
                              (3001, 'Brad Guzan', 'London', NULL, 5005),
                              (3004, 'Fabian Johns', 'Paris', 300, 5006),
                              (3007, 'Brad Davis', 'New York', 200, 5001),
                              (3009,'Geoff Camero', 'Berlin', 100, 5003),
                              (3008, 'Julian Green', 'London', 300, 5002);

SELECT * FROM customers5;

CREATE TABLE orders(
  order_no INTEGER,
  purch_amt NUMERIC,
  ord_date VARCHAR(50),
  customer_id INTEGER,
  salesman_id integer
);

INSERT INTO orders VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
                          (70009, 270.65, '2012-09-10', 3001, 5005),
                          (7002, 65.26, '2012-10-05', 3002, 5001),
                          (70004, 110.5, '2012-08-17', 3009, 5003),
                          (70007, 948.5, '2012-09-10', 3005, 5002),
                          (70005, 2400.6, '2012-07-27', 3007, 5001),
                          (70008, 5760, '2012-09-10', 3002, 5001);
SELECT * FROM orders;

CREATE TABLE salesman(
  salesman_id INTEGER,
  name VARCHAR(50),
  city VARCHAR(50),
  commision NUMERIC
);

INSERT INTO salesman VALUES (5001, 'James Hoog', 'New York', 0.15),
                            (5002, 'Nail Knite', 'Paris', 0.13),
                            (5005, 'Pit Alex', 'London', 0.11),
                            (5006, 'Mc Lyon', 'Paris', 0.14),
                            (5003, 'Lauson Hen', NULL, 0.12),
                            (5007, 'Paul Adam', 'Rome', 0.13);

SELECT * FROM salesman;

SELECT sum(purch_amt) FROM orders;

SELECT AVG(purch_amt) FROM orders;

SELECT count(cust_name) FROM customers5 WHERE cust_name NOTNULL;

SELECT MIN(purch_amt) FROM orders;

SELECT * FROM customers5 WHERE cust_name LIKE '%b';


SELECT * FROM orders WHERE customer_id
                             IN (SELECT customer_id
                                 FROM customers5 WHERE city = 'New York');


SELECT * FROM customers5 WHERE customer_id
                                 IN(SELECT customer_id FROM orders WHERE purch_amt > 10);

SELECT sum(grade) FROM customers5;

SELECT cust_name FROM customers5 WHERE cust_name NOTNULL;


SELECT MAX(grade) FROM customers5;

SELECT * FROM customers5;

SELECT * FROM orders;

SELECT * FROM salesman;