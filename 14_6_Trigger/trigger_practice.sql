use university;

show triggers in university;

describe instructor;

-- Before Insert

create trigger before_trigger_example
before insert
on instructor
for each row
set new.salary = new.salary + 10;

select dept_name from instructor;

insert into instructor (ID, name, dept_name, salary)
values (101, 'John', 'Comp. Sci.', 200000);

select * from instructor
where name = 'John';

show triggers in university;

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

drop table id_and_salary;

create table id_and_salary (
id_of_instructor int,
salary_of_instructor int);

describe id_and_salary;

drop trigger before_trigger_example;

create trigger after_trigger_example
after insert
on instructor
for each row
insert into id_and_salary values (new.ID, new.salary);

insert into instructor (ID, name, dept_name, salary)
values (102, 'Jim', 'Comp. Sci.', 300000);

select * from id_and_salary;

select * from instructor
where ID = 102;

insert into instructor (ID, name, dept_name, salary)
values (400, 'John', 'Comp. Sci.', 120000);

describe instructor;

drop trigger after_trigger_example;

delete from id_and_salary;

select * from id_and_salary;

