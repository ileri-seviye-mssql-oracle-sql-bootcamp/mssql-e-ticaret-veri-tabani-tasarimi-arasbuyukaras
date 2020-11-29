USE KodluyoruzSQL
GO

CREATE TABLE Customer(Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Firstname nvarchar(50) NOT NULL,
Surname nvarchar(100)NOT NULL,
Birthday date,
AGE as DATEDIFF(year,Birthday,Getdate()),
SystemDate date)

CREATE TABLE CustomerJob(Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL,
FOREIGN KEY (CustomerId) REFERENCES Customer(Id),
JobName varchar(100) NOT NULL)

CREATE TABLE CustomerAddress(Id int not null IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL,
FOREIGN KEY (CustomerId) REFERENCES Customer(Id),
[Address] nvarchar(500))

CREATE TABLE Item(Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
ItemDefinition varchar(150) NOT NULL,
ItemStatus int NOT NULL)

CREATE TABLE ItemBrand(ItemBrandId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
ItemId int not null,
FOREIGN KEY (ItemId) REFERENCES Item(Id),
BrandName varchar(250) NOT NULL)

CREATE TABLE ItemCategory(ICId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
ItemId int NOT NULL,
FOREIGN KEY (ItemId) REFERENCES Item(Id),
MainCategoryId int NOT NULL,
DetailCategoryId int not null,
SubDetailCategoryId int NOT NULL)


CREATE TABLE [Order](OrderId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
OrderDefinition varchar(250) NOT NULL,
TotalAmount numeric(15,2) NOT NULL,
OrderStatus int NOT NULL,
OrderDate date NOT NULL,
UserCode varchar(10) NOT NULL,
SystemDate date NOT NULL)

CREATE TABLE OrderStatus(RowId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
StatusId int,
StatusDefinition varchar(30) NOT NULL
)

CREATE TABLE OrderDetail (OrderDetailId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
OrderId int NOT NULL,
FOREIGN KEY (OrderId) REFERENCES [Order](OrderId),
ItemId int NOT NULL,
LinePrice numeric(15,2) NOT NULL)

