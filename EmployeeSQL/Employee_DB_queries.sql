select * from departmentemployee;
select * from departmentmanager;
select * from departments;
select * from employees;
select * from salaries;
select * from titles; 

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from salaries as s
join employees as e
on e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees 
where hire_date like '%1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from employees as e
join departmentmanager as dm
	on e.emp_no = dm.emp_no
	join departments as d
	on dm.dept_no = d.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select d.dept_name, de.emp_no, e.last_name, e.first_name
from employees as e
join departmentemployee as de
	on e.emp_no = de.emp_no
	join departments as d
	on de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees as e
where last_name like 'B%' and first_name = 'Hercules';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join departmentemployee as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
where de.dept_no in
(
	select dept_no
	from departments
	where dept_name = 'Sales');


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join departmentemployee as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
where de.dept_no in
(
	select dept_no
	from departments
	where dept_name in
	('Sales', 'Development')
);

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select e.last_name, count(e.last_name)as "Count of Last Name"
from employees as e
group by e.last_name
order by "Count of Last Name" desc;