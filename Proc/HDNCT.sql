--
create or alter trigger tNhap
on HDNHAPCHITIET 
instead of insert
as
begin
	declare @maHang varchar(5), @soluong int
	select @maHang = MaHang, @soluong = SoLuongLe from inserted
	if exists (select 1 from HANG where MaHang = @maHang)
	begin
		insert into HDNHAPCHITIET
		select*from inserted

		update Hang
		set SoLuong = SoLuong + @soluong
		where MaHang = @maHang
	end
	else
	begin
		print 'Chua ton tai'
		ROLLBACK
	end
end


insert into HDNHAPCHITIET values ('HDN010','HH30',3,'hop',1,'day',100,1*100)
select * from HANG
go
create or alter trigger tNhap
on HDNHAPCHITIET 
instead of insert
as
begin
	declare @maHang varchar(5) = (select dbo.fMaHang())
	
end

CREATE UNIQUE INDEX idx_STK
ON KHACHHANG(STK_KH);

SELECT *
FROM KHACHHANG WITH(INDEX(idx_STK_KH))
WHERE STK_KH = '1022287345763'

-- Xem thông tin chi tiết về chỉ mục 'idx_DonViTinh_GiaBan' trên bảng 'HANG'
SELECT 
    OBJECT_NAME(object_id) AS KHACHHANG,
    KHACHHANG AS idx_STK_KH,
    index_id,
    COL_NAME(object_id, STK_KH) AS ColumnName
FROM sys.index_columns
--WHERE object_id = OBJECT_ID('HANG')
--    AND index_id = OBJECT_ID('idx_DonViTinh_GiaBan');
go
--Tạo mã hóa đơn nhập mới
create or alter function fnNewMaMoiHDN()
returns varchar(10)
as
begin
	declare @maht int, @mamoi varchar(10)
	set @maht = (select max(right(MaHDNhap,len(MaHDNhap)-3)) from HOADONNHAP)
	set @mamoi= 'HDN'+REPLICATE('0',(3-len(@maht+1)))+cast((@maht+1) as varchar)
	return @mamoi
end


print dbo.fnNewMaMoiHDN()
select * from hoadonnhap


declare @mamoi varchar(10), @ma varchar(10)
set @ma= (select right(max(mahdnhap),6) from HOADONNHAP)
print @ma
set @mamoi = cast('HDN' as varchar) + replicate('0',3-len(@ma)) + cast((@ma+1) as varchar)
print @mamoi




go
--Tạo mã hàng mới
create or alter function fMaHang()
returns varchar(4) 
as
begin
	declare @mahang varchar(4), @ma int
	set @ma = (select max(right(MaHang,2))+1 from Hang)
    set @mahang = 'HH'+cast(@ma as varchar(2))
    return  @mahang
end
go
select dbo.fMahang()

--Tạo function trả về số lượng lẻ của hàng hóa
create or alter function fnSLLe(@MaHH varchar(4), @SLSi int)
returns int
as
begin
	set @MaHH = (select MaHang from HANG where MaHang = @MaHH)
	declare @SLLe int
	--Nước suối
	if @MaHH = 'HH01'
	begin
		set @SLLe = @SLSi*24
	end
	--Coca
	else if @MaHH = 'HH02'
	begin
		set @SLLe = @SLSi*24
	end
	--Pepsi
	else if @MaHH = 'HH03'
	begin
		set @SLLe = @SLSi*24
	end
	--Không độ
	else if @MaHH = 'HH04'
	begin
		set @SLLe = @SLSi*24
	end
	--Sting
	else if @MaHH = 'HH05'
	begin
		set @SLLe = @SLSi*24
	end
	--Trà túi lọc Phúc Long
	else if @MaHH = 'HH06'
	begin
		set @SLLe = @SLSi*25
	end
	--Cà phê gói NESCAFÉ
	else if @MaHH = 'HH07'
	begin
		set @SLLe = @SLSi*20
	end
	--Bia Tiger
	else if @MaHH = 'HH08'
	begin
		set @SLLe = @SLSi*24
	end
	--Bánh snack Oishi
	else if @MaHH = 'HH09'
	begin
		set @SLLe = @SLSi*8
	end
	--Thuốc lá
	else if @MaHH = 'HH10'
	begin
		set @SLLe = @SLSi*10
	end
	--Sữa tắm Dove
	else if @MaHH = 'HH11'
	begin
		set @SLLe = @SLSi*1
	end
	--Dầu gội
	else if @MaHH = 'HH12'
	begin
		set @SLLe = @SLSi*1
	end
	--Quẹt ga
	else if @MaHH = 'HH13'
	begin
		set @SLLe = @SLSi*1
	end
	--Giấy vệ sinh
	else if @MaHH = 'HH14'
	begin
		set @SLLe = @SLSi*10
	end
	--Bộ chăn ga
	else if @MaHH = 'HH15'
	begin
		set @SLLe = @SLSi*1
	end
	--Khăn tắm
	else if @MaHH = 'HH16'
	begin
		set @SLLe = @SLSi*1
	end
	--Kem đánh răng
	else if @MaHH = 'HH17'
	begin
		set @SLLe = @SLSi*1
	end
	--Bàn chải đánh răng
	else if @MaHH = 'HH18'
	begin
		set @SLLe = @SLSi*1
	end
	--Lược
	else if @MaHH = 'HH19'
	begin
		set @SLLe = @SLSi*1
	end
	--Dép
	else if @MaHH = 'HH20'
	begin
		set @SLLe = @SLSi*1
	end
	--Cốc thủy tinh
	else if @MaHH = 'HH21'
	begin
		set @SLLe = @SLSi*10
	end
	return @SLLe
end
go
select dbo.fnSLLe('HH01',2)
--Tạo hàm trả về đơn vị lẻ
create or alter function fnDVLe(@MaHH varchar(4))
returns nvarchar(10)
as
begin
	set @MaHH = (select MaHang from HANG where MaHang = @MaHH)
	declare @DVLe nvarchar(10)
	--Nước suối
	if @MaHH = 'HH01'
	begin
		set @DVLe = N'chai'
	end
	--Coca
	else if @MaHH = 'HH02'
	begin
		set @DVLe = N'chai'
	end
	--Pepsi
	else if @MaHH = 'HH03'
	begin
		set @DVLe = N'chai'
	end
	--Không độ
	else if @MaHH = 'HH04'
	begin
		set @DVLe = N'chai'
	end
	--Sting
	else if @MaHH = 'HH05'
	begin
		set @DVLe = N'chai'
	end
	--Trà túi lọc Phúc Long
	else if @MaHH = 'HH06'
	begin
		set @DVLe = N'gói'
	end
	--Cà phê gói NESCAFÉ
	else if @MaHH = 'HH07'
	begin
		set @DVLe = N'gói'
	end
	--Bia Tiger
	else if @MaHH = 'HH08'
	begin
		set @DVLe = N'lon'
	end
	--Bánh snack Oishi
	else if @MaHH = 'HH09'
	begin
		set @DVLe = N'gói'
	end
	--Thuốc lá
	else if @MaHH = 'HH10'
	begin
		set @DVLe = N'cây'
	end
	--Sữa tắm Dove
	else if @MaHH = 'HH11'
	begin
		set @DVLe = N'chai'
	end
	--Dầu gội
	else if @MaHH = 'HH12'
	begin
		set @DVLe = N'chai'
	end
	--Quẹt ga
	else if @MaHH = 'HH13'
	begin
		set @DVLe = N'cái'
	end
	--Giấy vệ sinh
	else if @MaHH = 'HH14'
	begin
		set @DVLe = N'cuộn'
	end
	--Bộ chăn ga
	else if @MaHH = 'HH15'
	begin
		set @DVLe = N'bộ'
	end
	--Khăn tắm
	else if @MaHH = 'HH16'
	begin
		set @DVLe = N'cái'
	end
	--Kem đánh răng
	else if @MaHH = 'HH17'
	begin
		set @DVLe = N'cái'
	end
	--Bàn chải đánh răng
	else if @MaHH = 'HH18'
	begin
		set @DVLe = N'cái'
	end
	--Lược
	else if @MaHH = 'HH19'
	begin
		set @DVLe = N'cái'
	end
	--Dép
	else if @MaHH = 'HH20'
	begin
		set @DVLe = N'đôi'
	end
	--Cốc thủy tinh
	else if @MaHH = 'HH21'
	begin
		set @DVLe = 'cái'
	end
	return @DVLe
end
go
select dbo.fnDVLe('HH01')
go
-------------------------------------------------------------------------------------
create or alter proc insertHDNhap (@manv varchar(10), @ret bit out)
as
begin
	declare @count int =(select count(*) from nhanvien where manv = @manv)
	declare @mahdnhap varchar(10) = (select dbo.fnNewMaMoiHDN())
	declare @tgian datetime = GETDATE()
	if @count=0
	begin
		set @ret = 0
		return
	end
	else
	begin
		insert into HOADONNHAP
		values (@mahdnhap, @tgian, 0, @manv)
		set @ret = 1
	end
end
-------------------------------------------------------------------------------------
create or alter proc spSuaHDNhap (@mahdnhap char(7), @manv char(4), @ret bit out)
as
begin
	update HOADONNHAP
	set MaNV=@manv
	where mahdnhap = @mahdnhap
	if @@ROWCOUNT<=0
	begin
		set @ret=0
	end
	else
	begin
		set @ret=1
	end
end
-------------------------------------------------------------------------------------
