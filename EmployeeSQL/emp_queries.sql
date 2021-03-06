--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM salaries AS sal
INNER JOIN employees AS emp ON
	emp.emp_no = sal.emp_no
ORDER BY "last_name" ASC;


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
	WHERE date_part('year',hire_date) = '1986'
ORDER BY "hire_date" ASC, "last_name" ASC;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept.dept_no,
	dept.dept_name,
	emp.emp_no,
	emp.last_name,
	emp.first_name
FROM employees AS emp
INNER JOIN dept_manager ON emp.emp_no = dept_manager.emp_no
INNER JOIN departments AS dept ON dept.dept_no = dept_manager.dept_no
ORDER BY dept_name ASC, last_name ASC, first_name ASC;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
ORDER BY dept_name ASC, last_name ASC, first_name ASC;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT * FROM departments;
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
	WHERE dept.dept_no = 'd007'
ORDER BY emp.last_name ASC, emp.first_name ASC;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
	WHERE dept.dept_no IN ('d007', 'd005')
ORDER BY emp.last_name ASC, emp.first_name ASC;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS "# of Employees"
FROM employees
GROUP BY last_name
ORDER BY "# of Employees" DESC;