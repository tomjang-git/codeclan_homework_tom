
1.1

SELECT 
  employees.*, 
  pay_details.local_account_no,
  pay_details.local_sort_code
FROM employees INNER JOIN pay_details
ON employees.id = pay_details.id;




1.2


SELECT 
  employees.*, 
  pay_details.local_account_no,
  pay_details.local_sort_code,
  teams.id
FROM (employees INNER JOIN pay_details ON employees.id = pay_details.id) 
INNER JOIN teams
ON employees.team_id = teams.id;

??


1.3

select
employees.first_name,
 employees.last_name,
 teams.name
from employees inner join teams
on employees.team_id = teams.id
where cast(teams.charge_cost as int) > 80
order by employees.last_name asc nulls last;
  


1.4

select 
department, count(id)
from employees
group by department;

1.5



select
 id,
 first_name,
 last_name,
 salary,
 fte_hours * salary as effective_salary,
 sum(fte_hours * salary) over (order by fte_hours * salary asc nulls last) as running_total_effective_salary
from employees;

1.6

select 
employees.id,
teams."name" from employees inner join teams
on employees.team_id = teams.id;



select 
  teams.name,
  count(employees.id) * cast(teams.charge_cost as int)
from employees inner join teams
on employees.team_id = teams.id
group by teams.id;











