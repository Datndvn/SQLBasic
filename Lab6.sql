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
--Bài 1  Viết các câu truy vấn sau:
--a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
--sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
SELECT HOADON.MaHoaDon,MaKhachHang,TrangThai,MaSanPham,SoLuong,NgayMuaHang
FROM HOADON
FULL JOIN HoaDonChiTiet
ON HOADON.MaHoaDon = HoaDonChiTiet.MaHoaDon
--b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
--sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với
--điều kiện maKhachHang = ‘KH001’
SELECT HOADON.MaHoaDon,MaKhachHang,TrangThai,MaSanPham,SoLuong,NgayMuaHang
FROM HOADON
FULL JOIN HoaDonChiTiet
ON HOADON.MaHoaDon = HoaDonChiTiet.MaHoaDon
where MaKhachHang = N'KH001'
--c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột
--sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành
--tiền. Với thành tiền= donGia* soLuong
SELECT HOADON.MaHoaDon,DonGia,TrangThai,HoaDonChiTiet.MaSanPham,HoaDonChiTiet.SoLuong,NgayMuaHang,HoaDonChiTiet.SoLuong * DonGia as 'ThanhTien'
FROM HOADON
FULL JOIN HoaDonChiTiet
ON HOADON.MaHoaDon = HoaDonChiTiet.MaHoaDon
FULL JOIN SanPham
ON HoaDonChiTiet.MaSanPham = SanPham.MaSanPham
--d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các
--cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và
--tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh
--toán.
SELECT HovaTenLot + '' + Ten as 'HoVaTen',Email,DienThoai,HOADON.MaHoaDon,TrangThai,HoaDonChiTiet.SoLuong * DonGia as 'TongTien'
FROM KHACH_HANG
INNER JOIN HOADON
ON KHACH_HANG.MaKhachHang = HOADON.MaKhachHang
INNER JOIN HoaDonChiTiet
ON HOADON.MaHoaDon = HoaDonChiTiet.MaHoaDon
INNER JOIN SanPham
ON SanPham.MaSanPham = HoaDonChiTiet.MaSanPham
where TrangThai like N'chưathanhtoan'
--e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
--hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần
--của cột tổng tiền
SELECT HoaDon.MaHoaDon,NgayMuaHang,SUM(HoaDonChiTiet.SoLuong * DonGia) as 'TongTien'
FROM HOADON
INNER JOIN HoaDonChiTiet
ON HOADON.MaHoaDon = HoaDonChiTiet.MaHoaDon
INNER JOIN SanPham
ON SanPham.MaSanPham = HoaDonChiTiet.MaSanPham
GROUP BY HOADON.MaHoaDon ,NgayMuaHang
HAVING SUM(HoaDonChiTiet.SoLuong * DonGia)  >= 500000
--Bài 2  Viết các câu truy vấn sau:
--a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
SELECT MaKhachHang,NgayMuaHang
FROM HOADON
where NgayMuaHang >= 2016-01-01
--b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
SELECT HoaDonChiTiet.MaSanPham,COUNT(*) as LuotMua
FROM HoaDonChiTiet
INNER JOIN HOADON
ON HoaDonChiTiet.MaHoaDon = HOADON.MaHoaDon
INNER JOIN SanPham
ON HoaDonChiTiet.MaSanPham = SanPham.MaSanPham
WHERE HOADON.NgayMuaHang LIKE '2016-12%'
GROUP BY HoaDonChiTiet.MaSanPham
HAVING COUNT(*) >=ALL (SELECT COUNT(*) FROM HoaDonChiTiet
INNER JOIN HOADON 
ON HoaDonChiTiet.MaHoaDon = HOADON.MaHoaDon
WHERE HOADON.NgayMuaHang LIKE '2016-12%'
GROUP BY HoaDonChiTiet.MaSanPham)
--c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
SELECT TOP 5 KHACH_HANG.* , SUM(HoaDonChiTiet.SoLuong * SanPham.DonGia) as 'TongTien'
FROM SanPham
INNER JOIN HoaDonChiTiet
ON SanPham.MaSanPham = HoaDonChiTiet.MaSanPham
INNER JOIN HOADON
ON HOADON.MaHoaDon = HoaDonChiTiet.MaHoaDon
INNER JOIN KHACH_HANG
ON KHACH_HANG.MaKhachHang = HOADON.MaKhachHang
WHERE YEAR (HOADON.NgayMuaHang) = '2016'
GROUP BY KHACH_HANG.MaKhachHang,KHACH_HANG.HovaTenLot,KHACH_HANG.Ten,DiaChi,Email,DienThoai

--d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên
--“Iphone 7 32GB” trong tháng 12/2016

--e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản
--phẩm.