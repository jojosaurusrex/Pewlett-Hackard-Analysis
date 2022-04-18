-- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- WHERE _______
-- ORDER BY _____, _____ DESC;


--title FROM titles
--to_date FROM titles --> specify '9999-01-01'

SELECT DISTINCT ON (title) title, 
e.emp_no,
e.first_name,
e.last_name,
from_date,
to_date
--INTO nameyourtable
FROM titles
	INNER JOIN employees AS e
		ON (e.emp_no = titles.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY title, e.birth_date, e.emp_no DESC;

SELECT e.emp_no,
e.first_name,
e.last_name,
titles.title,
titles.from_date,
titles.to_date
--INTO retirement_titles
FROM employees AS e
	INNER JOIN titles
		ON (e.emp_no = titles.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (rt.title) rt.title,
e.emp_no,
e.first_name,
e.last_name
--INTO nameyourtable
FROM retirement_titles AS rt
	INNER JOIN employees AS e
		ON (e.emp_no = rt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY rt.title, e.birth_date, e.emp_no DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
rt.title
--INTO unique_titles
FROM retirement_titles AS rt
	INNER JOIN employees AS e
		ON (e.emp_no = rt.emp_no)
WHERE (rt.to_date = '9999-01-01')
ORDER BY e.emp_no ASC, rt.to_date DESC;

--Copy Statement: https://stackoverflow.com/questions/66493564/pgadmin-exporting-text-column-to-csv-file

SELECT COUNT (ut.title), ut.title
--INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;

--Start of Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (de.emp_no = e.emp_no)
	INNER JOIN titles AS ti
		ON (ti.emp_no = e.emp_no)
WHERE(de.to_date = '9999-01-01') --to_date --> current employees, correct?
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;











