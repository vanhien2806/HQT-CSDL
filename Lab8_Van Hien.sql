USE QLBanHang

---Câu 1---
GO
CREATE PROCEDURE sp_ThemMoiNhanVien
    @manv INT,
    @tennv NVARCHAR(50),
    @gioitinh NVARCHAR(10),
    @diachi NVARCHAR(100),
    @sodt VARCHAR(20),
    @email VARCHAR(50),
    @phong NVARCHAR(50),
    @Flag INT
AS
BEGIN
    SET NOCOUNT ON;
    
    --Ki?m tra gi?i tính
    IF @gioitinh NOT IN ('Nam', 'N?')
    BEGIN
        RETURN 1;
    END
    
    --Ki?m tra Flag ?? xác ??nh là thêm m?i hay c?p nh?t thông tin nhân viên
    IF @Flag = 0 
    BEGIN
        INSERT INTO Nhanvien(manv, tennv, gioitinh, diachi, sodt, email, phong)
        VALUES(@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong);
    END
    ELSE
    BEGIN
        UPDATE Nhanvien
        SET tennv = @tennv,
            gioitinh = @gioitinh,
            diachi = @diachi,
            sodt = @sodt,
            email = @email,
            phong = @phong
        WHERE manv = @manv;
    END
    
    RETURN 0;
END

---Câu 2---
GO
CREATE PROCEDURE ThemMoiSanPham @masp int, @tenhang varchar(50), @tensp varchar(50), @soluong int, @mausac varchar(20), @giaban float, @donvitinh varchar(20), @mota varchar(100), @Flag int
AS
BEGIN
    SET NOCOUNT ON;

    -- Ki?m tra tên hãng s?n xu?t
    IF NOT EXISTS(SELECT * FROM Hangsx WHERE tenhang = @tenhang)
    BEGIN
        SELECT 1 AS 'MaLoi', 'Không tìm th?y tên hãng s?n xu?t' AS 'MoTaLoi'
        RETURN
    END

    -- Ki?m tra s? l??ng s?n ph?m
    IF @soluong < 0
    BEGIN
        SELECT 2 AS 'MaLoi', 'S? l??ng s?n ph?m ph?i l?n h?n ho?c b?ng 0' AS 'MoTaLoi'
        RETURN
    END

    -- N?u là ch? ?? thêm m?i s?n ph?m
    IF @Flag = 0
    BEGIN
        INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
        VALUES (@masp, (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhang), @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)

        SELECT 0 AS 'MaLoi', 'Thêm m?i s?n ph?m thành công' AS 'MoTaLoi'
    END
    ELSE -- N?u là ch? ?? c?p nh?t s?n ph?m
    BEGIN
        UPDATE Sanpham
        SET mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhang), 
            tensp = @tensp, 
            soluong = @soluong, 
            mausac = @mausac, 
            giaban = @giaban, 
            donvitinh = @donvitinh, 
            mota = @mota
        WHERE masp = @masp

        SELECT 0 AS 'MaLoi', 'C?p nh?t s?n ph?m thành công' AS 'MoTaLoi'
    END
END

---Câu 3---
GO
CREATE PROCEDURE XoaNhanVien 
    @manv int
AS
BEGIN
    -- Ki?m tra xem manv ?ã t?n t?i trong b?ng nhanvien hay ch?a
    IF NOT EXISTS (SELECT * FROM nhanvien WHERE manv = @manv)
    BEGIN
        RETURN 1; -- Tr? v? 1 n?u manv ch?a t?n t?i trong b?ng nhanvien
    END

    BEGIN TRANSACTION; -- B?t ??u transaction ?? ??m b?o tính toàn v?n c?a d? li?u

    -- Xóa d? li?u trong b?ng Nhap
    DELETE FROM Nhap WHERE manv = @manv;

    -- Xóa d? li?u trong b?ng Xuat
    DELETE FROM Xuat WHERE manv = @manv;

    -- Xóa d? li?u trong b?ng nhanvien
    DELETE FROM nhanvien WHERE manv = @manv;

    COMMIT TRANSACTION; -- K?t thúc transaction và l?u các thay ??i vào database

    RETURN 0; -- Tr? v? 0 n?u xóa thành công
END

---Câu 4---
GO
CREATE PROCEDURE XoaSanPham
    @masp varchar(10),
    @errorCode int OUTPUT
AS
BEGIN
    -- Ki?m tra xem masp ?ã t?n t?i trong b?ng sanpham ch?a
    IF NOT EXISTS (SELECT * FROM sanpham WHERE masp = @masp)
    BEGIN
        SET @errorCode = 1;
        RETURN;
    END
    
    -- Th?c hi?n xóa s?n ph?m ?ó kh?i b?ng sanpham
    DELETE FROM sanpham WHERE masp = @masp;
    
    -- Th?c hi?n xóa các b?n ghi trong b?ng Nhap và Xuat mà s?n ph?m này ?ã tham gia
    DELETE FROM Nhap WHERE masp = @masp;
    DELETE FROM Xuat WHERE masp = @masp;
    
    SET @errorCode = 0;
END

---Câu 5---
GO
CREATE PROCEDURE sp_ThemMoiHangsx 
    @mahangsx INT,
    @tenhang NVARCHAR(50),
    @diachi NVARCHAR(100),
    @sodt NVARCHAR(20),
    @email NVARCHAR(50)
AS
BEGIN
    -- Ki?m tra tên hàng ?ã t?n t?i hay ch?a
    IF EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
    BEGIN
        RETURN 1; -- Mã l?i 1: tên hàng ?ã t?n t?i
    END

    -- Thêm m?i hàng hóa
    INSERT INTO Hangsx(mahangsx, tenhang, diachi, sodt, email)
    VALUES(@mahangsx, @tenhang, @diachi, @sodt, @email)

    RETURN 0; -- Thành công
END

---Câu 6---
GO
CREATE PROCEDURE sp_NhapXuat_Xuat
    @sohdx INT,
    @masp INT,
    @manv INT,
    @ngayxuat DATE,
    @soluongX INT
AS
BEGIN
    
    IF NOT EXISTS(SELECT * FROM Sanpham WHERE masp = @masp)
    BEGIN
        RETURN 1 
    END
    
    
    IF NOT EXISTS(SELECT * FROM Nhanvien WHERE manv = @manv)
    BEGIN
        RETURN 2 
		END
    
    
    IF @soluongX > (SELECT soluong FROM Sanpham WHERE masp = @masp)
    BEGIN
        RETURN 3 
    END
    
    
    IF EXISTS(SELECT * FROM Xuat WHERE sohdx = @sohdx)
    BEGIN
        
        UPDATE Xuat
        SET masp = @masp,
            manv = @manv,
            ngayxuat = @ngayxuat,
            soluongX = @soluongX
        WHERE sohdx = @sohdx
    END
    ELSE
    BEGIN
        
        INSERT INTO Xuat(sohdx, masp, manv, ngayxuat, soluongX)
        VALUES(@sohdx, @masp, @manv, @ngayxuat, @soluongX)
    END
    
    
    RETURN 0
END