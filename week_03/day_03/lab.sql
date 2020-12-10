

1.1

SELECT
*
FROM pay_details
WHERE local_account_no is null and iban is null;


1.2


select 
first_name,
last_name,
country 
from employees
order by country asc, last_name nulls last;




1.3

select 
*
from employees
order by salary desc nulls last limit 10;


1.4

select 
first_name,
last_name,
salary
from employees
where country = 'Hungary'
order by salary asc limit 1;


1.5


select 
*
from employees
where email ilike '%yahoo%';


1.6

select
count(pension_enrol is true) as pension_enrol_true,
count(pension_enrol is false) as pension_enrol_false,
count(pension_enrol is null) as pension_enrol_unknown
from employees
group by employees.pension_enrol;
-- ^nope


select
count(*),
pension_enrol
from employees
group by employees.pension_enrol;




1.7

select 
*
from employees
where department = 'Engineering' and fte_hours = 1.0
order by salary desc limit 1;

or

select 
max(salary) 
from employees
where department = 'Engineering' and fte_hours = 1.0;



1.8

select 
country,
count(id) as employee_count,
avg(salary) as avg_salary
from employees
group by country 
having count(id) > 30
order by avg(salary) asc nulls last; 

1.9

select 
first_name,
last_name,
fte_hours,
salary,
fte_hours * salary as effective_yearly_salary
from employees;


1.10

select 
e.first_name,
e.last_name,
pd.local_tax_code
from employees as e left join pay_details as pd
on e.pay_detail_id = pd.id
where local_tax_code is null;


1.11


select 
e.*,
t.*
from employees as e inner join teams as t
on e.team_id = t.id;

(48 * 35 * charge_cost - salary) * fte_hours


-- not sure where to go from here 


1.12

select
distinct first_name,
count(distinct first_name) as distinct_first_name
from
employees
where employees is not null
group by employees.first_name;






























































































































































































































