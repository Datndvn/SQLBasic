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
select Top 10  MaKhachHang,HovaTenLot + '' + Ten as HovaTen,Email,DienThoai from  KHACH_HANG
select MaSanPham,SoLuong * DonGia as Tongtientonkho from SanPham
select MaKhachHang,HovaTenLot +''+ Ten as HovaTen from KHACH_HANG where Ten like N'H%'
select * from KHACH_HANG where DiaChi like N'%Đà Nẵng%'
select * from SanPham where SoLuong between 100 and 500
select * from HoaDon where TrangThai like N'%chuawthanhtoan%' and year(NgayMuaHang) = 2016
select * from HoaDon where MaKhachHang = 'KH001' or MaKhachHang = 'KH003' or MaKhachHang = 'KH006'
--Bài 2 (4 điểm) Viết các câu truy vấn sau:
--a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(MaKhachHang) as SoLuongKH from KHACH_HANG
--b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(DonGia) as DongiaLN from SanPham 
--c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(SoLuong) as Soluongsanphamthapnhat from SanPham
--d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(SoLuong) as TongSoLuongSanPham from SanPham
--e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select count(MaHoaDon) as SoLuongHD from HoaDon  where MONTH(NgayMuaHang) =12 and YEAR(NgayMuaHang) = 2016 
and TrangThai like N'%chuawthanhtoan%'
--f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select MaHoaDon,count(MaSanPham) as SoLoaiSanPham from HoaDonChiTiet group by MaHoaDon
--g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu
--chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select MaHoaDon,count(MaSanPham) as SoLoaiSanPham from HoaDonChiTiet group by MaHoaDon
having count(MaSanPham) >=5
--h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang,
--maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
