--Create titles table and import data
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
	title_id character (5) NOT NULL,
	title character varying (30) NOT NULL,
	CONSTRAINT titles_pkey PRIMARY KEY (title_id)
);
select * from titles;

--Create employees table and import data
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
	emp_no integer NOT NULL,
	emp_title_id character (5) NOT NULL,
	birth_date date NOT NULL,
	first_name character varying (20) NOT NULL,
	last_name character varying (20) NOT NULL,
	sex character (1) NOT NULL,
	hire_date date NOT NULL,
	CONSTRAINT employees_pkey PRIMARY KEY (emp_no),
	CONSTRAINT titles_fkey FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);
select * from employees;

--Create departments table and import data
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
 	dept_no character (4) NOT NULL,
	dept_name character varying (20) NOT NULL,
	CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
);
Select * from departments;

--Create dept_emp table and import data
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
	emp_no integer NOT NULL,
	dept_no character (4) NOT NULL,
	CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no), --composite key
	CONSTRAINT employee_fkey FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	CONSTRAINT departments_fkey FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
select * from dept_emp;

--Create dept_manager table and import data
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
	dept_no character (4) NOT NULL,
	emp_no integer NOT NULL,
	CONSTRAINT dept_manager_pkey PRIMARY KEY (emp_no, dept_no),
	CONSTRAINT employee_fkey FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	CONSTRAINT departments_fkey FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
select * from dept_manager;

--Create salaries table and import data
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
	emp_no integer NOT NULL,
	salary integer NOT NULL,
	CONSTRAINT salaries_pkey PRIMARY KEY (emp_no),
	CONSTRAINT employees_fkey FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
select * from salaries;

