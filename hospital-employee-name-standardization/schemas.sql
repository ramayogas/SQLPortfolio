--Employee professions group table
CREATE TABLE IF NOT EXISTS employee_profession_groups (  
    profession_group_id SERIAL PRIMARY KEY,
    profession_group_name VARCHAR(100) NOT NULL UNIQUE
);

--Employee professions table
CREATE TABLE IF NOT EXISTS employee_professions (  
    profession_id SERIAL PRIMARY KEY,
    profession_name VARCHAR(100) NOT NULL UNIQUE,
    profession_group_id INT NOT NULL,
    FOREIGN KEY (profession_group_id) REFERENCES employee_profession_groups(profession_group_id)
);

--Employee Table
CREATE TABLE IF NOT EXISTS employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    profession_id INT NOT NULL,
    profession_group_id INT NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    hire_date DATE,
    resignation_date DATE,
    FOREIGN KEY (profession_id) REFERENCES employee_professions(profession_id),
    FOREIGN KEY (profession_group_id) REFERENCES employee_profession_groups(profession_group_id)
);