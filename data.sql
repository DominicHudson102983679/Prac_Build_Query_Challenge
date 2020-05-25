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