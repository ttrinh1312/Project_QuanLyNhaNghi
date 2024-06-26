create database QuanLyNhaNghi
use QuanLyNhaNghi

create table HANG
(
	MaHang varchar(10) primary key,
	TenHang nvarchar(50) not null,
	SoLuong int,
	DonViTinh nvarchar(20),
	GiaBan int
)

create table KHACHHANG 
(
	Ma_KH varchar(13) primary key,
	Ten_KH nvarchar(50) not null,
	DiaChi_KH nvarchar(100),
	STK_KH varchar(15) unique
)
	
create table PHONG
(
	MaPhong varchar(10) primary key,
	LoaiPhong nvarchar(50),
	TinhTrangPhong nvarchar(15),
	DGTheoGio int,
	DGTheoNgay int
)
create table NHANVIEN
(
	MaNV varchar(10) primary key,
	HoTen nvarchar(60),
	SDT varchar(10) unique,
	ChucVu nvarchar(20)
)
create table HOADONBAN
(
	MaHDBan varchar(10) primary key,
	Ma_KH varchar(13),
	MaPhong varchar(10),
	ThoiGianDen datetime,
	ThoiGianDi datetime,
	DonViTinh nvarchar(10),
	TienPhong int,
	TienHang int,
	TongCong int,
	MaNV varchar(10)
	constraint fk_makh foreign key (Ma_KH) references KHACHHANG(Ma_KH),
	constraint fk_maphong foreign key(MaPhong) references PHONG(MaPhong),
	constraint fk_manv foreign key (MaNV) references NHANVIEN(MaNV)
)
go
create table HDBANCHITIET 
(
	MaHDBan varchar(10),
	MaHang varchar(10),
	SoLuong int,
	DonViTinh nvarchar(10),
	DonGia int,
	ThanhTien int,
	constraint fk_mahd foreign key (MaHDBAN) references HOADONBAN(MaHDBAN),
	constraint fk_mahang foreign key (MaHang) references HANG(MaHang)
)
go
create table HOADONNHAP
(
	MaHDNhap varchar(10) primary key,
	ThoiGian datetime,
	TongCong int,
	MaNV varchar(10),
	constraint fk_manv_nhap foreign key (MaNV) references NHANVIEN(MaNV)
)
go
create table HDNHAPCHITIET
(	
	MaHDNhap varchar(10),
	MaHang varchar(10),
	SoLuongLe int,
	DonVi nvarchar(10),
	SoLuongSi int,
	DonViTinh nvarchar(10),
	DonGiaSi int,
	ThanhTien int,
	constraint fk_mahdnhap foreign key (MaHDNHAP) references HOADONNHAP(MaHDNHAP),
	constraint fk_mahang_nhap foreign key (MaHang) references HANG(MaHang)
)
