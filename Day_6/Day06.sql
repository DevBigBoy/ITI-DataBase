-- SchemaName.ObjectName

SELECT *
From dbo.Student

-- How To Create Schema
Create Schema HR

create schema sales

alter schema HR transfer Student

alter schema HR transfer Instructor

alter schema sales transfer department


-- You can create the same table but in different schema
create table student
(
 id int,
 name varchar(20)
)

create table sales.student
(
 id int,
 name varchar(20)
)

-- You get an Error you have to write the schema name
select * 
from Instructor 

select * 
from hr.Instructor

select * 
from Student

select * 
from Hr.Student

use AdventureWorks2019

select * 
from HumanResources.EmployeeDepartmentHistory

-- Create a shortcut 
create synonym HE 
for HumanResources.EmployeeDepartmentHistory

select * from HE

-- This will delete both data and metadata
drop table course    

-- But that will only delete the data thus making the table empty
delete from course  
/*
  Also, this deletes the data But what's the difference?
  1. If you want to delete part of the data use the Delete clause 
   because you can use Where with it. 
  2. Delete is slower than truncate.
  3. you can roll back the deleted data with Delete Clause but 
   With truncate You can't
  4. If you have 100 employees have Id's From 1 to 100 
   When you delete them and then insert a new employee 
   he will get 101 but when using truncate, 
   truncate will reset the identity and start from being 1
*/
truncate table course    


create table test1
(
  id int identity,
  name varchar(20)
)

insert into test1  values('hassan')
insert into test1  values('mona')
insert into test1  values('ali')

delete from test1

select * from test1

insert into test1  values('omar')
insert into test1  values('fares')

select * from test1

truncate table test1

select * from test1

insert into test1  values('ezz')
insert into test1  values('moheb')

select * from test1

create table Dept
(
 Dept_id int primary key,
 dname varchar(20)
)

-- Interview Question
/*
How To Delete a Column From an Existing Table without Delete its Structure?
A: update the column with the Null value
*/

-- ==================================================================


create table emp
(
 eid int identity(1,1),
 ename varchar(20),
 eadd varchar(20) default 'alex',
 hiredate date default getdate(),
 sal int,
 overtime int,
 netsal as(isnull(sal,0)+isnull(overtime,0)) persisted,
 BD date,
 age as(year(getdate())-year(BD)),
 gender varchar(1),
 hour_rate int not null,
 did int,
 constraint c1 primary key(eid,ename),
 constraint c2 unique(sal),
 constraint c3 unique(overtime),
 constraint c4 check(sal>1000),
 constraint c5 check(eadd in ('cairo','mansoura','alex')),
 constraint c6 check(gender='F' or gender='M'),
 constraint c7 check(overtime between 100 and 500),
 constraint c8 foreign key(did)  references dept(dept_id)
		on delete set NULL on update cascade 
)


alter table emp add constraint c100 check(hour_rate>100)

alter table emp drop constraint c3

--XXXXX       Constraint   ---> New Data
--XXXXX       Constraint   --->shared 
--XXXXX       Datatype        Constraint    Default

alter table instructor add constraint c200 check(salary>1000)


--Rule
create rule r1 as @x>1000

sp_bindrule  r1,'instructor.salary'
sp_bindrule  r1,'emp.overtime'

sp_unbindrule 'instructor.salary'
sp_unbindrule 'emp.overtime'

drop rule r1



create default def1 as 5000

sp_bindefault  def1,'instructor.salary'

sp_unbindefault 'instructor.salary'

drop default def1

--Create New Datatype  ----ComplexDT  (int    >1000    default 5000)
create rule r1 as @x>1000
create default def1 as 5000

sp_addtype ComplexDT,'int'

sp_bindrule r1,ComplexDT

sp_bindefault def1,ComplexDT

create table test3
(
 id int,
 name varchar(20),
 salary ComplexDT
)

select format(GETDATE(),'MMMM')