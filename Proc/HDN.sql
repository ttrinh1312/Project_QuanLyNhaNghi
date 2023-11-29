--Tạo mã
create or alter function fnNewMaMoiHDN()
returns varchar(10)
as
begin
	declare @maht int, @mamoi varchar(10)
	if (select max(Mahdnhap) from hoadonnhap ) is null 
	begin
		set @mamoi='HDN001'
	end 
	else
	begin
	set @maht = (select max(right(MaHDNhap,len(MaHDNhap)-3)) from HOADONNHAP)
	set @mamoi= 'HDN'+REPLICATE('0',(3-len(@maht+1)))+cast((@maht+1) as varchar)
	end
	return @mamoi
end


print dbo.fnNewMaMoiHDN()
select * from hoadonnhap
--Thêm 
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
--SỬA
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
--không xóa dc hóa đơn nhập --vì xuất hóa đơn rồi nên kh xóa được