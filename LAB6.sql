create trigger trg_insertNhanVien on NhanVien
for insert 
as 
	if (select luong from inserted) < 15000
		begin 
			print 'Luong phai lon hon 15000'
			rollback transaction
		end

insert into NHANVIEN
values('Nguyen', 'Ngoc Bang', 'Trinh', '021', '2020-12-12','Cu Chi', 'Nu', 14999, '004',1)





create trigger trg_insertNhanVien2 on NhanVien
for insert
as
	declare @age int
	set @age = year(getdate()) - (select year(NGSINH) from inserted)
	if (@age < 18 or @age > 65)
		begin 
			print 'Tuoi khong hop le'
			rollback transaction
		end
insert into NHANVIEN
values('Nguyen', 'Ngoc Bang', 'Trinh', '021', '1960-12-12','Cu Chi', 'Nu', 15000, '004',1)





create trigger trg_UpdateNhanVien on NhanVien
for update
as
	if (select DCHI from inserted) like '%HCM%'
		begin
			print 'Dia chi khong hop le'
			rollback transaction
		end

update NHANVIEN set TENNV = 'NamNV' where MANV = '001'




create trigger trg_insertNhanVien2a on NHANVIEN
after insert
as 
begin
	select count(case when upper(Phai)= 'Nam' then 1 end) Nam,
		count(case when upper(Phai)= N'Nu' then 1 end ) Nữ
		from NHANVIEN
end

insert into NHANVIEN 
values(N'Nguyễn', N'Ngọc Băng', N'Trinh', '019', '1968-01-26','Cu Chi', N'Nữ', 15000, '004',1)




create trigger trg_updateNhanVien2b on NHANVIEN
after update
as
begin
	if update(Phai)
		begin
			select count(case when upper(Phai) = 'Nam' then 1 end) Nam,
				count(case when upper(Phai)	= N'Nữ' then 1 end) Nữ
			from NHANVIEN
		end
end
update NHANVIEN set PHAI ='Nam' where MANV = ''





create trigger trg_updateNhanVien2c on NHANVIEN
after update
as
begin
	select MA_NVIEN, count(MADA) as 'So luong' from PHANCONG
	group by MA_NVIEN
end

delete PHANCONG where MA_NVIEN = '000'




create trigger deleteNhanVien3a on NHANVIEN
instead of delete
as begin
		delete from THANNHAN where MA_NVIEN in (select MANV from deleted)
		delete from NHANVIEn where MANV in (select MANV from deleted)
end 
delete NHANVIEN where MANA = '001'

