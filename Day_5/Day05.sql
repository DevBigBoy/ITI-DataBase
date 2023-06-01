select top(3) *
from Student

select top(3) St_Fname
from Student

select top(3) *
from Student
where st_address='alex'

select top(3) salary
from Instructor

select max(salary)
from Instructor

select top(2) salary
from Instructor
order by salary desc

select top(2) distinct salary
from Instructor
order by salary desc

select top(3) with ties *
from Student
order by st_age

select top(7) with ties *
from Student
order by st_age

select newid() --GUID

select *,newid()
from Student

select top(3)*
from Student
order by newid()

select st_fname+' '+st_lname as fullname
from Student
order by fullname

select st_fname+' '+st_lname as fullname
from Student
where fullname='ahmed ali'

select st_fname+' '+st_lname as fullname
from Student
where st_fname+' '+st_lname='ahmed ali'

select *
from  (select st_fname+' '+st_lname as fullname
		from Student) as Newtable
where fullname='ahmed ali'

------------execution order
--from
--join
--on
--where 
--group
--having [agg]
--select [distinct +agg]
--order by
--top

--DB Objects [table   view     function   SP   Rule]
--[ServerName].[DBName].[schemaName].[objectName]

select *
from Student

select *
from [ASFOURA\MSSQLSERVER01].iti.dbo.Student


select *
from Company_SD.dbo.Project

select dname
from Company_SD.dbo.Departments
union all
select dept_name
from Department

--DDL
select * into table2
from Student

select * from table2

select * into table3
from Student

select * into company_sd.dbo.student
from Student

select st_id,st_fname into tab3
from Student
where st_address='alex'


select * into tab4
from Student
where 1=2

select * into tab4
from Student
where st_age<-1000

insert into tab3
values(66,'ali')

--insert based in select
insert into tab3
select st_id,st_fname from student


select Sum(salary) 
from Instructor
having count(ins_id)<100


select Sum(salary) 
from Instructor
where count(ins_id)>100   ---error


-- WE Use This By Using Subqueries
Select *
from (
	  select *,Row_number() over(order by st_Age desc) as RN
	  from Student) as Newtable
where RN=1

select *
from (
	  select *,Dense_rank() over(order by st_Age desc) as DR
	  from Student) AS NEWTABLE
where DR=1






Select *
from (
	  select *,Row_number() over
	  (Partition by dept_id order by st_Age desc) as RN
	  from Student) as Newtable
where RN=1

select *
from (
	  select *,Dense_rank() over(partition by dept_id order by st_Age desc) as DR
	  from Student) AS NEWTABLE
where DR=1


select *
from 
	(select *,Ntile(4) over(order by st_age desc) as G
	 from Student) as Newtable
where G=1

------------------------------------Data types
---------------------------Numeric DT
-- bit    --bool    0:1    true:false
-- tinyint 1 Byte   -128:+127   unsigned   0:255 
-- smallint 2B      -32768:+32767  unsigned   0:65555
-- int    4B
-- bigint  8B
---------------------------Decimal DT
-- smallmoney   4B   .0000
-- money        8B   .0000
-- real              .0000000
-- float             .000000000000000000000000000000000
-- dec   decimal   dec(5,2)  123.87    18.1     12.098 XXX
---------------------------Char DT
-- char(10)   [fixed length character]  ahmed 10   ali  10  على ????
-- varchar(10) [variable length character]   ahmed 5 ali 3
-- nchar(10)  unicode   على على
-- nvarchar(10)
-- nvarchar(max)  up to 2GB
---------------------------DateTime
-- Date   MM/DD/yyyy
-- Time   hh:mm:12.765
-- time(7) hh:mm:12.7659876
-- smalldatetime   MM/DD/yyyy hh:mm:00
-- datetime   MM/DD/yyyy hh:mm:ss.987
-- datetime2(7) MM/DD/yyyy hh:mm:ss.9879876
-- datetimeoffset   11/24/2020  10:30  +2:00   Timezone
---------------------------binary DT
-- binary   0111100   11111100
-- image
-----------------------------others
-- XML
-- unique_identifier
-- sql_variant
--------------------------------------------------
--DB Engine
--types of instances     types odf authentication
--Top     select into
--Ranking
--datatype

select ins_name,salary,
			case
			when salary>=3000 then 'high sal'
			when salary<3000 then 'low'
			else 'No value'
			end as Newsal
from Instructor

select ins_name,iif(salary>=3000,'high','low')
from Instructor


update Instructor
	set salary=
		case
		when salary>=3000 then salary*1.10
		else salary*1.20
		end

-------------------------------

select convert(varchar(20),getdate())

select cast(getdate() as varchar(20))


select convert(varchar(20),getdate(),102)
select convert(varchar(20),getdate(),103)
select convert(varchar(20),getdate(),104)
select convert(varchar(20),getdate(),105)

select format(getdate(),'dd-MM-yyyy')
select format(getdate(),'dddd MMMM yyyy')
select format(getdate(),'ddd MMM yy')
select format(getdate(),'dddd')
select format(getdate(),'MMMM')
select format(getdate(),'hh:mm:ss')
select format(getdate(),'HH')
select format(getdate(),'hh tt')
select format(getdate(),'dd-MM-yyyy hh:mm:ss tt')

select format(getdate(),'dd')
select day(getdate())

select eomonth(getdate())

select format(eomonth(getdate()),'dddd')

select format(eomonth(getdate()),'dd')


select eomonth('1/1/2000')


SELECT TOP(3) *
From Student



-- What is the Order execution In DB?
-- What is the DataBase Object Search On Google?
-- How To Access This Object?
-- [ServerName].[DBName].[schemaName].[objectName]

-------------------------------------------------------
-- Ranking Functions
-- Row_Number()
-- Dense_Rank()
-- NTiles()
-- Rank()
-- 3nd highest salary in each department
--------------------------------------------------------


-----------------------------------Data types
---------------------------Numeric DT
-- bit    --bool    0:1    true:false
-- tinyint 1 Byte   -128:+127   unsigned   0:255 
-- smallint 2B      -32768:+32767  unsigned   0:65555
-- int    4B
-- bigint  8B
---------------------------Decimal DT
-- smallmoney   4B   .0000
-- money        8B   .0000
-- real              .0000000
-- float             .000000000000000000000000000000000
-- dec   decimal   dec(5,2)  123.87    18.1     12.098 XXX
---------------------------Char DT
-- char(10)   [fixed length character]  ahmed 10   ali  10  على ????
-- varchar(10) [variable length character]   ahmed 5 ali 3
-- nchar(10)  unicode   على على
-- nvarchar(10)
-- nvarchar(max)  up to 2GB
---------------------------DateTime
-- Date   MM/DD/yyyy
-- Time   hh:mm:12.765
-- time(7) hh:mm:12.7659876
-- smalldatetime   MM/DD/yyyy hh:mm:00
-- datetime   MM/DD/yyyy hh:mm:ss.987
-- datetime2(7) MM/DD/yyyy hh:mm:ss.9879876
-- datetimeoffset   11/24/2020  10:30  +2:00   Timezone
---------------------------binary DT
-- binary   0111100   11111100
-- image
-----------------------------others
-- XML
-- unique_identifier
-- sql_variant
--------------------------------------------------
--DB Engine
--types of instances     types odf authentication
--Top     select into
--Ranking
--datatype