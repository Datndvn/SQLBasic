create table persons
(
Id int not null,
lastname nvarchar(50) not null,
Firstname nvarchar(50) ,
Age int,
City nvarchar(50) default N'Sandnes'
)
go
insert into persons(Id,lastname,Firstname,Age)
values (1,N'Nguyễn','A',18)

select * from persons

go
create table Orders
(
ID INT not null,
OrderNumber int not null,
OderDate date
)
alter table Orders
add constraint DF_OrderDate default getdate()
for OrderDate

insert into Orders(ID,OrderNumber) values (1,111)
select * from Orders
--Xóa default 
alter table Orders 
drop constraint DF_OrderDate