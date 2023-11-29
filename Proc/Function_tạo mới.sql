--Tạo mã hàng
create or alter function fMaHang()
returns varchar(4) 
as
begin
	declare @mahang varchar(4), @ma int
	if not exists (select 1 from Hang)
	begin
		set @mahang = 'HH01'
	end
	else
	begin
		set @ma = (select max(right(MaHang,2))+1 from Hang)
		set @mahang = 'HH'+cast(@ma as varchar(2))
	end
    return  @mahang
end

--Insert dữ liệu vào bảng hàng biết Tên hàng, ĐVTính, Giá bán
create or alter proc spHang(@Ten nvarchar(50), @DonViTinh nvarchar(20),@GiaBan int, @ret bit out)
as
begin
	declare @ma varchar(5) = (select dbo.fMaHang())
	insert into HANG
	values (@ma, @Ten,0, @DonViTinh, @GiaBan)
	set @ret=1 --nhap thanh cong
end

-- Mã nhân viên mới
create or alter function fMaNhanVien()
returns varchar(4) 
as
begin
	declare @manhanvien varchar(4), @ma numeric(2,0)
	if not exists (select 1 from NHANVIEN)
	begin
		set @manhanvien = 'NV01'
	end
	else
	begin
		set @ma = (select max(right(MaNV,2))+1 from NhanVien)
		set @manhanvien = 'NV'+replicate('0',2-len(@ma))+cast(@ma as varchar(2))
	end
    return @manhanvien
end
-- Insert dữ liệu nhân viên biêt Tên NV, SDT, Chức vụ
create proc spNhanVien(@Ten nvarchar(50), @SDT varchar(11), @ChucVu nvarchar(20), @ret bit out)
as
begin
	declare @ma varchar(10) = (select dbo.fMaNhanVien())
	insert into NHANVIEN
	values (@ma, @Ten, @SDT, @ChucVu)
	set @ret=1 --nhap thanh cong
end


-- Tạo mã khách hàng mới
create or alter function fMaKhachHang()
returns varchar(5) 
as
begin
	declare @makhachhang varchar(5), @ma int
	if not exists (select 1 from KHACHHANG)
	begin
		set @makhachhang = 'KH001'
	end
	else
	begin
		set @ma = (select max(right(Ma_KH,2))+1 from KhachHang)
		set @makhachhang = 'KH'+replicate('0',3-len(@ma))+cast(@ma as varchar(3))
	end
    return @makhachhang
end

create proc spKhachHang(@Ten nvarchar(50), @DiaChi nvarchar(50), @stk varchar(20), @ret bit out)
as
begin
	declare @ma varchar(10) = (select dbo.fMaKhachHang())
	insert into KHACHHANG
	values (@ma, @Ten, @DiaChi, @stk)
	set @ret=1 --nhap thanh cong
end