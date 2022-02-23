go
create table Destinations(
Id int,
Thumbnail nvarchar(250),
ImageList nvarchar(max),
primary key (Id),
)
Create table Tours(
Id int,
Code varchar(50),
BeginDate date,
Day int,
Night int,
ImageList nvarchar(max),
Status bit,
DestinationId int,
primary key (Id),
foreign key(DestinationId) references Destinations(Id)
)
go
Create table Languages(
Id varchar(10),
Name nvarchar(50),
primary key (Id)
)
go
Create table TourTranslations(
Id int,
TourId int,
LanguageId varchar(10),
Title nvarchar(250),
[Content] nvarchar(max),
Note nvarchar(max),
primary key (Id),
foreign key(LanguageId) references Languages(Id),
foreign key(TourId) references Tours(Id)
)
Create table DestinationTranslations(
Id int,
LanguageId varchar(10),
DestinationId int,
Title nvarchar(250),
[Content] nvarchar(max),
primary key (Id),
foreign key(DestinationId) references Destinations(Id),
foreign key(LanguageId) references Languages(Id),
)
go
Create table Bookings(
Id int,
CustomerName nvarchar(50),
CustomerAddress nvarchar(50),
CustomerPhone varchar(50),
CustomerEmail nvarchar(50),
TourId int,
primary key (Id),
foreign key(TourId) references Tours(Id),
)
