SELECT
    departments.dept_name,
    COUNT(dept_emp.emp_no) AS num_funcionarios,
    SUM(salaries.salary) AS salary,
    (
        SELECT
            MAX(salary)
        FROM
            (
                SELECT
                    SUM(s.salary) salary,
                    de.dept_no
                FROM
                    salaries s
                    INNER JOIN employees e ON s.emp_no = e.emp_no
                    INNER JOIN dept_emp de ON e.emp_no = de.emp_no
                GROUP BY
                    e.emp_no,
                    de.dept_no
                ORDER BY
                    null
            ) AS dept_salaries
        WHERE
            dept_salaries.dept_no = dept_emp.dept_no
    ) AS dept_greatest_salary
FROM
    departments,
    dept_emp,
    employees,
    salaries
WHERE
    dept_emp.to_date >= '9999-01-01'
    AND departments.dept_no = dept_emp.dept_no
    AND dept_emp.emp_no = employees.emp_no
    AND employees.emp_no = salaries.emp_no
GROUP BY
    departments.dept_no
ORDER BY
    num_funcionarios DESC;