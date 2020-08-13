create table emp (
emp_id varchar2(10) primary key,
ename varchar2(10),
salary number(5),
depart varchar2(10)
);

insert into emp values('a111', 'aaaa', 2000, 'insa');
insert into emp values('b222', 'cccc', 3500, 'sales');

select * from emp;

-- Drop table emp;
