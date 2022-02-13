-- Retrieve emp_no, first_name, and last_name columns from the Employees table.
-- Retrieve the title, from_date, and to_date columns from the Titles table. 
-- Create a new table using the INTO clause.
-- Join both tables on the primary key.
-- Filter the data on the birth_date column to retrieve the employees who were born between
    -- 1952 and 1955. Then, order by the employee number.

SELECT e.emp_no, first_name, last_name,
    titles.title,
    titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, last_name DESC;


    -- Copy the query from the starter_code and add to this file.

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
    title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no ASC;


    -- Write another query in the challenge_sql file to retrieve the number of employees by
        -- their most recent job title who are about to retire. 
    -- First, retrieve the number from the Unique Titles table.
    -- Then, create a Retiring Titles table to hold the required information.
    -- Group the table by title, then sort the count column in descending order.

SELECT COUNT (unique_titles) count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;



-- Deliverable 2:
    -- Write a query to create a Mentorship Eligibility table that holds the employees who 
        -- are eligible to participate in a mentorship program. 
            -- Retrieve the emp_no, first_name, last_name, and birth_date columns from the 
                -- Employees table.
            -- Retrieve the from_date and to_date columns from the Department Employee table.
            -- Retrieve the title column from the Titles table. 
            -- Use a DISTINCT ON statement to retrieve the first occurrence of the employee 
                -- number for each set of rows defined by the ON() clause. 
            -- Create a new table using the INTO clause.
            -- Join the Employees and Department Employee tables on the primary key.
            -- Join the Employees and Titles tables on the primary key.
            -- Filter the data on the to_date column to all the current employees, then filter
                -- the data on the birth_date columns to get all the employees whose birth
                -- dates are between 01-01-1965 and 12-31-1965.
            -- Order the table by the employee number.

SELECT DISTINCT ON (emp_no) 
    e.emp_no, 
    first_name, 
    last_name, 
    birth_date,
    dept_emp.from_date,
    dept_emp.to_date, 
    titles.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp ON e.emp_no = dept_emp.emp_no
JOIN titles ON e.emp_no = titles.emp_no
WHERE dept_emp.to_date = '9999-01-01'
    AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
