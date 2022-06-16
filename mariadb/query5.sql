SELECT
    e.first_name AS nome,
    e.last_name AS sobrenome,
    t.title,
    s.salary,
    t.to_date AS data_inicio,
    CASE
        WHEN t.from_date IS NOT NULL THEN t.from_date
    END AS data_saida,
    d.dept_name
FROM
    employees e,
    salaries s,
    dept_emp de,
    departments d,
    titles t
WHERE
    e.emp_no = s.emp_no
    AND e.emp_no = t.emp_no
    AND e.emp_no = de.emp_no
    AND de.dept_no = d.dept_no
    AND t.to_date >= '1986-01-01'
    AND t.title = 'Senior Engineer';