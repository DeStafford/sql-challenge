CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	foreign key (emp_title_id) references titles (title_id)
);

CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_managers(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

COPY departments FROM 'C:\Users\missm\Downloads\Starter_Code (16)\Starter_Code\data/departments.csv' 
WITH CSV HEADER DELIMITER ',';

COPY titles FROM 'C:\Users\missm\Downloads\Starter_Code (16)\Starter_Code\data/titles.csv' 
WITH CSV HEADER DELIMITER ',';

COPY employees FROM 'C:\Users\missm\Downloads\Starter_Code (16)\Starter_Code\data/employees.csv' 
WITH CSV HEADER DELIMITER ',';

COPY dept_emp FROM 'C:\Users\missm\Downloads\Starter_Code (16)\Starter_Code\data/dept_emp.csv' 
WITH CSV HEADER DELIMITER ',';

COPY dept_managers FROM 'C:\Users\missm\Downloads\Starter_Code (16)\Starter_Code\data/dept_manager.csv' 
WITH CSV HEADER DELIMITER ',';

COPY salaries FROM 'C:\Users\missm\Downloads\Starter_Code (16)\Starter_Code\data/salaries.csv' 
WITH CSV HEADER DELIMITER ',';




