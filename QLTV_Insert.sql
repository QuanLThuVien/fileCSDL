----Tạo bảng mới.

create table Users(
serId int primary key,
Username varchar(15),
Password varchar(10),
MaNhanh char(10),
);

---- Xóa dữ liệu trong bảng
use QLThuVien

DELETE FROM Phat
DELETE FROM CTMuonTra
DELETE FROM MuonTra
DELETE FROM NhanVien
DELETE FROM DocGia
DELETE FROM Sach
DELETE FROM TacPham
DELETE FROM TheLoai
DELETE FROM KeSach
DELETE FROM NXB
DELETE FROM TacGia

---- Insert dữ liệu vào các bảng 

INSERT INTO TacGia(MaTG,HoTen,NamSinh,QueQuan)
VALUES 
	('TG001',N'Tố Hữu','1950',N'Hà Nam'),
    ('TG002',N'Nam Cao','1958',N'Hà Nam'),
	('TG003',N'Xuân Diệu','1943',N'Lào Cai'),
	('TG004',N'Hồ Xuân Hương','1830',N'Thanh Hóa'),
	('TG005',N'Hồ Chí Minh','1949',N'Nghệ An'),
	('TG006',N'Tế Hanh','1941',N'Cà Mau'),
	('TG007',N'Vũ Trọng Phụng','1960',N'Huế'),
	('TG008',N'Nguyễn Trãi','1765',N'Quảng Bình'),
	('TG009',N'Nguyễn Du','1732',N'Quảng Nam');

INSERT INTO NXB(MaNXB,TenNXB,DiaChi,Email,TT_DaiDien)
VALUES 
	('NXB01',N'Kim Đồng',N'Hà Nội','nxbkimdong@gmail.com',N'Nguyễn Công Sơn'),
    ('NXB02',N'Thanh Niên',N'Thanh Xuân','thanhnien@gmail.com',N'Trần Bắc Hà'),
	('NXB03',N'Quốc Gia',N'Kim Mã','nxbdhquocgia@gmail.com',N'Hà Kim Nữ'),
	('NXB04',N'Thiếu Nhi',N'Vĩnh Phúc','nxbthieunhi@gmail.com',N'Trịnh Công Sơn');

INSERT INTO KeSach(MaKS,TenKe)
VALUES 
	('KS001',N'Kệ A'),
    ('KS002',N'Kệ B'),
	('KS003',N'Kệ C'),
	('KS004',N'Kệ D'),
	('KS005',N'Kệ E'),
	('KS006',N'Kệ F'),
	('KS007',N'Kệ G'),
	('KS008',N'Kệ H'),
	('KS009',N'Kệ I'),
	('KS010',N'Kệ K'),
	('KS011',N'Kệ L');

INSERT INTO TheLoai(MaTL,TenTL)
VALUES 
	('TL001',N'Trinh Thám'),
    ('TL002',N'Tình Cảm,Lãng Mạn'),
	('TL003',N'Thiếu Nhi'),
	('TL004',N'Chính Trị'),
	('TL005',N'Khoa Học Viễn Tưởng'),
	('TL006',N'Giáo Khoa'),
	('TL007',N'Địa Lý'),
	('TL008',N'Lịch Sử'),
	('TL009',N'Kinh Doanh');

INSERT INTO TacPham(MaTP,TenSach,MaTG,MaTL,NgayDangKy,MaNXB,NamXB,GiaSach,MaKS,SoLuong)
VALUES 
	('TP001',N'Chuyện con mèo dạy hải âu bay','TG001','TL003','2006/03/20','NXB03','2003','59000','KS003','50'),
    ('TP002',N'Sherlock Holmes','TG005','TL001','2009/04/13','NXB01','1998','143000','KS002','90'),
	('TP003',N'Vật lý đại cương','TG002','TL006','1982/05/25','NXB04','1990','30000','KS001','142'),
	('TP004',N'Cha giàu,cha nghèo','TG008','TL009','1997/08/08','NXB04','2001','63000','KS004','87'),
	('TP005',N'Nguyễn Trãi bút ký','TG007','TL003','2006/03/20','NXB01','2000','70000','KS005','20'),
	('TP006',N'Búp sen vàng','TG003','TL004','2002/07/29','NXB02','1992','132000','KS006','95'),
	('TP007',N'Đội quân nhí nhố','TG009','TL003','1980/12/23','NXB04','1996','5000','KS008','150'),
	('TP008',N'Vùng đất hứa','TG006','TL008','2010/11/12','NXB02','2003','16000','KS008','160'),
	('TP009',N'Chân trời góc bể','TG004','TL007','2000/10/24','NXB03','1999','23000','KS007','112'),
	('TP010',N'Thanh mai trúc mã','TG005','TL008','2000/05/20','NXB04','1988','89000','KS010','147');	

INSERT INTO Sach(MaSach,MaTP,TrangThai)
VALUES 
	('S0001','TP001',1),
	('S0002','TP002',0),
	('S0003','TP003',1),
	('S0004','TP004',1),
	('S0005','TP005',0),
	('S0006','TP006',1),
	('S0007','TP007',0),
	('S0008','TP008',1),
	('S0009','TP009',1),
	('S0010','TP010',1);

INSERT INTO DocGia(MaDG,HoTen,NgaySinh,GioiTinh,SDT,DiaChi)
VALUES 
	('DG001', N'Nguyễn Tiến Minh', '1997/12/22',N'Nam','0123456789',N'Trần Cung,Hà Nội'),
	('DG002', N'Phạm Ngọc Đạt','1999/07/12',N'Nam','02345678901',N'Phạm Văn Đồng ,Hà Nội'),
	('DG003', N'Nguyễn Ngọc Ánh','1996/02/01',N'Nữ','0123456789',N'Trần Cung,Hà Nội'),
	('DG004', N'Nguyễn Đức Thành','1995/11/21',N'Nam','01675478216',N'Mai Dịch,Hà Nội'),
	('DG005', N'Nguyễn Tuấn Hoàng Anh','1999/12/22',N'Nam','0123456789',N'Cầu Giấy,Hà Nội'),
	('DG006', N'Hoàng Thị Quỳnh Mai','1997/03/11',N'Nữ','0123456789',N'Thanh Xuân,Hà Nội'),
	('DG007', N'Trần Văn Hiếu','1998/10/20',N'Nam','01646060889',N'Mê Linh,Hà Nội'),
	('DG008', N'Hà Hải Dương','1999/01/01',N'Nam','0123456789',N'Kim Sơn , Ninh Bình'),
	('DG009', N'Tạ Văn Chiến','2000/09/12',N'Nam','0212345678',N'Mê Linh,Hà Nội'),
	('DG010', N'Phạm Trung Đông','1994/11/14',N'Nam','06789213768',N'Mê Linh,Hà Nội');

INSERT INTO NhanVien(MaNV,HoTen,NgaySinh,GioiTinh,SDT)
VALUES 
	('NV001',N'Phạm Tiến Dương','1993/12/22',N'Nam','0912345678'),
    ('NV002',N'Trần Văn Cường','1992/10/12',N'Nam','0134123456'),
	('NV003',N'Phan Thị Hạnh','1990/09/12',N'Nữ','0983280146'),
	('NV004',N'Vũ Thị Hồng Ngọc','1997/10/3',N'Nữ','0961159347'),
	('NV005',N'Nguyễn Thị Thu Hà','1998/10/22',N'Nữ','0123456789'),
	('NV006',N'Đào Thị Dung','1992/12/9',N'Nữ','0987654321'),
	('NV007',N'Hà Minh Đức','1996/12/4',N'Nam','0321456789'),
	('NV008',N'Phạm Hồng Kỳ','1995/02/12',N'Nam','0768943569'),
	('NV009',N'Lê Hoàng Long','1993/01/12',N'Nam','0934567778');

INSERT INTO MuonTra(MaPM,MaDG,NgayMuon,HenTra,MaNV_GD)
VALUES 
	('PM001','DG001','2018/01/12','2018/03/12','NV001'),
    ('PM002','DG002','2018/01/1','2018/03/1','NV002'),
	('PM003','DG003','2017/11/11','2018/03/11','NV003'),
	('PM004','DG004','2017/12/10','2018/02/12','NV004'),
	('PM005','DG005','2017/10/2','2017/12/12','NV005'),
	('PM006','DG006','2018/01/22','2018/03/9','NV006'),
	('PM007','DG007','2018/02/21','2018/03/1','NV007'),
	('PM008','DG008','2018/01/20','2018/03/2','NV008'),
	('PM009','DG009','2017/12/3','2018/02/12','NV009');

INSERT INTO CTMuonTra(MaPM,MaSach,TrangThai,NgayTra)
VALUES 
	('PM001','S0001',1,'2018/02/10'),
    ('PM002','S0002',0,'2018/03/12'),
	('PM003','S0003',1,'2018/04/11'),
	('PM004','S0004',1,'2018/05/3'),
	('PM005','S0005',0,'2018/06/1'),
	('PM006','S0006',1,'2018/04/2'),
	('PM007','S0007',0,'2018/03/9'),
	('PM008','S0008',1,'2018/04/11'),
	('PM009','S0009',1,'2018/02/12');

INSERT INTO Phat(MaPP,MaSach,MaPM,CapDo,GhiChu)
VALUES 
	('PP001','S0001','PM001',1,N'quá hạn'),
	('PP002','S0002','PM002',1,N'sách bị nhàu'),
	('PP003','S0003','PM003',2,N'rách 1 trang'),
	('PP004','S0004','PM004',3,N'quá hạn quá lâu'),
	('PP005','S0005','PM005',1,N'quá hạn'),
	('PP006','S0006','PM006',2,N'rách sách'),
	('PP007','S0007','PM007',3,N'hỏng sách'),
	('PP008','S0008','PM008',2,N'rách một số trang'),
	('PP009','S0009','PM009',1,N'quá hạn');