CREATE DATABASE lab7;--1
CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);
CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);
CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  department_id INTEGER REFERENCES departments
);--2

INSERT INTO locations VALUES (default,'A','A','A','A'),
                             (default,'B','B','B','B'),
                             (default,'C','C','C','C');
INSERT INTO departments VALUES (default,'a',100,1),
                               (default,'b',100,2);
INSERT INTO departments VALUES (40,'c',100,1);
INSERT INTO departments VALUES (4,'ds',100,2);
INSERT INTO employees VALUES (DEFAULT,'Alex', 'Lee','mail','098',100,1),
                             (DEFAULT ,'Sam','O','gmail','87',123,2);
INSERT INTO employees VALUES (DEFAULT ,'Forty','num','dsf','asdf',32,40);
INSERT INTO employees VALUES (DEFAULT ,'Fifth','nu','dsf','asdf',32,40);
INSERT INTO employees VALUES (DEFAULT ,'Fifth','nu','dsf','asdf',32,NULL);
--3
SELECT first_name,
       last_name,
       departments.department_id,
       departments.department_name
FROM employees INNER JOIN departments ON employees.department_id=departments.department_id;
--4
SELECT first_name,
       last_name,
       departments.department_id,
       departments.department_name
FROM employees LEFT JOIN departments ON employees.department_id=departments.department_id WHERE departments.department_id IN(40,80);
--5
SELECT first_name,
       last_name,
       departments.department_id,
       departments.department_name,
       locations.city,
       locations.state_province
FROM employees INNER JOIN departments ON employees.department_id=departments.department_id INNER JOIN locations ON departments.location_id = locations.location_id;
--6
SELECT departments.department_id,
       department_name,
       first_name,
       last_name
FROM departments LEFT JOIN employees e on departments.department_id = e.department_id;
--7
SELECT first_name,
       last_name,
       departments.department_id,
       department_name
FROM employees LEFT JOIN departments on employees.department_id = departments.department_id;