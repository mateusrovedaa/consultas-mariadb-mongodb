SELECT
    d.dept_no,
    e.gender,
    AVG(s.salary) AS media_salario,
    (
        SELECT
            AVG(time_in_company) / 365
        FROM
            (
                SELECT
                    SUM(DATEDIFF(s.to_date, s.from_date)) AS time_in_company,
                    de.dept_no
                FROM
                    salaries s
                    INNER JOIN employees e ON s.emp_no = e.emp_no
                    INNER JOIN dept_emp de ON de.emp_no = e.emp_no
                WHERE
                    s.from_date >= '1990-01-01'
                    AND s.to_date <= '1999-12-31'
                GROUP BY
                    e.emp_no
            ) AS time_in_company
        WHERE
            time_in_company.dept_no = d.dept_no
    ) AS time_in_years
FROM
    employees e,
    dept_emp d,
    salaries s
WHERE
    e.emp_no = s.emp_no
    AND e.emp_no = d.emp_no
    AND s.from_date >= '1990-01-01'
    AND s.to_date <= '1999-12-31'
    AND e.gender = 'F'
GROUP BY
    d.dept_no
ORDER BY
    s.from_date ASC,
    d.dept_no ASC;