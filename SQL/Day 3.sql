# Important for interview due to data integrity is at risk.

use feb26;

create table dept_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_fk_ex(dept_id)
);

desc dept_fk_ex;
desc emp_fk_ex; # MUL stands for foreign key

show indexes from dept_fk_ex;
show indexes from emp_fk_ex;

insert into dept_fk_ex(dept_name,dept_id,project_id) values
('IT', 103, 'P-01'),
('Admin', 104, 'P-02'),
('HR', 105,'P-01');

insert into emp_fk_ex(emp_name,p_id,department_id) values
('Omkar', 'P-02', 104),
('Sujal', 'P-01', 105),
('Devdatta', 'P-02', 103);

select * from dept_fk_ex;
select * from emp_fk_ex;

# -------- Example -----------

drop table course;
create table course (
	course_id varchar(30) primary key,
    course_name varchar(30),
    capacity int
);

create table stud (
	s_id int auto_increment primary key,
    s_name varchar(20),
    course_id varchar(30),
    foreign key (course_id) references course(course_id)
);

insert into course (course_id, course_name, capacity) values
('CS-1', 'CS', 50),
('DT-2', 'DA', 30),
('EG-3', 'Eng', 40);

INSERT INTO stud (s_name, course_id) VALUES 
('Omkar', 'CS-1'),
('Sujal', 'CS-1'),
('Chaitanya', 'DT-2'),
('Devdatta', 'EG-3');

select * from course;
select * from stud;

# -------Delete values ------------
delete from stud where course_id='CS-1';
delete from course where course_id='CS-1'; # Cascading delete

delete from emp_fk_ex where department_id=105;
delete from dept_fk_ex where dept_id=104;  # Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`feb26`.`emp_fk_ex`, CONSTRAINT `emp_fk_ex_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `dept_fk_ex` (`dept_id`))

update course set course_id='ENG-03' where course_id='EG-3'; # Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`feb26`.`stud`, CONSTRAINT `stud_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`))
# ----------------------------------

create table dept_using_cu_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_cu_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_cu_fk_ex(dept_id)
    on update cascade
);

insert into dept_using_cu_fk_ex (dept_name, emp_id, project_id) values 
('Human Resources', NULL, 'PROJ_HR_01'),
('Software Dev', NULL, 'PROJ_IT_99');

INSERT INTO emp_using_cu_fk_ex (emp_name, p_id, department_id) 
VALUES 
('Alice Smith', 'PROJ_HR_01', 1),
('Bob Jones', 'PROJ_IT_99', 2);

UPDATE emp_using_cu_fk_ex SET department_id = 2 WHERE department_id = 1;

select * from dept_using_cu_fk_ex;
select * from emp_using_cu_fk_ex; 