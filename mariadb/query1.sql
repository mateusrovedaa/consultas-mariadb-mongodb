SELECT
    employees.first_name,
    employees.birth_date,
    employees.hire_date,
    SUM(salaries.salary) as salary
FROM
    employees
    INNER JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE
    employees.hire_date >= '1985/01/01'
GROUP BY
    employees.emp_no
ORDER BY
    salary DESC,
    employees.hire_date DESC;