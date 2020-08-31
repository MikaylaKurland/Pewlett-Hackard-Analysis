
--SELECT 
--	e.emp_no,
--	e.first_name,
--	e.last_name,
--	ttl.title, 
--	ttl.from_date,
--	ttl.to_date
--INTO retirement_titles
--FROM employees as e
--INNER JOIN titles AS ttl
--ON (e.emp_no = ttl.emp_no)
--WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (rt.emp_no) rt.to_date,
--	rt.emp_no,
--	rt.first_name,
--	rt.last_name,
--	rt.title
--INTO unique_titles 
--FROM retirement_titles as rt
--ORDER BY rt.emp_no ASC, rt.to_date DESC;

--SELECT * FROM unique_titles;

--SELECT title,
--COUNT (*) AS Number_of_Employees
--INTO retiring_titles
--FROM unique_titles
--GROUP BY title
--ORDER BY Number_of_Employees DESC;


SELECT 
DISTINCT ON(e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ttl.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ttl
ON (e.emp_no = ttl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, e.emp_no ASC;