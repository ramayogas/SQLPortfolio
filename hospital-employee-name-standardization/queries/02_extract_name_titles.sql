-- ADD COLUMNS FOR CLEAN_NAME AND TITLE
ALTER TABLE employees ADD COLUMN clean_name TEXT;
ALTER TABLE employees ADD COLUMN title TEXT;

-- EXTRACT TITLE FROM FULL_NAME
UPDATE employees
SET title = TRIM(
    CASE
        -- AFTER COMMA + DOT
        WHEN INSTR(SUBSTR(full_name, INSTR(full_name, ',') + 1), '.') > 0
        THEN TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))
        -- BEFORE COMMA + DOT
        WHEN INSTR(SUBSTR(full_name, 1, INSTR(full_name, ',') -1 ), '.') > 0
        THEN TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))
        
        -- CHECK UPPERCASE BEFORE COMMA WITHOUT DOT
        WHEN TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1)) = UPPER(TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1)))
        THEN TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))
        -- CHECK UPPERCASE AFTER COMMA WITHOUT DOT
        WHEN TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1)) = UPPER(TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1)))
        THEN TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))
        
        -- BEFORE COMMA WITHOUT DOT 
        WHEN INSTR(full_name, ',') > 0 AND LENGTH(
        TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))) > LENGTH(TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1)))
        THEN TRIM(SUBSTR(full_name, 1,INSTR(full_name, ',') - 1))
        -- AFTER COMMA WITHOUT DOT
        WHEN INSTR(full_name, ',') > 0 AND LENGTH(
        TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))) < LENGTH(TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1)))
        THEN TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))
        
        ELSE
           NULL
    END
) 


-- EXTRACT NAME FROM FULL_NAME
UPDATE employees
SET clean_name = TRIM(
    CASE
        -- NO COMMA
        WHEN INSTR(full_name, ',') = 0
        THEN full_name

        -- AFTER COMMA
        WHEN INSTR(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1) , '.') > 0 
        THEN TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))

        -- BEFORE COMMA
        WHEN INSTR(SUBSTR(full_name, INSTR(full_name, ',') + 1), '.') > 0
        THEN TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))
        
        -- UPPERCASE BEFORE COMMA
        WHEN SUBSTR(full_name, INSTR(full_name, ',') + 1) = UPPER(SUBSTR(full_name, INSTR(full_name, ',') + 1))
        THEN TRIM(SUBSTR(full_name,1, INSTR(full_name, ',') - 1))

        -- UPPERCASE AFTER COMMA
        WHEN SUBSTR(full_name, 1, INSTR(full_name, ',') - 1) = UPPER(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))
        THEN TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))

        -- LENGHT BEFORE COMMA > LENGTH AFTER COMMA
        WHEN LENGTH(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1)) > LENGTH(SUBSTR(full_name, INSTR(full_name, ',') + 1))
        THEN TRIM(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))

        -- LENGHT AFTER COMMA > LENGTH BEFORE COMMA
        WHEN LENGTH(SUBSTR(full_name, INSTR(full_name, ',') + 1)) > LENGTH(SUBSTR(full_name, 1, INSTR(full_name, ',') - 1))
        THEN TRIM(SUBSTR(full_name, INSTR(full_name, ',') + 1))

        ELSE
           NULL

    END
)


-- EXTRACT SPECIALIZED dr TITLE 
SELECT full_name, clean_name, title FROM employees WHERE TITLE LIKE 'IR%'
SELECT full_name, clean_name, title FROM employees WHERE profession_id = 1412
SELECT full_name, clean_name, title, SUBSTR(title, 1, INSTR(title, " ") - 1) AS first_word , SUBSTR(title, INSTR(title, " ") + 1) AS last_word FROM employees WHERE profession_id = 1412
