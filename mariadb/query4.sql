SELECT
    titles.title,
    COUNT(employees.emp_no) AS num_funcionarios,
    SUM(salaries.salary) AS salario
FROM
    titles,
    salaries,
    employees
WHERE
    employees.emp_no = titles.emp_no
    AND employees.emp_no = salaries.emp_no
GROUP BY
    titles.title
ORDER BY
    salario DESC;