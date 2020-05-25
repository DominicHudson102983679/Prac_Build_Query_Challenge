INSERT INTO Enrolment (StudentID, SubjCode, Year, Semester, Grade) VALUES 
 
('s12233445', 'ICTWEB425', 2019, 2, 'C')


,('s12233445', 'ICTDBS403', 2019, 1, 'C')
,('s12233445', 'ICTWEB425', 2019, 1, 'D')
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
,(87665544, '87665544', 'John')
,(76554433, 'McCartney', 'Paul');

INSERT INTO Subject (SubjCode, Description) VALUES 
 ('ICTWEB425', 'Apply SQL to extract & manipulate data')
,('ICTDBS403', 'Create Basic Databases')
,('ICTDBS502', 'Design a Database');