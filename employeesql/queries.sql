-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
From 
	employees e
	JOIN salaries s on e.emp_no = s.emp_no
ORDER BY
	e.emp_no ASC;


-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	first_name, 
	last_name, 
	hire_date
From
	employees e
Where
	extract (year from hire_date) = 1986
Order By
	hire_date ASC, last_name ASC, first_name ASC;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	d.dept_manager_id, 
	d.dept_no, 
	d.emp_no, 
	e.last_name, 
	e.first_name
From
	dept_manager d
	JOIN employees e on d.emp_no = e.emp_no
Order By
	dept_manager_id ASC;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	de.dept_no
FROM
	employees e
	JOIN dept_emp de on e.emp_no = de.emp_no
ORDER BY
	e.emp_no ASC;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	e.first_name, 
	e.last_name, 
	e.sex
FROM
	employees e
Where
	first_name = 'Hercules'
	AND last_name like 'B%'
Order By
	last_name ASC;

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
	e.emp_no, 
	e.last_name, 
	e.first_name
From
	employees e 
	JOIN dept_emp d on e.emp_no = d.emp_no
	JOIN departments de on d.dept_no = de.dep_no
Where
	dept_name = 'Sales'
Order By
	last_name ASC, first_name ASC;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no, 
	e.last_name, 
	e.first_name,
	de.dept_name
From
	employees e 
	JOIN dept_emp d on e.emp_no = d.emp_no
	JOIN departments de on d.dept_no = de.dep_no
Where
	dept_name = 'Sales'
	Or dept_name = 'Development'
Order By
	last_name ASC, first_name ASC;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
	e.last_name, 
	count(e.last_name) as last_name_count
From
	employees e
Group By
	e.last_name
Order By
	last_name_count DESC
