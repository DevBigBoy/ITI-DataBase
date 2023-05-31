Select Salary
From Instructor

Select Sum(Salary) AS 'Total salaries'
From Instructor

Select MIN(Salary) AS 'Min Salary',
	   Max(Salary) AS 'Max Salary'
From Instructor

-- The aggregate Function does not count null values
Select COUNT(*), 
	   COUNT(St_Lname), 
	   COUNT(St_Fname),
	   COUNT(St_Age)
from Student

select avg(St_Age)
From Student

select sum(St_Age)/count(*)
from Student

select avg(isnull(St_Age,0))
from Student

-- Total salaries for each department
select Sum(salary),Dept_Id
from Instructor
GROUP BY Dept_Id

-- Group By 2 Columns + Joins
select Sum(salary) AS 'TOTAL Salaries',
	   i.Dept_Id, 
	   D.Dept_Name
from Instructor i inner Join Department D
	on i.Dept_Id = D.Dept_Id
GROUP BY i.Dept_Id, Dept_Name

SELECT Avg(St_Age),
	   St_Address, 
	   Dept_Id
From Student
Group BY St_Address, Dept_Id

Select Sum(salary), Dept_Id
from Instructor
Group by Dept_Id

Select Sum(salary), Dept_Id
from Instructor
where Salary>1000
Group by Dept_Id

-- To filter Groups
Select Sum(salary), Dept_Id
from Instructor
Group by Dept_Id
having sum(Salary) > 8000

Select Sum(salary), Dept_Id
from Instructor
Group by Dept_Id
having count(Ins_Id) < 5

-----------------------
--- Subqueries
-----------------------

-- Aggregate always come with group by
Select * 
From Student
where St_Age < Avg(St_Age)

-- To Solve above problem we use subqueries
Select * 
From Student
where St_Age < (Select Avg(St_Age) From Student)

select * , ( -- This runs First
			select count(Ins_Id)
			from Instructor) AS 'NO.Instructors' 
from Instructor

-- Display all the departments that have students
Select Dept_Name
From Department
where Dept_Id in (select distinct(Dept_Id)
				  From Student
				  where Dept_Id is not null)
-------------------------------------------------
-- Note: Joins are faster than Subqueries
select Distinct Dept_Name
from Student S inner join Department D
on S.Dept_Id = D.Dept_Id

-- DML + Subqueries
delete from Student
where St_Id = 18

delete from Student
where St_Id in (Select St_Id 
				from Student 
				where St_Address ='minia')

------------------------------------------------------
-- union family
-- union all    
-- union    
-- intersect   
-- except 1.19.29
----------------------------------------
