/* 

Dominic Hudson - 102983679

-------------------------------------------------------------- Task 1 

SUBJECT (SubjCode, Description)
Primary Key (SubjCode)

TEACHER (StaffID, Surname, GivenName)
Primary Key (StaffID)

SUBJECTOFFERING (Year, Semester, Fee, StaffID, SubjCode)
Composite Primary Key (Year, Semester)
Foriegn Key (StaffID) REFERENCES Teacher
Foreign Key (SubjCode) REFERENCES Subject

STUDENT (StudentID, Surname, GivenName, Gender)
Primary Key (StudentID)

ENROLMENT (DateEnrolled, Grade, StudentID, SubjCode, Year, Semester)
Foreign Key (StudentID) REFERENCES Student
Foreign Key (SubjCode) REFERENCES Subject
Composite Foreign Key (Year, Semester) REFERENCES SubjectOffering


------------------------------------------------------------ Task 2

IF OBJECT_ID('Subject') is not NULL
Drop table Subject;

IF OBJECT_ID('Student') is not NULL
Drop table Student;

IF OBJECT_ID('SubjectOffering') is not NULL
Drop table SubjectOffering;

IF OBJECT_ID('Enrolment') is not NULL
Drop table Enrolment;

IF OBJECT_ID('Teacher') is not NULL
Drop table Teacher;

GO

Create Table SUBJECT (
 SubjCode       NVARCHAR(100)
,Description    NVARCHAR(500)
,Primary Key    (SubjCode),
);

Create Table Student (
 StudentID      NVARCHAR(10)
,Surname        NVARCHAR(100)
,GivenName      NVARCHAR(100)
,Gender         NVARCHAR(1)
,Primary Key    (StudentID)
);

CREATE TABLE Teacher (
 StaffID        INT
,Surname        NVARCHAR(100)
,GivenName      NVARCHAR(100)
,Primary Key    (StaffID)
);

CREATE TABLE SubjectOffering (
 SubjCode      NVARCHAR(100)
,Year          INT
,Semester      INT
,Fee           MONEY
,StaffID       INT
,Primary Key   (SubjCode, Year, Semester)
,Foreign Key   (SubjCode) references Subject
,Foreign Key   (StaffID) references Teacher
);

CREATE TABLE Enrolment (
 StudentID     NVARCHAR(10)
,SubjCode      NVARCHAR(100)
,YEAR          INT
,Semester      INT
,Grade         NVARCHAR(2)
,DateEnrolled  DATE
,Primary Key   (StudentID, SubjCode, Year, Semester)
,Foreign key   (StudentID) references Student
,Foreign key   (SubjCode) references Subject 
);

select *
From Student;

select *
from teacher;

select *
from subject;

select *
from SubjectOffering;

select *
from enrolment;

--------------------------------------------------------- Task 3


INSERT INTO Enrolment (StudentID, SubjCode, Year, Semester, Grade) VALUES 
 ('s12233445', 'ICTWEB425', 2018, 1, 'D')
,('s12233445', 'ICTWEB425', 2018, 2, 'C')
,('s12233445', 'ICTDBS403', 2019, 1, 'C')
,('s23344556', 'ICTWEB425', 2018, 1, 'P')
,('s23344556', 'ICTWEB425', 2019, 1, 'HD')
,('s34455667', 'ICTWEB425', 2019, 1, 'P')
,('s23344556', 'ICTDBS403', 2019, 2, NULL)
,('s34455667', 'ICTDBS403', 2019, 2, NULL)
,('s23344556', 'ICTDBS502', 2018, 2, 'P')
,('s34455667', 'ICTDBS502', 2018, 2, 'N');

INSERT INTO Student (StudentID, Surname, GivenName, Gender) VALUES 
 ('s12233445', 'Morrison', 'Scott', 'M')
,('s23344556', 'Gillard', 'Julia', 'F')
,('s34455667', 'Whitlam', 'Gough', 'M')
,('s12983679', 'Hudson', 'Dominic', 'M');

INSERT INTO SubjectOffering (SubjCode, Year, Semester, Fee, StaffID) VALUES 
 ('ICTWEB425', 2018, 1, 200, 98776655)
,('ICTWEB425', 2019, 1, 225, 98776655)
,('ICTDBS403', 2019, 1, 200, 87665544)
,('ICTDBS403', 2019, 2, 200, 76554433)
,('ICTDBS502', 2018, 2, 225, 87665544);

INSERT INTO Teacher (StaffID, Surname, GivenName) VALUES 
 (98776655, 'Starr', 'Ringo')
,(87665544, 'Lennon', 'John')
,(76554433, 'McCartney', 'Paul');

INSERT INTO Subject (SubjCode, Description) VALUES 
 ('ICTWEB425', 'Apply SQL to extract & manipulate data')
,('ICTDBS403', 'Create Basic Databases')
,('ICTDBS502', 'Design a Database');

--------------------------------------- Task 4
*/

/* ------------------------------------- Query 1
Select 
Stu.GivenName, Stu.Surname, 
Sbj.SubjCode, Sbj.Description, 
SbjOff.Year, SbjOff.Semester, SbjOff.Fee, 
Tch.GivenName, Tch.Surname

FROM Student Stu
INNER JOIN Enrolment
ON Enrolment.StudentID = Stu.StudentID

INNER JOIN Subject Sbj
on Enrolment.SubjCode = Sbj.Subjcode

INNER JOIN SubjectOffering SbjOff 
ON Sbj.SubjCode = SbjOff.SubjCode

INNER JOIN Teacher Tch
ON SbjOff.StaffID = Tch.StaffID;
*/

/*------------------------------------------- Query 2
Select SbjOff.Year, SbjOff.Semester, Count(Enr.StudentID) AS Enrolments

FROM SubjectOffering SbjOff
INNER JOIN Enrolment Enr
ON Enr.SubjCode = SbjOff.SubjCode

Group BY SbjOff.Year, SbjOff.Semester;
*/

/*--------------------------------------------Query 3
Select 
Sbj.Description, 
Enr.StudentID, 
SbjOff.Year, SbjOff.Semester, SbjOff.Fee

FROM Subject Sbj
INNER JOIN SubjectOffering SbjOff
ON Sbj.SubjCode = SbjOff.SubjCode

INNER JOIN Enrolment Enr
ON Sbj.SubjCode = Enr.SubjCode

WHERE Fee = 225

ORDER BY Year asc, Semester asc;
*/

/*---------------------------------------- Task 5
/*Had to change teacher givenname and surname to staffID to create view */

/*
CREATE VIEW Query5 As
Select 
Stu.GivenName, Stu.Surname, 
Sbj.SubjCode, Sbj.Description, 
SbjOff.Year, SbjOff.Semester, SbjOff.Fee, 
Tch.StaffID

FROM Student Stu
INNER JOIN Enrolment
ON Enrolment.StudentID = Stu.StudentID

INNER JOIN Subject Sbj
on Enrolment.SubjCode = Sbj.Subjcode

INNER JOIN SubjectOffering SbjOff 
ON Sbj.SubjCode = SbjOff.SubjCode

INNER JOIN Teacher Tch
ON SbjOff.StaffID = Tch.StaffID;
*/