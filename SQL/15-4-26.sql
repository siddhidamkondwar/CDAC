use hr;
-- stored functions
delimiter $$
create function to_get_emp_detail(emp_id int)
returns varchar(100)
deterministic
begin
     declare f_name varchar(100);
     select concat(first_name,' ',last_name) into f_name
     from employees where employee_id = emp_id;
     return f_name;
end;;
$$
delimiter ;

select to_get_emp_detail(100);
##########################################################
-- annual income 
delimiter $$
create function to_get_annual_inc(emp_id int)
returns decimal(7,1)
deterministic
begin
     declare ann_inc decimal(7,1);
     select salary*12 into ann_inc
     from employees where employee_id = emp_id;
     return ann_inc;
end;;
$$
delimiter ;

select to_get_annual_inc(100);

#########################################

-- where we need to find no of emp by department_id

delimiter $$
CREATE FUNCTION to_get_emp_id(dept_id int)
returns int
deterministic
begin  
     declare number_of_emp int;
     select count(*) into number_of_emp
     from employees where DEPARTMENT_ID = dept_id
     group by DEPARTMENT_ID;
     return number_of_emp;
end;;
$$
delimiter ;
select  to_get_emp_id(90);

###############################################
-- pass the emp_id increment salary

delimiter $$
create function to_get_emp_id_incr(emp_id int ,incr decimal(8,2))
returns decimal(8,2)
deterministic
begin
      declare incr_sal decimal(10,2);
      select salary+(salary*incr) into incr_sal
      from employees where EMPLOYEE_ID = emp_id;
      return incr_sal;
end;;
$$
delimiter ;
select to_get_emp_id_incr(101,0.20);
#drop function to_get_emp_id_incr;

########################################################
-- pass the empl-id and increment in the salary , fetch salary 
delimiter $$

create function to_get_emp_id_expr(join_date date)
returns varchar(100)
deterministic
begin
    declare yr_ex int;

    set yr_ex = timestampdiff(year, join_date, curdate());

    if yr_ex >= 10 then
        return concat(yr_ex, ' senior emp');
    elseif yr_ex >= 5 then
        return concat(yr_ex, ' mid level exp');
    else
        return concat(yr_ex, ' new join');
    end if;

end$$

delimiter ;

select to_get_emp_id_expr('1987-09-9');

select 
    department_id,
    group_concat(to_get_emp_id_expr(hire_date) separator '-') as hire_band
from employees
group by department_id;


#########################################################################
-- get dept current buget
delimiter $$
create function to_get_curr_buget()
returns int
deterministic
begin 
    declare current_buget int;
    select sum(salary) into current_buget
    from employees;
    return current_buget;
end$$

delimiter ;

select to_get_curr_buget();

drop function to_get_curr_buget;
#############################################################
-- diff dept 
delimiter $$
create function to_get_curr_buget(department_id)
returns decimal(10,2)
deterministic
begin 
    declare current_buget decimal(10,2);
    select sum(salary) into current_buget
    from employees where department_id = dept_id;
    return current_buget;
end$$

delimiter ;

select to_get_curr_buget(50,60);

#########################################################
-- get department name and employee name 

delimiter $$
create function to_get_names(deptment_name varchar(100),first_name varchar(100))
returns varchar(200)
deterministic
begin 
	declare emp_name varchar(100);
    declare dept_name varchar(100);
    
     select e.first_name,d.department_name
      from employees e 
      join departments d 
       on e.department_id=d.depatment_id
       limit 1;
       return  concat(emp_name,' ',dept_name);
end$$

deterministic ;

select to_get_names('Sales', 'John');

#############################################################
-- procudural function

delimiter $$
create procedure read_all_emp1()
deterministic
begin
     select * from employees;
end$$

delimiter ;
call read_all_emp1();



################################################################

delimiter $$
create procedure read_all_emp_by_dept_name1()
deterministic
begin
      select e.first_name,d.department_name
      from employees e 
      join departments d 
       on e.department_id=d.department_id;
       
end$$
delimiter ;
call read_all_emp_by_dept_name1;
       
###################################################################

delimiter $$
create procedure get_all_emp_using_iddetail(in emp_id int)
begin 
    select * from employees where employee_id=emp_id;
end 
$$
delimiter ;
call get_all_emp_using_iddetails(100);

#################################################################

delimiter $$
create procedure get_all_emp_using_department(in dept_id int)
begin 
    select * from employees where DEPARTMENT_ID=dept_id;
end 
$$
delimiter ;
call get_all_emp_using_department(100);

#drop procedure get_all_emp_using_department;
##################################################################
create table student(s_id int,s_n varchar(50),m int);
delimiter $$
create procedure insert_student(in s_id int, in s_n varchar(50), in m int)
begin 
     insert into student values(s_id,s_n,m);
	end $$
delimiter ;
call insert_student(11,'ABC',70);
select * from student;

###################################################################

delimiter $$
create procedure emp_detail_using_dept_name(in emp_id int , out full_name varchar(50),out sal float(10,2),out dept_name varchar(50))
begin
	select concat(first_name,' ',last_name),
    salary,department_name into full_name,sal,dept_name
    from employees e 
    join departments d
    on d.DEPARTMENT_ID=e.DEPARTMENT_ID
    where e.EMPLOYEE_ID=emp_id;
end
$$
Delimiter ;
call emp_detail_using_dept_name(101,@full_name,@sal,@dept_name);

select @full_name as emp_name,@sal as Salary,@dept_name as department_name;

########################################################################################

delimiter $$
create procedure dept_name_city(in dept_id int ,out dept_name varchar(50),out c_name varchar(50))
begin
	select department_name,city into dept_name,c_name
    from departments d
    join locations l
    on l.LOCATION_ID=d.LOCATION_ID
    where d.DEPARTMENT_ID=dept_id;
end
$$
Delimiter ;

call dept_name_city(20,@dept_name,@c_name);



select @dept_name as department_name,@c_name as city_name;
###############################################################################################

delimiter $$
create procedure emp_dep_inout(in emp_id int ,out dept_name varchar(50),out full_name varchar(50))
begin
      select concat(first_name,' ',last_name),department_id into full_name,dept_id
      from employees where employee_id=emp_id;
end
$$
delimiter ;
set @emp_id=101;
call emp_dep_inout(@emp_id ,@dept_id,@full_name);

select @emp_id as employee_id ,@dept_id as dept_id,@full_name;

#############################################################################################
-- views 


create view emp_name_dept as
select employee_id,
concat(first_name,' ',last_name) as full_name,
salary,
department_id
from employees;

select * from emp_name_dept;

#################################################################
--       TRICKY
create view emp_name_dept1 as
select department_id,employee_id,
concat(first_name,' ',last_name) as full_name,
salary
from employees;

select * from emp_name_dept1;

-- whenever we try to update anthing in orignal table it will also update  in vieew 
update employees set first_name='ABC' where employee_id=100; 

##################################################################

create view emp_name_dept2 as
select employee_id,
concat(first_name,' ',last_name) as full_name,
salary,
d.department_id,department_name
from employees e
join departments d
on e.department_id=d.department_id;

select * from emp_name_dept2;
select * from employees;


