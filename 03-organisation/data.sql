-- Clean up if you re-run
DROP TABLE IF EXISTS timesheets, project_resources, resources, employee_projects, projects, employees, departments CASCADE;

-- Departments
CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT
);

-- Employees (self-referencing manager, dept FK)
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  department_id INT REFERENCES departments(id),
  manager_id INT REFERENCES employees(id),
  status TEXT DEFAULT 'active',       -- active / inactive / contractor
  salary NUMERIC(10,2),
  hired_at DATE NOT NULL
);

-- Projects
CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  department_id INT REFERENCES departments(id),
  budget NUMERIC(12,2),
  starts_at DATE,
  ends_at DATE
);

-- Many-to-many: employees <-> projects
CREATE TABLE employee_projects (
  employee_id INT REFERENCES employees(id),
  project_id INT REFERENCES projects(id),
  allocated_hours INT,
  role TEXT,
  PRIMARY KEY (employee_id, project_id)
);

-- Resources (assets, tools, etc.)
CREATE TABLE resources (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  resource_type TEXT,       -- hardware / software / infra / room / cloud
  department_id INT REFERENCES departments(id)
);

-- Which project uses which resource
CREATE TABLE project_resources (
  project_id INT REFERENCES projects(id),
  resource_id INT REFERENCES resources(id),
  quantity INT DEFAULT 1,
  PRIMARY KEY (project_id, resource_id)
);

-- Timesheets: logged work
CREATE TABLE timesheets (
  id SERIAL PRIMARY KEY,
  employee_id INT REFERENCES employees(id),
  project_id INT REFERENCES projects(id),
  work_date DATE NOT NULL,
  hours NUMERIC(5,2),
  billable BOOLEAN DEFAULT true
);


-- Departments
INSERT INTO departments (id, name, location) VALUES
  (1, 'Engineering', 'Bangalore'),
  (2, 'HR',          'Pune'),
  (3, 'Sales',       'Mumbai'),
  (4, 'IT Support',  'Remote');

-- Employees
INSERT INTO employees (id, full_name, email, department_id, manager_id, status, salary, hired_at) VALUES
  (1, 'Alice Singh',   'alice@corp.com', 1, NULL, 'active',     1800000, '2020-01-10'),
  (2, 'Bob Kumar',     'bob@corp.com',   1, 1,    'active',     1400000, '2021-03-15'),
  (3, 'Carol Jain',    'carol@corp.com', 3, NULL, 'active',     1600000, '2019-06-01'),
  (4, 'David Rao',     'david@corp.com', 3, 3,    'active',     1200000, '2022-02-20'),
  (5, 'Eve Nair',      'eve@corp.com',   2, NULL, 'active',     1300000, '2021-07-05'),
  (6, 'Frank Thomas',  'frank@corp.com', 4, NULL, 'active',     1500000, '2018-11-11'),
  (7, 'Grace Lee',     'grace@corp.com', 1, 2,    'active',     1100000, '2023-01-01'),
  (8, 'Heidi Lal',     'heidi@corp.com', 1, 2,    'inactive',    900000, '2020-09-09'),
  (9, 'Ivan Patel',    'ivan@corp.com',  3, 4,    'active',     1000000, '2023-04-18'),
  (10,'Judy Contractor','judy@corp.com', NULL, NULL, 'contractor', 800000, '2024-01-10');

-- Projects
INSERT INTO projects (id, name, department_id, budget, starts_at, ends_at) VALUES
  (1, 'Website Revamp',       1, 500000.00,  '2024-01-01', '2024-06-30'),
  (2, 'CRM Rollout',          3, 400000.00,  '2024-02-15', '2024-09-30'),
  (3, 'Recruitment Drive Q1', 2, 150000.00,  '2024-01-15', '2024-03-31'),
  (4, 'Helpdesk Automation',  4, 300000.00,  '2024-03-01', '2024-08-31'),
  (5, 'Secret Project X',     1, 1000000.00, '2024-04-01', NULL);

-- Employee <-> Project allocations
INSERT INTO employee_projects (employee_id, project_id, allocated_hours, role) VALUES
  (1, 1, 200, 'Tech Lead'),
  (2, 1, 160, 'Backend Dev'),
  (7, 1, 120, 'Frontend Dev'),
  (8, 1,  80, 'QA Engineer'),

  (3, 2, 180, 'Sales Lead'),
  (4, 2, 160, 'Sales Exec'),
  (9, 2, 120, 'Sales Intern'),

  (5, 3, 120, 'HR Manager'),

  (2, 4, 100, 'Integration Dev'),
  (6, 4, 160, 'SysAdmin'),

  (1, 5, 100, 'Architect');   -- Alice on Secret Project X (no timesheets yet)

-- Resources
INSERT INTO resources (id, name, resource_type, department_id) VALUES
  (1, 'MacBook Pro',        'hardware', 1),
  (2, 'Dell Laptop',        'hardware', 3),
  (3, 'AWS Account',        'cloud',    4),
  (4, 'Interview Room A',   'room',     2),
  (5, 'Kubernetes Cluster', 'infra',    4),
  (6, 'Figma License',      'software', 1);

-- Project <-> Resources
INSERT INTO project_resources (project_id, resource_id, quantity) VALUES
  (1, 1, 5),
  (1, 3, 1),
  (1, 6, 10),

  (2, 2, 6),
  (2, 3, 1),

  (3, 4, 1),
  (3, 6, 3),

  (4, 3, 1),
  (4, 5, 1),

  (5, 1, 2),
  (5, 6, 5);

-- Timesheets (some employees log hours, some don’t; some projects have no logs)
INSERT INTO timesheets (employee_id, project_id, work_date, hours, billable) VALUES
  (1, 1, '2024-01-05', 6.0, true),
  (1, 1, '2024-01-06', 5.5, true),
  (2, 1, '2024-01-06', 7.0, true),
  (7, 1, '2024-01-07', 4.0, true),
  (8, 1, '2024-01-08', 3.5, false),

  (3, 2, '2024-02-20', 8.0, true),
  (4, 2, '2024-02-21', 6.0, true),
  (9, 2, '2024-02-22', 5.0, true),

  (5, 3, '2024-01-20', 4.0, true),

  (2, 4, '2024-03-10', 5.0, true),
  (6, 4, '2024-03-11', 7.5, true);
-- Note: No timesheets for project_id = 5 (Secret Project X)
-- Note: Judy (id = 10) has no timesheets and no projects


