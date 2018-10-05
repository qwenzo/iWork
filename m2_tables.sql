
create Table Companies(
email varchar(200) PRIMARY KEY NOT NULL ,
company_name varchar(100) NOT NULL ,
address varchar(120) NOT NULL,
domain varchar(30) UNIQUE NOT NULL,
type varchar(15) NOT NULL,
vision varchar(30) NOT NULL, 
specialization varchar(30) NOT NULL,
)

create Table Company_Phone(
company varchar(200),
phone int NOT NULL,
FOREIGN KEY(company) REFERENCES Companies ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(company,phone))


create Table Departments(
code int ,
company varchar(200),
PRIMARY KEY(code,company) ,
FOREIGN KEY(company) REFERENCES Companies ON DELETE CASCADE ON UPDATE CASCADE,
department_name varchar(30)
)

create Table Jobs( 
PRIMARY KEY(title,department,company),
title varchar(50) NOT NULL,
department int NOT NULL,
company varchar(200) NOT NULL,
FOREIGN KEY(department,company) REFERENCES Departments ON DELETE CASCADE ON UPDATE CASCADE,
 short_description varchar(1000) NOT NULL
, detailed_description varchar(max) 
, min_experience int NOT NULL
, salary DECIMAL(18,4) NOT NULL
, deadline datetime
,no_of_vacancies int NOT NULL, 
working_hours int NOT NULL
)
--
create Table Questions( number int PRIMARY KEY IDENTITY(1,1),
question varchar(120) NOT NULL,
answer bit NOT NULL)

create Table Job_has_Question( 
job varchar(50) not null,
department int not null,
company varchar(200) not null,
question int,
PRIMARY KEY( job, department,company,question),
FOREIGN KEY(job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(question) REFERENCES Questions ON DELETE CASCADE ON UPDATE CASCADE)

create Table Users( 
username varchar(30) PRIMARY KEY, 
password varchar(15) NOT NULL, 
personal_email varchar(40) NOT NULL UNIQUE, 
birth_date datetime NOT NULL, 
years_of_experience int NOT NULL, 
first_name varchar(15) NOT NULL, 
middle_name varchar(15),
last_name varchar(15) NOT NULL, 
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
)

create Table User_Job( 
username varchar(30),
job varchar(50),
PRIMARY KEY(username,job),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE
 )

create Table Job_Seekers(
username varchar(30),
PRIMARY KEY(username),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE
)

create Table Staff_Members(
username varchar(30),
PRIMARY KEY(username),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
annual_leaves int, 
company_email varchar(40) UNIQUE, 
day_off varchar(15) CHECK(day_off!='Friday'), 
salary DECIMAL(18,4),
job varchar(50),
department int,
company varchar(200),
FOREIGN KEY(job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE)

create Table Job_Seeker_apply_Job( 
job varchar(50),
department int,
company varchar(200),
job_seeker varchar(30),
PRIMARY KEY(job,department,company,job_seeker),
FOREIGN KEY(job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(job_seeker) REFERENCES Job_Seekers ON DELETE CASCADE ON UPDATE CASCADE,
hr_response varchar(15) DEFAULT 'pending',
manager_response varchar(15) DEFAULT 'pending', 
score int)

 create Table Attendance_Records( 
 PRIMARY KEY(date,staff),
 date date, 
 staff varchar(30),
FOREIGN KEY(staff) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE, 
 start_time time --DATEPART(HOUR, datetime);, 
 ,end_time time)

 create Table Emails( serial_number int PRIMARY KEY IDENTITY , 
 subject varchar(30) NOT NULL, 
 date datetime, 
 body varchar(max))

 create Table Staff_send_Email_Staff( 
 email_number int  ,
 recipient varchar(30) NOT NULL,
 sender varchar(30) NOT NULL,
 PRIMARY KEY(email_number,recipient),
 FOREIGN KEY(email_number) REFERENCES Emails ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY(recipient) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY(sender) REFERENCES Staff_Members  ON DELETE NO ACTION ON UPDATE NO ACTION)

create Table HR_Employees( 
username varchar(30),
PRIMARY KEY(username)
, FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE )

 create Table Regular_Employees( 
 username varchar(30),
 PRIMARY KEY(username)
, FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE ) 

 create Table Managers( 
 username varchar(30),
 PRIMARY KEY(username)
, FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE ,
type varchar(30)
)

create Table Announcements( 
PRIMARY KEY (date, title, hr_employee),
date datetime nOT NULL, 
title varchar(30) NOT NULL,
hr_employee varchar(30),
 FOREIGN KEY(hr_employee) REFERENCES HR_Employees ON DELETE CASCADE ON UPDATE CASCADE , 
type varchar(15), 
description varchar(max))

create Table Requests( 
PRIMARY KEY (start_date, applicant),
start_date datetime NOT NULL, 
applicant varchar(30) NOT NULL,
FOREIGN KEY(applicant) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE, 
end_date datetime NOT NULL, 
request_date datetime NOT NULL, 
total_days  AS CONVERT(int,(DATEDIFF ( day , start_date , end_date )) )--CHECK(total_days>applicant.annual_leaves)
,
hr_response varchar(15) DEFAULT 'pending' NOT NULL,
manager_response varchar(15) DEFAULT 'pending' NOT NULL, 
manager_reason varchar(1000) DEFAULT 'not yet reviewed' NOT NULL,
hr_employee varchar(30) ,
manager varchar(30) ,
FOREIGN KEY(hr_employee) REFERENCES HR_Employees ON DELETE NO ACTION ON UPDATE NO ACTION ,
 FOREIGN KEY(manager) REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION )

 create Table Leave_Requests(
 start_date datetime NOT NULL, 
applicant varchar(30),
 PRIMARY KEY (start_date, applicant),
  FOREIGN KEY(start_date, applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE  , 
 type varchar(15) NOT NULL)

 create Table Business_Trip_Requests( 
 start_date datetime NOT NULL, 
applicant varchar(30),
 PRIMARY KEY (start_date, applicant),
  FOREIGN KEY(start_date, applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE  , 
 destination varchar(30)NOT NULL, 
 purpose varchar(1000) nOT NULL )

 create Table HR_Employee_apply_replace_Request( 
 start_date datetime NOT NULL, 
  applicant varchar(30),
  hr_employee varchar(30) NOT NULL,
  replacement varchar(30) NOT NULL,
 PRIMARY KEY (start_date, applicant),
  FOREIGN KEY(start_date, applicant) REFERENCES Leave_Requests ON DELETE CASCADE ON UPDATE CASCADE  , 

 FOREIGN KEY(hr_employee) REFERENCES HR_Employees ON DELETE NO ACTION ON UPDATE NO ACTION, 
FOREIGN KEY(replacement) REFERENCES HR_Employees ON DELETE NO ACTION ON UPDATE NO ACTION)

 create Table Regular_Employee_apply_replace_Request(  
  start_date datetime NOT NULL, 
  applicant varchar(30),
  reg_employee varchar(30) NOT NULL,
  replacement varchar(30) NOT NULL,
 PRIMARY KEY (start_date, applicant),
 FOREIGN KEY(start_date, applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE, 
 FOREIGN KEY(reg_employee) REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY(replacement) REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE NO ACTION)

 create Table Manager_apply_replace_Request( 
 start_date datetime NOT NULL, 
  applicant varchar(30),
  manager varchar(30) NOT NULL,
  replacement varchar(30) NOT NULL,
 PRIMARY KEY (start_date, applicant),
 FOREIGN KEY(start_date, applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE, 
 FOREIGN KEY(manager) REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY(replacement) REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION,
)

create Table Projects( 
name varchar(30) NOT NULL,
company varchar(200),
  manager varchar(30) NOT NULL,
PRIMARY KEY(name, company),
FOREIGN KEY (company) REFERENCES Companies ON DELETE CASCADE ON UPDATE CASCADE, 
start_date datetime NOT NULL, 
end_date datetime,  
FOREIGN KEY(manager) REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION)

create Table Manager_assign_Regular_Employee_Project( 
project_name varchar(30),
company varchar(200),
 regular_employee varchar(30) NOT NULL,
   manager varchar(30) NOT NULL,
PRIMARY KEY(project_name, company , regular_employee),
FOREIGN KEY (project_name,company) REFERENCES Projects ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY(regular_employee) REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE NO ACTION
 , FOREIGN KEY(manager) REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION)

 create Table Tasks( PRIMARY KEY(name, project_name ,company),
 name varchar(15) NOT NULL,
 project_name varchar(30) NOT NULL,
company varchar(200),
 FOREIGN KEY (project_name,company) REFERENCES Projects ON DELETE CASCADE ON UPDATE CASCADE , 
 deadline datetime, 
 status varchar(15) NOT NULL,
  description varchar(max), 
  regular_employee varchar(30) ,
  manager varchar(30) NOT NULL,
   FOREIGN KEY(regular_employee) REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE NO ACTION
 , FOREIGN KEY(manager) REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION)

 create Table Task_Comment(
 task_name varchar(15) NOT NULL,
 project_name varchar(30) NOT NULL,
company varchar(200),
 PRIMARY KEY (task_name,project_name,company,comment),
 FOREIGN KEY (task_name,project_name,company) REFERENCES Tasks ON DELETE CASCADE ON UPDATE CASCADE ,
  comment varchar(500) NOT NULL)
 







