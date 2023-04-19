go
----Cau 1a---------
INSERT INTO NhanVien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV08', 'Nguyen Van A', 'Nam', 'Ha Noi', '0918236771', 'nva@example.com', N'Kế toán')
----Thực hiện full back up
BACKUP DATABASE [QLBanHang] TO DISK = 'C:\Users\Admin\Documents\SQL Server Management Studio.bak' WITH INIT
go

go
----Cau 1b---------
go
INSERT INTO NhanVien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV09', 'Nguyen Van B', 'Nam', 'TP HCM', '07412938102', 'nvb@example.com', N'Kế toán')
----Thực hiện different backup
BACKUP DATABASE [QLBanHang] TO DISK = 'C:\Users\Admin\Documents\SQL Server Management Studio\different backup.bak' WITH INIT
go

go
----Cau 1c---------
INSERT INTO NhanVien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV17', 'Nguyen Van C', 'Nam', 'Ha Noi', '0912334321', 'nvc@example.com', N'Kế toán')
----Thực hiện BACKUP LOG
BACKUP LOG [QLBanHang] TO DISK = 'C:\Users\Admin\Documents\SQL Server Management Studio.trn' WITH  FORMAT;
go

go
----Cau 1d---------
INSERT INTO NhanVien (manv, tennv,  gioitinh, diachi, sodt, email, phong)
VALUES ('NV19', 'Nguyen Van D', 'Nam', 'TP HCM', '0912367811', 'nvd@example.com', N'Kế toán')
----Thực hiện BACKUP LOG
BACKUP LOG [QLBanHang] TO DISK = 'C:\Users\Admin\Documents\SQL Server Management Studio.trn' WITH  NOINIT;
go

go
----Cau 2---------
DROP DATABASE QLBanHang;

RESTORE DATABASE QLBanHang
FROM DISK = 'C:\Users\Admin\Documents\SQL Server Management Studio\QLBanHang.bak'
WITH STANDBY = 'C:\Users\Admin\Documents\SQL Server Management Studio.undo'
go