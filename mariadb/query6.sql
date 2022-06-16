SELECT
    t.title AS titulo,
    e.hire_date AS data_contratacao,
    e.first_name AS nome,
    e.last_name AS sobrenome,
    e.birth_date AS data_nascimento
FROM
    employees e
    INNER JOIN titles t ON e.emp_no = t.emp_no
ORDER BY
    e.emp_no,
    e.hire_date DESC;