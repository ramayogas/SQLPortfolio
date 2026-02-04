INSERT INTO employee_profession_groups (profession_group_name)
VALUES
('Medical'),
('Non Medical');

INSERT INTO employee_professions (profession_name, profession_group_id)
VALUES
    -- MEDICAL (1)
    ('Doctor', 1),
    ('Specialist Doctor', 1),
    ('Nurse', 1),
    ('Midwife', 1),
    ('Medical Support', 1),
    ('Electromedical Technician', 1),
    ('Radiographer', 1),
    ('Laboratory Analyst', 1),
    ('Pharmacist', 1),
    ('Physiotherapist', 1),
    ('Nutritionist', 1),
    ('Blood Bank Officer', 1),

    -- NON MEDICAL (2)
    ('Management', 2),
    ('Casemix / BPJS Claim', 2),
    ('IT Team', 2),
    ('Medical Records', 2),
    ('Administration', 2),
    ('Finance', 2),
    ('Security', 2),
    ('Cleaning Service', 2),
    ('CSSD', 2),
    ('Ambulance Driver', 2),
    ('Laundry Staff', 2),
    ('Building Technician', 2),
    ('K3 / Occupational Health & Safety', 2);


select * from employee_professions
select * from employee_profession_groups
select * from employees limit 10