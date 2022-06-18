# Create Procedure to give names of instructors as o/p.

use university;

describe instructor;

delimiter //

-- create procedure names_of_ins ()
-- begin
-- 	select name
--     from instructor;
-- end //

delimiter ;

call names_of_ins();

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# Create Procedure where you can pass an integer value and give output as name and salary of those
-- instructors who have salary value greater than the passed value.

delimiter //
create procedure ins_with_greater_sal (in sal_val int)
begin
	select name, salary
    from instructor
    where salary > sal_val;
end //

delimiter ;

call ins_with_greater_sal(200000);

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# Create a SP which will take instructor ID as input and will give
# output the details of that particular instructor whose ID was passed.

describe instructor;
select * from instructor;

delimiter //

create procedure op_ins (in ins_id int)
begin
	select *
    from instructor
    where ins_id = ID;
end //

delimiter ;

call op_ins (74420);

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# Create a SP to which will take instructor name as input and will give output the details
# of that particular instructor whose name was passed.

drop procedure op_ins_with_name;

describe instructor;
select * from instructor;

delimiter //

create procedure op_ins_with_name (in ins_name varchar(200))
begin
	select *
    from instructor
    where name = ins_name;
end //

delimiter ;

call op_ins_with_name ('RED');

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# Create a SP to check whether an instructor exists in the database if you know his name and ID.

delimiter //
create procedure check_ins (in ins_name varchar(30), in ins_id int)
begin
	select * 
    from instructor
    where name = ins_name
    and ins_id = ID;
end //

delimiter ;

call check_ins('RED', 101);

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# Create a SP to check whether a number is even or odd.

delimiter //

create procedure check_e1_odd (num int)
begin
	if num%2 = 0 then							#even condition
		select 'Number is even' as Result;
	else
		select 'Number is odd' as Result;
	end if;
end //

delimiter ;

call check_e1_odd (5);

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# check if passed number is negative, 0 or positive

delimiter //

create procedure check_no (in num int)
begin
	if num > 0 then
		select 'Number is positive' as Result;
	elseif num < 0 then
		select 'Number is negative' as Result;
	else
		select 'Number is zero' as Result;
	end if;
end //

delimiter ;
        
call check_no(-3);

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# Create a SP where you can pass department name and a variable. The variable shall store
# number of instructors working
# under the passed department name. Output the value of the variable.

describe instructor;

delimiter //

# call count_ins_fromDept ('Comp. Sci', var);

create procedure count_ins_fromDept (in dname varchar(30), out totalIns int)
begin
	select count(ID) into totalIns
    from instructor
    where dept_name = dname;
end //

delimiter ;

set @countIns = 3;
call count_ins_fromDept ('Comp. Sci.', @countIns);
select @countIns as TotalIns;

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------

# Create a procedure which will take a value through a variable and increase the variable’s value by 5

delimiter //

create procedure inc_val (inout val int)
begin
	set val = val + 5;
end //

delimiter ;

set @val = 5;
call inc_val (@val);
select @val as Value_of_val;

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------






