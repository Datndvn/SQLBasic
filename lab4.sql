Create table DuAn
(
MaDA nvarchar(10) not null,
TenDA nvarchar(50) not null,
MaPhong nvarchar(10) not null,
NoiTrienKhai nvarchar(50) not null,
NoiDung nvarchar(50) not null,
primary key(MaDA)
)
go
Create table NhanVien
(
MaNV nvarchar(10) not null,
TenNV nvarchar(50) not null,
MaPhong nvarchar(10) not null,
primary key(MaNV)
)
go
Create table CTDA
(
MaDA nvarchar(10) not null,
MaNV nvarchar(10) not null,
NoiDung nvarchar(50) not null,
primary key(MaDA,MaNV),
foreign key(MaDA) references DuAn(MaDA),
foreign key(MaNV) references NhanVien(MaNV)
)
insert into  DuAn(MaDA,TenDA,MaPhong,NoiTrienKhai,NoiDung)
values (N'1',N'Kế hoạch',N'P1',N'Hà Nội',N'Làm việc ')
insert into  DuAn(MaDA,TenDA,MaPhong,NoiTrienKhai,NoiDung)
values (N'2',N'Kế hoạch',N'P2',N'Hà Nội',N'Làm việc ')
insert into  NhanVien(MaNV,TenNV,MaPhong)
values (N'N1',N'Nguyễn Tiến Đạt',N'P1')
insert into  NhanVien(MaNV,TenNV,MaPhong)
values (N'N2',N'Nguyễn Tiến Đa',N'P2')
insert into  CTDA(MaDA,MaNV,NoiDung)
values (N'1',N'N1',N'Làm việc')
insert into  CTDA(MaDA,MaNV,NoiDung)
values (N'2',N'N2',N'Làm việc')
select * from DuAn
select * from NhanVien
select * from CTDA