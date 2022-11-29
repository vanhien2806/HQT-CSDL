--Bai 1
--In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của
--bạn.
create procedure sp_XuatTen
@ten nvarchar (20)
as
begin
print N'Xin Chào ' + @ten;
end
go
exec sp_XuatTen N'đèo'

--Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.
create proc  sp_sum
@s1 int, @s2 int
as
begin
declare @tg int;

set @tg = @s1 + @s2;
print N'tổng' + cast (@tg as varchar);
end;
exec sp_sum 5,6;
--Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.
create proc sp_tongchan
@n int 
as
begin
declare @tong int, @dem int
	set @tong = 0 
	set @dem =1
while @dem<@n
begin
	if (@dem%2=0)
		begin
			set @tong=@tong+@dem
				end
			set @dem+=1
		end
			print(N'Tổng số chẳn là: ' +cast( @tong  as  varchar))
	end
	exec sp_tongchan 10;

 --Nhập vào 2 số. In ra ước chung lớn nhất
 create proc UCLN
(@a int, @b int)
as

while (@a!=@b)
if (@a>@b)set @a=@a-@b
else set @b=@b-@a
print N'UCLN là '+cast(@a as varchar(10))
exec UCLN 8,20

--Bai 2
--Nh?p vào @Manv, xu?t thông tin các nhân viên theo @Manv.
 create proc Bai2_1
  @MaNV varchar(3) 
  as
  begin
	select * 
	from NHANVIEN
	where MANV = @MaNV
  end

exec Bai2_1 '003'
--Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó
select * from NHANVIEN
select * from DEAN
select COUNT (MANV),MADA,TENPHG FROM PHONGBAN
INNER JOIN DEAN ON DEAN.PHONG=PHONGBAN.MAPHG
INNER JOIN NHANVIEN ON NHANVIEN.PHG = PHONGBAN.MAPHG
GROUP BY MADA,TENPHG
HAVING MADA=10
--Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên tham
--gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA
select * from NHANVIEN
select * from PHONGBAN
select * from THANNHAN
select * from NHANVIEN
INNER JOIN PHONGBAN ON PHONGBAN.MAPHG=NHANVIEN.PHG
left outer join THANNHAN on THANNHAN.MA_NVIEN = NHANVIEN.MANV
where THANNHAN.MA_NVIEN is null and TRPHG='008'

--Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là
--@Trphg và các nhân viên này không có thân nhân.
create proc Bai2_4 
	@MaTP varchar(5)
as
begin
	select HONV, TENNV, TENPHG, NHANVIEN.MANV, THANNHAN.*
	from NHANVIEN inner join PHONGBAN on PHONGBAN.MAPHG = NHANVIEN.PHG
				  left outer join THANNHAN on THANNHAN.MA_NVIEN = NHANVIEN.MANV
	where THANNHAN.MA_NVIEN is null and TRPHG = @MaTP
end

exec Bai2_4 '008'

--Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có
--mã @Mapb hay không
create proc Bai2_5
	@MaNV varchar(5), @MaPB varchar(5)
as
begin
	if exists(select * from NHANVIEN where MANV = @MaNV and PHG = @MaPB)
		print 'Nhan Vien: ' + @MaNV+' co trong phong ban: ' + @MaPB
	else
		print 'Nhan Vien: ' + @MaNV+' khong co trong phong ban ' + @MaPB
end

exec Bai2_5 '004 ','1'

--Bai 3
--Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng
--tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.
update PHONGBAN set TENPHG = 'IT', TRPHG = '008', NG_NHANCHUC = '2020-12-12'
where MAPHG = '7'
CREATE PROC sp_InsertPB
	@MaPB int, @TenPB nvarchar(15),
	@MaTP nvarchar(9), @NgayNhanChuc date
AS
BEGIN
	if(exists(select * from PHONGBAN where MAPHG = @MaPB ))
		print 'Them that bai'
	else 
		begin
			insert into PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
			values(@MaPB, @TenPB,@MaTP,@NgayNhanChuc)
			print 'Them thanh cong'
		end
END

exec sp_InsertPB '8', 'CNTT', '008', '2020-10-06'

--Cập nhật phòng ban có tên CNTT thành phòng IT.

CREATE PROC sp_UpdatePB
	@MaPB int, @TenPB nvarchar(15),
	@MaTP nvarchar(9), @NgayNhanChuc date
AS
BEGIN
	if(exists(select * from PHONGBAN where MAPHG = @MaPB ))
		update PHONGBAN set TENPHG = @TenPB, TRPHG = @MaTP, NG_NHANCHUC = @NgayNhanChuc
		where MAPHG = @MaPB
	else 
		begin
			insert into PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
			values(@MaPB, @TenPB,@MaTP,@NgayNhanChuc)
			print 'Them thanh cong'
		end
END

exec sp_UpdatePB '8', 'IT', '008', '2020-10-06'

--Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu
--vào với điều kien
-- o nhân viên này trực thuộc phòng IT
-- o Nhận @luong làm tham số đầu vào cho cột Luong, nếu @luong<25000 thì nhân
--viên này do nhân viên có mã 009 quản lý, ngươc lại do nhân viên có mã 005 quản
--lý
--o Nếu là nhân viên nam thi nhân viên phải nằm trong độ tuổi 18-65, nếu là nhân
viên nữ thì độ tuổi phải từ 18-60.
create proc sp_InsertNhanVien
	@HONV nvarchar(15), @TENLOT nvarchar(15), @TENNV nvarchar(15),
	@MANV nvarchar(6), @NGSINH date, @DCHI nvarchar(50), @PHAI nvarchar(3),
	@LUONG float, @MA_NQL nvarchar(3) = null, @PHG int
as
begin
	declare @age int 
	set @age = YEAR(GETDATE()) - YEAR (@NGSINH)
	if @PHG = (select MAPHG from PHONGBAN where TENPHG = 'IT')
		begin
			if @LUONG < 25000
				set @MA_NQL = '009'
			else set @MA_NQL = '005'

			if (@PHAI = 'Nam' and (@age >= 18 and @age <= 65))
				or (@PHAI = 'Nu' and (@age >= 18 and @age <= 60))
				begin
					insert into NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
					values (@HONV, @TENLOT, @TENNV, @MANV, @NGSINH, @DCHI, @PHAI, @LUONG, @MA_NQL, @PHG)
				end
			else 
				print 'Khong thuoc do tuoi lao dong'
		end
	else 
		print 'Khong phai Phong Ban IT'
end

exec sp_InsertNhanVien 'Nguyen', 'Van', 'Nam', '008', '2020-06-10', 'Da Nang', 'Nam', '25000', '004', '8'
exec sp_InsertNhanVien 'Nguyen', 'Van', 'Nam', '006', '2020-06-10', 'Da Nang', 'Nam', '25000', '004', '8'
exec sp_InsertNhanVien 'Nguyen', 'Van', 'Nu', '005', '1954-06-10', 'Da Nang', 'Nam', '25000', '004', '8'
