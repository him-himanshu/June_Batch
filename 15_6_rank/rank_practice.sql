-- O/P top salaried instructors along with their rank

describe instructor;

select name, salary,
rank() over (
	order by salary desc) as TopSalariedIns
from instructor;

-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------

-- O/P top salaried instructors along with their rank and department.

select name, salary, dept_name,
rank() over (
	partition by dept_name
	order by salary desc) as TopSalariedIns
from instructor;

-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------

-- Students along with their credits ordered by their rank

describe student;

select name, tot_credit,
rank() over (
	order by tot_credit desc) as TopCreditedStudents
from student;

-- Department along with the number of instructors teaching there, order the output by rank.

describe instructor;

select dept_name, count(ID) as No_Of_Ins,
rank() over (
	order by count(ID) desc) as Ranking
from instructor
group by dept_name;

-- O/P top salaried instructors along with their rank and department.

select name, salary, dept_name,
rank() over (
	partition by dept_name
	order by salary desc) as TopSalariedIns
from instructor;

-- Avg salaries of departments ordered by their rank where
-- avg salary of a department is greater than 100000.
describe instructor;

select dept_name, avg(salary) as Avg_Salary,
rank() over (
	order by avg(salary) desc) as Ranking
from instructor
group by dept_name
having avg(salary) > 100000;

