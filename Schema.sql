--Creating table for PH_EmployeeDB
--CREATE TABLE is the syntax required to create a new table in SQL.
--departments is the name of the table and how it will be referenced in queries.
--dept_no VARCHAR(4) NOT NULL, creates a column named "dept_no" that can hold up to four varying characters, while NOT NULL tells SQL that no null fields will be allowed when importing data.
--dept_name VARCHAR(40) NOT NULL, creates a column similar to the dept_no, only the varying character count has a maximum of 40.
--PRIMARY KEY (dept_no), means that the dept_no column is used as the primary key for this table.
--UNIQUE (dept_name) adds the unique constraint to the dept_name column.ie no duplicates
--The closing parenthesis and semicolon signal that the SQL CREATE TABLE statement is complete. 
--Any code added after will need to be included in a new SQL statement
--A statement is a command that is set up with a certain syntax.
CREATE TABLE Departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

-- create new table for employee file
CREATE TABLE Employees(
emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
--Remember that foreign keys reference the primary key of other tables. In the two lines above we can see that:
--The FOREIGN KEY constraint tells Postgres that there is a link between two tables
--The parentheses following FOREIGN KEY specify which of the current table's columns is linked to another table
--REFERENCES table_name (column_name) tells Postgres which other table uses that column as a primary key

--create a new table for salaries data/csv
CREATE TABLE Salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

--Create a new table for Managers data/cvs
CREATE TABLE Managers (
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Create a new table for Titles data/csv
CREATE TABLE Titles (
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (title, emp_no) 
);

-- Create a new table for Department Employees data/csv
CREATE TABLE Department_Employees (
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM departments;
	
	
	