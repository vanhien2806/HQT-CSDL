-- 1.Hi?n th? th�ng tin c�c b?ng d? li?u tr�n.
SELECT * FROM Sanpham;

SELECT * FROM Hangsx;

SELECT * FROM Nhanvien;

SELECT * FROM Nhap;

SELECT * FROM Xuat;
-- 2.??a ra th�ng tin masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota c?a c�c s?n ph?m s?p x?p theo chi?u gi?m d?n gi� b�n.
GO
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
ORDER BY Sanpham.giaban DESC;
GO
-- 3.??a ra th�ng tin c�c s?n ph?m c� trong c?a h�ng do c�ng ty c� t�n h�ng l� Samsung s?n xu?t.
GO
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
GO
-- 4.??a ra th�ng tin c�c nh�n vi�n N? ? trong ph�ng "K? to�n".
GO
SELECT * FROM nhanvien
WHERE gioitinh = 'N?' AND phong = 'K? to�n'
GO
/* 5.??a ra th�ng tin phi?u nh?p g?m: sohdn, masp, tensp, tenhang, soluongN, dongian, tiennhap, soluongN, 
dongiaN, mausac, donvitinh, ngaynhap, tennv, phong. S?p x?p theo chi?u t?ng d?n c?a h�a ??n nh?p.*/
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Nhap.sohdn ASC;
/* 6.??a ra th�ng tin phi?u xu?t g?m: sohdx, masp, tensp, tenhang, soluongX, giaban,tienxuat = soluongX*giaban, mausac, donvitinh, ngayxuat, 
tennv, phong trong th�ng 10 n?m 2018, s?p x?p theo chi?u t?ng d?n c?a sohdx.*/
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;
-- 7.??a ra c�c th�ng tin v? c�c h�a ??n m� h�ng samsung ?� nh?p trong n?m 2017, g?m: sohdn, masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong.
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
-- 8.??a ra Top 10 h�a ??n xu?t c� s? l??ng xu?t nhi?u nh?t trong n?m 2018, s?p x?p theo chi?u gi?m d?n c?a soluongX. 
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2023' 
ORDER BY Xuat.soluongX DESC;
-- 9.??a ra th�ng tin 10 s?n ph?m c� gi? b?n cao nh?t trong c?a h�ng, theo chi?u gi?m d?n gi� b�n.
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
-- 10.??a ra c�c th�ng tin s?n ph?m c� gia b?n t? 100.000 ??n 500.000 c?a h�ng Samsung.
SELECT *
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000
-- 11.T�nh t?ng ti?n ?� nh?p trong n?m 2018 c?a h�ng samsung. 
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018
-- 12.Th?ng k� t?ng ti?n ?� xu?t trong ng�y 2/9/2018.
	SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'
-- 13.??a ra sohdn, ngaynhap c� ti?n nh?p ph?i tr? cao nh?t trong n?m 2018.
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC
-- 14.??a ra 10 m?t h�ng c� soluongN nhi?u nh?t trong n?m 2019.
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC
-- 15.??a ra masp,tensp c?a c�c s?n ph?m do c�ng ty 'Samsung' s?n xu?t do nh�n vi�n c� m� 'NV01' nh?p.
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
-- 16.??a ra sohda, masp, soluongN, ngayN c?a m?t h�ng c� masp l� 'SPO2', ???c nh�n vi�n 'NVG2' xu?t.
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'
-- 17.??a ra manv, tennv, ?� xu?t m?t h�ng c� m� 'SPO2' ng�y '03-02-2020'.
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;
