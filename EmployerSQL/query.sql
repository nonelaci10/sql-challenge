---Selecting the tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp_no, last_name, first_name, gender 
FROM employees
JOIN salaries
on employees.emp_no = salaries.emp_no
;

------------------------------------
--List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >='19860101'
AND hire_date < '19870101';

------------------------------------
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, departments.dept_name,departments.emp_no,
employees.last_name,employees.first_name,departments.from_date,departments.to_date 

	FROM dept_manager LEFT JOIN employees
		ON departments.emp_no = e.emp_no
	JOIN departments
		ON departments.dept_no = d.dept_no;

SELECT * 
FROM dept_manager_info;


------------------------------------
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_manager.dept_no, departments.dept_name, departments.emp_no,
employees.last_name,employees.first_name,dept_manager.from_date, dept_manager.to_date 

	FROM dept_manager 
    LEFT JOIN employees
		ON dept_manager.emp_no = e.emp_no
	JOIN departments AS d
		ON departments.dept_no = departments.dept_no;

SELECT * 
FROM dept_manager_info;

------------------------------------
--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

------------------------------------
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees JOIN dept_emp 
ON employees.emp_no = department.emp_no
JOIN departments
ON department.dept_no = departments.dept_no
where dept_name = 'Sales';

SELECT * FROM sales_employee ;



------------------------------------
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name, em.first_name,d.dept_name
FROM employees AS em JOIN dept_emp AS demp
ON e.emp_no = demp.emp_no
JOIN departments AS dp
ON demp.dept_no = dm.dept_no
where dept_name = 'Development'
OR dept_name = 'Sales';

SELECT * FROM employee_sales_development;

------------------------------------
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,COUNT(last_name) AS "same last name"
FROM employees 
GROUP BY last_name
order by "same last name" DESC;

SELECT * FROM same_last_name;

