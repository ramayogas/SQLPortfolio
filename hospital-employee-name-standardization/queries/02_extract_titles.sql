-- Name Cleaning
SELECT TRIM(full_name) AS clean_name
FROM employees;

-- Split Name
SELECT * FROM employees WHERE profession_id = 11;