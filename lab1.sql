CREATE DATABASE lab1;

CREATE TABLE users(
  id  SERIAL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50)
);

SELECT * FROM users;

ALTER TABLE users ADD COLUMN "isadmin" INT;

ALTER TABLE users
    ALTER COLUMN isadmin TYPE boolean USING isadmin::boolean;

ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE;


ALTER TABLE users ADD CONSTRAINT CON_id UNIQUE(id);

CREATE TABLE tasks(
  id SERIAL PRIMARY KEY ,
  name VARCHAR(50),
  user_id INT
);
DROP TABLE tasks;
DROP DATABASE lab1;