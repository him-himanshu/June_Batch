use university;

show tables;

describe course;

select * from course;

show tables;

describe instructor;

-- create view no_of_ins_in_each_dept as
select dept_name, count(ID) as no_of_ins
from instructor
group by dept_name;

select * from no_of_ins_in_each_dept;

select dept_name
from no_of_ins_in_each_dept;


-- Find courses offered in either semester Fall or year 2009

select course_id, year, semester
from section
where semester = 'Fall' or year = 2009;


-- Find the names of all instructors that have a salary value greater than
-- that of each instructor in the Biology department

create view sal_gthan_eins_bio as
select name
from instructor
where salary > all 

(select salary
from instructor
where dept_name = 'Biology');

select * from sal_gthan_eins_bio;


-- Find the names of all instructors whose salary is greater than at
-- least one instructor in the Biology department

describe instructor;

select name
from instructor
where salary > some

(select salary
from instructor
where dept_name = 'Biology');
