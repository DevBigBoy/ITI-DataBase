use Company_SD;
select * from EMPLOYEE;
select FNAME,LNAME,SALARY,DNO from EMPLOYEE;
select PNAME,PLOCATION,DNUM from PROJECT;
select  FNAME+' '+LNAME as "name" ,SALARY=SALARY*0.10 from EMPLOYEE;
select SSN,FNAME+' '+LNAME as "name" from EMPLOYEE where salary >1000;
select SSN,FNAME+' '+LNAME as "name" from EMPLOYEE where salary >10000;
select FNAME+' '+LNAME as "name" from EMPLOYEE Where SEX='f';
select DNUM,DNAME FROM DEPARTMENTS where MGRSSN=968574;
select PNAME,PNUMBER,PLOCATION FROM PROJECT WHERE DNUM=1;
--/*1. Display the Department id, name and id and the name of its manager.


















--/*1. Display the Department id, name and id and the name of its manager.

select Dnum,DNAME ,Fname  from  Departments  INNER JOIN employee  ON MGRSSN = SSN;
--2. Display the name of the departments and the name of the projects under its control.
select DNAME ,PNAME  from  Departments D  INNER JOIN Project P  ON D.DNUM = P.DNUM;
--3. Display the full data about all the dependence associated with the name of the employee they depend on him/her.
SELECT E.FNAME,D.* FROM Employee E INNER JOIN Dependent D ON D.ESSN=E.SSN; 
--4. Display the Id, name and location of the projects in Cairo or Alex city.

SELECT * FROM Project WHERE City IN ('cairo','alex');
--5. Display the Projects full data of the projects with a name starts with "a" letter.
SELECT * FROM Project WHERE pname like 'a%';
--6. display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select *from Employee where Dno=30 and Salary between 1000 and 2000;
--7. Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
SELECT "FNAME"+"LNAME" AS 'FULL NAME' FROM  Employee INNER JOIN Project ON Dnum =10 AND Pname='AL Rabwah' INNER JOIN Works_for ON Hours>=10;
--8. Find the names of the employees who directly supervised with Kamel Mohamed.

SELECT fname ,lname FROM Employee where Superssn=(select ssn from Employee where fname='kamel'and Lname='mohamed') 
select CONCAT(e1.fname,' ',e1.lname) as 'fullname'
from Employee e1 inner join Employee e2
on e2.fname='kamel'and e2.Lname='mohamed' and e2.ssn=e1.superssn;
--9. Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.

select fname,lname ,pname from Employee inner join Works_for on ssn=ESSn inner join Project on pno=Pnumber order by Pname;
--10. For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.

select city,pnumber,dname,lname,address,bdate from Project p inner join Departments d on p.city='cairo'and d.dnum=p.dnum inner join Employee on MGRSSN=ssn;
--11. Display All Data of the mangers
select * from Employee e inner join Departments d on d.mgrssn = e.SSN;
--12. Display All Employees data and the data of their dependents even if they have no dependents */

SELECT E.*,D.* 
FROM Employee E 
full outer JOIN Dependent D 
ON D.ESSN=E.SSN; 
insert  into Employee (Fname,Lname,SSN,Bdate,address,Sex,salary,superssn,Dno) values ('mohamed','atef','102672',5/9/1997,'haram','m',3000,112233,30);
insert  into Employee (Fname,Lname,SSN,Bdate,address,Sex,salary,superssn,Dno) values ('mohamed','atef','102672',5/9/1997,'haram','m',3000,112233,30);
update employee set salary=Salary*1.20 where ssn=102672;



--1.	Display (Using Union Function)
--a.	 The name and the gender of the dependence that's gender is Female and depending on Female Employee.
--b.	 And the male dependence that depends on Male Employee.

SELECT Dependent_name ,CONCAT(FNAME,' ',LNAME) as 'employee name'
FROM Dependent d,Employee e
WHERE d.SEX='F'and e.Sex='F'
union
SELECT Dependent_name ,CONCAT(FNAME,' ',LNAME)as 'employee name'
FROM Dependent d,Employee e
WHERE d.SEX='m'and e.Sex='m'


--2.	For each project, list the project name and the total hours per week (for all employees) spent on that project.


--SELECT FNAME,LNAME, PNAME ,SUM(HOURS)  FROM Employee INNER JOIN Works_for ON ESSN=SSN INNER JOIN PROJECT ON PNO=PNUMBER GROUP BY PNAME;

SELECT PNAME ,SUM(HOURS) AS 'TOTAL HOURS'  
FROM  Works_for INNER JOIN PROJECT
ON PNO=PNUMBER 
GROUP BY PNAME;


--3.	Display the data of the department which has the smallest employee ID over all employees' ID.
SELECT min(e.ssn),d.dnum,d.dname
FROM departmentS d inner join Employee e
on d.dnum=e.dno
group by dnum,dname;
--4.	For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
select dname ,AVG(salary)as 'average salary',min(salary) as 'min value',max(salary) as 'max value'
from Departments inner join Employee on dnum=dno group by Dname  ;

--5.	List the last name of all managers who have no dependents.


select fname ,lname from Employee e inner join Departments d on d.mgrssn = e.SSN and MGRSSN not in(select essn from Dependent );



--6.	For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.


select dnum,dname,count(ssn)from Departments inner join Employee on dno=Dnum group by dnum, dname having avg(salary)<(select avg (salary) from Employee)
--7.	Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.

select fname,lname ,pname , Dname from Employee e inner join Departments d on d.Dnum = e.dno inner join Project p on d.dnum = p.dnum order by Dname , fname,lname;


--8.	Try to get the max 2 salaries using subquery
select max(salary)
from Employee
union
select max(salary) 
from Employee
where Salary<(select max(salary) from employee)

--9.	Get the full name of employees that is similar to any dependent name
select concat(fname,' ',lname) 
from Employee
intersect
select dependent_name 
from Dependent
--10.	Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30% 
update employee 
set salary = Salary*1.3 
where ssn in(select essn from Works_for inner join project on pno=pnumber and Pname='Al Rabwah')



--11.	Display the employee number and name if at least one of them have dependents (use exists keyword) self-study.
select ssn ,CONCAT(fname,' ',lname) 
from Employee 
where exists (select essn from Dependent);

select * from Departments;
--dml--------------------------------------------------------------------------------------------------------
--1.	In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
insert 
into Departments(Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPT IT',100,112233,1-11-2006);



--2.	Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100), and they give you(your SSN =102672) her position (Dept. 20 manager) 

--a.	First try to update her record in the department table
--b.	Update your record to be department 20 manager.
--c.	Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)


update Departments set MGRSSN =968574 where dnum=100;

update Departments set MGRSSN =102672 where dnum=20;

update Employee set Superssn=102672 where ssn=102660;

--3.	Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) so try to delete his data from your database in case you know that you will be temporarily in his position.
--Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works in any projects and handle these cases).
delete Dependent where ESSN=223344
delete Works_for where ESSN=223344

update Departments set MGRSSN=102672 where MGRSSN=223344;

update Employee set Superssn = 102672  where Superssn=223344;

delete Employee where SSN=223344





