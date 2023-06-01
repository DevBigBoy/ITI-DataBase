--1.	Retrieve number of students who have a value in their age. 
select COUNT(st_age) as number_of_st_not_null
from Student
--where St_Age is not null

--2.	Get all instructors Names without repetition
select distinct ins_name
from Instructor

--3.	Display student with the following Format (use isNull function)
       --  Student ID	Student Full Name	Department name
		select isnull(st_id,' no data') asStudend_ID,isnull(st_fname+' '+st_lname,'no data ') as full_name,isnull(dept_name,' no data') as department_name
		from Student s,Department d
		where d.Dept_Id=s.Dept_Id

--4.	Display instructor Name and Department Name 
 --Note: display all the instructors if they are attached to a department or not
 select dept_name,ins_name
 from Instructor i left outer join Department d
 on d.Dept_Id=i.Dept_Id
 
 --5.	Display student full name and the name of the course he is taking
       --For only courses which have a grade
	   select st_fname+' '+st_lname as full_name ,crs_name
	   from Student s,Stud_Course sc,Course c
	   where s.St_Id=sc.St_Id and c.Crs_Id=sc.Crs_Id and Grade is not null

--6.	Display number of courses for each topic name
        select COUNT(crs_id) as n_courses,top_name
		from Course c inner join Topic t
		on t.Top_Id=c.Top_Id
		group by Top_Name

		--7.	Display max and min salary for instructors
		select max(salary) as max_val ,min(salary) as min_val
		from Instructor

		--8.	Display instructors who have salaries less than the average salary of all instructors.
		select ins_name
		from Instructor
		where salary < (select avg(salary) from Instructor)

		--9.	Display the Department name that contains the instructor who receives the minimum salary.
		select dept_name
		from Instructor i inner join Department d
		on d.Dept_Id=i.Dept_Id and Salary=(select min(Salary) from Instructor)

		select top 1 dept_name
		from Instructor i inner join Department d
		on d.Dept_Id=i.Dept_Id 
		order by Salary 

		--10.	 Select max two salaries in instructor table. 
		select top 2 Salary
		from Instructor
		order by salary desc

		--11 Select instructor name and his salary but if there is no salary display instructor bonus.
		-- “use one of coalesce Function”

		select ins_name ,coalesce(convert( varchar(20),salary),'bounas')
		from Instructor 
		--12.	Select Average Salary for instructors 
		select avg(salary) as avg_val
		from Instructor

		--13.	Select Student first name and the data of his supervisor 
		select x.st_fname,y.*
		from Student x,Student y
		where y.St_id=x.St_super

		--14.	Write a query to select the highest two salaries in Each Department for instructors
		-- who have salaries. “using one of Ranking Functions”
		select * 
		from (
		select *,ROW_NUMBER() over(partition by dept_id order by salary desc)as max_sal
		from Instructor i)
		as new
		where max_sal<=2

		--15.	 Write a query to select a random  student from each department.  “using one of Ranking Functions”
		select * from(
		select  *,ROW_NUMBER() over(partition by dept_id order by newid()) as random
		from Student)as new
		where random=1
--------------------------------------------------------------------------------------------------------------------------------------------\
-----------------adven---------------
--1.	Display the SalesOrderID, ShipDate of the SalesOrderHearder table (Sales schema)
-- to designate SalesOrders that occurred within the period ‘7/28/2002’ and ‘7/29/2014’
select salesorderid,shipdate
from Sales.SalesOrderHeader
where  OrderDate between '7/28/2002' and '7/29/2014'

--2.	Display only Products(Production schema) with a StandardCost below $110.00 (show ProductID, Name only)
select productid,name
from Production.Product
where StandardCost<110

--3.	Display ProductID, Name if its weight is unknown
select productid,name
from Production.Product
where Weight is null

--4.	 Display all Products with a Silver, Black, or Red Color

select *
from Production.Product
where color in ('silver','black','red')

--5.	 Display any Product with a Name starting with the letter B
select *
from Production.Product
where name like 'b%'

--6.	Run the following Query
--UPDATE Production.ProductDescription
--SET Description = 'Chromoly steel_High of defects'
--WHERE ProductDescriptionID = 3
--Then write a query that displays any Product description with underscore value in its description.
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select * 
from Production.ProductDescription
where Description like '%[_]%'

--7.	Calculate sum of TotalDue for each OrderDate in Sales.
--SalesOrderHeader table for the period between  '7/1/2001' and '7/31/2014'
select sum(totaldue) as sum_total,orderdate
from sales.SalesOrderHeader
where OrderDate between '7/1/2001'and'7/31/2014'
group by OrderDate

--8.	 Display the Employees HireDate (note no repeated values are allowed)

select distinct hiredate
from HumanResources.Employee

--9.	 Calculate the average of the unique ListPrices in the Product table

select avg(distinct listprice) as unique_avg
from Production.Product

--10.	Display the Product Name and its ListPrice within the values of 100 and 120 the list should has 
--the following format "The [product name] is only! [List price]" (the list will be sorted according to its ListPrice value)
select concat('the [',name ,'] is only!',' [',listprice,']') as product_name_price
from Production.Product
where ListPrice between 100 and 120
order by ListPrice

--a)	 Transfer the rowguid ,Name, SalesPersonID, Demographics from Sales.Store table  in a newly created table named [store_Archive]
--Note: Check your database to see the new table and how many rows in it?
--b)	Try the previous query but without transferring the data? 
select *into store_Archive
from Sales.Store
select *into store_Archivee
from Sales.Store
where 1=2

--12.	Using union statement, retrieve the today’s date in different styles

select convert(varchar(20),getdate())
union
select cast(getdate() as varchar(20))
union
select convert(varchar(20),getdate(),102)
union
select convert(varchar(20),getdate(),103)
union
select convert(varchar(20),getdate(),104)
union
select convert(varchar(20),getdate(),105)

select format(getdate(),'dd-MM-yyyy')
union
select format(getdate(),'dddd MMMM yyyy')
union
select format(getdate(),'ddd MMM yy')
union
select format(getdate(),'dddd')
union
select format(getdate(),'MMMM')
union
select format(getdate(),'hh:mm:ss')
union
select format(getdate(),'HH')
union
select format(getdate(),'hh tt')
union
select format(getdate(),'dd-MM-yyyy hh:mm:ss tt')
union
select format(getdate(),'dd')

select day(getdate())

select eomonth(getdate())

select format(eomonth(getdate()),'dddd')
union
select format(eomonth(getdate()),'dd')

-----------------------------------------------------------------------------------------------
select @@VERSION


select @@SERVERNAME



















	   


