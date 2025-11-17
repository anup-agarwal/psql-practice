-- Q1. List all employees with their department name.
--     If an employee has no department, show NULL.
select e.id,e.full_name,d.name from employees as e left join departments as d on e.department_id=d.id;

-- Q2. List all projects with their department name and budget.
select p.name, d.name as department, p.budget from projects as p left join departments as d on p.department_id=d.id;

-- Q3. Show each employee with their manager’s name.
--     If they don’t have a manager, show NULL.
select e.*, m.full_name as manager from employees as e left join employees as m on e.manager_id = m.id;

-- Q4. For each department, show how many employees it has.
select d.id, d.name, count(e.*) from departments as d, employees as e where d.id=e.department_id group by d.id order by d.id;

-- Q5. For each project, show total allocated hours
--     (sum of allocated_hours from employee_projects).
select p.id as project_id, p.name as project_name, sum(allocated_hours) as allocated_hours from ((employees join employee_projects on employees.id = employee_projects.employee_id) join projects as p on p.id=employee_projects.project_id) group by p.id order by project_id desc;

-- Q6. For each project that has timesheets, show total logged hours.
select p.*, sum(hours) as logged_hours from projects as p join timesheets as t on p.id=t.project_id group by p.id order by p.id;

-- Q7. List all employees who have NEVER logged any timesheet.
select e.* from employees as e where not exists (select * from timesheets where timesheets.employee_id=e.id);

-- Q8. List all projects that have NO timesheets at all.
select * from projects where not exists (select * from timesheets where projects.id=timesheets.project_id);

-- Q9. List all employees who are managers (someone reports to them).
select m.* from employees as m where exists (select * from employees as e where e.manager_id=m.id);

-- Q10. List employees who are allocated to 2 or more projects.
--      Show employee id, name, and project_count.
select e.*, count(employee_projects.project_id) as num_of_projects
from employees as e join employee_projects on e.id=employee_projects.employee_id join projects as p on p.id=employee_projects.project_id
group by e.id
having count(employee_projects.project_id)>1;

-- Q11. Show top 3 employees by total timesheet hours.
select e.*, sum(t.hours) as hours from employees as e join timesheets as t on t.employee_id=e.id
group by e.id
order by hours desc
limit 3;

-- Q12. List employees whose salary is ABOVE the average salary.
select e.* from employees as e where e.salary > (select avg(salary) from employees);

-- Q13. Using a CTE:
--      Step 1: calculate total hours per employee.
--      Step 2: list only those with total_hours > 10.
with employee_hours as (
  select e.*, sum(t.hours) as hours from employees as e join timesheets as t on t.employee_id=e.id group by e.id
)
select * from employee_hours where hours>10;

-- Q14. List resources that are used by projects belonging to
--      MORE THAN ONE department.
select r.*, count(departments.*) as num_of_depts from resources as r join project_resources on project_resources.resource_id=r.id join departments on r.department_id=departments.id 
group by r.id 
having count(departments.*)>1;

-- Q15. Using EXISTS:
--      List employees allocated to “Website Revamp”
--      even if they logged 0 hours.
select e.* from 
(
  (employees as e join employee_projects as ep on e.id=ep.employee_id) join 
  projects on ep.project_id=projects.id and projects.name='Website Revamp'
)
where exists (select * from timesheets where projects.id=timesheets.project_id)

-- Q16. Using NOT EXISTS:
--      List projects that HAVE allocations
--      BUT have NO timesheets.
select * from projects join employee_projects on projects.id = employee_projects.project_id where
not exists (select * from timesheets where timesheets.project_id=employee_projects.project_id);