use QuanLyDeAn2

alter table PHONGBAN alter column TenPHG nvarchar(30)

alter table DEAN alter column DDiemDA nvarchar(20)

alter table THANNHAN alter column TenTN nvarchar(20)

alter table THANNHAN alter column Phai nvarchar(3)

alter table THANNHAN alter column QuanHe nvarchar(15)

alter table NHANVIEN add SoDienThoai varchar(15)

alter table NHANVIEN drop column SoDienThoai