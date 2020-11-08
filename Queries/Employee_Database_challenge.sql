--Deliverable 1

SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

--Check results
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

--Check results
SELECT * FROM unique_titles;

--Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--Check table
SELECT * FROM retiring_titles;


--DELIVERABLE 2
SELECT e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01');
	 
--Check mentorship table
SELECT * FROM mentorship;


SELECT DISTINCT ON (me.emp_no) me.emp_no,
me.first_name,
me.last_name,
me.birth_date,
me.from_date,
me.to_date,
me.title
INTO mentorship_program
FROM mentorship as me
ORDER BY me.emp_no;

--Check table
SELECT * FROM mentorship_program;
SELECT * FROM retirement_by_dept;

--Deliverable 3 Query #1
SELECT SUM (count) FROM retiring_titles;

--Deliverable 3 Query #2
SELECT COUNT (emp_no) FROM mentorship_program;
