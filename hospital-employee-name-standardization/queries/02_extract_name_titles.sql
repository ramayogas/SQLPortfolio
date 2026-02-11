ALTER TABLE employees ADD COLUMN clean_name TEXT;
ALTER TABLE employees ADD COLUMN title TEXT;

select full_name, clean_name, title from employees where profession_id = 1411
SELECT * FROM employees

UPDATE employees
SET clean_name = TRIM(
    CASE
        WHEN INSTR(full_name, ',') = 0 THEN full_name
        --Before comma
        WHEN LENGTH(TRIM(SUBSTR(full_name,1,INSTR(full_name,',') - 1))) 
        >
        --After comma
             LENGTH(TRIM(SUBSTR(full_name, INSTR(full_name,',')+1)))
          THEN SUBSTR(full_name,1,INSTR(full_name,',') - 1)
        ELSE SUBSTR(full_name, INSTR(full_name,',')+1)
    END
)

UPDATE employees
SET title = TRIM(
    CASE
        --Before comma
        WHEN LENGTH(TRIM(SUBSTR(full_name,1,INSTR(full_name,',') - 1))) 
        <
        --After comma
             LENGTH(TRIM(SUBSTR(full_name, INSTR(full_name,',')+1)))
          THEN SUBSTR(full_name,1,INSTR(full_name,',') - 1)
        ELSE SUBSTR(full_name, INSTR(full_name,',')+1)
    END
)



