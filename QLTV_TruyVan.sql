use QLThuVien
1. Select * From TacGia
2. Select * From TacGia Where TacGia.MaTG='TG001'
3. Select * From TacGia Where YEAR(TacGia.NamSinh)>=1950 AND YEAR(TacGia.NamSinh)<=1990
4. Select TacGia.MaTG, TacGia.HoTen From TacGia 
Where TacGia.HoTen like N'%Nguyễn%'
5. Select COUNT(*) From TacGia
6. Select TacGia.MaTG,TacGia.HoTen,TacGia.NamSinh
From TacGia Order by YEAR(NamSinh) ASC
7. Select TacGia.QueQuan, COUNT(QueQuan)[Số Lượng] 
From TacGia GROUP BY QueQuan
8. Select * From TacPham
9. Select MaTP From TacPham ORDER BY GiaSach
10. Select TOP 5 * From TacPham ORDER BY GiaSach DESC
11. Select * From NhanVien
12. Select NhanVien.MaNV, NhanVien.HoTen From NhanVien 
Where NhanVien.HoTen like N'%Thị%'
14. Select NhanVien.GioiTinh, COUNT(GioiTinh)[Số Lượng] 
From NhanVien GROUP BY GioiTinh
15. Select NhanVien.MaNV, COUNT(MuonTra.MaPM) 
From NhanVien,MuonTra
Where NhanVien.MaNV=MuonTra.MaNV_GD
GROUP BY NhanVien.MaNV
16. Select * From DocGia
17. Select DocGia.MaDG, DocGia.HoTen
From DocGia, MuonTra
Where DocGia.MaDG=MuonTra.MaDG
18. Danh sách tác phẩm của tác giả 'Tố Hữu'
Select TacPham.MaTP,TacPham.TenSach,TacGia.HoTen
From TacPham, TacGia
Where (TacGia.MaTG=TacPham.MaTG and TacGia.HoTen=N'Tố Hữu')
19. Thống kê số lượng sách đã nhập của mỗi NXB
Select NXB.MaNXB,SUM(SLTP.SoLuong) 
From NXB,
	(Select NXB.MaNXB,TacPham.MaTP,TacPham.SoLuong
	From NXB,TacPham
	Where (TacPham.MaNXB=NXB.MaNXB))as SLTP
Where NXB.MaNXB=SLTP.MaNXB
Group by NXB.MaNXB
20. Thống kê số lượng tác phẩm của mỗi tác giả
Select TacGia.MaTG,SUM(TacPham.MaTG)
From TacGia, TacPham
Where TacGia.MaTG=TacPham.MaTG
Group by TacGia.MaTG 
21. Select * From KeSach
22. Select * From TacPham
23. Select * From TacPham Order by TacPham.TenSach asc
24. Danh sách tác phẩm để tại Kệ A
Select TacPham.MaTP, TacPham.TenSach
From TacPham,KeSach
Where (TacPham.MaKS=KeSach.MaKS and KeSach.MaKS=N'%Kệ A%')
25. Danh sách các sách đang được mượn
Select TacPham.MaTP, TacPham.TenSach
From TacPham,
	(Select Sach.MaTP
	From Sach,CTMuonTra
	Where Sach.MaSach=CTMuonTra.MaSach) as TP
Where TacPham.MaTP=TP.MaTP
26. Số lượng giao dịch lủa mỗi nhân viên thư viện
Select NhanVien.MaNV, COUNT(MuonTra.MaPM) 
From NhanVien,MuonTra
Where NhanVien.MaNV=MuonTra.MaNV_GD
GROUP BY NhanVien.MaNV
27. Select * From Phat
28. Thống kê các độc giả bị phạt
Select DocGia.MaDG,DocGia.HoTen
From DocGia,
	(Select Phat.MaPM, MuonTra.MaDG
	From Phat, MuonTra
	Where Phat.MaPM=MuonTra.MaPM) as P
Where DocGia.MaDG=P.MaDG
29. Các tác phẩm thuộc thể loại 'Chính Trị'
Select TacPham.MaTP, TacPham.TenSach
From TacPham, TheLoai
Where (TacPham.MaTL=TheLoai.MaTL and TheLoai.TenTL=N'Chính trị')
30. Các sách quá hạn trả
Select Sach.MaTP
From Phat,Sach
Where Sach.MaSach=Phat.MaSach
------------------------------------------------------------------------- 



------------------------------------------------
--------------------------------------------------



 
 Select MaTP, TenSach, TenTL From TacPham INNER JOIN TheLoai ON TacPham.MaTL = TheLoai.MaTL
 Select MaTP, TenSach, TenTL From TacPham FULL JOIN TheLoai ON TacPham.MaTL = TheLoai.MaTL
 Select MaTP, TenSach, TenTL From TacPham LEFT JOIN TheLoai ON TacPham.MaTL = TheLoai.MaTL 
 Select MaTP, TenSach, TenTL From TacPham RIGHT JOIN TheLoai ON TacPham.MaTL = TheLoai.MaTL
 CREATE TABLE TacPham
		(
		MaTP char(10) primary key,
		TenSach nvarchar(50)not null,
		MaTG char(10) references TacGia(MaTG),
		MaTL char(10) references TheLoai(MaTL),
		NgayDangKy date,
		MaNXB char(10) references NXB(MaNXB),
		NamXB date,
		GiaSach money,
		MaKS char(10) references KeSach(MaKS),
		SoLuong int
		)
 INSERT INTO TacPham
	VALUES('TP01',N'Chuyện con mèo dạy hải âu bay','TG01','TL03','2006/03/20','NXB03','2003','59000','KS03','50')
 UPDATE TacPham SET TenSach=N'Truyện Kiều' Where MaTP='TP02'
 DELETE TacPham Where MaTP='TP01'
 ALTER TABLE TacPham ADD MauSach nvarchar(15)
 CREATE VIEW ViewTacPham 
	AS
	 Select * From TacPham Where MaTP='TP01'
 DROP VIEW ViewTacPham
