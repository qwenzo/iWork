


CREATE FUNCTION SETsalary
(@username varchar(30) , @Job_title varchar(20) ,@departement int , @company varchar(200))
returns  int
begin 
declare @returnedValue int
SELECT @returnedValue=J.salary FROM Jobs J Where J.company = @company AND J.department=@departement AND J.title=@Job_title
RETURN @returnedValue
END
go

CREATE FUNCTION SETmail
(@username varchar(30) , @Job_title varchar(20) , @company varchar(200))
returns  varchar(30)
begin 
declare @returnedValue varchar(30)
SELECT @returnedValue=C.domain FROM Jobs J,Company C Where J.company=C.email AND J.company = @company AND J.title=@Job_title
RETURN @returnedValue
END
go

CREATE FUNCTION Getdayoff
(@username varchar(30))
returns varchar(15)
begin 
declare @value varchar(15)
SELECT @value=u.day_off FROM Staff_Members u where u.username=@username
RETURN @value
END
go

CREATE Function GETDepartement
(@username varchar(30))
returns int
begin
declare @value int
SELECT @value=d.code FROM Staff_Members s , Departments d where s.department = d.code AND s.company = d.company AND s.username = @username
return @value
end
go

CREATE Function GETCompany
(@username varchar(30))
returns  varchar(200)
begin
declare @value varchar(200)
SELECT @value=d.company FROM Staff_Members s , Departments d where s.department = d.code AND s.company = d.company AND s.username = @username
return @value
end
go

CREATE FuNCTION GetSubject 
(@email int)
returns varchar(30)
begin
declare @value varchar(30)
SELECT @value=e.subject FROM Emails e where e.serial_number=@email
return @value
end
go

CREATE FuNCTION GetSender
(@email int)
returns varchar(30)
begin
declare @value varchar(30)
SELECT @value=e.sender FROM Staff_send_Email_Staff e where e.email_number=@email
return @value
end