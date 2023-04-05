go
CREATE VIEW Lab_2_C1_san_pham AS
SELECT *
FROM Sanpham;
go

go
Select * from Lab_2_C1_san_pham
go

go 
CREATE VIEW Lab_2_C1_Hang_sx AS
SELECT *
FROM Hangsx;
go
go
Select * from Lab_2_C1_Hang_sx
go

go 
CREATE VIEW Lab_2_C1_Nhan_vien AS
SELECT *
FROM Nhanvien;
go
go
Select * from Lab_2_C1_Nhan_vien
go

go 
CREATE VIEW Lab_2_C1_Nhap AS
SELECT *
FROM Nhap;
go
go
Select * from Lab_2_C1_Nhap
go

go 
CREATE VIEW Lab_2_C1_Xuat AS
SELECT *
FROM Xuat;
go
go
Select * from Lab_2_C1_Xuat
go

go 

CREATE VIEW Lab_2_C2 AS
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
go
go
Select * from Lab_2_C2 ORDER BY Lab_2_C2.giaban DESC;
go

go
CREATE VIEW Lab_2_C3 AS
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, 
Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
go
go
Select * from Lab_2_C3 
go

go
CREATE VIEW Lab_2_C4 AS
SELECT * FROM nhanvien
WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'
go
go
Select * from Lab_2_C4
go

go
CREATE VIEW Lab_2_C5 AS
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, 
Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap,
Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv

go
go
Select * from Lab_2_C5 ORDER BY Lab_2_C5.sohdn ASC;
go

go
CREATE VIEW Lab_2_C6 AS
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018

go
go
Select * from Lab_2_C6 ORDER BY Lab_2_C6.sohdx ASC;
go

go
CREATE VIEW Lab_2_C7 AS
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;

go
go
Select * from Lab_2_C7 
go

go
CREATE VIEW Lab_2_C_8 AS
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2018' 
ORDER BY Xuat.soluongX DESC;

go
go
Select * from Lab_2_C_8 ORDER BY Lab_2_C_8.soluongX DESC
go

go
CREATE VIEW Lab_2_C9 AS
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;

go
go
Select * from Lab_2_C9 ORDER BY Lab_2_C9.giaBan DESC
go

go
CREATE VIEW Lab_2_C_10 AS
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000

go
go
Select * from Lab_2_C_10 
go

go
CREATE VIEW Lab_2_C_11 AS
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018

go
go
Select * from Lab_2_C_11 
go

go
CREATE VIEW Lab_2_C_12 AS
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'

go
go
Select * from Lab_2_C_12 
go

go
CREATE VIEW Lab_2_C_13 AS
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC

go
go
Select * from Lab_2_C_13 
go

go
CREATE VIEW Lab_2_C_14 AS
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC

go
go
Select * from Lab_2_C_14 
go

go
CREATE VIEW Lab_2_C_15 AS
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';

go
go
Select * from Lab_2_C_15
go

go
CREATE VIEW Lab_2_C_16 AS
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'

go
go
Select * from Lab_2_C_16
go

go
CREATE VIEW Lab_2_C_17 AS
SELECT Nhanvien.manv, Nhanvien.tennv
FROM Nhanvien
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-03-02'

go
go
Select * from Lab_2_C_17
go

go
CREATE VIEW Lab_3_C_1 AS
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS SoLuongLoaiSP
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang;

go
go
Select * from Lab_3_C_1
go

go
CREATE VIEW Lab_3_C_2 AS
SELECT Sanpham.tensp, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Sanpham
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Sanpham.tensp;

go
go
Select * from Lab_3_C_2
go

go
CREATE VIEW Lab_3_C_3 AS
SELECT Sanpham.tensp, SUM(Xuat.soluongX) AS TongSoLuongXuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'samsung' AND YEAR(Xuat.ngayxuat) = 2018
GROUP BY Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000

go
go
Select * from Lab_3_C_3
go

go
CREATE VIEW Lab_3_C_4 AS
SELECT Nhanvien.phong, COUNT(Nhanvien.manv) AS SoLuongNam
FROM Nhanvien
WHERE Nhanvien.gioitinh = 'Nam'
GROUP BY Nhanvien.phong;

go
go
Select * from Lab_3_C_4
go

go
CREATE VIEW Lab_3_C_5 AS
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) AS TongSoLuongNhap
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Hangsx.tenhang;

go
go
Select * from Lab_3_C_5
go

go
CREATE VIEW Lab_3_C_6 AS
SELECT Nhanvien.tennv, SUM(Sanpham.giaban * Xuat.soluongX) AS TongTienXuat
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = 2018
GROUP BY Nhanvien.tennv;

go
go
Select * from Lab_3_C_6
go

go
CREATE VIEW Lab_3_C_7 AS
SELECT Nhanvien.tennv, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Nhanvien
JOIN Nhap ON Nhanvien.manv = Nhap.manv
WHERE MONTH(Nhap.ngaynhap) = 8 AND YEAR(Nhap.ngaynhap) = 2018
GROUP BY Nhanvien.tennv
HAVING SUM(Nhap.soluongN * Nhap.dongiaN) > 100000;

go
go
Select * from Lab_3_C_7
go

go
CREATE VIEW Lab_3_C_8 AS
SELECT *
FROM Sanpham
WHERE NOT EXISTS (
    SELECT *
    FROM Xuat
    WHERE Sanpham.masp = Xuat.masp
);

go
go
Select * from Lab_3_C_8
go

go
CREATE VIEW Lab_3_C_9 AS
SELECT DISTINCT Sanpham.*
FROM Sanpham
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Nhap.ngaynhap) = 2018 AND YEAR(Xuat.ngayxuat) = 2018;

go
go
Select * from Lab_3_C_9
go

go
CREATE VIEW Lab_3_C_10 AS
SELECT DISTINCT Nhanvien.*
FROM Nhanvien
INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv;

go
go
Select * from Lab_3_C_10
go

go
CREATE VIEW Lab_3_C_11 AS
	SELECT *
FROM Nhanvien
WHERE Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Nhap)
  AND Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Xuat);
go
go
Select * from Lab_3_C_11
go