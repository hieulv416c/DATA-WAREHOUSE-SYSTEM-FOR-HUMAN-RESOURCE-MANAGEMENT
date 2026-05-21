Create database DTWH_FINAL

create schema employee
	

create table employee.DimEmplyee (
    EmployeeKey int identity(1,1) primary key
  , EmployeeID   int
  , FirstName Nvarchar(50)
  , LastName Nvarchar(50)
  , BirthDate Date
  , Gender Nchar (1)
  , MaritalStatus Nchar (1)
  , OrganizationLevel Smallint
  , HireDate Date
  , JobTitle Nvarchar(50)
  , SalariedFlag Bit
  , CurrentFlag Bit
  , VacationHours Smallint 
  , SickLeaveHours Smallint 
  , Actived_From datetime
  , Actived_To datetime
)

create table employee.DimDepartment (
    DepartmentKey int identity(1,1) primary key
  , DepartmentID  Smallint
  , DepartmentName nvarchar(50)
  , GroupName nvarchar(50)
  , Actived_From datetime
  , Actived_To datetime
)


create table employee.DimShift (
    ShiftKey int identity(1,1) primary key
  , ShiftID  Tinyint 
  , ShiftName nvarchar(50)
  , Start_Time time
  , End_Time time
  , Actived_From datetime
  , Actived_To datetime
)


create table employee.DimContact (
    ContactKey int identity(1,1) primary key
  , EmailAddress nvarchar(128)
  , PhoneNumber Nvarchar (50)
  , Actived_From datetime
  , Actived_To datetime
)

create table employee.DimCandidate (
    CandidateKey int identity(1,1) primary key
  , JobCandidateID   Tinyint 
  , BusinessEntityID  nvarchar(50)
  , Actived_From datetime
  , Actived_To datetime
)	

create table employee.DimLocation (
    LocationKey int identity(1,1) primary key
  , LocationID   nvarchar(50) 
  , CountryRegionCode  nvarchar(50)
  , CoutryName nvarchar(50)
  , StateProvince nvarchar(50)
  , City nvarchar(50)
  , Actived_From datetime
  , Actived_To datetime
)	


DROP TABLE IF EXISTS employee.DimTime;
DECLARE @StartDate date = '20010101';
DECLARE @Year int = 20;
DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, @Year, @StartDate));

;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
src AS
(
  SELECT
    DateKey         	= CONVERT(datetime, d),
    DateKey1 		= CAST(d AS DATE),
    TheDay         		= DATEPART(DAY,       d),
    TheDayName      	= DATENAME(WEEKDAY,   d),
    TheWeek         	= DATEPART(WEEK,      d),
    TheISOWeek      	= DATEPART(ISO_WEEK,  d),
    TheDayOfWeek    	= DATEPART(WEEKDAY,   d),
    TheMonth        	= DATEPART(MONTH,     d),
    TheMonthName    	= DATENAME(MONTH,     d),
    TheQuarter      	= DATEPART(Quarter,   d),
    TheYear         	= DATEPART(YEAR,      d),
    TheFirstOfMonth 	= DATEFROMPARTS(YEAR(d), MONTH(d), 1),
    TheLastOfYear   	= DATEFROMPARTS(YEAR(d), 12, 31),
    TheDayOfYear    	= DATEPART(DAYOFYEAR, d)
  FROM d
)


SELECT * 
INTO employee.DimTime 
FROM src
ORDER BY DateKey
OPTION (MAXRECURSION 0)



DimContactI
SELECT CAST(ABS(CHECKSUM(NEWID())) AS INT) AS ContactID 
	, p.BusinessEntityID as EmployeeID
	, em.EmailAddress as EmailAddress
	, ph.PhoneNumber as PhoneNumber
FROM Person.Person p
join HumanResources.Employee e
on p.BusinessEntityID = e.BusinessEntityID
join Person.PersonPhone ph
on p.BusinessEntityID = ph.BusinessEntityID
join Person.EmailAddress em 
on p.BusinessEntityID = em.BusinessEntityID

DimEmployee
select e.BusinessEntityID 
	, p.FirstName
	, p.LastName
	, e.BirthDate
	, e.Gender
	,e.MaritalStatus
	, e.HireDate
	,e.JobTitle
	, e.SalariedFlag
	,e.VacationHours
	, e.SickLeaveHours
	,e.CurrentFlag
	,e.OrganizationLevel
from [HumanResources].[Employee] as e
join Person.Person as p
on e.BusinessEntityID = p.BusinessEntityID 
