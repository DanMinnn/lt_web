create database QLBanChauCanh

go
use QLBanChauCanh
go

create table NguoiDung(
	MaNguoiDung varchar(10) primary key,
	TenDangNhap nvarchar(20),
	TenNguoiDung nvarchar(20),
	SoDienThoai varchar(10),
	Email varchar(30),
	MatKhau varchar(12),
	DiaChi nvarchar(50)
)

create table DonHang(
	MaDonHang varchar(10) primary key,
	NgayDatHang datetime,
	MaNguoiDung varchar(10),
	DiaChiGiaoHang nvarchar(50),
	PTThanhToan nvarchar(20),
	TinhTrang nvarchar(10),
	TenNguoiNhanHang nvarchar(20),
	SoDienThoaiNhanHang varchar(10),
	TongTien float,
	GiamGia int,
	GhiChu nvarchar(50),

	foreign key (MaNguoiDung) references NguoiDung(MaNguoiDung) 
)

create table PhanLoai(
	MaPhanLoai varchar(10) primary key,
	PhanLoaiChinh varchar(10)
)

create table PhanLoaiPhu(
	MaPhanLoaiPhu varchar(10) primary key,
	TenPhanLoaiPhu nvarchar(20),
	MaPhanLoai varchar(10),

	foreign key (MaPhanLoai) references PhanLoai(MaPhanLoai)
)

create table SanPham(
	MaSanPham varchar(10) primary key,
	TenSanPham nvarchar(20),
	MaPhanLoai varchar(10),
	GiaNhap money,
	DonGiaBanNhoNhat money, 
	DonGiaBanLonNhat money,
	TrangThai nvarchar(10),
	MoTaNgan nvarchar(30),
	AnhDaiDien varchar(50),
	NoiBat nvarchar(20),
	MaPhanLoaiPhu varchar(10),

	foreign key (MaPhanLoai) references PhanLoai(MaPhanLoai),
	foreign key (MaPhanLoaiPhu) references PhanLoaiPhu(MaPhanLoaiPhu)
)

create table MauSac(
	MaMau varchar(10) primary key,
	TenMau nvarchar(20)
)

create table SPTheoMau(
	MaSPTheoMau varchar(10) primary key,
	MaSanPham varchar(10),
	MaMau varchar(10),

	foreign key (MaSanPham) references SanPham(MaSanPham),
	foreign key (MaMau) references MauSac(MaMau)
)

create table AnhChiTietSP(
	MaAnh varchar(10) primary key,
	MaSPTheoMau varchar(10),
	TenFileAnh nvarchar(20)

	foreign key (MaSPTheoMau) references SPTheoMau(MaSPTheoMau)
)

create table ChiTietSPBan(
	MaChiTietSP varchar(10) primary key,
	MaSPTheoMau varchar(10),
	KichCo nvarchar(10),
	SoLuong int,
	DonGiaBan money

	foreign key (MaSPTheoMau) references SPTheoMau(MaSPTheoMau)
)

create table ChiTietDH(
	MaDonHang varchar(10),
	MaChiTietSP varchar(10),
	SoLuongMua int,
	DonGiaBan money

	primary key (MaDonHang, MaChiTietSP)
)

alter table PhanLoaiPhu
alter column TenPhanLoaiPhu nvarchar(50);

alter table PhanLoai
alter column PhanLoaiChinh nvarchar(50);

delete from PhanLoai

insert into PhanLoai(MaPhanLoai, PhanLoaiChinh)
values ('PL1', N'Chậu trồng cây'),
		('PL2', N'Quà tặng cây cảnh'),
		('PL3', N'Cây cảnh trồng ngoài trời'),
		('PL4', N'Chậu văn phòng'),
		('PL5', N'Chậu kiểng'),
		('PL6', N'Chậu sứ');

insert into PhanLoai(PhanLoaiChinh)
values (N'Chậu trồng cây');

insert into PhanLoaiPhu(MaPhanLoaiPhu, TenPhanLoaiPhu)
values ('PLP1', N'CHẬU ĐÁ MÀI'),
		('PLP2', N'CHẬU GỐM SỨ'),
		('PLP3', N'CÂY TẶNG PHONG THỦY'),
		('PLP4', N'CÂY TẶNG DỊP LỄ'),
		('PLP5', N'CÂY CÓ HOA'),
		('PLP6', N'CÂY BỤI');


alter table SanPham
alter column TenSanPham nvarchar(50);

delete from SanPham

insert into SanPham(MaSanPham, TenSanPham, MaPhanLoai, DonGiaBanNhoNhat, AnhDaiDien, MaPhanLoaiPhu, NoiBat)
values ('SP1', N'Chậu sứ', 'PL1', 100000, 'img_1.jpg', 'PLP1', '100ms'),
		('SP2', N'Chậu cây bạch mã', 'PL2', 100000, 'img_2.jpg', 'PLP1', '200ms'),
		('SP3', N'Chậu đại phú', 'PL1',100000, 'img_3.jpg', 'PLP1', '300ms'),
		('SP4', N'Chậu đại phú', 'PL2',200000, 'img_4.jpg', 'PLP2', '400ms'),
		('SP5', N'Chậu đại phú','PL4', 300000, 'img_5.jpg', 'PLP2', '100ms'),
		('SP6', N'Chậu đại phú','PL3', 400000, 'img_6.jpg', 'PLP3', '200ms'),
		('SP7', N'Chậu đại phú','PL5', 500000, 'img_7.jpg', 'PLP4', '300ms'),
		('SP8', N'Chậu đại phú','PL3', 600000, 'img_8.jpg', 'PLP5', '400ms'),
		('SP9', N'Chậu đại phú','PL6', 700000, 'img_9.jpg', 'PLP6', '100ms');
		