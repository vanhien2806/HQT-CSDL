USE  QLBanHang;
go
-- 1 Hãy thống kê xem mỗi hãng sản xuất có bao nhiêu loại sản phẩm--
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS SoLuongLoaiSP
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang;
go

go
--2  Hãy thống kê xem tổng tiền nhập của mỗi sản phẩm trong năm 2018--
SELECT Sanpham.tensp, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Sanpham
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Sanpham.tensp;
go

go
--3 Hãy thống kê các sản phẩm có tổng số lượng xuất năm 2018 là lớn hơn 10.000 sản--
--phẩm của hãng samsung.--
SELECT Sanpham.tensp, SUM(Xuat.soluongX) AS TongSoLuongXuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'samsung' AND YEAR(Xuat.ngayxuat) = 2018
GROUP BY Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000;
go

go
--4 Thống kê số lượng nhân viên Nam của mỗi phòng ban.--
SELECT Nhanvien.phong, COUNT(Nhanvien.manv) AS SoLuongNam
FROM Nhanvien
WHERE Nhanvien.gioitinh = 'Nam'
GROUP BY Nhanvien.phong;
go

go
--5Thống kê tổng số lượng nhập của mỗi hãng sản xuất trong năm 2018.--
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) AS TongSoLuongNhap
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Hangsx.tenhang;
go

go
--6 Hãy thống kê xem tổng lượng tiền xuất của mỗi nhân viên trong năm 2018 là bao--
--nhiêu.--
SELECT Nhanvien.tennv, SUM(Sanpham.giaban * Xuat.soluongX) AS TongTienXuat
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = 2018
GROUP BY Nhanvien.tennv;
go

go
--7 Hãy đưa ra tổng tiền nhập của mỗi nhân viên trong tháng 8 – năm 2018 có tổng giá trị--
--lớn hơn 100.000--
SELECT Nhanvien.tennv, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Nhanvien
JOIN Nhap ON Nhanvien.manv = Nhap.manv
WHERE MONTH(Nhap.ngaynhap) = 8 AND YEAR(Nhap.ngaynhap) = 2018
GROUP BY Nhanvien.tennv
HAVING SUM(Nhap.soluongN * Nhap.dongiaN) > 100000;
go

go
--8 Hãy đưa ra danh sách các sản phẩm đã nhập nhưng chưa xuất bao giờ.--
SELECT *
FROM Sanpham
WHERE NOT EXISTS (
    SELECT *
    FROM Xuat
    WHERE Sanpham.masp = Xuat.masp
);
go

go
--9 Hãy đưa ra danh sách các sản phẩm đã nhập năm 2018 và đã xuất năm 2018.--
SELECT DISTINCT Sanpham.*
FROM Sanpham
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Nhap.ngaynhap) = 2018 AND YEAR(Xuat.ngayxuat) = 2018;
go

go
--10 Hãy đưa ra danh sách các nhân viên vừa nhập vừa xuất.--
SELECT DISTINCT Nhanvien.*
FROM Nhanvien
INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv;
go

go
-- 11 Hãy đưa ra danh sách các nhân viên không tham gia việc nhập và xuất.--
	SELECT *
FROM Nhanvien
WHERE Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Nhap)
  AND Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Xuat);

go