--DDL
create database Sohag2

Use Sohag2

Create table Emp
(
 eid int primary key,
 ename varchar(20) not null,
 eadd varchar(20) default 'cairo',
 Hiredate date default getdate(),
 gender varchar(1),
 sal int,
 Dnum int
)

alter table emp add Age int

alter table emp alter Column sal tinyint

alter table emp drop column age

drop table emp

----------------------------
--DML
--insert   Update   Delete
insert into emp
values(1,'ahmed','alex',NULL,'M',1000,NULL)

insert into emp(ename,eid)
values('ahmed',2)

--insert constructor
insert into emp(ename,eid)
values('ahmed',4),('omar',8),('nada',20)


update emp
	set ename='omar'
where eid=1

update emp
	set ename='omar',sal=5000
where eid=1

update emp
	set sal+=100

delete from emp
where eid=1

delete from emp
where sal>5000
-------------------------------------------
--DQL
Use ITI

Select * from Student
 
Select st_id,st_fname from Student
 
Select * from Student
where st_age>=34
 
Select * from Student
order by st_age desc

select distinct st_fname
from Student

select *
from Student
where st_fname is NULL

select *
from Student
where st_fname is not NULL  and st_Lname is not NULL

select st_fname+' '+st_lname [Full name]
from Student

--select fullname
--from student

select *
from Student
where st_address='alex' or st_address='mansoura'

select *
from Student
where st_address in('alex','mansoura','cairo','aswan')

select *
from Student
where st_age>=33 and st_age<=37

select *
from Student
where st_age between 33 and 37

--DB Mapping
--SQL
--Create DB    Wizard   Code
--DDL Create   Alter   Drop
--DML Insert    Update   Delete
--DQL  Select Form Where Order by
--Distinct    in   between  and or > <
--is null   is not null



















