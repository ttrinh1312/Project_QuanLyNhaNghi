---TẠO MÃ MỚI
create or alter function taomahdb()
returns varchar(10)
as
begin
	declare @maht int, @mamoi varchar(10)
	if not exists (select 1 from HOADONBAN)
	begin
		set @mamoi = 'HDB001'
	end
	else
	begin
		set @maht = (select max(right(MaHDBan,len(MaHDBan)-3)) from HOADONBAN)
		set @mamoi= 'HDB'+REPLICATE('0',(3-len(@maht+1)))+cast((@maht+1) as varchar)
	end
	return @mamoi
end
--THÊM HÓA ĐƠN BÁN
create or alter proc insertHDB(@makh varchar(10), @maphong varchar(10), @manv varchar(5), @ret int out)
as
begin
	
	--kiểm tra mã kh
	declare @d1 int
	set @d1 = (select count(*) from KHACHHANG where Ma_KH=@makh)
	if @d1=0 
	begin
		set @ret=2
		return
	end
	--kiểm tra phòng có tồn tại hay không
	declare @d2 int
	set @d2 = (select count(*) from PHONG where MaPhong=@maphong)
	if @d2=0 
	begin
		set @ret=3
		return
	end
	--kiểm tra phòng tình trạng
	declare @d3 nvarchar(20)
	set @d3=(select TinhTrangPhong from PHONG where MaPhong=@maphong)
	if @d3!=N'Trống'
	begin
		set @ret=4
		return
	end
	--kiểm nhân viên
	declare @d4 int
	set @d4 = (select count(*) from NHANVIEN where MaNV=@manv)
	if @d4=0 
	begin
		set @ret=5
		return
	end

	--set mã hóa đơn
	declare @mahd varchar(10)
	set @mahd = (select dbo.taomahdb())
	--set thời gian đến
	declare @tgden datetime
	set @tgden=GETDATE()
	--insert
	insert into HOADONBAN
	values (@mahd,@makh,@maphong,@tgden,null,null,null,null,null,@manv)
	update PHONG
	set TinhTrangPhong=N'Đang ở'
	where MaPhong=@maphong
	if @@ROWCOUNT<=0
	begin
		set @ret=6
		return
	end
	else
	begin
		set @ret=7
	end
end
--SỬA HÓA ĐƠN BÁN
create or alter proc spSuaHDBan(@ma_kh varchar(11), @maphong varchar(10), @manv varchar(10), @ret int out)
as
begin
	declare @mahd varchar(10) = (select mahdban from hoadonban where Ma_KH=@ma_kh and ThoiGianDi is null)
	declare @maphongcu varchar(10) = (select maphong from HOADONBAN where MaHDBan=@mahd)
	declare @count int = (select count(*) from hoadonban where Ma_KH=@ma_kh and ThoiGianDi is null and MaPhong=@maphongcu)
	if @count=0
	begin
		set @ret=2
		return
	end
	declare @ttp nvarchar(15) = (select tinhtrangphong from phong where maphong=@maphong)
	if @ttp<>N'Trống'
	begin
		set @ret=3
		return
	end

	update hoadonban 
	set Ma_KH=@ma_kh, Manv=@manv, Maphong=@maphong
	where MaHDBan=@mahd
	update Phong
	set Tinhtrangphong = N'Trống'
	where maphong=@maphongcu
	update Phong
	set Tinhtrangphong = N'Đang ở'
	where maphong=@maphong
	if @@ROWCOUNT <=0
	begin
		set @ret=4
	end
	else
	begin
		set @ret=5
	end
end
--xóa hóa đơn bán  
create or alter proc spXoaMaHDBan(@maphong varchar(10),@ret int out)
as
begin
	declare @mahd varchar(10)
	set @mahd=(select MaHDBan from HOADONBAN where MaPhong=@maphong and ThoiGianDi is null)
	delete from HDBANCHITIET where MaHDBan=@mahd
	delete from HOADONBAN where MaHDBan=@mahd
	update PHONG
	set TinhTrangPhong = N'Trống'
	where MaPhong=@maphong
	if @@ROWCOUNT<=0
	begin
		set @ret=0
		return
	end
	else 
	begin
		set @ret=1
		return
	end
end

