create table Catalog(
Id int IDENTITY(1,1),
Name nvarchar(128) not null,
SiteTitle nvarchar(128),
MetaKeyworks nvarchar(158),
MetaDescription nvarchar(158),
ParentId int,
SortOrder int,
Visibility bit not null,
primary key (Id)
)
go
create table product(
Id int IDENTITY(1,1),
TypeId varchar(20),
Name nvarchar(128),
CatalogId int,
Description nvarchar(128),
[Content] ntext,
Price decimal(18,2),
PromotionPrice decimal(18,2),
Image nvarchar(128),
Thumblmage nvarchar(128),
ImageList nvarchar(max),
MetaDescription nvarchar(158),
SiteTitle nvarchar(128),
MetaKeyworks nvarchar(158),
ViewCount int,
Warranty int,
Video nvarchar(128),
DateCreated datetime,
UserCreated int,
UserModified int,
Status bit not null,
primary key (Id),
foreign key(CatalogId) references Catalog(Id)
)
go
create table Customers(
Id int IDENTITY(1,1),
CustomerName nvarchar(128),
CustomerPhone nvarchar(128),
CustomerEmail nvarchar(128),
CustomerAddress nvarchar(128),
CustomerCity nvarchar(128),
primary key (Id),

)
go
create table Orders(
Id int IDENTITY(1,1),
OrderDate datetime,
CustomerId int,
Status int,
primary key (Id),
foreign key(CustomerId) references Customers(Id)
)
go
create table OrderDetails(
OrderId int,
ProductId int,
Quantity int,
primary key (OrderId,ProductId),
foreign key(ProductId) references product(Id),
foreign key(OrderId) references Orders(Id),
)

go
create table Attributes
(
Id int IDENTITY(1,1),
Name nvarchar(128),
primary key (Id),
)
go
create table AttributeValues(
Id int IDENTITY(1,1),
AttributeId int,
Name nvarchar(128),
primary key (Id),
foreign key(AttributeId) references Attributes(Id)
)
go
create table ProductAttributes(
ProductId int,
AttributeValueId int,
primary key (ProductId,AttributeValueId),
foreign key(ProductId) references product(Id),
foreign key(AttributeValueId) references AttributeValues(Id)
)
go
create table ProductLinks
(
Id int,
LinkedProductID int,
ProductId int,
primary key (Id),
)

