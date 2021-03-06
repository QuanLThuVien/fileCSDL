Create proc xemdausach
(
@MaTP char(10)
)
AS
SELECT tp.MaTP, tp.TenSach ,sach.TrangThai FROM TacPham tp , Sach sach
Where tp.MaTP=@MaTP  
ORDER BY tp.MaTP

xemdausach 'TP001'

CREATE PROC Them_Phat
(	
	@MaPP char(10),
	@MaSach char(10),
	@MaPM char(10),
	@CapDo int, 
	@GhiChu nvarchar(50)
)
AS
INSERT INTO Phat(MaPP,MaSach,MaPM,CapDo,GhiChu)
VALUES(@MaPP,@MaSach,@MaPM,@CapDo,@GhiChu);

CREATE PROC Xoa_Phat(@MaPP char(10))
AS
DELETE Phat
WHERE MaPP=@MaPP;

CREATE PROC Sua_Phat
(
	@MaPP char(10),
	@CapDo int, 
	@GhiChu nvarchar(50)
)
AS
UPDATE Phat
	SET CapDo = @CapDo
	SET GhiChu = @GhiChu
WHERE MaPP= @MaPP;


------------------------------------------------------------------------------------
if exists (select * from sysobjects WHERE name = 'AddID' AND type = 'fn')
drop function AddID
GO
-- @lastid là mã cuối cùng (fixwidth)
-- @prefix là tiền tố mã: vd HS0001 => HS
-- @size là số lượng ký tự trong mã HS0001 => 6
	
CREATE function AddID (@lastid varchar(10),@prefix varchar(10),@size int)
returns varchar(10)
as
BEGIN
	IF(@lastid = '')
	set @lastid = @prefix + REPLICATE (0,@size - LEN(@prefix))
	declare @num_nextid int, @nextid varchar(10)
	set @lastid = LTRIM(RTRIM(@lastid))
	-- number next id
	set @num_nextid = replace(@lastid,@prefix,'') + 1
	-- bo di so luong ky tu tien to
	set @size = @size - len(@prefix)
	-- replicate số lượng số 0 REPLICATE(0,3) => 000
	set @nextid = @prefix + REPLICATE (0,@size - LEN(@prefix))
	set @nextid = @prefix + RIGHT(REPLICATE(0, @size) + CONVERT (VARCHAR(MAX), @num_nextid), @size)
	return @nextid
END;


if exists (select * from sysobjects WHERE name = 'ID_TacGia' AND type = 'TR')
drop trigger ID_TacGia
GO
----------------------------------------------------
CREATE trigger ID_TacGia on TacGia
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaTG from TacGia order by MaTG desc)
	UPDATE TacGia set MaTG = dbo.AddID (@lastid,'TG',5) where MaTG = ''
end

go	
CREATE trigger ID_NXB on NXB
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaNXB from NXB order by MaNXB desc)
	UPDATE NXB set MaNXB = dbo.AddID (@lastid,'NXB',5) where MaNXB = ''
end	

go
CREATE trigger ID_KeSach on KeSach
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaKS from KeSach order by MaKS desc)
	UPDATE KeSach set MaKS = dbo.AddID (@lastid,'KS',5) where MaKS = ''
end	

go
CREATE trigger ID_TheLoai on TheLoai
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaTL from TheLoai order by MaTL desc)
	UPDATE TheLoai set MaTL = dbo.AddID (@lastid,'TL',5) where MaTL = ''
end	

go
CREATE trigger ID_TacPham on TacPham
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaTP from TacPham order by MaTP desc)
	UPDATE TacPham set MaTP = dbo.AddID (@lastid,'TP',5) where MaTP = ''
end	

go
CREATE trigger ID_Sach on Sach
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaSach from Sach order by MaSach desc)
	UPDATE Sach set MaSach = dbo.AddID (@lastid,'S',5) where MaSach = ''
end	

go
CREATE trigger ID_DocGia on DocGia
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaDG from DocGia order by MaDG desc)
	UPDATE DocGia set MaDG = dbo.AddID (@lastid,'DG',5) where MaDG = ''
end	

go
CREATE trigger ID_NhanVien on NhanVien
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaNV from NhanVien order by MaNV desc)
	UPDATE NhanVien set MaNV = dbo.AddID (@lastid,'NV',5) where MaNV = ''
end	

go
CREATE trigger ID_MuonTra on MuonTra
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaPM from MuonTra order by MaPM desc)
	UPDATE MuonTra set MaPM = dbo.AddID (@lastid,'PM',5) where MaPM = ''
end	

go
CREATE trigger ID_Phat on Phat
for insert
as
BEGIN
	DECLARE @lastid nvarchar(10)
	SET @lastid  = (SELECT TOP 1 MaPP from Phat order by MaPP desc)
	UPDATE Phat set MaPP = dbo.AddID (@lastid,'PP',5) where MaPP = ''
end	
