ALTER TABLE employees ADD COLUMN clean_name TEXT;
ALTER TABLE employees ADD COLUMN title TEXT;

select full_name, clean_name, title from employees where profession_id = 1412
SELECT full_name, clean_name, title FROM employees

UPDATE employees
set title = NULL

-- UPDATE employees
-- SET clean_name = TRIM(
--     CASE
--         WHEN INSTR(full_name, ',') = 0 THEN full_name
--         --Before comma
--         WHEN LENGTH(TRIM(SUBSTR(full_name,1,INSTR(full_name,',') - 1))) AND full_name like '%.%' 
--         >
--         --After comma
--              LENGTH(TRIM(SUBSTR(full_name, INSTR(full_name,',')+1)))
--           THEN SUBSTR(full_name,1,INSTR(full_name,',') - 1)
--         ELSE SUBSTR(full_name, INSTR(full_name,',')+1)
--     END
-- )


-- UPDATE employees
-- SET clean_name = TRIM(
--     CASE
--         WHEN INSTR(full_name, ',') = 0 THEN full_name
--         --Has dots
--         WHEN TRIM(SUBSTR(full_name,1,INSTR(full_name,',') - 1)) AND full_name like '%.%' 
--         THEN SUBSTR(full_name,1,INSTR(full_name,',') - 1)
--         ELSE SUBSTR(full_name, INSTR(full_name,',')+1)
--     END
-- )

-- UPDATE employees
-- SET title = TRIM(
--     CASE
--         WHEN TRIM(SUBSTR(full_name,1,INSTR(full_name,',') - 1)) AND full_name like '%.%' 
--         THEN SUBSTR(full_name,1,INSTR(full_name,',') + 1)
--         ELSE SUBSTR(full_name, INSTR(full_name,',') -1)
--     END
-- )


UPDATE employees
SET clean_name = TRIM(
    CASE
        WHEN INSTR(full_name, ',') = 0 THEN full_name
        WHEN TRIM(SUBSTR(full_name,1,INSTR(full_name,',') - 1)) AND full_name like '%.%' 
        -- THEN SUBSTR(full_name,1,INSTR(full_name,',') + 1)
        -- ELSE SUBSTR(full_name, INSTR(full_name,',')-1)
    END
)

UPDATE employees
SET title = TRIM(
    CASE
        WHEN TRIM(SUBSTR(full_name,1,INSTR(full_name,',') - 1)) AND full_name like '%.%' 
        THEN SUBSTR(full_name,1,INSTR(full_name,',') - 1)
        ELSE SUBSTR(full_name, INSTR(full_name,',') + 1)
    END
)


SELECT full_name, clean_name, title FROM employees

SELECT TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))
FROM employees
where full_name like '%.%' ;

SELECT TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))
FROM employees
WHERE INSTR(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1), '.') > 0;
