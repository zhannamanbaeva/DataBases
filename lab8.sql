CREATE DATABASE lab8;
CREATE INDEX index_name on countries USING HASH (name);
CREATE INDEX index_name_surname on employees USING HASH (name, surname);
CREATE INDEX index_salary on employees(salary);
CREATE INDEX idnex_substring on employees (substring(name from 1 for 4));
CREATE INDEX index_salary_depID on employees (department_id, salary);
CREATE INDEX index_depID_budget on departments(department_id, budget);
