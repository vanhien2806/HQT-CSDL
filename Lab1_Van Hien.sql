
CREATE TABLE Sanpham (
  masp nchar(10) PRIMARY KEY,
  mahangsx nchar(10),
  tensp nVARCHAR(20),
  soluong INT,
  mausac nVARCHAR(50),
  giaban money,
  donvitinh nCHAR(10),
  mota nvarchar(max),
);

CREATE TABLE Hangsx (
  mahangsx nchar(10) PRIMARY KEY,
  tenhang nVARCHAR(20),
  diachi nVARCHAR(30),
  sodt nVARCHAR(20),
  email nVARCHAR(30)
);

CREATE TABLE Nhanvien (
  manv nchar(10) PRIMARY KEY,
  tennv nVARCHAR(20),
  gioitinh nCHAR(10),
  diachi nVARCHAR(30),
  sodt nVARCHAR(20),
  email nVARCHAR(30),
  phong nVARCHAR(30)
);

CREATE TABLE Nhap (
  sohdn nchar(10) PRIMARY KEY,
  masp nchar(10), 
  manv nchar(10),
  ngaynhap DATE,
  soluongN INT,
  dongiaN money,
  FOREIGN KEY (masp) REFERENCES Sanpham(masp),
  FOREIGN KEY (manv) REFERENCES Nhanvien(manv)
);

CREATE TABLE Xuat (
  sohdx nchar(10) PRIMARY KEY,
  masp nchar(10),
  manv nchar(10),
  ngayxuat DATE,
  soluongX INT,
  FOREIGN KEY (masp) REFERENCES Sanpham(masp),
  FOREIGN KEY (manv) REFERENCES Nhanvien(manv)
);
INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
VALUES ('SP01', 'H02', 'F1 Plus', 100, 'xám', 7000000, 'Chiếc', 'Hàng cận cao cấp');
INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
VALUES ('SP02', 'H01', 'Galaxy Note 11', 50, 'đỏ', 19000000, 'Chiếc', 'Hàng cao cấp');
INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
VALUES ('SP03', 'H02', 'F3 lite', 200, 'nâu', 3000000, 'Chiếc', 'Hàng phổ thông');
INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
VALUES ('SP04', 'H03', 'Vjoy3', 200, 'xám', 1500000, 'Chiếc', 'Hàng phổ thông');
INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
VALUES ('SP05', 'H01', 'Galaxy v11', 500, 'nâu', 8000000, 'Chiếc', 'Hàng cận cao cấp');


INSERT INTO Hangsx (mahangsx, tenhang, diachi, sodt, email)
VALUES ('H01', 'Samsung', 'Korea', '011-08271717', 'ss@gmail.com.kr');
INSERT INTO Hangsx (mahangsx, tenhang, diachi, sodt, email)
VALUES ('H02', 'OPPO', 'China', '081-08626262', 'oppo@gmail.com.cn');
INSERT INTO Hangsx (mahangsx, tenhang, diachi, sodt, email)
VALUES ('H03', 'Vinfone', 'Việt nam', '081-08626262', 'vf@gmail.com.vn');


INSERT INTO Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
VALUES ('NV01', 'Nguyễn Thị Thu', 'Nữ', 'Hà Nội', '0982626521', 'thu@gmail.com', 'kế toán');
INSERT INTO Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
VALUES ('NV02', 'Lê Văn Nam', 'Nam', 'Bắc Ninh', '0972525252', 'nam@gmail.com', 'Vật tư');
INSERT INTO Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
VALUES ('NV03', 'Trần Hòa Bình', 'Nữ', 'Hà Nội ','03283883', 'nhb@gmail.com', 'kế toán');

INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
VALUES ('N01', 'SP02', 'NV01', '02-05-2019', 10, 17000000);
INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
VALUES ('N02', 'SP01', 'NV02', '04-07-2020', 30, 6000000);
INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
VALUES ('N03', 'SP04', 'NV02', '05-17-2020', 20, 1200000);
INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
VALUES ('N04', 'SP01', 'NV03', '03-22-2020', 10, 6200000);
INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
VALUES ('N05', 'SP05', 'NV01', '07-07-2020', 20,7000000);

INSERT INTO Xuat (sohdx, masp, manv, ngayxuat, soluongX)
VALUES
('X01', 'SP03', 'NV02', '2020-06-14', 5),
('X02', 'SP01', 'NV03', '2019-03-05', 3),
('X03', 'SP02', 'NV01', '2020-12-12', 1),
('X04', 'SP03', 'NV02', '2020-06-02', 2),
('X05', 'SP05', 'NV01', '2020-05-18', 1);

BACKUP DATABASE QLBanHang 
TO DISK = 'C:\C:\Users\Admin\Documents\SQL Server Management Studio\QLBanHang.bak';

RESTORE DATABASE QLBanHang 
FROM DISK = 'C:\C:\Users\Admin\Documents\SQL Server Management Studio\QLBanHang.bak';
