
----=======>1. Insert data in all table

select*from tblEmployee
insert into tblEmployee values('nazmul','hasan','Feni','0152369874','nazmul@gmail.com','1990',01235698,'Male')
insert into tblEmployee values('Shihab','hasan','Sathkhira','01523669874','shihabl@gmail.com','1991',23635698,'Male')
insert into tblEmployee values('Abdullah','Al-Mamun','Cumilla','0145698874','mamunl@gmail.com','1993',23789698,'Male')
insert into tblEmployee values('Tamim','Islam','Barisal','0145698874','tamiml@gmail.com','1990',235699698,'Male')
insert into tblEmployee values('Mamun','Ahmed','Dhaka','01447896874','mamunl@gmail.com','1993',23452398,'Male')
insert into tblEmployee values('Josna','Akhter','Dhaka','014796574','josnal@gmail.com','1999',237785638,'Female')
go

---==========Insert data into tblSalary
select*from tblSalary
insert into tblSalary (employeeid,basicSalary,intensive) values(3,100000,3000)
insert into tblSalary (employeeid,basicSalary,intensive) values(4,100000,3000)
insert into tblSalary (employeeid,basicSalary,intensive) values(5,100000,3000)
insert into tblSalary (employeeid,basicSalary,intensive) values(3,100000,3000)
insert into tblSalary (employeeid,basicSalary,intensive) values(6,50000,5000)
insert into tblSalary (employeeid,basicSalary,intensive) values(11,100000,5000)
insert into tblSalary (employeeid,basicSalary,intensive) values(12,100000,3000)
go

---============Insert data into tblMetroInfo
select*from tblMetroInfo
insert into tblMetroInfo values('Sonar Bangla',1)
insert into tblMetroInfo values('Padma',2)
insert into tblMetroInfo values('Jumuna',3)
insert into tblMetroInfo values('Bongo Express',4)
go
---============Insert data into tblDepartment


 select*from tblDepartment
 insert into tblDepartment values('Tecnical','Metro Master',3)
 insert into tblDepartment values('Tecnical','Metro Master',6)
 insert into tblDepartment values('Tecnical','Metro Master',6)
 insert into tblDepartment values('Finance',' Budget Controler',11)
 insert into tblDepartment values('IT',' System Analyst',12)
 go

----================Insert data into tblEmployeeLeave 
insert into tblEmployeeLeave values(3,1,'Fever','12-14-2020','12-15-2020',0)
insert into tblEmployeeLeave values(4,2,'Physical Injured','12-16-2020','12-20-2020',0)
insert into tblEmployeeLeave values(11,1,'Fever','12-13-2020','12-20-2020',0)
go

--============Insert data into  tblEmployeeLeavestock

select*from tblEmployeeLeavestock
insert into tblEmployeeLeavestock values(3,8)
insert into tblEmployeeLeavestock values(4,8)
insert into tblEmployeeLeavestock values(5,8)
insert into tblEmployeeLeavestock values(6,8)
insert into tblEmployeeLeavestock values(12,8)
insert into tblEmployeeLeavestock values(11,8)
go

--=============Insert data into 
insert into tblPassenger values('sumon',0178963597,getdate(),4,1,0,'22,23')
insert into tblPassenger values('Rajib',012378997,getdate(),4,1,0,'30,36')
insert into tblPassenger values('Bilkis',0178997,getdate(),4,1,0,'23,63')
 insert into tblPassenger values('Najim',012789697,getdate(),4,1,0,'45')
insert into tblPassenger values('Munna',0102365597,getdate(),4,1,0,'25')
go
 ---==========>insert into tblMetroMaster
insert into tblMetroMaster values(1,'Nazmul',1,3)
insert into tblMetroMaster values(2,'Shihab',2,4)
go
--=======insert into tblBudget 
insert into tblBudget values('Metro Budget',2500000)
insert into tblBudget values('ItemRepair Budget',2500000)
insert into tblBudget values('RouteRepair Budget',2500000)
go

---=======insert into tblrepairItem
insert into tblrepairItem values('Metro Engine')
insert into tblrepairItem values('Metro Bogi')
insert into tblrepairItem values('Metro route')
insert into tblrepairItem values('Termina Box')
insert into tblrepairItem values('Metro Seat')
go

--=====insert into tblRepairBox

insert into tblRepairBox values(1,'Metro Bogi',getdate(),12/30/2021,1)
insert into tblRepairBox values(1,'Metro Terminal',getdate(),12/20/2021,3)

---=======insert into tblDepreciation

insert into tblDepreciation values(1)
insert into tblDepreciation values(2)
go
--=======>insert into tblEventPackage

insert into tblEventPackage values('Monthly Ticket Holder',null,6) 
go

--==============> insert into tblLinkEmp

 insert into tblLinkEmp values(getdate(),getdate(),6)   
 go

---========> insert into tblAdvancePurchaseTicket

 insert into tblAdvancePurchaseTicket values(1,2,1,null)
 go



---=====>>>2. Insert Data with store procedure

---====>Insert into tblstopage though store procedure 

EXEC SP_INSERTINTOSTOPAGE 'GULSAN','UTTRA',2,200,100,'12-12-2021','12-12-2021'
EXEC SP_INSERTINTOSTOPAGE 'UTTRA','GULSAN',2,200,100,'12-12-2021','12-12-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','GULSAN',2,200,100,'12-12-2021','12-12-2021'
EXEC SP_INSERTINTOSTOPAGE 'GULSAN','MIRPUR',2,200,100,'12-12-2021','12-12-2021'
EXEC SP_INSERTINTOSTOPAGE 'AGARGAON','GULSAN',2,200,100,'12-12-2021','12-12-2021'
EXEC SP_INSERTINTOSTOPAGE 'UTTRA','AGARGAON',2,200,100,'12-03-2021','12-05-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','AGARGAON',2,200,100,'12-03-2021','12-04-2021'
EXEC SP_INSERTINTOSTOPAGE 'UTTRA','GULSAN',2,200,100,'12-08-2021','12-09-2021'
EXEC SP_INSERTINTOSTOPAGE 'UTTARA','GULISTAN',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'GULISTAN','MOTIJIL',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','GULISTAN',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','BADDA',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'BADDA','SHABAG',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','SHABAG',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'GULSAN','SHABAG',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'FIRMGATE','MOTIJIL',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MOTIJIL','AGAGAON',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','SHABAG',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'KOMOLAPUR','MOTIJIL',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'BADDA','GULISTAN',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','MOTIJIL',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','MOTIJIL',2,300,200,'12-09-2021','12-10-2021'
EXEC SP_INSERTINTOSTOPAGE 'MIRPUR','MOTIJIL',2,300,200,'12-09-2021','12-10-2021'
GO


 --=====insert into ticketstock with store procedure

 exec sp_insertintoticketstock 50
 exec sp_insertintoticketstock 100
 exec sp_insertintoticketstock 300
 go

---===>3. test view

--==>i)view for tblMetromaaster

select*from vMetromaster
GO

---==ii)view for tblsalry

select*from vSalaryInfo
GO
--==>iii) view for tblemployee 

select*from EemployeeInfo
GO

--====4. test trigger

--===> Test TRIGGER trTicketStock

insert into tblPassenger (passengerName,stopageId,totalSeat,classId) values('Shihab',1,2,2)
GO

---====>>5. test function
--===>Test Scalar values function .
select*from fnPassengerSummeryOfMonth(2021,1)

---===>6 WRITE A SIMPLE QUERY
 --=>i)
SELECT*FROM tblEmployee WHERE employeeId =12
GO

--=ii)
SELECT*FROM tblSalary WHERE salaryId=4
GO
--==iii)
SELECT*FROM tblStopage 
GO
--===>>7. write join query

--=== write a join query employee departement group by gender 

select e.employeeId,e.empFirstName,e.gender 
from tblEmployee e 
inner join tblDepartment d on e.employeeId=d.employeeId
go

8. Write join query with aggregiate function.

--===>write a join query employee departement group by gender
select count(e.employeeId) as ename ,e.empFirstName,e.gender 
from tblEmployee e 
inner join tblDepartment d on e.employeeId=d.employeeId
group by  e.gender,e.empFirstName 

--==>9. write Sub-query
--===sub-query to find out maximum salry for the employee

SELECT salaryId,netSalary,intensive FROM tblSalary
WHERE netSalary=(SELECT MAX(netSalary) FROM tblSalary)

go


----======Sub query to find out max budget 
SELECT budgetId,budgetName ,budgetAmount FROM tblBudget
WHERE budgetAmount=(SELECT MAX(budgetAmount) FROM tblBudget)


----====Sub query to find out max ticket stock 
SELECT classId,availableTicket FROM tblTicketStock
WHERE availableTicket=(SELECT MAX(availableTicket) FROM tblTicketStock)


--===>10. write CTE 
----====CTE  employee and salasry with Cube 

With CTE_employeeWiseSalay
AS

(
select count(e.employeeId) as eid ,e.empFirstName,e.gender ,s.netSalary
from tblEmployee e 
inner join tblDepartment d on e.employeeId=d.employeeId
inner join tblSalary s on e.employeeId=s.employeeid
group by  e.gender,e.empFirstName,s.netSalary with rollup
)
select*from CTE_employeeWiseSalay
GO


---==>Serached Case 
 
SELECT metroId,
CASE
WHEN AC_Bath_Price=200     THEN 'IT IS FOR VIP CUSTOMERS'
WHEN Business_Class_Price=100 THEN 'IT IS AVAIABLE FOR EVERY ONE'
ELSE 'NO COMMENT'
END AS RESULT
FROM tblStopage
GO


11. Write query with ROLLUP, CUBE,OVER
--==>query with rollup

select e.empFirstName,count(e.employeeId)as 'employee ',e.gender 
from tblEmployee e 
inner join tblDepartment d on e.employeeId=d.employeeId
group by  empFirstName,e.gender with ROLLUP   
GO

--==>join query with cube 
select e.empFirstName,count(e.employeeId)as 'employee ',e.gender 
from tblEmployee e 
inner join tblDepartment d on e.employeeId=d.employeeId
group by  empFirstName,e.gender with cube   
GO
-----<><><><><><><><><><><><><==================================-><><><><><><><><><><><><><><>











