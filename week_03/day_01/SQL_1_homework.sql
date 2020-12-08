1.1

SELECT *
FROM employees
WHERE department = 'Human Resources';


1.2

SELECT
first_name, last_name, country
FROM employees
WHERE department = 'Legal';


1.3

SELECT
COUNT(country) AS count_country
FROM employees
WHERE country = 'Portugal';

1.4

SELECT
COUNT(country) AS count_country
FROM employees
WHERE country = 'Portugal' OR country = 'Spain';


1.5

SELECT
COUNT(id) AS count_id
FROM pay_details
WHERE local_account_no IS NULL;

COUNT(local_account_no) AS count_local_account_no     Why doesnt this work?



1.6

SELECT
first_name, last_name
FROM employees
ORDER BY last_name DESC NULLS LAST;







1.7

SELECT
COUNT(first_name) AS count_first_name
FROM employees
WHERE first_name LIKE 'F%';

When I use quotation marks the text goes yellow for the code above



1.8

SELECT
COUNT(pension_enrol) AS pension_enroll_not
FROM employees
WHERE pension_enrol IS true AND country != 'France' AND country != 'Germany'



1.9

SELECT 
COUNT(id) AS count_of_employees_2003_start
FROM employees
WHERE start_date BETWEEN '2003-01-01' AND '2003-12-31';


---------------------------------------got up to this point 


1.10

SELECT


















































































