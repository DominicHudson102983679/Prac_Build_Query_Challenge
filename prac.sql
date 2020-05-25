/* Dominic Hudson - 102983679 */

/* Task 1 

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




*/