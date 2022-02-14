create table Students
(
  StudentID int primary key,
  Name nvarchar(50),
  Age int,
  JoinofDate datetime
)
alter table Students
drop constraint PK__Students__32C52A797F60ED59
alter table Students
add constraint pk_Students_StudentID primary key(StudentID,Name)