use Company_SD

--  Q1 :

Select Dnum , Dname ,SSN ,  concat(Fname , Lname ) as [Full Name] 
	from Departments inner join Employee 
	on Departments.MGRSSN = Employee.SSN

 -- Q2 -

Select Dname , Pname 
	from Departments inner join Project
	on Departments.Dnum =Project.Dnum

-- Q3 -

select dep.* , CONCAT(EM.Fname,  EM.Lname)as [Full Name]
	from Dependent dep inner join  Employee EM 
	on dep.ESSN =EM.SSN

-- Q4 - 

SELECT  PNUMBER  , PNAME  , PLOCATION
	FROM PROJECT 
	WHERE CITY LIKE 'ALEX' OR CITY  LIKE 'CAIRO'
	
-- Q5 - 

Select *
	FROM Project 
	WHERE Pname LIKE 'A%'

-- Q6 - 

SELECT Employee.*
	FROM Employee 
	WHERE Employee.Dno = 30 
	AND Salary BETWEEN 1000 AND 2000 

-- Q7 - 

SELECT CONCAT(FNAME , LNAME ) AS [FULL NAME ] 
	FROM  Employee EM INNER JOIN Works_for WF 
	ON WF.ESSn = EM.SSN AND WF.Hours*5 >=10 AND EM.Dno =10
	INNER JOIN Project PJ 
	ON WF.Pno = PJ.Pnumber
	AND PJ.Pname= 'AL Rabwah'

-- Q8 - 

SELECT  concat(e.Fname , e.Lname )AS [FULL NAME ] 
	from Employee e inner join  Employee m 
	on  m.SSN = e.Superssn
	AND  m.Fname ='Kamel' and m.Lname ='Mohamed' 

-- Q9 -

SELECT CONCAT(FNAME , LNAME ) AS [NAME ] , PJ.Pname
	FROM  Employee EM INNER JOIN Works_for WF 
	ON WF.ESSn = EM.SSN 
	INNER JOIN Project PJ 
	ON WF.Pno = PJ.Pnumber
	order by PJ.Pname

-- Q10 - 

select PJ.Pnumber , DP.Dname , EM.Lname , EM.Address , EM.Bdate 
	from Project PJ  inner join Works_for WF 
	ON PJ.City ='Cairo' and WF.Pno = PJ.Pnumber
	inner join Employee EM
	ON WF.ESSn = EM.SSN 
	inner join Departments DP 
	on EM.Dno = DP.Dnum

-- Q11 -

SELECT * 
	FROM Project

-- Q12 - 
	
SELECT  EM.* 
	from Employee EM inner join Departments DP
	on DP.MGRSSN = EM.SSN


-- Q13 - 
insert into Employee
VALUES (NULL , NULL , 102672 , NULL , NULL ,NULL ,3000, 112233, 30)

-- Q14 -

insert into Employee(SSN, Dno)
VALUES ( 102672, 30)


--SELECT 

UPDATE Employee
	SET Salary *=1.2
	where SSN =102672


