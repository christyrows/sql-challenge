CREATE TABLE titles (
    title_id Varchar NOT NULL,
    title Varchar(20) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_id int NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name varchar(25) NOT NULL,
    last_name varchar(25) NOT NULL,
    sex Char(2) NOT NULL,
    hire_date VARCHAR NOT NULL,
    PRIMARY KEY (emp_id),
	FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE departments (
    dept_no Varchar(4) NOT NULL,
    dept_name Varchar(30) NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no Varchar NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_id),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no Varchar NOT NULL,
    emp_no int NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_id)
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary Int NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_id)
);