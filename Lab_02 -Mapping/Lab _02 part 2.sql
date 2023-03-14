 -- Part_two 

use Company_SD

 -- Q_1 : 

select * from Employee  

-- Q_2 :

 select Fname , Lname , Salary , Dno from Employee

 -- Q_3 :
 select Pname , Plocation , Dnum from Project

 --Q_4 :

 select Fname +' '+ Lname +' '+cast(salary*12*0.10 AS varchar(20)) as [ANNUAL COMM ] from Employee

 -- Q_5 :

 select SSN , Fname + ' '+Lname as [Name]from Employee
	where Salary >1000 

-- Q_6 :

 select SSN , Fname + ' '+Lname as [Name]from Employee
	where Salary*12 >10000 

-- Q_7 :

 select Fname + ' '+Lname as [Name],Salary from Employee
	where Sex = 'F'  

-- Q_8 :

select Dnum , Dname from Departments
	where MGRSSN =968574 

-- Q_9 :

select Pnumber , Pname , Plocation  from Project
	where Dnum =10