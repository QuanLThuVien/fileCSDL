use master
DROP DATABASE QLThuVien

go
CREATE DATABASE QLThuVien

---- Xóa bảng
use QLThuVien

DROP TABLE Phat
DROP TABLE CTMuonTra
DROP TABLE MuonTra
DROP TABLE NhanVien
DROP TABLE DocGia
DROP TABLE Sach
DROP TABLE TacPham
DROP TABLE TheLoai
DROP TABLE KeSach
DROP TABLE NXB
DROP TABLE TacGia

go
use QLThuVien

CREATE TABLE TacGia
(
MaTG char(10) primary key,
HoTen nvarchar(50),
NamSinh date,
QueQuan nvarchar(50),
GhiChu nvarchar(50)
)

CREATE TABLE NXB
(
MaNXB char(10) primary key,
TenNXB nvarchar(50),
DiaChi nvarchar(50),
Email varchar(30),
TT_DaiDien nvarchar(50)
)

CREATE TABLE KeSach
(
MaKS char(10) primary key,
TenKe nvarchar(50),
)

CREATE TABLE TheLoai
(
MaTL char(10) primary key,
TenTL nvarchar(50)
)

CREATE TABLE TacPham
(
MaTP char(10) primary key,
TenSach nvarchar(50),
MaTG char(10) references TacGia(MaTG),
MaTL char(10) references TheLoai(MaTL),
NgayDangKy date,
MaNXB char(10) references NXB(MaNXB),
NamXB date,
GiaSach money,
MaKS char(10) references KeSach(MaKS),
SoLuong int
)

CREATE TABLE Sach
(
MaSach char(10) primary key,
MaTP char(10) references TacPham(MaTP),
TrangThai bit
)

CREATE TABLE DocGia
(
MaDG char(10) primary key,
HoTen nvarchar(50),
NgaySinh date,
GioiTinh nchar(3) check (GioiTinh in (N'Nữ', N'Nam')),
SDT char(12),
DiaChi nvarchar(50)
)

CREATE TABLE NhanVien
(
MaNV char(10) primary key,
HoTen nvarchar(50),
NgaySinh date,
GioiTinh nchar(3) check (GioiTinh in (N'Nữ', N'Nam')),
SDT char(12)
)

CREATE TABLE MuonTra
(
MaPM char(10) primary key,
MaDG char(10) references DocGia(MaDG),
NgayMuon date,
HenTra date,
MaNV_GD char(10) references NhanVien(MaNV)
)

CREATE TABLE CTMuonTra
(
MaPM char(10) references MuonTra(MaPM),
MaSach char(10) references Sach(MaSach),
TrangThai bit,
NgayTra date,
primary key (MaPM, MaSach)
)

CREATE TABLE Phat
(
MaPP char(10) primary key,
MaPM char(10) references MuonTra(MaPM),
MaSach char(10) references Sach(MaSach),
CapDo int,
GhiChu nvarchar(50)
)