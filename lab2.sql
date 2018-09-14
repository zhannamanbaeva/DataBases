CREATE DATABASE lab21;
CREATE TABLE countries(
  country_id SERIAL primary key,
 country_name VARCHAR(25),
  region_id INT,
  population INT
);
INSERT INTO countries VALUES (DEFAULT, 'Russia', 1, 12000000);

INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Korea');

INSERT INTO countries VALUES (DEFAULT, 'Turkey', NULL, 900000);

INSERT INTO countries (country_id, country_name, region_id, population)
VALUES (DEFAULT, 'USA', 12, 1700000),

       (DEFAULT, 'Canada', 4, 1500000),

       (DEFAULT, 'Greece', 15, 3500000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countries VALUES (DEFAULT, DEFAULT, 7, 600000);

INSERT INTO countries VALUES (DEFAULT);

CREATE TABLE countries_new (
  LIKE countries
);
INSERT INTO countries_new SELECT * FROM countries RETURNING *;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1
    RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new AS c USING countries AS cn WHERE c.country_id = cn.country_id RETURNING *;

DELETE FROM countries * RETURNING;
DROP TABLE countries;
DROP DATABASE lab12;
