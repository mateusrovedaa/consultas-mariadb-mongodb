SELECT
    employees.first_name,
    departments.dept_name,
    employees.hire_date,
    SUM(salaries.salary)
FROM
    dept_manager
    INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
    INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
    LEFT JOIN salaries ON salaries.emp_no = employees.emp_no
GROUP BY
    employees.emp_no;