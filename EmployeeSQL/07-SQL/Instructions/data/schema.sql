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


-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_id, last_name, first_name, sex, s.salary 
FROM employees as e
INNER JOIN salaries as s ON
e.emp_id = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
Select first_name, last_name, hire_date
from employees
where hire_date like '%86'

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

SELECT m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM dept_manager as m
INNER JOIN employees as e
on e.emp_id = m.emp_no
INNER JOIN departments as d
ON m.dept_no = d.dept_no
;

-- 4. List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
from employees as e 
INNER JOIN dept_emp as de
on e.emp_id = de.emp_no
INNER JOIN departments as d
on de.dept_no = d.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
from employees
where 
	first_name = 'Hercules'
	AND last_name like 'B%'


-- 6. List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.
Select e.emp_id, e.last_name, e.first_name
from employees as e 
INNER JOIN dept_emp as de
on e.emp_id = de.emp_no
INNER JOIN departments as d
on de.dept_no = d.dept_no
where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
Select e.emp_id, e.last_name, e.first_name, d.dept_name
from employees as e 
INNER JOIN dept_emp as de
on e.emp_id = de.emp_no
INNER JOIN departments as d
on de.dept_no = d.dept_no
where dept_name in ('Sales', 'Development')

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees
-- share each last name.
Select last_name, count(last_name) as "Actor_Count"
from employees
group by last_name
ORDER BY "Actor_Count" DESC;
