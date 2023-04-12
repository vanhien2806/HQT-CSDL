go
use QLBanHang
go

--Cau1--
go
CREATE FUNCTION Lab6_C1(@ten AS NVARCHAR(50))
RETURNS TABLE
AS
RETURN
    SELECT sp.masp, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota, hsx.tenhang
    FROM Sanpham sp
    INNER JOIN Hangsx hsx ON sp.mahangsx = hsx.mahangsx
    WHERE sp.tensp LIKE '%' + @ten + '%'
go
GO
SELECT * FROM Lab6_C1('Galaxy Note 11')
GO

--cau2--
go
CREATE FUNCTION Lab6_C2(@x DATE, @y DATE)
RETURNS TABLE
AS
RETURN 
    SELECT sp.masp, sp.tensp, hsx.tenhang, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota
    FROM Nhap n
    JOIN Sanpham sp ON n.masp = sp.masp
    JOIN Hangsx hsx ON sp.mahangsx = hsx.mahangsx
    WHERE n.ngaynhap BETWEEN @x AND @y
go
GO
SELECT * FROM Lab6_C2('2018-01-01', '2020-12-31')
GO

--cau3--
go
CREATE FUNCTION Lab6_C3 (@hangsx nvarchar(50), @luachon int)
RETURNS TABLE
AS
RETURN
    SELECT sp.masp, sp.tensp, hsx.tenhang, sp.soluong, sp.giaban, sp.donvitinh, sp.mota
    FROM Sanpham sp
    JOIN Hangsx hsx ON sp.mahangsx = hsx.mahangsx
    WHERE hsx.tenhang = @hangsx AND ((@luachon = 0 AND sp.soluong = 0) OR (@luachon = 1 AND sp.soluong > 0))
go
go
SELECT * FROM Lab6_C3('Oppo', 1)
go

--cau4--
go
CREATE FUNCTION Lab6_C4(@tenphong NVARCHAR(50))
RETURNS TABLE
AS
RETURN
    SELECT *
    FROM Nhanvien
    WHERE phong = @tenPhong
go
go
SELECT * FROM Lab6_C4(N'Kế toán')
go

--cau5--
go
CREATE FUNCTION Lab6_C5(@address NVARCHAR(100))
RETURNS TABLE
AS
RETURN
SELECT *
FROM Hangsx
WHERE diachi LIKE '%' + @address + '%'
go
go
SELECT * FROM Lab6_C5(N'Vi')
go

--cau6--
go
CREATE FUNCTION Lab6_C6(@x INT, @y INT)
RETURNS TABLE
AS
RETURN
    SELECT sp.masp, sp.tensp, hsx.tenhang, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota, xuat.ngayxuat
    FROM Sanpham sp
    INNER JOIN Hangsx hsx ON sp.mahangsx = hsx.mahangsx
    INNER JOIN Xuat xuat ON sp.masp = xuat.masp
    WHERE YEAR(xuat.ngayxuat) BETWEEN @x AND @y;
go
go
SELECT * FROM Lab6_C6(2018,2020)
go

--cau7--
go
CREATE FUNCTION Lab6_C7 
(
    @manufacturer_name NVARCHAR(50),
    @option INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT sp.Masp, sp.Tensp, sp.Mausac, sp.Giaban, sp.Donvitinh, sp.Mota
    FROM Sanpham sp
    INNER JOIN Hangsx hs ON sp.Mahangsx = hs.Mahangsx
    LEFT JOIN Nhap n ON sp.Masp = n.Masp
    LEFT JOIN Xuat x ON sp.Masp = x.Masp
    WHERE hs.Tenhang = @manufacturer_name AND
    (
        (@option = 0 AND n.Sohdn IS NOT NULL) OR
        (@option = 1 AND x.Sohdx IS NOT NULL)
    )
	)
go
go
SELECT * FROM Lab6_C7('Samsung',0)
go

--cau 8--
go
CREATE FUNCTION Lab6_C8
(
    @ngayNhap DATE
)
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        nv.manv, 
        nv.tennv, 
        nv.gioitinh, 
        nv.diachi, 
        nv.sodt, 
        nv.email, 
        nv.phong
    FROM 
        Nhanvien nv 
        JOIN Nhap n ON nv.manv = n.manv
    WHERE 
        n.ngaynhap = @ngayNhap
)
go
go
SELECT * FROM Lab6_C8('04-07-2020')
go

--cau 9--
go
CREATE FUNCTION Lab6_C9
(
    @minPrice FLOAT,
    @maxPrice FLOAT,
    @mahangsx VARCHAR(50)
)
RETURNS @products TABLE
(
    masp VARCHAR(10),
    mahangsx VARCHAR(10),
    tensp NVARCHAR(50),
    soluong INT,
    mausac NVARCHAR(50),
    giaban FLOAT,
    donvitinh NVARCHAR(20),
    mota NVARCHAR(MAX)
)
AS
BEGIN
    INSERT INTO @products
    SELECT s.masp, s.mahangsx, s.tensp, s.soluong, s.mausac, s.giaban, s.donvitinh, s.mota
    FROM Sanpham s
    INNER JOIN Hangsx h ON s.mahangsx = h.mahangsx
    WHERE s.giaban >= @minPrice AND s.giaban <= @maxPrice AND h.tenhang = @mahangsx
    RETURN
END
go
go
SELECT * FROM Lab6_C9(1,1000000000,'Samsung')
go

--cau10--
go
CREATE FUNCTION Lab6_C_10
(
)
RETURNS TABLE
AS
RETURN
(
    SELECT sp.Masp, sp.Tensp, sp.Mausac, sp.Giaban, sp.Donvitinh, sp.Mota, hs.Tenhang
    FROM Sanpham sp
    INNER JOIN Hangsx hs ON sp.Mahangsx = hs.Mahangsx
)
go

go
SELECT * FROM Lab6_C_10()
go