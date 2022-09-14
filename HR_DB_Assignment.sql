USE HR;
-- 1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name.
select * from EMPLOYEES;
select first_name AS 'FIRST NAME',last_name AS 'LAST NAME'
from employees;
-----------------------------------------------------------------------
-- 2. Write a query to get unique department ID from employee table. 
select distinct DEPARTMENT_ID
FROM EMPLOYEES;
-----------------------------------
-- 3. Write a query to get all employee details from the employee table order by first name, descending. 
select * FROM EMPLOYEES
order by FIRST_NAME DESC;
-------------------------------------------
-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)
select FIRST_NAME,LAST_NAME,SALARY,SALARY*15 PF
FROM EMPLOYEES;
-----------------------
-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary. 
select employee_id,first_name,last_name,SALARY
from employees
ORDER BY SALARY ASC;
------------------------------------
-- 6. Write a query to get the total salaries payable to employees
SELECT SUM(SALARY) FROM EMPLOYEES;
-----------------------------
-- 7. Write a query to get the maximum and minimum salary from employees table
select max(SALARY), min(salary) from employees;
--------------------------------------
-- 8. Write a query to get the average salary and number of employees in the employees table
SELECT COUNT(EMPLOYEE_ID),ROUND(AVG(SALARY),2) FROM EMPLOYEES;
---------------------------
-- 9. Write a query to get the number of employees working with the company
select count(EMPLOYEE_ID) from employees;
--------------------------------------------
-- 10. Write a query to get the number of jobs available in the employees table
Select count(DISTINCT JOB_ID) FROM EMPLOYEES;
------------------------------------------
-- 11. Write a query get all first name from employees table in upper case
SELECT UPPER(FIRST_NAME) FROM EMPLOYEES;
---------------------------------------------------
-- 12. Write a query to get the first 3 characters of first name from employees table
SELECT LEFT(FIRST_NAME,3) FROM EMPLOYEES;
------------------------------------------------------------
-- 13. Write a query to get first name from employees table after removing white spaces from both side
SELECT TRIM(FIRST_NAME) FROM EMPLOYEES;
-----------------------------------------------
-- 14. Write a query to get the length of the employee names (first_name, last_name) from employees table
SELECT first_name, last_name, length(first_name)+ length(last_name)
'Length of names' from EMPLOYEES;
----------------------------------------
-- 15. Write a query to check if the first_name fields of the employees table contains numbers
select * from employees 
where first_name REGEXP '[0-9]';
-------------------------------------------
-- 16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
-- not in the range $10,000 through $15,000
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
where SALARY NOT BETWEEN 10000 AND 15000;
-----------------------------------------------
-- 17. Write a query to display the name (first_name, last_name) and department ID of all employees in 
-- departments 30 or 100 in ascending order
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID
FROM EMPLOYEES WHERE
DEPARTMENT_ID in(30,100)
ORDER BY DEPARTMENT_ID;
----------------------------------
-- 18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
-- not in the range $10,000 through $15,000 and are in department 30 or 100
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES WHERE
SALARY NOT BETWEEN 10000 AND 15000
AND DEPARTMENT_ID in(30,100);
------------------------------------------
-- 19. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987
SELECT FIRST_NAME,LAST_NAME,HIRE_DATE FROM EMPLOYEES
WHERE year(HIRE_DATE) LIKE '1987%';
------------------------------------------
-- 20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%B%C%';
-------------------------------------
-- 21. Write a query to display the last name, job, and salary for all employees whose job is that of a 
-- Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000
SELECT LAST_NAME,JOB_ID,SALARY
FROM EMPLOYEES
WHERE JOB_ID in('IT_PROG','SH_CLERK')
AND SALARY NOT IN(4500,10000,15000);
------------------------------------------
-- 22. Write a query to display the last name of employees whose names have exactly 6 characters
SELECT LAST_NAME FROM EMPLOYEES
where LENGTH(LAST_NAME)=6
ORDER BY LAST_NAME;
-------------------------------------------
-- 23. Write a query to display the last name of employees having 'e' as the third character
select last_name from employees
where last_name like '__e%';
-----------------------------------------
-- 24. Write a query to get the job_id and related employee's id
SELECT JOB_ID,group_concat(EMPLOYEE_ID,' ') AS 'EMPLOYEES ID'
FROM EMPLOYEES
GROUP BY JOB_ID;
--------------------------------
-- 25. Write a query to update the portion of the phone_number in the employees table, within the phone 
-- number the substring '124' will be replaced by '999'
update employees 
set phone_number = replace(phone_number,'124','999')
WHERE PHONE_NUMBER LIKE '%124%';
---------------------------------------------------------------
-- 26. Write a query to get the details of the employees where the length of the first name greater than or equal to 8
select * FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >=8;
---------------------------------------
-- 27. Write a query to append '@example.com' to email field
UPDATE EMPLOYEES
SET EMAIL = concat(EMAIL,'@EXAMPLE.COM');
-------------------------------------------------
-- 28. Write a query to extract the last 4 character of phone numbers
SELECT right(PHONE_NUMBER,4) AS PH_NO FROM EMPLOYEES;
-----------------------------------------------
-- 29. Write a query to get the last word of the street address
SELECT SUBSTRING_INDEX(STREET_ADDRESS,' ',-1) AS `LAST WORD OF STREET ADDRESS`
FROM LOCATIONS;
----------------------------------------------------------------------------------------
-- 30. Write a query to get the locations that have minimum street length
SELECT * FROM LOCATIONS
WHERE LENGTH(STREET_ADDRESS)<= (SELECT min(LENGTH(STREET_ADDRESS)) FROM LOCATIONS);
-----------------------------------------
-- 31. Write a query to display the first word from those job titles which contains more than one words
SELECT JOB_TITLE,substr(JOB_TITLE,1,INSTR(JOB_TITLE, ' ')-1)  AS
`FIRST WORD OF JOB TITLE WHICH HAS MORE THAN 1 WORD` FROM JOBS;
----------------------------------------------------------------------------------
-- 32. Write a query to display the length of first name for employees where last name contain character 'c' 
-- after 2nd position
use hr;
SELECT LENGTH(FIRST_NAME), FIRST_NAME,LAST_NAME 
FROM employees where instr(last_name,'c')>2;
--------------------------------------------------------
-- 33. Write a query that displays the first name and the length of the first name for all employees whose 
-- name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
-- employees' first names
SELECT FIRST_NAME,LENGTH(FIRST_NAME) FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%'
OR FIRST_NAME LIKE 'J%'
OR FIRST_NAME LIKE 'M%'
ORDER BY FIRST_NAME;
----------------------------------------------------------------------
-- 34. Write a query to display the first name and salary for all employees. Format the salary to be 10 
-- characters long, left-padded with the $ symbol. Label the column SALARY
SELECT FIRST_NAME,lpad(SALARY,10,'$') AS SALARY FROM EMPLOYEES;
---------------------------------------------------------------------------------
-- 35. Write a query to display the first eight characters of the employees' first names and indicates the 
-- amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary
USE HR;
SELECT left(first_name,8),
repeat('$',FLOOR(SALARY/1000))
'SALARY($)' , SALARY 
FROM EMPLOYEES
ORDER BY SALARY DESC;
--------------------------------------------
-- 36. Write a query to display the employees with their code, first name, last name and hire date who hired 
-- either on seventh day of any month or seventh month in any year
SELECT employee_id,first_name,last_name,hire_date 
FROM employees 
WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y'))>0;
-- END------------------------------------------------------------------

	















