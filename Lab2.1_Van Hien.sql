-- 1.Hi?n th? thông tin các b?ng d? li?u trên.
SELECT * FROM Sanpham;

SELECT * FROM Hangsx;

SELECT * FROM Nhanvien;

SELECT * FROM Nhap;

SELECT * FROM Xuat;
-- 2.??a ra thông tin masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota c?a các s?n ph?m s?p x?p theo chi?u gi?m d?n giá bán.
GO
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
ORDER BY Sanpham.giaban DESC;
GO
-- 3.??a ra thông tin các s?n ph?m có trong c?a hàng do công ty có tên hãng là Samsung s?n xu?t.
GO
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
GO
-- 4.??a ra thông tin các nhân viên N? ? trong phòng "K? toán".
GO
SELECT * FROM nhanvien
WHERE gioitinh = 'N?' AND phong = 'K? toán'
GO
/* 5.??a ra thông tin phi?u nh?p g?m: sohdn, masp, tensp, tenhang, soluongN, dongian, tiennhap, soluongN, 
dongiaN, mausac, donvitinh, ngaynhap, tennv, phong. S?p x?p theo chi?u t?ng d?n c?a hóa ??n nh?p.*/
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Nhap.sohdn ASC;
/* 6.??a ra thông tin phi?u xu?t g?m: sohdx, masp, tensp, tenhang, soluongX, giaban,tienxuat = soluongX*giaban, mausac, donvitinh, ngayxuat, 
tennv, phong trong tháng 10 n?m 2018, s?p x?p theo chi?u t?ng d?n c?a sohdx.*/
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;
-- 7.??a ra các thông tin v? các hóa ??n mà hãng samsung ?ã nh?p trong n?m 2017, g?m: sohdn, masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong.
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
-- 8.??a ra Top 10 hóa ??n xu?t có s? l??ng xu?t nhi?u nh?t trong n?m 2018, s?p x?p theo chi?u gi?m d?n c?a soluongX. 
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2023' 
ORDER BY Xuat.soluongX DESC;
-- 9.??a ra thông tin 10 s?n ph?m có gi? b?n cao nh?t trong c?a hàng, theo chi?u gi?m d?n giá bán.
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
-- 10.??a ra các thông tin s?n ph?m có gia b?n t? 100.000 ??n 500.000 c?a hãng Samsung.
SELECT *
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000
-- 11.Tính t?ng ti?n ?ã nh?p trong n?m 2018 c?a hãng samsung. 
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018
-- 12.Th?ng kê t?ng ti?n ?ã xu?t trong ngày 2/9/2018.
	SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'
-- 13.??a ra sohdn, ngaynhap có ti?n nh?p ph?i tr? cao nh?t trong n?m 2018.
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC
-- 14.??a ra 10 m?t hàng có soluongN nhi?u nh?t trong n?m 2019.
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC
-- 15.??a ra masp,tensp c?a các s?n ph?m do công ty 'Samsung' s?n xu?t do nhân viên có mã 'NV01' nh?p.
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
-- 16.??a ra sohda, masp, soluongN, ngayN c?a m?t hàng có masp là 'SPO2', ???c nhân viên 'NVG2' xu?t.
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'
-- 17.??a ra manv, tennv, ?ã xu?t m?t hàng có mã 'SPO2' ngày '03-02-2020'.
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;
