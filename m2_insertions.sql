create database TLASTV2
--Companies
INSERT INTO Companies VALUES ('EG_Hardware@EGH.eg', 'EG_Hardware', 'Cairo , 90 street', '@EGH.eg', 'national',
'Cheap And Good', 'Hardware');

INSERT INTO Companies VALUES ('ARGames@AR.com', 'ARGames', 'NYC, 15th street District No.5', '@AR.com', 'international',
'promising Envirnoment', 'Gaming');

INSERT INTO Companies VALUES ('EDSoftwares@ED.jp', 'EDSoftwares', 'Cairo ,Madint Nasr, District No.7', '@ED.jp', 'international',
'easy money', 'Software Engineering');

-- Departements 
INSERT INTO Departments VALUES (101, 'EG_Hardware@EGH.eg', 'Electronics');
INSERT INTO Departments VALUES (201, 'EG_Hardware@EGH.eg', 'processors');
INSERT INTO Departments VALUES (301, 'EG_Hardware@EGH.eg', 'Monitors');

INSERT INTO Departments VALUES (101, 'ARGames@AR.com', 'Game Design');
INSERT INTO Departments VALUES (102, 'ARGames@AR.com', 'Game Art');
INSERT INTO Departments VALUES (103, 'ARGames@AR.com', 'Game Testing');

INSERT INTO Departments VALUES (201, 'EDSoftwares@ED.jp', 'DB');
INSERT INTO Departments VALUES (101, 'EDSoftwares@ED.jp', 'DLD');
INSERT INTO Departments VALUES (307, 'EDSoftwares@ED.jp', 'OOP');

--Jobs
INSERT INTO Jobs VALUES ('SE',201,'EDSoftwares@ED.jp','test', 'test test',3,5000,'10/15/2017',5,6)
INSERT INTO Jobs VALUES ('SE123',201,'EDSoftwares@ED.jp','test', 'test test',3,5000,'10/15/2017',0,6)
INSERT INTO Jobs VALUES ('S LD',101,'EDSoftwares@ED.jp','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('SGD',101,'ARGames@AR.com','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('FGD',101,'ARGames@AR.com','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('FGD',101,'ARGames@AR.com','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('GD',101,'EG_Hardware@EGH.eg','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('test 8',101,'EG_Hardware@EGH.eg','test', 'test test',1,5000,'10/15/2017',1,1)
INSERT INTO Jobs VALUES ('HR - Test',101,'EG_Hardware@EGH.eg','test', 'test test',1,5000,'10/15/2017',1,1)
INSERT INTO Jobs VALUES ('test 3',101,'EG_Hardware@EGH.eg','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('test 3',201,'EG_Hardware@EGH.eg','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('test 6',201,'EG_Hardware@EGH.eg','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('test 4',101,'EG_Hardware@EGH.eg','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('test 5',301,'EG_Hardware@EGH.eg','test', 'test test',3,5000,'10/15/2017',7,6)
INSERT INTO Jobs VALUES ('SGD',103,'ARGames@AR.com','test', 'test test',3,9000,'10/15/2017',7,6)

--USERS

INSERT INTO Users VALUES( 'Ahmed_useif' , '12345m', 'Ahmed@yahoo.com', '10/29/1990', 1, 'Ahmed', 'Gamal',
'useif');
INSERT INTO Users VALUES( 'Ahmed_khamis224' , '12345m', 'Ahm2e2232d@yahoo.com', '10/29/1990', 1, 'Ahmed', 'Gamal',
'Khamis');
INSERT INTO Users VALUES( 'Ahmed_khamis224333' , '12345m', 'Ahm233e2232d@yahoo.com', '1985', 6, 'Ahmed', 'Gamal',
'Khamis');



--ARAGAMES
INSERT INTO Users VALUES( 'Mohamed_Hesham' , '12345m6', 'MH@yahoo.com', '10/5/1997', 1, 'Mohamed', 'Hesham',
'Ibrahim');
INSERT INTO Users VALUES( 'Ahmed_Khaled11' , '543217', 'Ahme1dKH@yahoo.com','7/20/1980', 3, 'Ahmed', 'Khaled',
'Yousry');
INSERT INTO Users VALUES( 'Ahmed_Khaled121' , '543217', 'A2hme1dKH@yahoo.com','7/20/1980', 3, 'Ahmed', 'Khaled',
'Yousry');
INSERT INTO Users VALUES( 'DanielMalak' , '1234588', 'DanielMalak11@gmail.com', '10/20/1996', 1, 'Daniel', 'Malak',
'Malak');
INSERT INTO Users VALUES( 'DanielMalak1' , '1234588', 'DanielM1alak@gmail.com', '10/20/1996', 1, 'Daniel', 'Malak',
'Malak');
INSERT INTO Users VALUES( 'Ahmed_khamis22' , '12345m', 'Ahm2e22d@yahoo.com', '10/29/1990', 5, 'Ahmed', 'Gamal',
'Khamis');
Insert INTO Staff_Members VALUES('Mohamed_Hesham',20,'Mohamed_Hesham@AR.com','Tuesday' ,2000000,'FGD',101,'ARGames@AR.com');
Insert INTO Staff_Members VALUES('Ahmed_Khaled121',20,'Ahmed_Khaled121@EGH.eg','Thursday' ,500,'FGD',101,'ARGames@AR.com');
Insert INTO Staff_Members VALUES('DanielMalak1',30,'DanielMal1ak@EGH.eg','Monday' ,8000,'FGD',101,'ARGames@AR.com');
Insert INTO Staff_Members VALUES('DanielMalak',30,'DanielMalak@EGH.eg','Monday' ,8000,'FGD',101,'ARGames@AR.com');
Insert INTO Staff_Members VALUES('Ahmed_khamis22',30,'AKH22@EGH.eg','Monday' ,8000,'FGD',101,'ARGames@AR.com');
Insert INTO Staff_Members VALUES('Ahmed_Khaled11',21,'Ahmed_Khaled11@EGH.eg','Thursday' ,500,'FGD',101,'ARGames@AR.com');
INSERT INTO Regular_Employees VALUES ('Ahmed_khamis22')
INSERT INTO Regular_Employees VALUES ('Mohamed_Hesham');
INSERT INTO Regular_Employees VALUES ('Ahmed_Khaled121');
INSERT INTO HR_Employees VALUES ('Ahmed_Khaled11');
INSERT INTO Managers VALUES ('DanielMalak','HR');
INSERT INTO Managers VALUES ('DanielMalak1','HR');

--EG HARDWARE
INSERT INTO Users VALUES( 'Ahmed_Khaled112' , '543217', 'AhmedKH111@yahoo.com', '5/3/1983', 3, 'sameh', 'Khaled',
'Mohamed');
INSERT INTO Users VALUES( 'test7' , '543217', '777@yahoo.com', '5/3/1983', 3, 'sameh', 'Khaled',
'Mohamed');
INSERT INTO Users VALUES( 'reg' , '543217', 'reg@yahoo.com', '5/3/1983', 3, 'sameh', 'Khaled',
'Mohamed');
INSERT INTO Users VALUES( 'reg4' , '543217', 'reg4@yahoo.com', '5/3/1983', 3, 'sameh', 'Khaled',
'Mohamed');
INSERT INTO Users VALUES( 'reg3' , '543217', 'reg3@yahoo.com', '5/3/1983', 3, 'sameh', 'Khaled',
'Mohamed');
INSERT INTO Users VALUES( 'reg2' , '543217', 'reg2@yahoo.com', '5/3/1983', 3, 'sameh', 'Khaled',
'Mohamed');
INSERT INTO Users VALUES( 'ibraam_emad' , '123', 'IbraamEmad@gmail.com', '9/8/1977', 5, 'Ibraam', 'Emad',
'Wassef');
INSERT INTO Users VALUES( 'SaraSS' , '5fef17', 'SaraSamy@yahoo.com', '2/19/1986', 8, 'Sara', 'Samy',
'Yousry');
INSERT INTO Users VALUES( 'SaraSS2' , '5fef17', 'SaraSamy2@yahoo.com', '2/19/1986', 8, 'Sara', 'Samy',
'Yousry');
INSERT INTO Users VALUES( 'Hesham1985' , 'io444t43ik', 'HeshanMaged@gmail.com', '1/28/1985', 7, 'Hesham', 'Maged',
'Hesham');
INSERT INTO Users VALUES( 'Hesham1996' , 'io444t43ik', 'Hesham1996@gmail.com', '1/28/1985', 7, 'Hesham', 'Maged',
'Hesham');
INSERT INTO Users VALUES( 'Hesham19962' , 'io444t43ik', 'Hesham19962@gmail.com', '1/28/1985', 7, 'Hesham', 'Maged',
'Hesham');
INSERT INTO Users VALUES( 'Ahmed_Khaled1' , '543217', 'AhmedKH@yahoo.com','7/20/1980', 3, 'Ahmed', 'Khaled',
'Yousry');
Insert INTO Staff_Members VALUES('Ahmed_Khaled1',20,'Ahmed_Khaled1@EGH.eg','Thursday' ,500,'GD',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('Ahmed_Khaled112',20,'Ahmed_Khaled111@EGH.eg','Tuesday', 8000,'test 3',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('test7',20,'test7@EGH.eg','Tuesday', 8000,'test 3',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('reg',20,'test37@EGH.eg','Tuesday', 8000,'test 3',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('reg2',20,'test327@EGH.eg','Thursday', 8000,'test 6',201,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('reg3',20,'test3273@EGH.eg','Thursday', 8000,'test 6',201,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('reg4',20,'test32473@EGH.eg','Thursday', 8000,'test 3',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('ibraam_emad',20,'ibraam_emad@EGH.eg','Sunday', 8000.99,'test 3',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('SaraSS',20,'SaraSS@EGH.eg','Suterday', 8000,'test 3',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('SaraSS2',20,'SaraSS2@EGH.eg','Suterday', 8000,'test 3',201,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('Hesham1985',20,'Hesham1985@EGH.eg','Sunday', 8000,'test 5',301,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('Hesham19962',20,'Hesham19962@EGH.eg','Sunday', 8000,'test 3',101,'EG_Hardware@EGH.eg');
Insert INTO Staff_Members VALUES('Hesham1996',20,'Hesham199762@EGH.eg','Sunday', 8000,'test 5',301,'EG_Hardware@EGH.eg');
INSERT INTO HR_Employees VALUES ('Ahmed_Khaled112');
INSERT INTO Regular_Employees VALUES ('Ahmed_Khaled1');
INSERT INTO Managers VALUES ('test7','HR');
INSERT INTO Regular_Employees VALUES ('reg')
INSERT INTO Regular_Employees VALUES ('reg2')
INSERT INTO Regular_Employees VALUES ('reg3')
INSERT INTO Regular_Employees VALUES ('reg4')
INSERT INTO Managers VALUES ('ibraam_emad','Financial');
INSERT INTO HR_Employees VALUES ('SaraSS');
INSERT INTO HR_Employees VALUES ('SaraSS2');
INSERT INTO Managers VALUES ('Hesham1996','HR');
INSERT INTO Managers VALUES ('Hesham19962','HR');


--JSs
INSERT INTO Job_Seekers  VALUES ('Ahmed_useif')
INSERT INTO Job_Seekers  VALUES ('Ahmed_khamis22')
INSERT INTO Job_Seekers  VALUES ('Ahmed_khamis224')
INSERT INTO Job_Seekers  VALUES ('Ahmed_khamis224333')
--INSERT INTO Regular_Employees  VALUES ('Ahmed_khamis224')

--testing View TOP 3 AND total hrs of the month
 INSERT INTO Attendance_Records VALUES ('12/12/2017', 'Mohamed_Hesham', '1:00:00AM', '2:00:00AM')
  INSERT INTO Attendance_Records VALUES ('12/13/2017', 'Mohamed_Hesham', '1:00:00AM', '4:00:00AM')
    INSERT INTO Attendance_Records VALUES ('2/13/2017', 'Mohamed_Hesham', '1:00:00AM', '7:00:00AM')
	INSERT INTO Attendance_Records VALUES ('12/12/2017', 'Ahmed_Khaled121', '1:00:00AM', '6:00:00AM')
  INSERT INTO Attendance_Records VALUES ('12/13/2017', 'Ahmed_Khaled121', '1:00:00AM', '5:00:00AM')
    INSERT INTO Attendance_Records VALUES ('2/13/2017', 'Ahmed_Khaled121', '1:00:00AM', '7:00:00AM')
	INSERT INTO Projects VALUES ('test','ARGames@AR.com','DanielMalak1','12/14/2017','12/15/2017')
	INSERT INTO Tasks VALUES ('lol','test','ARGames@AR.com','11/15/2017','Open','test test','Ahmed_Khaled121','DanielMalak1')
	INSERT INTO Projects VALUES ('test2','ARGames@AR.com','DanielMalak1','12/14/2017','12/15/2017')
	INSERT INTO Manager_assign_Regular_Employee_Project VALUES ('test2','ARGames@AR.com','Ahmed_Khaled121','DanielMalak1')
	INSERT INTO Manager_assign_Regular_Employee_Project VALUES ('test','ARGames@AR.com','Ahmed_Khaled121','DanielMalak1')
	INSERT INTO Tasks VALUES ('lol','test2','ARGames@AR.com','12/15/2017','Open','test test','Ahmed_Khaled121','DanielMalak1')
	INSERT INTO Task_Comment VALUES ('lol','test2','ARGames@AR.com','teeeest')
	INSERT INTO Tasks VALUES ('lol5','test2','ARGames@AR.com','12/15/2017','Fixed','test test','Ahmed_Khaled121','DanielMalak1')
	INSERT INTO Tasks VALUES ('lol2','test2','ARGames@AR.com','12/15/2017','Fixed','test test','Mohamed_Hesham','DanielMalak1')
	INSERT INTO Tasks VALUES ('lol3','test2','ARGames@AR.com','12/15/2017','Fixed','test test','Mohamed_Hesham','DanielMalak1')

-- interview Qs
INSERT INTO Questions VALUES ('test1',0);
INSERT INTO Job_has_Question VALUES('GD',101,'EG_Hardware@EGH.eg',SCOPE_IDENTITY())
INSERT INTO Questions VALUES ('test2',0);
INSERT INTO Job_has_Question VALUES('GD',101,'EG_Hardware@EGH.eg',SCOPE_IDENTITY())
INSERT INTO Questions VALUES ('test3',0);
INSERT INTO Job_has_Question VALUES('GD',101,'EG_Hardware@EGH.eg',SCOPE_IDENTITY())
INSERT INTO Questions VALUES ('test4',1);
INSERT INTO Job_has_Question VALUES('GD',101,'EG_Hardware@EGH.eg',SCOPE_IDENTITY())
--INSERT INTO Questions VALUES ('test 5',NULL);
--INSERT INTO Job_has_Question VALUES('GD',101,'EG_Hardware@EGH.eg',SCOPE_IDENTITY())

--View Application JS
--INSERT INTO Job_Seeker_apply_Job VALUES ('test 3',101,'EG_Hardware@EGH.eg','Ahmed_khamis22','pending','pending',7)
UPDATE Job_Seeker_apply_Job SET manager_response='accepted' where job_seeker='Ahmed_khamis22' AND job='test 3' AND company='EG_Hardware@EGH.eg' AND department= 101 
UPDATE Job_Seeker_apply_Job SET manager_response='rejected' where job_seeker='Ahmed_khamis22' AND job='test 4' AND company='EG_Hardware@EGH.eg' AND department= 101 

--ATTENDANCE REC
INSERT INTO Attendance_Records VALUES('11/2/2017','Ahmed_khamis22','1:00 AM','3:00 AM')
INSERT INTO Attendance_Records VALUES('11/7/2017','Ahmed_khamis22','2:00 AM','3:00 AM')
INSERT INTO Attendance_Records VALUES('11/5/2017','Ahmed_khamis22','1:00 AM','3:00 AM')

--ANNOUNCEMENTS 
INSERT INTO Announcements VALUES ('11/20/2017','test','Ahmed_Khaled112','test','test')
INSERT INTO Announcements VALUES ('11/21/2017','test','Ahmed_Khaled112','test1','test1')
INSERT INTO Announcements VALUES ('11/1/2017','test','Ahmed_Khaled112','test1','test1')

--Requests
INSERT INTO Requests VALUEs('5/1/2017','reg2','5/6/2017',CURRENT_TIMESTAMP,'pending','accepted','pending',NULL,'ibraam_emad')
INSERT INTO Leave_Requests VALUES('5/1/2017','reg2','test')
INSERT INTO Regular_Employee_apply_replace_Request VALUES('5/1/2017','reg2','reg2','reg3')

INSERT INTO Requests VALUEs('5/1/2017','reg','5/6/2017',CURRENT_TIMESTAMP,'pending','accepted','pending',NULL,'ibraam_emad')
INSERT INTO Business_Trip_Requests VALUES('5/1/2017','reg','test','testy')



