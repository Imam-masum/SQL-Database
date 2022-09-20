

                     /*
                      TraineeName:Md.Imam Hosen 
                      TrianeeId:1264925
                      TraineeBatch:ESAD/CS/PNTL-M/49/01
                       ProjectName: Dahaka_Metro_Rail 

                    ***Major Study: Automation of Metro Mangement System and Ticketing System*******

                     */



DROP DATABASE IF EXISTS Dhaka_Metro_Rail
GO
---====>create Database 

Create Database Dhaka_Metro_Rail
ON
(
Name='Dhaka_Metro_Rail_Data_1',
fileName='E:\ddl/Dhaka_Metro_Rail.mdf',
size=50mb,
maxsize=100mb,
filegrowth=5%
)
Log On
(
Name='Dhaka_Metro_Rail_Log_1',
fileName='E:\ddl/Dhaka_Metro_Rail.ldf',
size=5mb,
maxSize=50,
fileGrowth=2mb
)
Go
---===>>>>use Databse 

use Dhaka_Metro_Rail
GO
----===================>>>>>>>>>>>
----===>1.Normalization(create table)

--==>TAble no 001 

Create table tblEmployee
(
    employeeId int identity primary KEY,
    empFirstName   nvarchar(30)not null,
    empLastName nvarchar(20)not null,
    city nvarchar(30) default 'Dhaka',
    contact nvarchar(13),
    email nvarchar(30) default 'metro@gmailbd.com',
    dob datetime  not null check(year(dob)>=1990)  ,
    nationalId nvarchar(16) unique ,
	gender nvarchar(20)  check (gender in ('Male','Female','others'))
)
GO

---=====>Table no 002 
create table tblDepartment 
(
    deptId int IDENTITY primary KEY,
    deptName nvarchar(30),
    designation nvarchar(30),
    employeeId int references tblemployee(employeeId),
)
GO

--=====>table no 003 

create table tblLinkEmp
(
    linkId int IDENTITY PRIMARY KEY,
    joinDate datetime not null ,
    resignDate DATETIME not null ,
    employeeId int references tblemployee(employeeId)
)
GO

---======>tbale no--004
create table tblSalary
(
    salaryId int IDENTITY primary key ,
    employeeid int REFERENCES tblemployee(employeeId),
    basicSalary float check (basicSalary between 50000 and 100000),
    houseRent  as (basicsalary*.10),
    medicalAllowence as(basicSalary*.10),
    transport as (basicSalary*.10),
    intensive money  default 0 ,
    promotion BIT,
    providendFund as (basicSalary*.10),
    total as basicSalary+  (basicsalary*.10+basicSalary*.10+basicSalary*.10+intensive) ,
    netSalary as basicSalary+ (basicsalary*.10+basicSalary*.10+basicSalary*.10+intensive -basicSalary*.10)
  
)
go

---====>table no 005

Create Table tblEventPackage  
(
    eventId int IDENTITY primary key ,
    eventName nvarchar(30),
    employeeId int references tblemployee(employeeId),
    passengerId int REFERENCES  tblPassenger (passengerId)
)
GO

----====>table no --6

create table tblMetroInfo
(
    metroId int IDENTITY primary KEY,
    metroName nvarchar(30),
    routeNo NVARCHAR(30) Default ('Terminal-1'),
   
)
go

----====>table no 007

create table tblMetroMaster
(
    masterId int not null PRIMARY KEY,
    masterName nvarchar(30),
    metroId int REFERENCES tblMetroInfo(metroId),
    deptId int REFERENCES tblDepartment(deptId)

)
go

--=====>table no 008

create table tblPassenger 
(
    passengerId int IDENTITY primary KEY,
    passengerName nvarchar(30),
    passengerContact nvarchar(30),
    ticketPurchaseDate datetime not null default getdate(),
    stopageId int REFERENCES tblStopage(stopageId),
    metroId int REFERENCES tblMetroInfo(metroId)
    

)
GO

--====>table no 009

create table tblStopage
(
    stopageId int  IDENTITY primary key,
    [from] nvarchar(30),
    [to] nvarchar(30),
    metroId int REFERENCES tblMetroInfo(metroId),
    Ac_Bath_Price money null,
    Business_Class_Price money
)
go


--====>table no 010

create table tblTicketStock
(
    classId int identity primary KEY,
    availableTicket int not null 
)
GO

--=====>table no 011

create table tblAdvancePurchaseTicket
(
    npassengerId int  primary KEY,
    classId int REFERENCES tblTicketStock(classId),
    metroId int REFERENCES tblMetroInfo(metroId),
    passengerId int REFERENCES tblpassenger(passengerId)
)
GO

--=====>table no 012

create table tblBudget 
(
    budgetId int IDENTITY PRIMARY KEY,
    budgetName nvarchar(30),
    budgetAmount money
)
GO

--=====>table no 013

create table tblrepairItem
(
    itemId int IDENTITY PRIMARY KEY,
    itemName nvarchar(30)
)
GO

--====>table no 014

create table tblDepreciation 
(
    depreciationId int IDENTITY PRIMARY KEY,
    itemId int REFERENCES tblrepairItem(itemId)
)
GO

--====>table no 015

create table tblRepairBox
(
    repairId int IDENTITY PRIMARY KEY,
    itemId int REFERENCES tblrepairItem(itemId),
    repairItem nvarchar(30),
    repairDate datetime default getdate(),
    deleiveryDate datetime default getdate(),
    budgetId int REFERENCES tblBudget(budgetId)
)
GO

--====>table no 016

create table tblEmployeeLeave
(
    employeeId int REFERENCES tblemployee(employeeId),
    deptId int REFERENCES tblDepartment(deptid),
    leaveCase nvarchar(50),
    leaveStart datetime default getdate(),
    leaveEnd datetime default getdate(),
    totalleave int not null
     Primary key(employeeId,deptid)
)
GO

--====>table no 017

create table tblEmployeeLeavestock
(
    employeeId int REFERENCES tblemployee not null primary key,
    leaveStock int default 8 
)
GO

--====>table no 018

create table team 
(id int null,
teamName nvarchar(30)
)

------===============================================================================
--==>2.Alter statement (Any Table)
--==> i)ALTER TABLE TBLEMPLOYEE

ALTER TABLE tblEmployee
ADD gender NVARCHAR(20)  CHECK (gender in ('Male','Female','others'))

--==>ii)ALTER TABLE TBLTICKETPRICE

ALTER TABLE tblTicketPrice
DROP CONSTRAINT classname 

--==>iii)ALTER TABLE TBLEMPLOYEELEAVE

ALTER TABLE   tblEmployeeLeave
ADD    totalleave INT DEFAULT 0

--==>3.Create Index
--=>CLUSTERED INDEX

CREATE CLUSTERED INDEX IX_TEAM
ON TEAM (id)
GO

--===>NONCLUSTERED INDEX

CREATE NONCLUSTERED INDEX IX_TEAMINFO
ON TEAM(TEAMNAME)

---=====>4.Create View
--===>i)Create view for tblemployee

CREATE VIEW EemployeeInfo AS
SELECT employeeId,leaveStart,leaveEnd
FROM tblEmployeeLeave
WHERE employeeId=6
GO

--===>ii)Create view for tblsalry

CREATE VIEW vSalaryInfo AS
SELECT stopageId,[from],[to]
FROM tblStopage
WHERE stopageId=1

--===>iii) Create view for tblsalry

CREATE VIEW vMetromaster AS
SELECT metroId,masterId,masterName
FROM tblMetroMaster
WHERE metroId=1




--===5.Create Procedure 
---====>Create Insert Procedure
---===>CREATE PROC FOR Insert data tblemployee  

create proc sp_insertintoemployee
             @ef nvarchar(30),
             @el nvarchar(30),
             @city nvarchar(30),
             @contact nvarchar(14),
             @email nvarchar(30),
             @dob datetime ,
             @nt nvarchar(30),
             @g nvarchar(12)
 AS
 insert  into tblEmployee (empFirstName,empLastName,city,contact,email,dob,nationalId,gender)
 values(@ef,@el,@city,@contact,@contact,@email,@dob,@nt,@g)         
 GO

--====>CREATE PROC FOR Insert data tblTicketPrice  

Create proc  sp_ticketpriceinsert 
                               @classname nvarchar (30) ,
                            
                               @availableticket int 
AS
Insert Into tblTicketPrice (className,availableTicket)
values(@classname,@availableticket)
GO

--===>6.Create Procedure with OUTPUT parameter

create proc sp_InsertBudget
              @budgetName nvarchar(30),
              @budgetAmount money,
              @id int OUTPUT
AS
insert into tblBudget (budgetName,budgetAmount)
values(@budgetName,@budgetAmount)
select @id=IDENT_CURRENT('tblBudget') 
GO    

---====>create procedure for insert,update,delete

create proc  sp_ticketpriceinsert 
                               @classname nvarchar (30) ,
                               
                               @availableticket int 
AS
BEGIN
  IF @StatementType = 'Insert'
       BEGIN
            INSERT INTO tblTicketStock
                        (classId,
                        availableTicket)
            VALUES     ( @classname,
                        @availableticket)
END                        
      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   tblTicketStock
        END   
 IF @StatementType = 'Update'
        BEGIN
            UPDATE tblTicketStock
            SET    classId = @classname,
                   availableTicket = @availableticket
                   
            WHERE  classId = @classname
        END                      

 ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM tblTicketStock
            WHERE  classId = @classname
        END
  
END
GO

---======7.Create Function(UDF's)

 --==>Scalar Function

 CREATE  FUNCTION fnEmptotalCountLeave(@orderDate1 DATETIME,@orderDate2 DATETIME)
  RETURNS INT
   AS
  BEGIN
		DECLARE @leaveCount INT
		SELECT @leaveCount= COUNT(leaveStart-leaveEnd) FROM tblEmployeeLeave
		WHERE leaveStart BETWEEN @orderDate1 and  @orderDate2
		RETURN @leaveCount
END
GO
----====>tabel level function(Singale Statment)

create  FUNCTION fnPassengerSummeryOfMonth(@year INT, @mid INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	COUNT(passengerid) 'Total Passenger',
    COUNT(metroId)  'Total metro'
	FROM tblPassenger
	WHERE YEAR([ticketPurchaseDate])=@year AND ([metroId])=@mid
)
GO

---===>Table  Level multi-Statment Function 

CREATE FUNCTION fnPassengerSummery (@year int ,@mid int )
RETURNS @tblpassenger TABLE
( passengerid int,
   metroId int 
)
AS
BEGIN
INSERT into @tblpassenger
SELECT passengerId ,
    count(passengerid) 'Total Passenger',
     count(metroId)  'Total metro'
	FROM tblPassenger
	WHERE YEAR([ticketPurchaseDate])=@year AND ([metroId])=@mid
    GROUP by passengerId
    RETURN 


END
Go
--==> 08.Create Trigger
--=> AFTER Tigger

CREATE TRIGGER trUpdateDelete
ON tblsalary
AFTER UPDATE,DELETE
AS
BEGIN
		PRINT 'Trigger fired!!'
		ROLLBACK TRANSACTION
END
GO

--===>For Tigger

CREATE TRIGGER trInsert 
ON tblemployee
FOR  insert 
AS
BEGIN
		PRINT 'Trigger fired!!'
		ROLLBACK TRANSACTION
END
GO

---====> Instead of trigger

CREATE TRIGGER trTicketStock
on tblpassenger
INSTEAD of insert 
AS
BEGIN
          Declare @pid int,@total int ,@seat int 
          SELECT @pid=classId ,@seat=totalseat from inserted
          select @total= sum(availableticket) from tblTicketStock where classId=@pid
          IF @total>@seat
BEGIN
          Insert into tblPassenger (passengerId,passengerName,passengerContact,ticketPurchaseDate,stopageId,metroId,totalSeat,seatNo,classId)
          Select passengerId,passengerName,passengerContact,ticketPurchaseDate,stopageId,metroId,totalSeat,seatNo,classId from inserted
END
ELSE
BEGIN
            RAISERROR ('there is no stock',10,1)
            ROLLBACK TRANSACTION
END
END
GO

---======>09 transaction

---- transaction (001) create a transaction between tblemployeelave and leave stock 

BEGIN TRANSACTION
BEGIN TRY
UPDATE tblEmployeeLeavestock set leaveStock=leaveStock-2
where employeeId=2
UPDATE tblEmployeeLeave set totalleave=totalleave+2
WHERE employeeId=2
COMMIT TRANSACTION 
END TRY
BEGIN CATCH 
RAISERROR ('limitcross',1,1)
ROLLBACK TRANSACTION 

END CATCH
GO





