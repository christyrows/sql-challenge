CREATE TABLE titles.Titles (
    emp_title_id Varchar NOT NULL,
    title Varchar(20) NOT NULL,
    PRIMARY KEY (emp_title_id)
);

CREATE TABLE employees.Employees (
    emp_id int NOT NULL,
    emp_title_id varchar NOT NULL,
    birthdate VARCHAR NOT NULL,
    first_name varchar(25) NOT NULL,
    last_name varchar(25) NOT NULL,
    sex Char(2) NOT NULL,
    hire_date VARCHAR NOT NULL,
    PRIMARY KEY (emp_id),
	FOREIGN KEY(emp_title_id) REFERENCES Titles (emp_title_id)
);

CREATE TABLE departments.Departments (
    dept_id Varchar(4) NOT NULL,
    dept_name Varchar(30) NOT NULL,
    PRIMARY KEY (dept_id)
);

CREATE TABLE dept_emp.Department_Employees (
    emp_id int NOT NULL,
    dept_id Varchar NOT NULL,
	FOREIGN KEY(emp_id) REFERENCES Employees(emp_id),
	FOREIGN KEY(dept_id) REFERENCES Departments (dept_id)
);

CREATE TABLE dept_manager.Department_Manager (
    dept_id Varchar NOT NULL,
    emp_id int NOT NULL,
	FOREIGN KEY(dept_id) REFERENCES Departments (dept_id),
	FOREIGN KEY(emp_id) REFERENCES Employees (emp_id)
);

CREATE TABLE salaries.Salary (
    emp_id int NOT NULL,
    salary Int NOT NULL,
	FOREIGN KEY(emp_id) REFERENCES Employees (emp_id)
);