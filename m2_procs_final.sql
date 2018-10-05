
--last version
--1 REG/UNREG takes name of the company as input and select every attribute for it
create PROCEDURE  SearchByname
@name varchar(200)
as
if exists ( SELECT * FROM Companies C where C.company_name=@name)
SELECT * FROM Companies Where company_name=@name
go
--1 REG/UNREG takes the address of the company as input and select every attribute for it
create procedure SearchByadd
@address varchar(50)
as
if exists ( SELECT * FROM Companies C where C.address=@address)
SELECT * FROM Companies Where @address=address
go

--1 REG/UNREG takes the type of the company as input and select every attribute for it
create proc SearchByType
@type varchar(15)
as
IF @type = 'national' or @type =  'international'
   SELECT * FROM Companies Where @type=type 
go

create proc getJobsOfDepartements
@Manager varchar(30)
as
SELECT title FROM Jobs J,Departments d where J.company=d.company AND J.department=d.code AND J.department=dbo.GETDepartement(@Manager) AND J.company=dbo.GETCompany(@Manager)
go


--2 view all companies with info 
CREATE PROC ALLCompanies
AS
      SELECT * FROM Companies
go

CREATE PROC ALLCompanies_by_type
AS
      SELECT C.* FROM Companies C
	  ORDER BY C.type
go

--edited
create PROC DCinfo
  @Company varchar(100)
AS
if (@Company is NOT null)
begin
SELECT C.company_name,C.email,C.domain,C.address,C.specialization,C.type,C.vision FROM Companies C WHERE @Company=C.email
SELECT D.department_name,D.code FROM Departments D,Companies C where @Company=C.email AND D.company=C.email
end
go


--edited
create PROC CompanyDepartementJV
 @company varchar(100) , @departement varchar(30)
 AS

 SELECT D.department_name , D.code FROM Departments D , Companies C  where D.company=C.email AND C.email= dbo.GETCOMPANYMAILNAME(@company) AND D.code=dbo.GETDeptN(@departement)
 SELECT J.title,J.short_description,J.detailed_description,J.min_experience,J.salary,J.working_hours,J.deadline FROM Departments D , Companies C , Jobs J where D.company=C.email AND C.email=dbo.GETCOMPANYMAILNAME(@company) AND J.department=D.code AND J.company=C.email
 AND J.department=dbo.GETDeptN(@departement) AND J.no_of_vacancies>0 AND J.company=dbo.GETCOMPANYMAILNAME(@company)
go


--edited
create PROC Register
@username varchar(30), 
@password varchar(15), 
@personal_email varchar(40), 
@birth_date datetime , 
@years_of_experience int, 
@first_name varchar(15) , 
@middle_name varchar(15),
@last_name varchar(15),
@o INT OUTPUT
AS
if NOT EXISTS ( SELECT * FROM Users u where u.username=@username) AND NOT EXISTS ( SELECT * FROM Users u where u.personal_email=@personal_email)
begin
INSERT INTO Users VALUES( @username , @password, @personal_email, @birth_date, @years_of_experience, @first_name, @middle_name,
@last_name)
INSERT INTO Job_Seekers VALUES( @username )
end
else SET @o = 1;
 
go

create PROC SearchbyKW
@Keyword varchar(1000)
as
SELECT * FROM Jobs J where J.no_of_vacancies is not NULL AND (J.title LIKE '%'+@Keyword+'%' or J.short_description LIKE '%'+@Keyword+'%') AND no_of_vacancies>0
go


create PROC Avgsalaries
as
SELECT avg(J.salary),C.company_name
FROM Companies C , Jobs J
WHERE C.email = J.company
GROUP BY C.company_name
ORDER BY avg(J.salary) DESC

go

--edited
create PROC Login
@user_name varchar(30),@password varchar(15) , @o INT OUTPUT
as
IF EXISTS (SELECT* FROM Users u where @user_name=u.username AND @password=u.password)
  begin
  IF EXISTS (SELECT* FROM Job_Seekers u where @user_name=u.username )
   --print 'you are a JS'
   SET @o=1
else IF EXISTS (SELECT* FROM HR_Employees u where @user_name=u.username )
   SET @o=2
else IF EXISTS (SELECT* FROM Regular_Employees u where @user_name=u.username )
   SET @o=3
else IF EXISTS (SELECT* FROM Managers u where @user_name=u.username )
   SET @o=4
END
ELSE 
SET @o=5
 go

 CREATE PROC info 
 @user_name varchar(30)
 as
 SELECT * FROM Users u WHERE @user_name=Users.username
go
 CREATE PROC info 
 @user_name varchar(30)
 as
 SELECT* FROM Users WHERE @user_name=Users.username
go

create PROC Edit_Info
@username varchar(30), 
@password varchar(15)=NULL, 
@personal_email varchar(40)=NULL, 
@birth_date datetime =NULL, 
@years_of_experience int=NULL, 
@first_name varchar(15)=NULL , 
@middle_name varchar(15)=NULL,
@last_name varchar(15)=NULL,
@o INT OUTPUT
as
if @password is not NULL
 UPDATE Users SET password=@password where username=@username
if @personal_email is not null
UPDATE Users SET personal_email=@personal_email where username=@username
if @birth_date is not null
UPDATE Users SET birth_date=@birth_date where username=@username
if @years_of_experience is not null
UPDATE Users SET years_of_experience=@years_of_experience where username=@username
if @first_name is not null
UPDATE Users SET first_name=@first_name where username=@username
if @middle_name is not null
UPDATE Users SET middle_name=@middle_name where username=@username
if @last_name is not null
UPDATE Users SET last_name=@last_name where username=@username
if @personal_email is not null
UPDATE Users SET personal_email=@personal_email where username=@username
else if EXISTS ( SELECT * FROM Users u where u.personal_email=@personal_email)
SET @o = 1;



go

--edited
create PROC ApplyJob  --job seeker 1
@username varchar(30) , @Job_title varchar(50), @departement int , @company varchar(200) 
as
if  (dbo.GETEXPUSER(@username)>=dbo.GETMINEXPJ(@Job_title,@departement,@company)) AND exists (SELECT * FROM Jobs J where J.company=@company AND J.department=@departement and J.title=@Job_title AND J.no_of_vacancies>0)  --checks the years_of_experience and if there is vacancies
 begin
IF  EXISTS (SELECT A.manager_response FROM Job_Seeker_apply_Job A WHERE A.manager_response='pending' AND A.job_seeker = @username AND A.company=@company ANd A.department=@departement AND A.job=@Job_title)
 print 'you have already applied to this job' --prints only if the application is pending
ELSE
 INSERT INTO Job_Seeker_apply_Job VALUES (@Job_title,@departement,@company,@username,'pending','pending',NULL)  --inserting the new application
 END
else
   print 'err, not enf yrs of exp'
 go



 create PROC QapplyJ  --job seeker 2
  @Job_title varchar(50) , @departement int , @company varchar(200) ,@username varchar(30)
  as if EXISTS ( SELECT * FROM Job_Seeker_apply_Job jsj where jsj.company=@company AND jsj.department=@departement AND jsj.job=@Job_title AND jsj.job_seeker=@username) AND
  @Job_title is not null AND  @departement is not null and @company is not null AND  @username is not null
  SELECT Q.question,JhQ.question FROM Job_has_Question JhQ,Questions Q where JhQ.job=@Job_title AND JhQ.company=@company AND JhQ.department=@departement AND Q.number=JhQ.question
 if @username is null
 print 'enter a name'
 if @departement is null
 print 'enter a dept'
 if @company is null
 print 'enter a comp'
 if @Job_title is null
 print 'enter a job'
 
go

create proc view_score
@username varchar(30)
as
if EXISTS ( SELECT * FROM Job_Seeker_apply_Job js where js.job_seeker=@username AND js.score = NULL)
SELECT Job_Seeker_apply_Job.score from Job_Seeker_apply_Job where Job_Seeker_apply_Job.job_seeker=@username
else
SELECT score from Job_Seeker_apply_Job  where Job_Seeker_apply_Job.job_seeker=@username  

go

create proc updateScore  --job seeker 3
@question int, @answer bit , @username varchar(30) , @job_title varchar(50) , @departement int , @company varchar(200)
as
declare @score int =0
if exists ( SELECT * FROM Questions Q where Q.number=@question AND q.answer=@answer)
begin
if  exists ( SELECT * FROM Job_Seeker_apply_Job  where job_seeker=@username AND Job_Seeker_apply_Job.job=@job_title AND Job_Seeker_apply_Job.company=@company AND Job_Seeker_apply_Job.department=@departement AND Job_Seeker_apply_Job.score is NULL)
UPDATE Job_Seeker_apply_Job
SET Job_Seeker_apply_Job.score = @score+1
where Job_Seeker_apply_Job.job_seeker=@username AND Job_Seeker_apply_Job.job=@job_title AND Job_Seeker_apply_Job.company=@company AND Job_Seeker_apply_Job.department=@departement

else UPDATE Job_Seeker_apply_Job
SET Job_Seeker_apply_Job.score = Job_Seeker_apply_Job.score+1
where Job_Seeker_apply_Job.job_seeker=@username AND Job_Seeker_apply_Job.job=@job_title AND Job_Seeker_apply_Job.company=@company AND Job_Seeker_apply_Job.department=@departement

end

else if  exists ( SELECT * FROM Job_Seeker_apply_Job  where job_seeker=@username AND Job_Seeker_apply_Job.job=@job_title AND Job_Seeker_apply_Job.company=@company AND Job_Seeker_apply_Job.department=@departement AND Job_Seeker_apply_Job.score is NULL)
UPDATE Job_Seeker_apply_Job
SET Job_Seeker_apply_Job.score = 0
where Job_Seeker_apply_Job.job_seeker=@username AND Job_Seeker_apply_Job.job=@job_title AND Job_Seeker_apply_Job.company=@company AND Job_Seeker_apply_Job.department=@departement
 
go

create proc ViewStatud  --job seeker 4
@username varchar(30)
as
if EXISTS ( SELECT * FROM Job_Seeker_apply_Job js where js.job_seeker=@username AND js.score = NULL)
SELECT Job_Seeker_apply_Job.score,Job_Seeker_apply_Job.manager_response from Job_Seeker_apply_Job where Job_Seeker_apply_Job.job_seeker=@username
else
SELECT * from Job_Seeker_apply_Job where Job_Seeker_apply_Job.job_seeker=@username  --selecting all the info of his application
go

create proc ChooseaJob2 
@username varchar(30)

as 
if EXISTS ( SELECT * FROM Job_Seeker_apply_Job js where js.job_seeker=@username )
select job,department,company from Job_Seeker_apply_Job j where @username=j.job_seeker AND j.manager_response='accepted'
go


create proc ChooseaJob  --job seeker 5
@username varchar(30),@Job_title varchar(20),@day_off varchar(20) ,@departement int ,@company varchar(200),@TYPEIFMANAGER varchar(10)=null 
as


if EXISTS ( select js.manager_response  from Job_Seeker_apply_Job js where js.manager_response='accepted' AND js.department=@departement AND js.company=@company AND js.job_seeker=@username AND js.job=@Job_title  )  --checks the manager response
begin
 INSERT INTO Staff_Members VALUES ( @username , 30, @username+''+dbo.SETmail(@username , @Job_title , @company), @day_off, dbo.SETsalary(@username , @Job_title  ,@departement , @company), @Job_title, @departement, @company)  --inserting all his info in the staff member table with 30 annual leaves
 INSERT INTO User_Job VALUES(@username,@Job_title)
 

 UPDATE Jobs SET no_of_vacancies = no_of_vacancies-1 where Jobs.company=@company AND Jobs.department=@departement AND @Job_title=@Job_title  --updating the no. of vacancies
 UPDATE Jobs SET no_of_vacancies = 0 where no_of_vacancies<0
 end
 else print 'you cannot choose a pending/ rejected job'
      
 go

 create proc DeleteApp  --job seeker 6
 @username varchar(30), @Job_title varchar(50),@departement int ,@company varchar(200)
 as
 if EXISTS ( select js.manager_response  from Job_Seeker_apply_Job js where (js.manager_response='pending' ) AND js.department=@departement AND js.company=@company AND js.job_seeker=@username AND js.job=@Job_title )
   DELETE FROM Job_Seeker_apply_Job  where Job_Seeker_apply_Job.department=@departement AND Job_Seeker_apply_Job.company=@company AND Job_Seeker_apply_Job.job_seeker=@username AND Job_Seeker_apply_Job.job=@Job_title

else print 'you cannot delete this'
   go

 

   create proc Checkin  --staff member 1
   @username varchar(30)
   as
 if exists ( SELECT * FROM Staff_Members s where s.company=dbo.GETCompany(@username) AND s.department=dbo.GETDepartement(@username) AND s.username=@username)
 begin
   if   ((datename(dw,CURRENT_TIMESTAMP) != 'Friday' AND datename(dw,CURRENT_TIMESTAMP) != dbo.Getdayoff(@username))) AND exists (SELECT * FROM Staff_Members s where s.username=@username)  --checks to see its not friday or his othe day_off
      INSERT INTO Attendance_Records VALUES (CONVERT (date, CURRENT_TIMESTAMP),@username,CONVERT (time, CURRENT_TIMESTAMP),NULL) --where date(CURRENT_TIMESTAMP)-date(Attendance_Records.date)=0 
   else
    print 'err'
end
go

 create proc Checkout  --staff member 2
   @username varchar(30)
   as
    if exists ( SELECT * FROM Staff_Members s where  s.username=@username AND s.company=dbo.GETCompany(@username) AND s.department=dbo.GETDepartement(@username) )
	begin
   if  datename(dw,CURRENT_TIMESTAMP) != 'Friday' AND datename(dw,CURRENT_TIMESTAMP) != dbo.Getdayoff(@username)  --checks to see its not friday or his othe day_off
   begin
   if EXISTS (SELECT * FROM Attendance_Records A where A.date = CONVERT (date, CURRENT_TIMESTAMP) AND A.staff=@username)
   UPDATE Attendance_Records
    SET end_time = CONVERT (time, CURRENT_TIMESTAMP) where Attendance_Records.staff=@username AND Attendance_Records.date=CONVERT (date,CURRENT_TIMESTAMP)  --setting the checkout time
  else  INSERT INTO Attendance_Records VALUES (CONVERT (date, CURRENT_TIMESTAMP),@username,NULL,CONVERT (time, CURRENT_TIMESTAMP))
  end
   else
    print 'err'
	
end
go
--

create proc ViewallRecords  --staff member 3
  @username varchar(30),@from date , @to date
  as
  if exists ( SELECT * FROM Staff_Members s where s.company=dbo.GETCompany(@username) AND s.department=dbo.GETDepartement(@username) AND s.username=@username)
	SELECT Attendance_Records.date, Attendance_Records.start_time,Attendance_Records.end_time,DATEDIFF(second,Attendance_Records.start_time,Attendance_Records.end_time)/ 3600.0 AS Duration,J.working_hours-DATEDIFF(second,Attendance_Records.start_time,Attendance_Records.end_time)/ 3600.0 AS missing_Hs FROM Attendance_Records , Jobs J where 
	Attendance_Records.date >= @from AND  Attendance_Records.date<=@to AND J.company= dbo.GETCompany(@username) AND J.department=dbo.GETDepartement(@username) AND dbo.GETJOB(@username,dbo.GETCompany(@username),dbo.GETDepartement(@username))=J.title AND Attendance_Records.staff=@username  --selecting all info in the interval the he specified
go

--staff member 4
CREATE proc apply_for_leave_request
@username varchar(50),
@replacement varchar(50),
@type varchar(50),
@start_date date,
@end_date date

as
 if EXISTS (SELECT * FROM Staff_Members s where s.username=@username) 
begin
if(not exists(select * from Requests where applicant = @username and ((@start_date<end_date and @start_date>start_date) or (@end_date<end_date and @end_date>start_date)) ))
begin
declare @annual_leaves int
set @annual_leaves=(select annual_leaves from Staff_Members where username= @username)
declare @leave_days int
set @leave_days = DATEDIFF(DAY, @start_date, @end_date)
if(@leave_days <= @annual_leaves)
begin
insert into Requests(start_date, applicant, end_date,request_date)
values(@start_date, @username, @end_date, CURRENT_TIMESTAMP)
insert into Leave_Requests
values (@start_date, @username, @type)
if(exists(select * from Managers where username = @username) and exists(select * from Managers where username = @replacement))
begin 
update Requests
set manager_response = 'accepted'
where start_date = @start_date and applicant = @username
update Requests
set manager = @username
where start_date = @start_date and applicant = @username
insert into Manager_apply_replace_Request
values(@start_date, @username, @username, @replacement)

end
 if(exists(select * from HR_Employees where username = @username) and exists(select * from HR_Employees where username = @replacement))
begin 
insert into HR_Employee_apply_replace_Request
values(@start_date, @username, @username, @replacement)
end

 if(exists(select * from Regular_Employees where username = @username) and exists(select * from Regular_Employees where username = @replacement))
begin 
insert into Regular_Employee_apply_replace_Request
values(@start_date, @username, @username, @replacement)

end

end
end
end 

go

CREATE proc apply_requests_business_trip
@username varchar(50),
@replacement varchar(50),
@destination varchar(50),
@purpose varchar(50),
@start_date date,
@end_date date


as
if exists (SELECT * FROM Staff_Members s where s.username=@username)
begin
if(not exists(select * from Requests where applicant = @username and ((@start_date<end_date and @start_date>start_date) or (@end_date<end_date and @end_date>start_date)) ))
begin
declare @annual_leaves int
set @annual_leaves=(select annual_leaves from Staff_Members where username= @username)
declare @leave_days int
set @leave_days = DATEDIFF(DAY, @start_date, @end_date)
if(@leave_days <= @annual_leaves)
begin
insert into Requests(start_date, applicant, end_date,request_date)
values(@start_date, @username, @end_date, CURRENT_TIMESTAMP)
insert into Business_Trip_Requests
values(@start_date, @username, @destination, @purpose)

if(exists(select * from Managers where username = @username) and exists(select * from Managers where username = @replacement))
begin 
update Requests
set manager_response = 'accepted'
where start_date = @start_date and applicant = @username
update Requests
set manager = @username
where start_date = @start_date and applicant = @username
insert into Manager_apply_replace_Request
values(@start_date, @username, @username, @replacement)
end
if(exists(select * from HR_Employees where username = @username) and exists(select * from HR_Employees where username = @replacement))
begin 
insert into HR_Employee_apply_replace_Request
values(@start_date, @username, @username, @replacement) 
end
if(exists(select * from Regular_Employees where username = @username) and exists(select * from Regular_Employees where username = @replacement))
begin 
insert into Regular_Employee_apply_replace_Request
values(@start_date, @username, @username, @replacement)
end
end
end

end



go






create proc ViewAllStatusRs  --staff member 5
 @username varchar(30)
 as
 SELECT r.request_date,r.start_date,r.end_date,r.manager_response,r.hr_response FROM Requests r where r.applicant = @username
 go

 create proc DeleteReq  --staff member 6
 @username varchar(30) , @from datetime 
 as
 if EXISTS ( SELECT * FROM Requests  where applicant=@username AND start_date = @from AND (manager_response='pending' OR hr_response='pending'))  --checks the responses of the hr and manager
   DELETE FROM Requests where applicant=@username AND start_date = @from
else print 'not pending'
go

create proc SendEmail  --staff member 7
 @username varchar(30) , @subject varchar(30) , @body varchar(max)=NULL , @recipient varchar(30)
 as
 if exists(SELECT * FROM Staff_Members s where  s.username=@username)
 begin
 if @body is null
   SET @body= ''  --if there is no body it will send an empty string not null
 if EXISTS ( SELECT * FROM Staff_members s where s.username=@username) AND EXISTS ( SELECT * FROM Staff_members s where s.username=@recipient) AND (dbo.GETCompany(@username)=dbo.GETCompany(@recipient))
  begin
  INSERT INTO Emails  VALUES(@subject,CURRENT_TIMESTAMP,@body)
  INSERT INTO Staff_send_Email_Staff VALUES (scope_identity(),@recipient,@username)  --inserting the email in the table 
  end
end
go

create proc ViewEmails  --staff member 8

@username varchar(30) 
as
 if exists(SELECT * FROM Staff_Members s where  s.username=@username)
SELECT  e.serial_number,ss.recipient,e.subject,e.date,e.body,ss.sender FROM Staff_send_Email_Staff ss,Emails e where e.serial_number=ss.email_number AND ss.recipient=@username AND dbo.GETCompany(@username)=dbo.GETCompany(ss.sender)  --checks if the recipient is the user
go

create proc replySE  --staff member 9
@recp varchar(30),@body varchar(max) ,@email int
as
 INSERT INTO Emails VALUES (dbo.GetSubject(@email),CURRENT_TIMESTAMP,@body)  --same subject as the first email
  INSERT INTO Staff_send_Email_Staff VALUES (@email,dbo.GetSender(@email),@recp)  --the recipient will be the sender and the sender will be the recipient
go

create proc ViewAnnouncements  --staff member 10
@username varchar(30)
as
if exists (select * FROM Announcements a where dbo.GETCompany(a.hr_employee)=dbo.GETCompany(@username))  --checks the departement of the hr who posted the announcment
select * FROM Announcements a where a.date >= DATEADD(day, -20, CURRENT_TIMESTAMP)  --between the current date and 20 days before
go


--HR
create proc AddNewJobHR  --HR employee 1
@HR varchar(30), @Role varchar(25),@Job varchar(25),@short_description varchar(1000),@detailed_description varchar(max),@min_experience int ,@salary DECIMAL(18,4)
,@deadline datetime
,@no_of_vacancies int, 
@working_hours int
as
declare @Job_title varchar(50) = CONCAT(@Role, ' - ', @Job)
if exists (SELECT * FROM HR_Employees where HR_Employees.username=@HR) AND NOT EXISTS (SELECT * FROM Jobs J where J.title=@Job_title AND J.company =dbo.GETCompany(@HR) AND J.department =dbo.GETDepartement(@HR))
  begin 
    INSERT INTO Jobs VALUES (@Job_title,dbo.GETDepartement(@HR),dbo.GETCompany(@HR),@short_description,@detailed_description,@min_experience,@salary ,@deadline,@no_of_vacancies,@working_hours)
 end
else print 'either this job already exist or you are not an HR'
go

create proc AddNewQJ  --HR employee 1 (adding new questions for the new job)
@HR varchar(30),@Job_title varchar(50),@question varchar(120) , @answer int
as
if exists (SELECT * FROM HR_Employees where HR_Employees.username=@HR) 
  begin 
  if exists ( SELECT * FROM Jobs J where J.title=@Job_title ANd J.company=dbo.GETCompany(@HR) ANd J.department=dbo.GETDepartement(@HR))
  begin
    INSERT INTO Questions VALUES(@question,@answer)
	INSERT INTO Job_has_Question VALUES(@Job_title,dbo.GETDepartement(@HR),dbo.GETCompany(@HR),scope_identity())
 end
 end
go

create PROC viewJob  --HR employee 2
@user_name VARCHAR(30),@title varchar(50)
AS
if exists (select * FROM HR_Employees where username=@user_name) AND exists (SELECT * FROM Jobs j where j.title=@title) AND
exists (SELECT * FROM JOBs J where J.title=@title ANd J.company=dbo.GETCompany(@user_name) AND J.department=dbo.GETDepartement(@user_name))
SELECT * from Jobs j where @title=j.title AND dbo.GETDepartement(@user_name)=j.department AND dbo.GETCompany(@user_name)=j.company 
GO

create PROC editJob  --HR employee 3
@user_name VARCHAR(30),@title varchar(50),@short_description varchar(1000)=null,@detailed_description VARCHAR(max)=null,@min_experiance int=null,
@salary DECIMAL(18,4)=null,@deadline DATETIME =null
AS
if exists (select * FROM HR_Employees where username=@user_name) AND exists (SELECT * FROM Jobs j where j.title=@title AND dbo.GETDepartement(@user_name)=j.department AND dbo.GETCompany(@user_name)=j.company)
begin
IF (@short_description is not null)
update jobs SET short_description = @short_description
WHERE jobs.company=dbo.GETCompany(@user_name) AND @title=jobs.title AND jobs.department=dbo.GETDepartement(@user_name)
IF (@detailed_description is not null)
update jobs SET detailed_description = @detailed_description
WHERE jobs.company=dbo.GETCompany(@user_name) AND @title=jobs.title AND jobs.department=dbo.GETDepartement(@user_name)
IF (@min_experiance is not null)
update jobs SET min_experience=@min_experiance
WHERE jobs.company=dbo.GETCompany(@user_name) AND @title=jobs.title AND jobs.department=dbo.GETDepartement(@user_name)
IF (@salary is not null)
update jobs SET salary=@salary
WHERE jobs.company=dbo.GETCompany(@user_name) AND @title=jobs.title AND jobs.department=dbo.GETDepartement(@user_name)
IF (@deadline is not null)
update jobs SET deadline=@deadline
WHERE jobs.company=dbo.GETCompany(@user_name) AND @title=jobs.title AND jobs.department=dbo.GETDepartement(@user_name)
end
--update only if needed when the values is not null
GO

create PROC viewApplication  --HR employee 4
@user_name VARCHAR(30),@job_title VARCHAR(50)
AS
if exists (SELECT * from Job_Seeker_apply_Job x , jobs j WHERE dbo.GETCompany(@user_name)=x.company AND x.company=j.company AND x.department = dbo.GETDepartement(@user_name) AND x.department=j.department ANd j.title=@job_title) AND
exists (select * FROM HR_Employees where username=@user_name)
SELECT x.*,j.deadline,j.detailed_description,j.min_experience,j.no_of_vacancies,j.salary,j.short_description,j.working_hours from Job_Seeker_apply_Job x , jobs j WHERE dbo.GETCompany(@user_name)=x.company AND x.company=j.company AND x.department = dbo.GETDepartement(@user_name) AND x.department=j.department ANd j.title=@job_title AND x.job=j.title
AND x.manager_response = 'pending'
GO

create proc AcceptOrRejectApp  --HR employee 5
@user_name VARCHAR(30),@job_seeker VARCHAR(30),@job varchar(50),@hr_response VARCHAR(30)
AS
if exists (select * from Job_Seeker_apply_Job x where dbo.GETCompany(@user_name) = x.company AND dbo.GETDepartement(@user_name) = x.department AND x.job_seeker = @job_seeker)
AND exists (select * FROM HR_Employees where username=@user_name)
update Job_Seeker_apply_Job SET hr_response=@hr_response
where @job_seeker=Job_Seeker_apply_Job.job_seeker AND @job=Job_Seeker_apply_Job.job AND dbo.GETCompany(@user_name)=Job_Seeker_apply_Job.company AND dbo.GETDepartement(@user_name)=Job_Seeker_apply_Job.department

GO

CREATE PROC PostAnn  --HR employee 6
@user_name varchar(30) , @title VARCHAR(15),@type VARCHAR(30),@description VARCHAR(30)
AS
if exists (select * from HR_Employees where @user_name = username )  --checks if he is an hr employee
INSERT into Announcements VALUES(CURRENT_TIMESTAMP,@title,@user_name,@type,@description)  --inserting a new announcment in the current time
GO

create PROC viewRequests  --HR employee 7
@user_name VARCHAR(30)
AS
if exists (select * from HR_Employees where @user_name = username )  --checks if he is an hr employee
begin
SELECT r.*,LR.type FROM Requests r,Leave_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@user_name) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@user_name) AND r.manager_response = 'accepted' AND dbo.GETTYPEMANAGER(r.manager) != 'HR'  --only the accepted by the manager
SELECT r.*,LR.destination,LR.purpose FROM Requests r,Business_Trip_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@user_name) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@user_name) AND r.manager_response = 'accepted' AND dbo.GETTYPEMANAGER(r.manager) != 'HR'
--SELECT * FROM Requests r WHERE dbo.GETCompany(@user_name) = dbo.GETCompany(r.applicant) AND dbo.GETDepartement(@user_name) = dbo.GETDepartement(r.applicant) AND r.manager_response = 'accepted'
end
GO

create PROC AcceptOrRejectreq  --HR employee 8
@user_name VARCHAR(30),@start_date DATETIME,@applicant VARCHAR(30),@hr_response VARCHAR(30)
AS
if exists (select * from HR_Employees where @user_name = username )
begin
if exists (select * from Requests r where dbo.GETCompany(@user_name)=dbo.GETCompany(@applicant) AND dbo.GETDepartement(@user_name)=dbo.GETDepartement(@applicant) AND r.manager_response='accepted' AND r.manager_reason !='manager' AND dbo.GETTYPEMANAGER(r.manager) != 'HR' and r.applicant = @applicant and r.start_date = @start_date ) 
begin
update Requests SET hr_response=@hr_response where dbo.GETCompany(@user_name)=dbo.GETCompany(@applicant) AND dbo.GETDepartement(@user_name)=dbo.GETDepartement(@applicant) AND Requests.manager_response='accepted' AND Requests.manager_reason !='manager' AND dbo.GETTYPEMANAGER(Requests.manager) != 'HR' and Requests.applicant = @applicant and Requests.start_date = @start_date
if(@hr_response='accepted')
begin
  update Staff_Members SET annual_leaves=annual_leaves-dbo.CHECKDAYSOFFREQ(@applicant,@start_date,dbo.GETENDDATEReq(@applicant,@start_date)) where Staff_Members.username=@applicant  --setting the new annual_leaves no.
  AND  Staff_Members.company=dbo.GETCompany(@user_name) AND Staff_Members.department=dbo.GETDepartement(@user_name) 
  AND dbo.GETCompany(@user_name) = dbo.GETCompany(@applicant) AND dbo.GETDepartement(@user_name) = dbo.GETDepartement(@applicant)
  print dbo.CHECKDAYSOFFREQ(@applicant,@start_date,dbo.GETENDDATEReq(@applicant,@start_date)) 
update Staff_Members SET annual_leaves=0 where annual_leaves<0
end
end
end
GO

create proc ViewallRecordsHR  --HR employee 9
  @user_name varchar(30),@from date , @to date,@e varchar(30)
  as
if exists (select * from HR_Employees where @user_name = username )  --checks if he is an hr employee
begin
  if exists ( SELECT * FROM Staff_Members s where s.company=dbo.GETCompany(@user_name) AND s.department=dbo.GETDepartement(@user_name) AND s.username=@e)
	SELECT Attendance_Records.date, Attendance_Records.start_time,Attendance_Records.end_time,DATEDIFF(second,Attendance_Records.start_time,Attendance_Records.end_time)/ 3600.0 AS Duration,J.working_hours-DATEDIFF(second,Attendance_Records.start_time,Attendance_Records.end_time)/ 3600.0 AS missing_Hs FROM Attendance_Records , Jobs J where 
	Attendance_Records.date >= @from AND  Attendance_Records.date<=@to AND J.company= dbo.GETCompany(@user_name) AND J.department=dbo.GETDepartement(@user_name) AND dbo.GETJOB(@e,dbo.GETCompany(@e),dbo.GETDepartement(@e))=J.title
	AND dbo.GETCompany(@user_name) = dbo.GETCompany(@e) AND dbo.GETDepartement(@user_name) = dbo.GETDepartement(@e) AND Attendance_Records.staff=@e
	end
go

create proc VieweachMonthHR  --HR employee 10
@Staff varchar(30), @HR varchar(30) , @year datetime
AS
if exists  (SELECT * FROM HR_Employees where HR_Employees.username=@HR) AND exists (SELECT * FROM Staff_Members where Staff_Members.username=@Staff) AND (dbo.GETDepartement(@Staff)=dbo.GETDepartement(@HR)) AND (dbo.GETCompany(@Staff)=dbo.GETCompany(@HR))
  SELECT Month,SUM(Duration) AS Total_Hours FROM( SELECT month(A.date)AS Month ,DATEDIFF(second,A.start_time,A.end_time)/ 3600.0 AS Duration  FROM Attendance_Records A where year(A.date) = year(@year) AND A.staff=@Staff
   ) as tbl1  group by Month
go

create procedure ViewTop  --HR employee 11
@HR varchar(30),@month datetime
as
if exists  (SELECT * FROM HR_Employees where HR_Employees.username=@HR)  --AND (dbo.GETDepartement(@reg)=dbo.GETDepartement(@HR)) AND (dbo.GETCompany(@reg)=dbo.GETCompany(@HR))
SELECT  TOP 3 staff,Month,SUM(Duration) AS Total_Hours FROM( SELECT A.staff AS staff,Month(A.date)AS Month ,DATEDIFF(second,A.start_time,A.end_time)/ 3600.0 AS Duration  FROM Attendance_Records A,Tasks T where   (T.regular_employee=A.staff)
AND month(T.deadline)=month(@month) AND T.status='Fixed' AND month(A.date) = month(@month) ANd t.company=dbo.GETCompany(@HR) AND dbo.GETDepartement(A.staff)=dbo.GETDepartement(@HR) )  --selecting the employees who finished all the tasks and spent the most hours
    as tbl1 group by Month,staff  order  by Total_Hours  DESC
go



--REGULAR
create proc viewproject  --regular employee 1
@regular varchar(30)
as
if exists (select * from Regular_Employees r where r.username=@regular)  --checks if he is a regular employee
select P.start_date,P.end_date,name,P.manager FROM Projects P,Manager_assign_Regular_Employee_Project MR where  P.name=MR.project_name  AND MR.regular_employee=@regular AND P.company=MR.company AND  P.company=dbo.GETCompany(@regular)
go

create proc viewtask  --regular employee 2
@regular varchar(30),@project_name varchar(30)
as
if exists (select * from Regular_Employees r where r.username=@regular) AND EXISTS (SELECT * FROM Manager_assign_Regular_Employee_Project mr where mr.project_name=@project_name AND mr.regular_employee=@regular) 
select T.name,T.project_name,T.deadline,T.status,T.description,T.manager From Tasks T where  T.regular_employee=@regular AND T.project_name =@project_name 
SELECt T.name,T.project_name,TC.* FROM Task_Comment TC,Tasks T where TC.project_name=@project_name AND TC.task_name=T.name AND TC.company=T.company AND TC.project_name=T.project_name AND T.company = dbo.GETCompany(@regular)
go

create proc ﬁnalizingTask  --regular employee 3
@regular varchar(30) ,@task_name varchar(30) , @project_name varchar(30)
as 
if exists(select * from Regular_Employees r where r.username=@regular ) AND EXISTS (SELECT * FROM Tasks t where t.name=@task_name AND t.project_name=@project_name AND t.company=dbo.GETCompany(@regular) AND t.status='Assigned' and t.regular_employee = @regular)
and exists(select * from tasks t where t.regular_employee=@regular and t.company=dbo.GETCompany(@regular) and t.name=@task_name and t.deadline>CURRENT_TIMESTAMP AND t.project_name=@project_name )  --checks that he did not pass the deadline
UPDATE Tasks SET status='Fixed' where Tasks.regular_employee=@regular  and Tasks.project_name=@project_name and Tasks.name=@task_name and Tasks.company = dbo.GETCompany(@regular)  --updating the task status as fixed
go

create  proc updateAssign  --regular employee 4
@regular varchar(30) ,@task_name varchar(30), @project_name varchar(30)
as
if exists(select * from Regular_Employees r where r.username=@regular )
and exists(select * from tasks t where t.regular_employee=@regular and t.company=dbo.GETCompany(@regular) and t.name=@task_name and t.deadline>CURRENT_TIMESTAMP AND t.project_name=@project_name and t.status!='Closed' and t.status='Fixed')  --checks to see if the deadline has not passed and the status fixed
UPDATE Tasks SET status='Assigned' where Tasks.regular_employee=@regular  and Tasks.project_name=@project_name and Tasks.name=@task_name   --updating the status to assigned
go

--Manager

create proc ViewReqsManager_LR
@username varchar(30)
as
if exists (select * from Managers m , Staff_Members s where m.username=s.username AND m.username=@username AND s.company=dbo.GETCompany(@username) AND s.department=dbo.GETDepartement(@username))
 begin
   if not exists (select * from Managers m where m.username=@username and m.type='HR' )
   begin
     SELECT * FROM Requests r,Leave_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username) AND dbo.isHR(r.applicant)=0 AND r.manager_response='pending' AND r.start_date = LR.start_date
    end
	else 
	begin 
	SELECT * FROM Requests r,Leave_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username)   AND r.manager_response='pending' AND r.start_date = LR.start_date
     end
end
go


--edited
create proc ViewReqsManager_TR
@username varchar(30)
as
if exists (select * from Managers m , Staff_Members s where m.username=s.username AND m.username=@username AND s.company=dbo.GETCompany(@username) AND s.department=dbo.GETDepartement(@username))
 begin
   if not exists (select * from Managers m where m.username=@username and m.type='HR' )
   begin
     SELECT * FROM Requests r,Business_Trip_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username) AND dbo.isHR(r.applicant)=0 AND r.manager_response='pending'AND r.start_date = LR.start_date
	 end
	else 
	begin 
     SELECT * FROM Requests r,Business_Trip_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username)  AND r.manager_response='pending' AND r.start_date = LR.start_date
	 end
end
go

create proc ViewReqsManager 
@username varchar(30)
as
if exists (select * from Managers m , Staff_Members s where m.username=s.username AND m.username=@username AND s.company=dbo.GETCompany(@username) AND s.department=dbo.GETDepartement(@username))
 begin
   if not exists (select * from Managers m where m.username=@username and m.type='HR' )
   begin
     SELECT * FROM Requests r,Leave_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username) AND dbo.isHR(r.applicant)=0 AND r.manager_response='pending'
     SELECT * FROM Requests r,Business_Trip_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username) AND dbo.isHR(r.applicant)=0 AND r.manager_response='pending'
	 end
	else 
	begin 
	SELECT * FROM Requests r,Leave_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username)   AND r.manager_response='pending'
     SELECT * FROM Requests r,Business_Trip_Requests LR where LR.applicant =r.applicant AND LR.start_date=r.start_date AND dbo.GETCompany( r.applicant) = dbo.GETCompany(@username) AND dbo.GETDepartement(r.applicant) = dbo.GETDepartement(@username)  AND r.manager_response='pending'
	 end
end
go

--edited
create proc ManagerReqRejection
@username varchar(30), @from datetime , @manager varchar(30) , @manager_reason varchar(1000)
as
if exists (select * from Requests r where r.hr_employee is NULL AND r.start_date=@from AND r.applicant=@username AND dbo.GETCompany(@username)=dbo.GETCompany(@manager) AND 
dbo.GETDepartement(@username)=dbo.GETDepartement(@manager))
begin
if  exists (select * from Managers m where m.username=@manager and m.type='HR' )
UPDATE Requests SET manager_response='rejected' ,Requests.hr_response='rejected',Requests.manager=@manager,Requests.manager_reason=@manager_reason where  Requests.start_date=@from AND Requests.applicant=@username AND dbo.isHR(@username)=0
else
UPDATE Requests SET manager_response='rejected' ,Requests.manager=@manager,Requests.manager_reason=@manager_reason where  Requests.start_date=@from AND Requests.applicant=@username 
end
go
--edited
go
create proc AcceptetanceManagerReq
@username varchar(30), @from datetime , @manager varchar(30) 
as
if exists (select * from Requests r where r.hr_employee is NULL AND r.start_date=@from AND r.applicant=@username AND dbo.GETCompany(@username)=dbo.GETCompany(@manager) AND 
dbo.GETDepartement(@username)=dbo.GETDepartement(@manager))
begin
if  exists (select * from Managers m where m.username=@manager and m.type='HR' )
UPDATE Requests SET Requests.manager_response='accepted' ,Requests.hr_response='accepted',Requests.manager=@manager where  Requests.start_date=@from AND Requests.applicant=@username AND dbo.isHR(Requests.applicant)=0
else
UPDATE Requests SET Requests.manager_response='accepted',Requests.manager=@manager where  Requests.start_date=@from AND Requests.applicant=@username 
end
go

--edited



create proc ViewApps 
 @manager varchar(30) , @Job_title varchar(50)
as
if EXISTS (SELECT * FROM Job_Seeker_apply_Job js where js.company=dbo.GETCompany(@manager) AND 
js.department=dbo.GETDepartement(@manager) AND js.job=@Job_title)
begin

SELECT short_description,detailed_description

min_experience,

salary,

deadline,

no_of_vacancies,

working_hours FROM Job_Seeker_apply_Job js,Jobs j WHERE j.title=@Job_title AND js.job=j.title AND js.hr_response='accepted' 
AND js.manager_response='pending' 
AND  js.company=dbo.GETCompany(@manager) AND 
js.department=dbo.GETDepartement(@manager)  AND j.company = js.company AND j.department= js.department
SELECT job_seeker,

hr_response,

manager_response,

score FROM Job_Seeker_apply_Job js,Jobs j WHERE j.title=@Job_title AND js.job=j.title AND js.hr_response='accepted' AND js.manager_response='pending' AND  js.company=dbo.GETCompany(@manager) AND 
js.department=dbo.GETDepartement(@manager)  AND j.company = js.company AND j.department= js.department
end
go

--edited
create proc AccJApp
@username varchar(30) , @manager varchar(30),@job varchar(50)
as
if EXISTS (SELECT * FROM Job_Seeker_apply_Job js where js.job_seeker=@username AND js.company=dbo.GETCompany(@manager) AND 
js.department=dbo.GETDepartement(@manager) AND js.hr_response='accepted' AND js.manager_response='pending'AND js.company=dbo.GETCompany(@manager) AND js.department=dbo.GETDepartement(@manager)) AND EXISTS (SELECT * FROM Managers m where m.username=@manager)
begin
UPDATE Job_Seeker_apply_Job SET Job_Seeker_apply_Job.manager_response='accepted' 
WHERE   Job_Seeker_apply_Job.job_seeker=@username AND Job_Seeker_apply_Job.company=dbo.GETCompany(@manager) AND 
Job_Seeker_apply_Job.department=dbo.GETDepartement(@manager) AND Job_Seeker_apply_Job.job=@job 
 update Jobs SET no_of_vacancies = no_of_vacancies-1 where Jobs.company=dbo.GETCompany(@manager) AND Jobs.department=dbo.GETDepartement(@manager) AND Jobs.title=@job
 update Jobs SET no_of_vacancies = 0 where no_of_vacancies<0
end
else print 'err'
go

--edited
create proc RejJApp
@username varchar(30) , @manager varchar(30),@job varchar(50)
as
if EXISTS (SELECT * FROM Job_Seeker_apply_Job js where js.job_seeker=@username AND js.company=dbo.GETCompany(@manager) AND 
js.department=dbo.GETDepartement(@manager) AND js.hr_response='accepted'AND js.manager_response='pending' AND js.company=dbo.GETCompany(@manager) AND js.department=dbo.GETDepartement(@manager)) AND EXISTS (SELECT * FROM Managers m where m.username=@manager)
begin
UPDATE Job_Seeker_apply_Job SET Job_Seeker_apply_Job.manager_response='rejected' 
WHERE   Job_Seeker_apply_Job.job_seeker=@username AND Job_Seeker_apply_Job.company=dbo.GETCompany(@manager) AND 
Job_Seeker_apply_Job.department=dbo.GETDepartement(@manager) AND Job_Seeker_apply_Job.job=@job 
end
else print 'err'
go

create proc newproject
@name varchar(30), @manager varchar(30),@start_date datetime, @out INT OUTPUT
,@end_date datetime
as
if exists (SELECT * from Managers m where m.username=@manager) AND NOT EXISTS ( SELECT * FROM Projects p where p.name = @name AND p.company=dbo.GETCompany(@manager))
INSERT INTO Projects VALUES (@name,dbo.GETCOMPANY(@manager),@manager,@start_date,@end_date)
else SET @out = 1
go

--edited
create proc MAssignReg
@manager varchar(30) , @reg varchar(30) , @project_name varchar(30),  @out INT OUTPUT
as
SET @out =0
if exists (SELECT * from Regular_Employees reg where reg.username=@reg ) AND exists (SELECT * from Managers m where m.username=@manager)  AND NOT EXISTS ( SELECT * FROM Manager_assign_Regular_Employee_Project mr where mr.company=dbo.GETCompany(@manager) AND mr.manager=@manager AND mr.project_name=@project_name AND mr.regular_employee=@reg)
begin
if  dbo.GETCompany(@reg)=dbo.GETCompany(@manager) AND dbo.GETDepartement(@reg)=dbo.GETDepartement(@manager) AND NOT EXISTS (SELECT * FROM  Manager_assign_Regular_Employee_Project mr 
where mr.company=dbo.GETCompany(@manager)  AND mr.project_name=@project_name AND mr.manager=@manager AND mr.regular_employee=@reg)
begin
if NOT EXISTS (SELECT* FROM Manager_assign_Regular_Employee_Project mr inner join Projects p1 on p1.name=mr.project_name AND p1.company=mr.company
inner join Manager_assign_Regular_Employee_Project mr2 on mr.company=mr2.company inner join Projects p2 on p2.name=mr2.project_name 
inner join Projects p3 on p3.company = p1.company where p3.name=@project_name AND p1.name  != @project_name  AND p2.name != @project_name AND p1.name != p2.name AND p1.end_date>=p3.start_date
AND p2.end_date>=p3.start_date AND mr.regular_employee=@reg AND mr2.regular_employee=@reg)

     INSERT INTO Manager_assign_Regular_Employee_Project VALUES (@project_name,dbo.GETCompany(@manager),@reg,@manager)
  else SET @out = 1
end
else print 'not the same dep/company'
end
else SET @out = 2
go

--new
create proc GET_ALL_Projects_Manager
@manager varchar(30)
as
SELECT name FROM Projects p where p.company=dbo.GETCompany(@manager) AND p.manager=@manager
go

create proc GET_ALL_REGS_Manager
@manager varchar(30)
as
SELECT username FROM Regular_Employees r where dbo.GETCompany(@manager) = dbo.GETCompany(username) AND dbo.GETDepartement(@manager) = dbo.GETDepartement(username)
go

create proc GET_ALL_REGS_Manager_assigned_project
@manager varchar(30),@project_name varchar(30)
as
SELECT regular_employee FROM Manager_assign_Regular_Employee_Project mr
where mr.company=dbo.GETCompany(@manager) AND mr.project_name=@project_name AND mr.manager=@manager
go

--edited
create proc removeRegularProject
@manager varchar(30) , @reg varchar(30) , @project_name varchar(30),@out INT OUTPUT
as
if exists (SELECT * from Regular_Employees reg where reg.username=@reg ) AND exists (SELECT * from Managers m where m.username=@manager) 
begin
if  dbo.GETCompany(@reg)=dbo.GETCompany(@manager) AND dbo.GETDepartement(@reg)=dbo.GETDepartement(@manager) AND EXISTS (SELECT * FROM Manager_assign_Regular_Employee_Project mp,Projects p where mp.manager=@manager AND mp.project_name=@project_name AND mp.company=p.company AND p.company=dbo.GETCompany(@manager) AND mp.project_name = p.name )
begin
  if (dbo.COUNTassignedTasksForProject(@reg,@project_name) =0 )
     DELETE FROM  Manager_assign_Regular_Employee_Project where Manager_assign_Regular_Employee_Project.regular_employee=@reg AND Manager_assign_Regular_Employee_Project.project_name=@project_name
	else  SET @out = 1
end
else print 'not the same dep/company'
end
else print 'not manager or regular'
go

--edited
create proc defineaTask
@manager varchar(30) , @project_name varchar(30) , @task_name varchar(15) , @deadline datetime, @description varchar(max) , @comment varchar(500) , @out INT OUTPUT
as
if exists (SELECT * from Managers m where m.username=@manager) AND EXISTS (SELECT * FROM Projects P where p.name=@project_name AND p.manager=@manager AND p.company=dbo.GETCompany(@manager))
AND not exists (SELECT * FROM Tasks mar where  mar.project_name=@project_name AND mar.manager=@manager AND mar.company=dbo.GETCompany(@manager)  AND mar.name=@task_name)
begin
 INSERT INTO Tasks VALUES (@task_name,@project_name,dbo.GETCompany(@manager),@deadline,'Open',@description,NULL,@manager)
 INSERT INTO Task_Comment VALUES (@task_name,@project_name,dbo.GETCompany(@manager),@comment)
end
else SET @out = 1
go

--new
create proc select_regs_Project
@manager varchar(30),@project_name varchar(30)
as
SELECT regular_employee FROM Manager_assign_Regular_Employee_Project mar where  mar.project_name=@project_name AND mar.manager=@manager AND mar.company=dbo.GETCompany(@manager)
go

--edited
create proc AssignRegTask
@manager varchar(30),@reg varchar(30) , @project_name varchar(30) , @task_name varchar(15) , @out INT OUTPUT
as
if exists (SELECT * from Regular_Employees reg where reg.username=@reg ) AND exists (SELECT * from Managers m where m.username=@manager) AND dbo.GETCompany(@reg)=dbo.GETCompany(@manager) AND dbo.GETDepartement(@reg)=dbo.GETDepartement(@manager) AND NOT EXISTS 
(SELECT * FROM Tasks mar where mar.name=@task_name  AND mar.project_name=@project_name AND mar.manager=@manager AND mar.company=dbo.GETCompany(@manager) AND mar.regular_employee=@reg) AND exists ( SELECT * FROM Tasks mar where mar.name=@task_name AND mar.project_name=@project_name AND mar.manager=@manager AND mar.company=dbo.GETCompany(@manager))
begin
if exists (SELECT * FROM Manager_assign_Regular_Employee_Project mar where mar.regular_employee = @reg AND mar.project_name=@project_name AND mar.manager=@manager AND mar.company=dbo.GETCompany(@manager))
  UPDATE Tasks SET Tasks.regular_employee = @reg,Tasks.status='Assigned' where Tasks.name=@task_name AND Tasks.project_name=@project_name AND Tasks.manager=@manager AND Tasks.company=dbo.GETCompany(@manager) AND Tasks.regular_employee is NULL
  else print'you only can assign emps.to tasks who are working in the same project as the task'
end
else SET @out = 1
go

--edited
create proc ChangeRegInTask
@manager varchar(30),@reg varchar(30),@reg2 varchar(30), @task_name varchar(15) , @project_name varchar(30), @out INT OUTPUT
as
if exists (SELECT * from Regular_Employees reg where reg.username=@reg ) AND exists (SELECT * from Managers m where m.username=@manager) 
AND exists (SELECT * from Regular_Employees reg where reg.username=@reg2 ) AND dbo.GETCompany(@reg)=dbo.GETCompany(@manager) AND dbo.GETDepartement(@reg)=dbo.GETDepartement(@manager)
begin
if exists ( SELECT * FROM Tasks t where t.status='Assigned' AND t.regular_employee=@reg AND t.project_name=@project_name AND t.manager=@manager AND t.company=dbo.GETCompany(@manager) ) AND EXISTS ( SELECT * FROM Manager_assign_Regular_Employee_Project t where  t.regular_employee=@reg2 AND t.project_name=@project_name  AND t.manager=@manager AND t.company=dbo.GETCompany(@manager))
begin
  UPDATE Tasks SET regular_employee = @reg2 where regular_employee=@reg AND Tasks.name=@task_name AND Tasks.project_name=@project_name AND Tasks.manager=@manager AND Tasks.company=dbo.GETCompany(@manager)
  end
else SET @out=1
end
else print 'not a manager or not a reg'
go

--new
create proc Get_ALL_Tasks
@project_name varchar(30) , @manager varchar(30)
AS
SELECT name FROM Tasks t where t.project_name=@project_name AND t.manager=@manager AND t.company=dbo.GETCompany(@manager)
go

--edited
create proc ViewTasksstatus
@manager varchar(30),@status varchar(15),@project_name varchar(30)
as
if exists (SELECT * from Managers m where m.username=@manager) AND EXISTS ( SELECT * FROM Projects p where p.company=dbo.GETCompany(@manager) AND p.name=@project_name)
begin 

  SELECT name,deadline,description,regular_employee,status FROM Tasks t where t.status=@status AND t.project_name=@project_name  AND t.manager=@manager AND t.company=dbo.GETCompany(@manager)
end
else print ' not a manager'
go

create proc ReviewTaskReject
@manager varchar(30),@project_name varchar(30) , @task_name varchar(15) , @deadline datetime
as
if exists (SELECT * from Managers m where m.username=@manager)
begin
 if exists (SELECT * FROM Tasks t where t.project_name=@project_name AND t.name=@task_name AND t.status='Fixed')
   UPDATE Tasks  SET Tasks.status='Assigned' ,Tasks.deadline=@deadline
  where  Tasks.name=@task_name AND Tasks.project_name=@project_name AND Tasks.manager=@manager AND Tasks.company=dbo.GETCompany(@manager)
else print 'either the task is not fixed or is project does not exist'
end
else print ' not a manager'
go

create proc ReviewTaskAccept
@manager varchar(30),@project_name varchar(30) , @task_name varchar(15) 
as
if exists (SELECT * from Managers m where m.username=@manager)
begin
 if exists (SELECT * FROM Tasks t where t.project_name=@project_name AND t.name=@task_name AND t.status='Fixed' AND t.company=dbo.GETCompany(@manager))
   UPDATE Tasks  SET Tasks.status='Closed' 
   where  Tasks.name=@task_name AND Tasks.project_name=@project_name AND Tasks.manager=@manager AND Tasks.company=dbo.GETCompany(@manager)
else print 'either the task is not fixed or is project does not exist'
end
else print ' not a manager'
go
 
