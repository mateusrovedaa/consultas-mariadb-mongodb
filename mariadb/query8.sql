SELECT
    d.dept_name,
    t.title,
    MAX(s.salary) AS maior_salario,
    MIN(s.salary) AS menor_salario
FROM
    employees e
    INNER JOIN salaries s ON e.emp_no = s.emp_no
    INNER JOIN titles t ON e.emp_no = t.emp_no
    INNER JOIN dept_emp de ON e.emp_no = de.emp_no
    LEFT JOIN departments d ON d.dept_no = de.dept_no
GROUP BY
    t.title;