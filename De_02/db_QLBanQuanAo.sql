
create database QLBanQuanAo

go
use QLBanQuanAo
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
values ('PL1', N'Đầm dạ tiệc'),
		('PL2', N'Đầm công sở'),
		('PL3', N'Quần công sở'),
		('PL4', N'Quần jeans'),
		('PL5', N'Áo phao'),
		('PL6', N'Áo vest');

/*insert into PhanLoai(PhanLoaiChinh)
values (N'Chậu trồng cây');*/

insert into PhanLoaiPhu(MaPhanLoaiPhu, TenPhanLoaiPhu)
values  
		('PLP1', N'Đầm dạ tiệc'),
		('PLP2', N'Đầm công sở'),
		('PLP3', N'Quần công sở'),
		('PLP4', N'Quần jeans'),
		('PLP5', N'Áo phao'),
		('PLP6', N'Áo vest');


alter table SanPham
alter column TenSanPham nvarchar(100);

delete from SanPham

insert into SanPham(MaSanPham, TenSanPham, MaPhanLoai, DonGiaBanNhoNhat, AnhDaiDien, MaPhanLoaiPhu)
values ('SP1', N'Đầm dạ hội FDH', 'PL1', 100000, 'img_1.jpg', 'PLP1'),
		('SP2', N'Đầm công sở vải thô, dáng xòe', 'PL2', 100000, 'img_2.jpg', 'PLP2'),
		('SP3', N'Đầm công sở dáng A', 'PL1',100000, 'img_3.jpg', 'PLP2'),
		('SP4', N'Đầm maxi', 'PL2',200000, 'img_4.jpg', 'PLP1');
		
		