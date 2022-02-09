Create table KHACH_HANG
(
MaKhachHang nvarchar(10) not null,
HovaTenLot nvarchar(50) not null,
Ten nvarchar(50) not null,
DiaChi nvarchar(50) not null,
Email nvarchar(50) not null,
DienThoai nvarchar(50) not null,
primary key(MaKhachHang)
)
go
Create table SanPham
(
MaSanPham int not null identity,
Mota nvarchar(250) not null,
SoLuong int not null,
DonGia money not null,
primary key(MaSanPham),
check(soluong>0),
check(dongia>0)
)
go
Create table HOADON
(
MaHoaDon int not null,
NgayMuaHang datetime not null,
MaKhachHang nvarchar(10) not null,
TrangThai nvarchar(30) not null,
primary key(MaHoaDon),
foreign key(MaKhachHang) references KHACH_HANG(MaKhachHang)
)
go
Create table HoaDonChiTiet
(
MaHoaDon int not null,
MaSanPham int not null,
SoLuong int not null,
MaHoaDonChiTiet int not null identity,
primary key(MaHoaDonChiTiet),
foreign key(MaHoaDon) references HoaDon(MaHoaDon),
foreign key(MaSanPham) references SanPham(MaSanPham)
)
go
--Nhap Lieu KHACH_HANG
insert into KHACH_HANG(MaKhachHang,HovaTenLot,Ten,DiaChi,Email,DienThoai)
values ('PH10',N'Nguyễn Tiến',N'Đat',N'Nam Định','dat@fpt.edu.vn','0123456789')
insert into KHACH_HANG(MaKhachHang,HovaTenLot,Ten,DiaChi,Email,DienThoai)
values ('PH11',N'Nguyễn Thị',N'Thắm',N'Nam Định','Tham@fpt.edu.vn','0123456780')
--Nhap Lieu SanPham
insert into SanPham(Mota,SoLuong,DonGia)
values (N'coi truyền hình',5,1000)
insert into SanPham(Mota,SoLuong,DonGia)
values (N'giặt quần áo',4,5000)
--Nhập liệu Hóa Đơn
insert into HOADON(MaHoaDon,NgayMuaHang,MaKhachHang,TrangThai)
values(1,'08-11-2021','PH10',N'Đã thanh Toán')
insert into HOADON(MaHoaDon,NgayMuaHang,MaKhachHang,TrangThai)
values(2,'09-10-2021','PH11',N'Đã thanh Toán')
--Nhap liệu bảng chi tiết hóa đơn 
insert into HoaDonChiTiet(MaHoaDon,MaSanPham,SoLuong) values(1,1,10)
select * from HoaDon
select * from SanPham
select * from HoaDonChiTiet
select * from KHACH_HANG