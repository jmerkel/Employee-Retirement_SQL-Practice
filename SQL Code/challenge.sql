-- Module 7 Challenge
---------------------
--GENERAL INFO

--Retirement Info = All Retiring Employees (Emp No, First Name, Last Name)
--Current EMP = All Current Retiring Employees (Emp No, First Name, Last Name, to_Date)
--Employee_Count_Department = TOTAL employee Count per department
--Emp_Info = Retiring Current Employee Information (Emp No, First Name, Last Name, Gender, Salary)

-- PART 1a
-- Number of titles retiring --> EmpNo, First Name, Last Name, Title, From Date, Salary
-- Need Empinfo & Titles (Retirement criteria was fulfilled in the lesson)
SELECT emp_info.emp_no,
	emp_info.first_name,
	emp_info.last_name,
	emp_info.salary,
	titles.title,
	titles.from_date
INTO retiring_titles
FROM emp_info
RIGHT JOIN titles
ON emp_info.emp_no = titles.emp_no;

--PART 1b
--Most Recent Titles * Partitioning
-- Descending order by date + frequency count of employee titles (# of Engineer, etc.)
-- DELETE NULL Rows
DELETE FROM retiring_titles 
WHERE (retiring_titles.emp_no IS NULL);

SELECT * FROM 
	(SELECT *, COUNT(*)
	OVER
		(PARTITION BY
			first_name,
		 	last_name
		 ) as count
	FROM retiring_titles) as tmp
	where tmp.count > 1

SELECT emp_no, first_name, last_name, salary, title, from_date 
INTO unique_titles FROM
	(SELECT emp_no, first_name, last_name, salary, title, from_date, ROW_NUMBER() OVER
(PARTITION BY (first_name, last_name) ORDER BY from_date DESC) AS rn 
	FROM retiring_titles
	)tmp2 WHERE rn = 1;

SELECT COUNT (emp_no), title
INTO retiring_titles_count
FROM unique_titles
GROUP BY title
ORDER BY title;

--PART 1c
-- Who's ready for a mentor
-- New table with Emp No, First/Last Name, Title, from_date, to_date 
-- Birthdate should be within 1965 (only current employees) + only current
-- Need Employees (Emp, name, birthdate) + Title (title, from, to) 
SELECT 
	employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	titles.title, 
	titles.from_date, 
	titles.to_date
INTO mentorship
FROM employees
INNER JOIN titles 
ON employees.emp_no = titles.emp_no
WHERE titles.to_date = '9999-01-01' AND
employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY employees.emp_no ASC;