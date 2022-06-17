1. Create Procedure to give names of instructors as o/p.
Routine File:
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_name_of_ins`()
BEGIN
select name
from instructor;
END
Actual SQL Script:
USE `university`;
DROP procedure IF EXISTS `show_name_of_ins`;
USE `university`;
DROP procedure IF EXISTS `university`.`show_name_of_ins`;
;
DELIMITER $$
USE `university`$$
CREATE PROCEDURE `show_name_of_ins`()
BEGIN
select name
from instructor;
END$$
DELIMITER ;
;
call show_name_of_ins();
2. Create Procedure where you can pass an integer value and give output as name and salary of those instructors who have salary value greater than the passed value.
Routine File:
CREATE PROCEDURE `ins_with_greater_sal`(
ins_having_sal_gt int
)
BEGIN
select name
from instructor
where salary > ins_having_sal_gt;
END
Actual SQL Script:
USE `university`;
DROP procedure IF EXISTS `ins_with_greater_sal`;
USE `university`;
DROP procedure IF EXISTS `university`.`ins_with_greater_sal`;
;
DELIMITER $$
USE `university`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_with_greater_sal`(
ins_having_sal_gt int
)
BEGIN
select name, salary
from instructor
where salary > ins_having_sal_gt;
END$$
DELIMITER ;
;
call ins_with_greater_sal(20000);
3. Create a SP which will take instructor ID as input and will give output the details of that particular instructor whose ID was passed.
delimiter //
create procedure getIns (in insid int)
begin
select *
from instructor
where ID = insid;
end //
delimiter ;
call getIns (103);
