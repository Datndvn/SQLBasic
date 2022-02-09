Create table VanDongVien
(
HovaTen nvarchar(50) not null,
Tuoi int not null,
MonThiDau nvarchar(20) not null,
CanNang float not null,
ChieuCao float not null
)
insert into VanDongVien(HovaTen,Tuoi,MonThiDau,CanNang,ChieuCao)
values (N'Nguyễn Tiến Đat',18,N'Đấu Vật',65,1.75)
insert into VanDongVien(HovaTen,Tuoi,MonThiDau,CanNang,ChieuCao)
values (N'Nguyễn Thị Anh Thơ',23,N'Điền Kinh',50,1.7)
insert into VanDongVien(HovaTen,Tuoi,MonThiDau,CanNang,ChieuCao)
values (N'Nguyễn Xuan Hieu',18,N'Đấu Vật',60,1.7)
select * from Vandongvien
ORDER BY ChieuCao ASC;