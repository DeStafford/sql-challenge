-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT sal.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees as emp 
INNER JOIN salaries as sal 
ON emp.emp_no = sal.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, dept.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_managers AS dm
INNER JOIN departments AS dept
ON dm.dept_no = dept.dept_no
INNER JOIN employees AS emp
ON emp.emp_no = dm.emp_no
ORDER BY dm.dept_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name 
FROM employees as emp
LEFT JOIN dept_emp as de
ON emp.emp_no = de.emp_no
INNER JOIN departments as dept
ON dept.dept_no = de.dept_no
ORDER BY de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, last_name, first_name 
FROM employees as emp
INNER JOIN dept_emp as de 
ON emp.emp_no = de.emp_no
INNER JOIN departments as dept
ON dept.dept_no = de.dept_no
WHERE LOWER(dept.dept_name) = 'sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, last_name, first_name, dept.dept_name 
FROM employees as emp
INNER JOIN dept_emp as de 
ON emp.emp_no = de.emp_no
INNER JOIN departments as dept
ON dept.dept_no = de.dept_no
WHERE LOWER(dept.dept_name) = 'sales' OR LOWER(dept.dept_name) = 'development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) as frequency_counts
FROM employees
GROUP BY last_name
ORDER BY frequency_counts DESC;