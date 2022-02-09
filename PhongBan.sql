
Create table PHONG_BAN
(
MA_PB nvarchar(20) not null,
TEN_PB nvarchar(50) not null,
MA_TRUONGPHONG nvarchar(50) not null,
primary key(MA_PB)
)
GO

Create table NHAN_VIEN
(
ID_NhanVien nvarchar(2) not null,
HO_NV nvarchar(20) not null,
TEN_NV nvarchar(50) not null,
NAM_SINH DATETIME ,
DIA_CHI nvarchar(50) not null,
GIOI_TINH nvarchar(10) not null, 
LUONG INT not null,
PHG nvarchar(20) not null
primary key(ID_NhanVien)
FOREIGN KEY(PHG) REFERENCES PHONG_BAN(MA_PB)
)
go
insert into PHONG_BAN(MA_PB,TEN_PB,MA_TRUONGPHONG)
values (N'1',N'VĂN PHÒNG 1',N'P1')
insert into PHONG_BAN(MA_PB,TEN_PB,MA_TRUONGPHONG)
values (N'2',N'VĂN PHÒNG 2',N'P2')
insert into NHAN_VIEN(ID_NhanVien,HO_NV,TEN_NV,NAM_SINH,DIA_CHI,GIOI_TINH,LUONG,PHG)
values (N'0',N'Nguyễn Thị',N'Thắm', 2003-09-09,N'Nam Định',N'nữ',10000,N'1')
insert into NHAN_VIEN(ID_NhanVien,HO_NV,TEN_NV,NAM_SINH,DIA_CHI,GIOI_TINH,LUONG,PHG)
values (N'1',N'Nguyễn Thọ',N'Lan', 2003-10-09,N'Nam Định',N'nữ',90000,N'2')
select * from PHONG_BAN
select * from NHAN_VIEN