create table persons
(
Id int IDENTITY(1,1) PRIMARY KEY,
lastname nvarchar(50) not null,
Firstname nvarchar(50) ,
Age int,
)
INSERT INTO persons(lastname,Firstname,Age)
VALUES (N'TEDU','SQL',1)
SELECT * FROM persons
