
Create table QuestionCategories(
Id int,
Name nvarchar(50),
ParentId int,
SortOrder int,
Status bit
primary key(Id)
)
go 
Create table Questions(
Id int,
Name nvarchar(50),
[Content] nvarchar(50),
SortOder int,
[Level] int,
CategoryId int,
Mark int,
Type int,
primary key(Id),
foreign key(CategoryId) references QuestionCategories(Id)
)
go
Create table Answers(
Id int,
Name nvarchar(50),
[Content] nvarchar(max),
QuestionId int,
IsCorrect bit,
primary key(Id),
foreign key(QuestionId) references Questions(Id),
)
go
Create table Students(
Id int,
UserName varchar(50),
PassWord varchar(50),
FullName nvarchar(50),
primary key(Id),
)
go
Create table Exam (
Id int,
Name nvarchar(50),
Description nvarchar(50),
TotalMark int,
PassMark int,
TotalQuestion int,
NumberOfHard int,
NumberOfMedium int,
NumberOfEasy int,
Status int,
primary key(Id)
)
Create table ExamResults(
Id int,
ExamDate datetime,
StudentId int,
ExamId int,
Mark int,
NumberOfCorrect int,
NumberOfInCorrect int,
primary key(Id),
foreign key(StudentId) references Students(Id),
foreign key(ExamId) references Exam(Id)
)
go
Create table ExamQuestions(
Id int,
QuestionId int,
SortOder int,
ExamId int,
primary key(Id),
foreign key(QuestionId) references Questions(Id),
foreign key(ExamId) references Exam(Id)
)
go
Create table ExamResultDetails(
Id int,
QuestionId int,
ExamResultId int,
ChooseAnswerId int,
primary key(Id),
foreign key(QuestionId) references Questions(Id),
foreign key(ChooseAnswerId) references Answers(Id)
)