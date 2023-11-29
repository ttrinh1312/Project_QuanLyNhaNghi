--THÊM
create or alter proc InsertHDBCT(@maphong varchar(10), @mahang varchar(10), @sl int, @ret int out)
as
begin
	-- kiểm tra mã phòng có tồn tại không
	declare @d1 int
	set @d1=(select count(*) from HOADONBAN where MaPhong=@maphong and ThoiGianDi is null)
	if @d1=0
	begin
		set @ret=1
		return
	end
	--lấy cái mã hóa đơn của phòng
	declare @mahd varchar(10)
	set @mahd=(select MaHDBan from HOADONBAN where MaPhong=@maphong and ThoiGianDi is null)
	-- kiểm tra mã hàng có tồn tại không
	declare @d2 int
	set @d2=(select count(*) from HANG where Mahang=@mahang)
	if @d2=0
	begin
		set @ret=2
		return
	end
	--kiểm tra xem còn hàng hay không 
	declare @d3 int
	set @d3=(select SoLuong from HANG where MaHang=@mahang)
	if @d3=0 
	begin
		set @ret=3
		return
	end
	-- kiểm tra số lượng lớn hơn 0 và nhỏ hơn số lượng
	if @sl<=0 or @sl>@d3
	begin
		set @ret=4
		return
	end
	--set đơn giá
	declare @dongia int
	set @dongia = (select GiaBan from HANG where Mahang=@mahang)
	--set đơn vị tính
	declare @dvt nvarchar(10)
	set @dvt= (select DonViTinh from HANG where Mahang=@mahang )
	--tính tiền
	declare @thanhtien int
	set @thanhtien=@dongia*@sl
	if (select count(*) from HDBANCHITIET where MaHang=@mahang and MaHDBan=@mahd) > 0
	begin 
		update HDBANCHITIET
		set SoLuong=SoLuong+@sl
		where MaHang=@mahang
		update HDBANCHITIET
		set Thanhtien=SoLuong*Dongia
		where MaHang=@mahang
	end
	else
	begin
		insert into HDBANCHITIET
		values (@mahd,@mahang,@sl,@dvt,@dongia,@thanhtien)
	end
	---update nè 
	update HOADONBAN
	set TienHang=(select SUM(Thanhtien) from HDBANCHITIET where MaHDBan=@mahd group by MaHDBan)
	where MaHDBan=@mahd
	update HANG
	set SoLuong=SoLuong-@sl
	where MaHang=@mahang
	if @@ROWCOUNT<=0
	begin
		set @ret=5
		return
	end
end
go
--SỬA 
create or alter proc spSuaHDBanChiTiet(@maphong varchar(10),@mahang varchar(4),@sl int, @ret int out)
as
begin
	declare @mahd varchar(10)
	set @mahd=(select MaHDBan from HOADONBAN where MaPhong=@maphong and ThoiGianDi is null)
	update HDBANCHITIET
	set SoLuong=@sl
	where MaHang=@mahang
	update HDBANCHITIET
	set ThanhTien=SoLuong * DonGia
	update HOADONBAN
	set TienHang=(select SUM(Thanhtien) from HDBANCHITIET where MaHDBan=@mahd group by MaHDBan)
	where MaHDBan=@mahd
	update HANG
	set SoLuong=SoLuong-@sl
	where MaHang=@mahang
	if @@ROWCOUNT<=0
	begin
		set @ret=0
		return
	end
end

--test 
declare @maphong varchar(10), @mahang varchar(10), @sl int, @ret int
select @maphong='A305',@mahang='HH02',@sl=2
exec spSuaHDBanChiTiet @maphong, @mahang,@sl,@ret out
print @ret
select * from HOADONBAN
select * from hdbanchitiet
select * from HANG
go
--XÓA
create or alter proc spXoaHDBanChiTiet(@maphong varchar(10),@mahang varchar(4), @ret int out)
as
begin
	declare @mahd varchar(10)
	set @mahd=(select MaHDBan from HOADONBAN where MaPhong=@maphong and ThoiGianDi is null)
	declare @slcu int = (select Soluong from HDBanChitiet where MaHang=@mahang)
	update HANG
	set SoLuong=SoLuong+@slcu
	where MaHang=@mahang
	delete from hdbanchitiet
	update HOADONBAN
	set TienHang=(select SUM(Thanhtien) from HDBANCHITIET where MaHDBan=@mahd group by MaHDBan)
	where MaHDBan=@mahd
	if @@ROWCOUNT<=0
	begin
		set @ret=0
		return
	end
end

------------------------------------
