-- Create a brand new schema
CREATE DATABASE IF NOT EXISTS interview_queries_practice;

-- Switch to it
USE interview_queries_practice;

-- Drop leftovers in case you re-run
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS students;

-- Departments
CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance');

-- Employees
CREATE TABLE employees (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  salary DECIMAL(10,2),
  department_id INT,
  manager_id INT NULL,
  job_role VARCHAR(100),
  job_title VARCHAR(100),
  join_date DATE,
  start_date DATE,
  CONSTRAINT fk_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (id, name, salary, department_id, manager_id, job_role, job_title, join_date, start_date) VALUES
(1,  'Alice Johnson',    220000.00, 1, NULL, 'VP Engineering',  'VP Eng',  '2015-04-01', '2015-04-01'),
(2,  'Bob Patel',        150000.00, 1, 1,    'Backend',         'Senior Eng','2018-09-15', '2018-09-15'),
(3,  'Charlie Zhang',    150000.00, 1, 1,    'Backend',         'Senior Eng','2019-01-10', '2019-01-10'),
(4,  'Dana S.',          90000.00,  1, 2,    'Frontend',        'Eng'      ,'2020-07-03', '2020-07-03'),
(5,  'Evan Gupta',       60000.00,  2, NULL, 'HR Manager',      'Manager'  ,'2017-03-20', '2017-03-20'),
(6,  'Fiona Lee',        55000.00,  2, 5,    'Recruiter',       'Recruiter','2021-08-01', '2021-08-01'),
(7,  'Gaurav Singh',     120000.00, 3, NULL, 'Head Sales',      'Head Sales','2016-06-10','2016-06-10'),
(8,  'Hannah Brown',     115000.00, 3, 7,    'Account Exec',    'AE'       ,'2019-11-25', '2019-11-25'),
(9,  'Isha Kapoor',      115000.00, 3, 7,    'Account Exec',    'AE'       ,'2020-02-14', '2020-02-14'),
(10, 'John Doe',         40000.00,  4, NULL, 'Accountant',      'Accountant','2022-05-10','2022-05-10'),
(11, 'Kate Moss',        45000.00,  4, 10,   'Fin Ops',         'Analyst'  ,'2023-01-16', '2023-01-16'),
(12, 'Liam Turner',      150000.00, 1, 1,    'Backend',         'Senior Eng','2018-09-15', '2018-09-15'),
(13, 'Maya Sharma',      95000.00,  1, 2,    'QA',              'QA Lead'  ,'2016-12-05', '2016-12-05'),
(14, 'Nikhil Rao',       60000.00,  3, 7,    'Sales Ops',       'Ops'      ,'2021-03-03', '2021-03-03'),
(15, 'Olivia Perez',     90000.00,  1, 2,    'Frontend',        'Eng'      ,'2019-07-01', '2019-07-01'),
(16, 'Paul White',       150000.00, 3, 7,    'Solution Eng',    'Senior SE' ,'2016-09-21','2016-09-21'),
(17, 'Quinn Miller',     30000.00,  2, 5,    'Intern',          'Intern'   ,'2024-06-01', '2024-06-01'),
(18, 'Ravi Khanna',      115000.00, 3, 7,    'Account Exec',    'AE'       ,'2019-11-25', '2019-11-25'),
(19, 'Sameer Khan',      60000.00,  3, 7,    'Sales Ops',       'Ops'      ,'2020-10-10', '2020-10-10'),
(20, 'Tara Singh',       150000.00, 4, 10,   'Finance Lead',    'Lead'     ,'2014-01-01', '2014-01-01');

-- Clone for singular 'employee'
CREATE TABLE employee LIKE employees;
INSERT INTO employee SELECT * FROM employees;

-- Sales
CREATE TABLE sales (
  id INT PRIMARY KEY AUTO_INCREMENT,
  sale_date DATE,
  amount DECIMAL(10,2)
);

INSERT INTO sales (sale_date, amount) VALUES
('2024-07-01', 1200.00),
('2024-07-10', 800.00),
('2024-08-05', 5000.00),
('2024-09-12', 600.00),
('2024-10-01', 3000.00),
('2024-11-20', 4500.00),
('2024-12-25', 7000.00),
('2025-01-03', 2500.00),
('2025-02-14', 1900.00),
('2025-03-18', 4200.00),
('2025-04-22', 3600.00),
('2025-05-30', 5100.00),
('2025-06-11', 4700.00),
('2025-07-05', 6200.00),
('2025-08-09', 3300.00);

-- Students
CREATE TABLE students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  student_name VARCHAR(100),
  score INT
);

INSERT INTO students (student_name, score) VALUES
('Aman', 95),
('Bala', 88),
('Chitra', 95),
('Deepak', 76),
('Esha', 88),
('Faraz', 92),
('Gita', 76),
('Hari', 65),
('Isha', 92),
('Jay', 80);

-- Create Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    EmpID INT,
    ProjectName VARCHAR(50) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (EmpID) REFERENCES employees(id)
);

-- Insert sample data
INSERT INTO Projects (ProjectID, EmpID, ProjectName, StartDate, EndDate) VALUES
(201, 1, 'Alpha', '2023-01-01', '2023-06-30'),
(202, 3, 'Beta', '2022-07-01', NULL),
(203, 2, 'Gamma', '2023-03-15', '2023-08-10'),
(204, 1, 'Delta', '2024-01-01', NULL),
(205, 6, 'Epsilon', '2022-11-01', '2023-03-01'),
(206, 6, 'Zeta', '2023-05-01', NULL),
(207, 9, 'Theta', '2019-05-05', '2020-01-01');

-- Useful indexes
CREATE INDEX idx_emp_dept ON employees (department_id);
CREATE INDEX idx_emp_salary ON employees (salary);
CREATE INDEX idx_sales_date ON sales (sale_date);



-- ================================================================
-- 1. Find the 4th highest salary from a table.
select * from (
	select * , 
		dense_rank() over(order by salary desc) as rnk
	from employees
) ranked
where rnk = 4;

-- 5. Retrieve duplicate records from a table without using the DISTINCT keyword.
select * from(
	select *, 
		count(salary) over(partition by salary) as rnk
	from employees
)ranked
where rnk > 1;

-- 7. Fetch alternate records from a table (odd/even rows).
select * from(
	select * ,	
		row_number() over(order by id) as rno
	from employees
)t
where  mod(rno, 2) = 0;

-- 14. Find all employees who started after Jan 1, 2020, but before Jan 1, 2023.
select * from employees
where start_date > '2020-01-01' and start_date < '2023-01-01'
order by start_date;

-- 19. Find all tables that have specific column names in a database.
select table_name from INFORMATION_SCHEMA.COLUMNS
where column_name = 'id' and table_schema = 'interview_queries_practice';

-- 21. Concatenate strings in MySQL.
SELECT concat(job_role, " ", name) as joined
from employees;

-- 22. Retrieve unique values from a column without using the DISTINCT keyword.
select salary from employees
group by salary order by salary asc;

-- 24. Create a copy of a table, including both structure and data, without using backup utilities.

-- 25. Convert a UNIX timestamp into a readable date format.

-- 27. Get the length of the string in a column.

-- 28. Delete all records from a table without deleting the table itself.

-- 30. Convert a data type of a column in a table.

-- 31. Retrieve the total count of rows, but only count each distinct value in a column once.
select count(distinct salary) from employees;

-- 32. Find the three most frequent values in a column along with their counts.
select salary, count(salary) from employees
group by salary
order by count(salary) desc limit 3;

-- 33. Get the monthly sales amount for the last 12 months.
select month(sale_date) as month, year(sale_date) as year, sum(amount) as sales_amount
from sales group by month(sale_date), year(sale_date)
order by  month(sale_date) desc, year(sale_date) desc;

-- 34. Find employees who have managers with a salary greater than $100,000.
select e1.name as employee_name, e1.manager_id as manager_id, e2.name as manager_name, e2.salary as manager_salary
from employees e1 inner join
employees e2 on e1.manager_id = e2.id
where e2.salary > 100000;

-- 35. Get the rank of students based on their scores in descending order.
select student_name, dense_rank() over(order by score desc) as rank_score
from students;

-- 36. Find the employees who earn more than the average salary in their respective departments.
select e1.name, e1.salary, e1.department_id
from employees e1 where e1.salary > (
	select avg(e2.salary) from employees e2
    where e2.department_id = e1.department_id
) order by e1.department_id;

-- 37. Retrieve all pairs of students who have the same scores.
select s1.student_id, s1.student_name, s1.score, s2.student_id, s2.student_name, s2.score
from students s1 inner join students s2
	on s1.score = s2.score 
where s1.student_id < s2.student_id
order by s1.student_id;

-- 38. Retrieve the last 7 days' records, excluding weekends.
 SELECT * 
FROM table_name 
WHERE date_column BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE() 
AND DAYOFWEEK(date_column) NOT IN (1,7);

-- 39. Find the employees who have the same job roles in different departments.
select e1.name, e1.job_role, e1.department_id, e2.department_id
from employees e1 inner join employees e2	
	on e1.job_role = e2.job_role
where e1.department_id != e2.department_id and e1.id < e2.id;

-- 40. Retrieve the total sales amount, but replace null values with zeros.

-- 41. Retrieve the name and salary of the top 3 earning employees.
select name, salary from(
	select *, dense_rank() over (order by e2.salary desc) as rnk
    from employees e2
)t where rnk between 1 and 3;

-- *42. Find employees who earn above the average salary of their department AND their department's average salary is above the company's average.
select department_id, name, salary, dept_avg_salary, comp_avg_salary from (
	select e2.*, 
		avg(salary) over(partition by e2.department_id) as dept_avg_salary, 
        avg(salary) over() as comp_avg_salary
	from employees e2
)t
where salary > dept_avg_salary and dept_avg_salary > comp_avg_salary;

-- *43. Retrieve departments that have more employees than the average number of employees across all departments.
select department_id 
from employees 
group by department_id 
having count(id) > (
	select avg(r.employee_count) 
    from (
		select count(e.id) as employee_count 
        from employees e 
        group by e.department_id
    )r
);

-- *44. Find the second highest departmental average salary. 
with dept_avg as(
	select department_id, avg(salary) as avg_salary
    from employees 
    group by department_id
)
select department_id, avg_salary from(
	select department_id, avg_salary, 
		dense_rank() over(order by avg_salary desc) as rnk
	from dept_avg
)t where rnk = 2;

-- 45. Retrieve the highest earning employee from each department.
select name, salary, department_id, job_role from(
	select *, 
		dense_rank() over(partition by department_id order by salary desc) as rnk
	from employees
)t where rnk = 1;

-- 46. Find departments that have the same average salary.
with dept_avg as(
	select department_id, avg(salary) as avg_salary
    from employees 
    group by department_id
)
select d1.department_id as dept1, d2.department_id as dept2, d1.avg_salary
from dept_avg d1 
inner join dept_avg d2
	on d1.avg_salary = d2.avg_salary
where d1.department_id != d2.department_id 
and d1.department_id < d2.department_id;

-- *47. Find employees whose salary is above the median salary of the company.
select name, salary from employees where salary > (
	select avg(salary) from (
		SELECT * ,
			row_number() OVER(order by salary) as rnk,
			count(*) over() as cnt
		from employees
	)t where t.rnk in (floor((t.cnt+1)/2), ceil((t.cnt+1)/2))
);


with ordered as(
	select salary, 
		row_number() over(order by salary) as rnk,
        count(*) over() as cnt
	from employees
),
median_salary as(
	select avg(salary) as median_salary
    from ordered 
    where rnk in (floor((cnt+1)/2), ceil((cnt+1)/2))
)
select e.id, e.name, e.job_title, e.salary, m.median_salary
from employees e
inner join median_salary m
	on e.salary > m.median_salary;

-- 48. Retrieve the department names which have employees with salaries in the top 10% of all salaries.
SELECT * FROM (
	SELECT * ,
		PERCENT_RANK() OVER(ORDER BY salary DESC) AS pct_rnk
	FROM employees 
	
)t WHERE t.pct_rnk <= 0.10;

-- 49. Find the average salary of the departments which have more than five employees earning above the overall average salary.
SELECT department_id, AVG(salary)
FROM (
	SELECT id, department_id,salary
	FROM employees 
	WHERE salary > (
		SELECT AVG(salary) 
		FROM employees
	)
)T GROUP BY department_id 
HAVING COUNT(id) > 5;

-- 50. Retrieve employees who have the same name as their manager.
select e1.id as emp_id, e1.name as emp_name, e2.name as manager_name
from employees e1 inner join employees e2
	on e1.manager_id = e2.id
where e1.name = e2.name;

-- *51. Determine if any department's average salary is higher than the maximum salary in another department.
with dept_max as (
	select department_id, salary from(
			select department_id, salary,
				dense_rank() over(partition by department_id order by salary desc) as rnk
			from employees
	)t where rnk = 1
), dept_avg as (
	select department_id, avg(salary) as avg_salary
    from employees 
    group by department_id
)
select a.department_id, a.avg_salary, b.salary as max_salary
from dept_max b 
inner join dept_avg a
	on a.avg_salary > b.salary
   and a.department_id <> b.department_id;

-- 52. Find the employee who has the closest salary to the company's median salary but doesn't earn the median salary.
	-- SUBQUERY WAY 
SELECT id, name, salary 
FROM employees 
WHERE salary <> (
	SELECT AVG(t.salary) FROM (
		SELECT * , 
			ROW_NUMBER() OVER(ORDER BY salary ASC) AS rnk,
			COUNT(*) OVER() AS cnt
		FROM employees
	)t WHERE t.rnk IN (FLOOR((t.cnt+1)/2), CEIL((t.cnt+1)/2))
);
	-- WINDOW FUNCTION WAY
with ordered_salary as (
    select id, salary,
           row_number() over(order by salary) as rnk,
           count(*) over() as cnt
    from employees
), median_salary as (
    select avg(salary) as median_val
    from ordered_salary 
    where rnk in (floor((cnt+1)/2), ceil((cnt+1)/2))
)
select e.id, e.name, e.salary, m.median_val, abs(e.salary - m.median_val) as diff
from employees e
cross join median_salary m
where e.salary <> m.median_val
order by abs(e.salary - m.median_val);

-- 53. Retrieve the departments where the total salary expenditure exceeds the average total salary expenditure across all departments.
with dept_total as (
    select department_id, sum(salary) as total_salary
    from employees
    group by department_id
)
select d.department_id, d.total_salary
from dept_total d
where d.total_salary > (
	select avg(total_salary) from dept_total
);

-- 55. Identify departments that have less than the company-wide median number of employees.
	-- Using Subquery
SELECT s.department_id 
FROM (
	SELECT department_id, COUNT(*) AS emp_count
	FROM employees
	GROUP BY department_id
)s
WHERE s.emp_count < (
	SELECT AVG(emp_count) AS median_emp_count
    FROM(
		SELECT r.* , 
			ROW_NUMBER() OVER(ORDER BY emp_count) AS rnk,
            COUNT(*) OVER() as cnt
		FROM (
			SELECT department_id, COUNT(*) AS emp_count
			FROM employees
			GROUP BY department_id
        )r
	)t WHERE t.rnk IN (FLOOR((t.cnt+1)/2), CEIL((t.cnt+1)/2))
);
	-- Using CTE's
with dept_group as (
    select department_id, count(*) as cnt
    from employees
    group by department_id
),
ordered_dept as (
    select department_id, cnt,
           row_number() over(order by cnt) as rnk,
           count(*) over() as total_depts
    from dept_group
),
median_emp_dept as (
    select avg(cnt) as median_emp
    from ordered_dept
    where rnk in (floor((total_depts+1)/2), ceil((total_depts+1)/2))
)
select b.department_id, b.cnt, a.median_emp
from dept_group b
cross join median_emp_dept a
where b.cnt < a.median_emp;                                              

-- 56. Get the most common job title among employees who earn above the company average.
select job_title, count(job_title) as job_title_count
from employees
where salary > (
    select avg(salary) as comp_avg
	from employees
)group by job_title
order by job_title_count desc;

-- 57. Identify employees who earn more than the average salary in both their department and the company.
with dept_avg_sal as (
	select department_id, avg(salary) as dept_avg_salary
    from employees 
    group by department_id
)
select e.name, e.salary, e.department_id, d.dept_avg_salary
from employees e 
inner join dept_avg_sal d 
	on e.department_id = d.department_id
where e.salary > d.dept_avg_salary
and e.department_id = d.department_id;

-- 58. Retrieve the month (in numbers) with the highest total sales.
select month(sale_date), sum(amount)
from sales
group by month(sale_date)
order by sum(amount) desc limit 1;

-- 59. Get the department that has the maximum difference between the highest and lowest salaries.
select department_id, max_salary, min_salary, max_salary - min_salary as difference
from (
	select department_id, max(salary) as max_salary, min(salary) as min_salary
	from employees 
	group by department_id
)t order by difference desc ;

-- *60. Find the employee who earns the median salary in each department.
	-- Case-I
select e.id, e.name, e.salary, e.department_id, r.median_dept_salary
from employees e inner join (
	select t.department_id, avg(t.salary) as median_dept_salary
	from (
		select department_id, salary, 
			row_number() over(partition by department_id order by salary) as rnk,
			count(*) over(partition by department_id) as cnt
		from employees
	)t
	where t.rnk in (floor((t.cnt+1)/2.0), ceil((t.cnt+1)/2.0))
	group by t.department_id
)r on e.department_id = r.department_id
where e.salary = r.median_dept_salary;

    -- Case-II
select e.id, e.name, e.salary, e.department_id, r.median_dept_salary
from employees e inner join (
	select t.department_id, t.salary as median_dept_salary
	from (
		select department_id, salary, 
			row_number() over(partition by department_id order by salary) as rnk,
			count(*) over(partition by department_id) as cnt
		from employees
	)t
	where t.rnk in (floor((t.cnt+1)/2.0), ceil((t.cnt+1)/2.0))
)r on e.department_id = r.department_id
where e.salary = r.median_dept_salary;

-- *61. Retrieve employees who earn more than their respective department's median salary.
select e.id, e.name, e.department_id, r.department_id, e.salary, r.median_dept_salary
from employees e inner join (
	select t.department_id, avg(t.salary) as median_dept_salary from (
		select department_id, salary,
			row_number() over(partition by department_id order by salary) as rnk,
			count(*) over(partition by department_id) as cnt
		from employees
	)t
	where rnk in (floor((t.cnt+1)/2), ceil((t.cnt+1)/2))
	group by t.department_id
)r on e.department_id = r.department_id
where e.salary > r.median_dept_salary;

-- 62. Identify the departments where the minimum salary is greater than the maximum salary of at least one other department.
with min_dept_sal as (
	select department_id, min(salary) as min_sal
    from employees 
    group by department_id
), max_dept_sal as (
	select department_id, max(salary) as max_sal
    from employees
    group by department_id
)
select a.department_id, a.min_sal
from min_dept_sal a cross join max_dept_sal b
	on a.min_sal > b.max_sal;

-- 63. Find employees whose salary ranks in the top 3 within their department.
select id, name from (
	select *, 
		dense_rank() over(partition by department_id order by salary desc) as rnk
	from employees
)t where rnk <= 3;

-- 64. Identify the department with the most diverse salary distribution.
select department_id, max(salary) - min(salary) as difference
from employees 
group by department_id
order by difference desc limit 1;

-- 65. Retrieve employees who do not have the lowest salary in their department but earn less than the department average.
select e.id, e.name 
from employees e inner join (
	select department_id, min(salary) as min_sal, avg(salary) as dept_avg_sal
	from employees
	group by department_id
)t on e.department_id = t.department_id
where e.salary > t.min_sal and e.salary < t.dept_avg_sal;

-- 66. Determine departments with average salary close to the company's median salary (difference < 1000).
select department_id, avg(salary)
from employees 
group by department_id
having abs(avg(salary) - (	
    select avg(salary) from (
		select department_id, salary,
			row_number() over(order by salary) as rnk,
			count(*) over() as cnt
		from employees
	)t where rnk in (floor((cnt+1)/2), ceil((cnt+1)/2))
  )
) < 1000;

-- 67. Find the departments where the total number of employees is above the company's average.
select department_id
from employees
group by department_id
having count(id) > (
	select avg(employee_count) from (
		select count(id) as employee_count
		from employees
		group by department_id
	) as sub_query
);

-- 68. Identify employees who earn more than the second highest earner in their respective department.
	-- THIS IS ALSO RIGHT BUT USING JOINS TO FIND 1st EARNER IN A DEPARTMENT IS INEFFICIENT
select distinct(e.id), e.name, e.department_id
from employees e inner join (
	select department_id, salary from (
		select department_id, salary,
			dense_rank() over(partition by department_id order by salary desc) as rnk
		from employees
	)t where rnk = 2
) r on e.department_id = r.department_id
where e.salary > r.salary;

	-- MORE EFFICIENT WAY
select id, name, salary from (
	select e.id, e.name, e.salary, 
		dense_rank() over(partition by department_id order by salary desc) as rnk
	from employees e
)e where rnk = 1;

-- 69. Find the departments where the top earner makes at least twice as much as the second top earner.
with second_top_earner as (
	select department_id, salary
    from (
		select department_id, salary,
			dense_rank() over(partition by department_id order by salary desc) as rnk
		from employees
    )t where rnk = 2
), top_earner as (
	select department_id, salary
    from (
		select department_id, salary,
			dense_rank() over(partition by department_id order by salary desc) as rnk
		from employees
    )t where rnk = 1
)
select e.department_id from second_top_earner e
inner join top_earner s
	on e.department_id = s.department_id
where s.salary > 2*e.salary;

-- 70. Retrieve employees who have been in the company longer than the average tenure of their department managers.
select e.id, e.name 
from employees e inner join (
	select department_id, avg(datediff(curdate(), start_date)) as avg_manager_tenure from ( 
		select distinct e1.id, e1.department_id, e1.start_date
		from employees e inner join employees e1
			on e.manager_id = e1.id
	)t group by department_id
)r on e.department_id = r.department_id
where datediff(curdate(), e.start_date) > r.avg_manager_tenure;

-- 71. Identify the department with the smallest gap between the lowest and average salary.
select department_id, abs(avg_salary-min_salary) as min_gap from (
	select department_id, avg(salary) as avg_salary, min(salary) as min_salary
	from employees
	group by department_id
)t order by min_gap limit 1;

-- 72. Identify employees who earn below the average salary of their peers who joined in the same year.
select e.id, e.name
from employees e
where e.salary < (
    select avg(e2.salary)
    from employees e2
    where year(e2.join_date) = year(e.join_date)
);

-- *73. Retrieve the employee who has the closest salary to their department's median but isn't the median earner.
select department_id, avg(salary) from (
	select department_id, salary, 
		row_number() over(partition by department_id order by salary desc) as rnk,
		count(*) over(partition by department_id) as cnt
	from employees
)t where rnk in (floor((cnt+1)/2), ceil((cnt+1)/2))
group by department_id;

-- 74. Determine the departments whose average tenure is greater than the company average.
select department_id, avg(tenure) as avg_tenure from (
	select department_id, datediff(curdate(), join_date) as tenure
	from employees
)t group by department_id
having avg_tenure > (
	select avg(datediff(curdate(), join_date))
    from employees
);

-- 75. Identify departments where more than half of the employees earn above the company's median salary.
with count_emp_dept as (
	select department_id, count(id) as count_emp
    from employees 
    group by department_id 
)
select e1.department_id, e1.count_emp
from count_emp_dept e1 inner join (

	-- Calculate Employees Earns More Than Company Median Salary In Each Department
	select e.department_id, count(e.id) as emp_count
	from employees e
	where e.salary > (
    
		-- Calculate Company Median Salary
		select avg(salary) as comp_median_salary from (
			select salary, 
				row_number() over(order by salary) as rnk,
				count(*) over() as cnt
			from employees
		)t where rnk in (floor((cnt+1)/2), ceil((cnt+1)/2))
        
	) group by department_id
    
)e2 on e1.department_id = e2.department_id
where e2.emp_count > e1.count_emp/2;

-- 76. Find employees who are in the top 3 salaries of their department but not in the top 10 company-wide.
with top_three_dept_sal as (
	select id, department_id from (
		select id, department_id,
			dense_rank() over(partition by department_id order by salary desc) as rnk
		from employees
	)t2 where rnk <= 3
)
select * from top_three_dept_sal a inner join (
	select * from (
		select e.id, e.name, e.department_id, e.salary, 
			dense_rank() over(order by e.salary desc) as rnk
		from employees e
	)t1 where rnk > 10
)b on a.id = b.id and a.department_id = b.department_id;

-- 77. Identify employees whose salary is above the average salary of the top two departments (by avg salary).
select e.id, e.name, e.salary, e.department_id, e.job_title from employees e
where e.salary > (
	select avg(avg_dept_sal) from (
		select avg(salary) as avg_dept_sal from employees 
		group by department_id
		order by avg_dept_sal desc
		limit 2
	)t1
);

-- *78. Find employees who have a manager earning less than the lowest salary in their department.
select distinct e1.id, e1.name, e1.salary, e1.department_id
from employees e1 inner join employees e2
where e1.manager_id = e2.id and e2.salary < (
	select min(salary) from employees e3
    where e2.department_id = e3.department_id
    group by department_id
);
    
-- 79. Identify the department with the least difference between the top earner and the department average.
select department_id, max_salary-avg_salary as diff from (
	select department_id, max(salary) as max_salary, avg(salary) as avg_salary
	from employees
	group by department_id
)t order by diff limit 1;

-- 80. Retrieve employees who have the same salary rank in their department and in the company overall.

-- 81. Determine departments where the third-highest earner makes more than double the department's average.

-- 82. Find employees who have more direct reports than their manager.

-- 83. List all employees, their department name, and the projects they are working on.
select e.id, e.name, e.department_id, p.ProjectName
from employees e 
left join departments d on e.department_id = d.department_id
left join Projects p on e.id = p.EmpId;

-- *84. Find the total number of projects handled by each department(Show DeptName + ProjectCount.).
select count(p.projectID) as project_count, e.department_id
from employees e inner join projects p
	on e.id = p.EmpID
group by e.department_id;

-- 85. Show employees who are in the IT department and working on at least one project.
select e.id, p.projectID from employees e
inner join projects p on p.EmpID = e.id	
inner join departments d on e.department_id = d.department_id
where d.department_name = 'Engineering';

-- 86. Find departments with employees not working on any project.
select distinct d.department_id, d.department_name from employees e 
left join projects p on e.id = p.EmpID
left join departments d on e.department_id = d.department_id
where p.projectID is null;

-- 87. Show employee names along with their manager’s name and their department name.
select e1.name as employee_name, e2.name as manager_name, d.department_name as department_id
from employees e1 inner join employees e2 on e1.manager_id = e2.id 
inner join departments d on e1.department_id = d.department_id;

-- 88. List the names of employees along with the number of projects they are working on.
select e.name, count(p.projectID) as number_of_projects
from employees e left join projects p on e.id = p.EmpID
group by e.id;

-- *89. Find the department with the maximum number of employees working on projects.
select d.department_id, d.department_name, count(distinct e.id) as emp_count 
from employees e 
inner join projects p on e.id = p.EmpID
inner join departments d on e.department_id = d.department_id
group by d.department_id 
order by emp_count 
desc limit 1;

-- *90. For each department, list employees and their latest project (based on StartDate).
select t.id, t.proj_name, t.startDate, d.department_id from (
	select p.EmpID as id, p.ProjectName as proj_name, p.startDate, 
		row_number() over(partition by p.EmpID order by p.StartDate desc) as rnk
	from projects p
)t inner join employees e on e.id = t.id
inner join departments d on e.department_id = d.department_id
where t.rnk = 1;

-- 91. Show all projects along with employee name and department name, even if the project has no assigned employee.
select p.projectID, p.projectName, e.name, d.department_name
from projects p left join employees e on p.EmpID = e.id
left join departments d on d.department_id = e.department_id;

-- 92. List employees who are not in any department but are working on at least one project.
select distinct e.name from employees e
inner join projects p on e.id = p.EmpID
where e.department_id is null;

-- *93. Find employees who are working on projects across different departments. (e.g., employee belongs to IT but also has projects under employees from HR/Finance.)
SELECT DISTINCT e1.id, e1.name, e1.department_id
FROM Projects p1
JOIN Projects p2
    ON p1.ProjectID = p2.ProjectID
   AND p1.EmpID <> p2.EmpID
JOIN employees e1
    ON p1.EmpID = e1.id
JOIN employees e2
    ON p2.EmpID = e2.id
WHERE e1.department_id <> e2.department_id;