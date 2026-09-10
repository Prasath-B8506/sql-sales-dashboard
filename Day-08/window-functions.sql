-- Day 08: SQL Window Functions
-- SQL Learning Journey

-- 1. Average salary within each department
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_avg
FROM employees;


-- 2. ROW_NUMBER() - rank employees within each department
SELECT
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- 3. RANK() - rank employees within each department
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- 4. DENSE_RANK() - rank employees within each department
SELECT
    name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- 5. Highest-paid employee in each department
WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
)
SELECT
    name,
    department,
    salary
FROM ranked_employees
WHERE department_rank = 1;


-- 6. Second-highest salary in each department
WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
)
SELECT
    name,
    department,
    salary
FROM ranked_employees
WHERE department_rank = 2;


-- 7. Department total and average salary
SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average
FROM employees;


-- 8. Running total of salary
SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        ORDER BY id
    ) AS running_total
FROM employees;


-- 9. Previous employee salary using LAG()
SELECT
    name,
    department,
    salary,
    LAG(salary) OVER (
        ORDER BY id
    ) AS previous_salary
FROM employees;


-- 10. Next employee salary using LEAD()
SELECT
    name,
    department,
    salary,
    LEAD(salary) OVER (
        ORDER BY id
    ) AS next_salary
FROM employees;


-- 11. Salary difference from previous employee
SELECT
    name,
    department,
    salary,
    LAG(salary) OVER (
        ORDER BY id
    ) AS previous_salary,
    salary - LAG(salary) OVER (
        ORDER BY id
    ) AS salary_difference
FROM employees;


-- 12. Rank all employees by salary
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
