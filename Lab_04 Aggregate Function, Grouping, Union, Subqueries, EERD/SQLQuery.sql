USE COMPANY_SD



-- Q1 - 
 
SELECT  DEPENDENT.DEPENDENT_NAME , DEPENDENT.SEX 
	FROM DEPENDENT , EMPLOYEE
	WHERE DEPENDENT.SEX LIKE 'F%' AND 
	EMPLOYEE.SEX LIKE'F%'
	UNION ALL 
SELECT  DEPENDENT.DEPENDENT_NAME , DEPENDENT.SEX 
	FROM DEPENDENT , EMPLOYEE
	WHERE DEPENDENT.SEX LIKE 'M%' AND 
	EMPLOYEE.SEX LIKE'M%'

-- Q2 -

SELECT  PNAME , SUM(HOURS) AS [TOTAL HOURS]  
	FROM PROJECT  , WORKS_FOR
	GROUP BY PNAME 

-- Q3 -

select * from Departments
	where Dnum in (select dno from Employee
	where ssn in (select min(ssn) from Employee))	

-- Q4 - 

select Dname  , max(salary) , min(salary) , avg(salary)
from Departments , Employee
where Dno = Dnum
group by dname 

-- Q5 - 

select concat ( fname , lname )
		from Employee inner join  Departments
		on Employee.SSN = Departments.MGRSSN and MGRSSN not in (select ESSN from Dependent)
		

-- Q6 - 

/**6 For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.**/
select Dno , count(*)
from  Employee
group by Dno 
having avg(Salary) < ( select avg(salary)
from Employee)

select Dnum, Dname , (select count(*)from Employee)
from Departments,employee
where Departments.Dnum = Employee.Dno
group by Dnum, Dname 
having avg(Employee.Salary) < (select avg(salary) from Employee)

-- Q7 - 

select Fname,Lname ,Pname , Dno
from Employee inner join Departments
on ssn = MGRSSN
inner join Project
on Departments.Dnum=Project.Dnum 
order by Dno , Fname,Lname
	
-- Q8 - 

select (select max(salary) from Employee) as First_MaXSalary , max(salary) as second_MaXSalary
from Employee
where Salary not in (select max(salary) from Employee)


-- Q9 -

select CONCAT(Fname,Lname) as Fullname
from Employee , Dependent
where SSN=EssN and CHARINDEX(Fname,Dependent_name)>0

-- Q10 -

select Fname,Lname
from Employee
where exists (select count(*) from Dependent where ssn = essn)

-- Q11 -

Insert into Departments
values ('DEPT IT',100,112233,'1-11-2006')

-- Q12 - 
 -- A- 
update Departments
set  mgrssn= (select SSn from Employee where ssn =968574)
where Dnum = 100

-- B - 
update employee
set Fname='menna' , Lname='magdy' ,Dno=20
where ssn =102672

--C - 
update employee
set Superssn = (select ssn from Employee where ssn =102672)
where ssn = 102660

-- Q13 - 

delete from Employee
where ssn =(select MGRSSN from Departments 
where MGRSSN=223344 ) and ssn =
(select essn from  Dependent
where essn =223344)

-- Q14 - 

update Employee
set Salary += Salary*.3
where Dno in
(select Dnum from Departments where Dname='Al Rabwah')