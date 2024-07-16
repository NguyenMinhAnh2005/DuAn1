create database FashionStores3;
go

use FashionStores3;
go

create table TaiKhoan (
    MaTK varchar(10) primary key,
    UserName varchar(20),
    PassWord varchar(20),
    VaiTro varchar(10),
    TrangThai bit
);
go

create table NhanVien (
    MaNV varchar(10) primary key,
    MaTK varchar(10) not null,
    HoTen nvarchar(50),
    GioiTinh bit,
    DiaChi nvarchar(100),
    SoDienThoai varchar(10),
    CCCD nvarchar(50),
    NgayVaoLam date,
    TrangThai bit,
    Anh varchar(MAX),
    foreign key(MaTK) references TaiKhoan(MaTK)
);
go

create table KhachHang (
    MaKH varchar(10) primary key,
    HoTen nvarchar(50),
    NgaySinh date,
    SoDienThoai varchar(10),
    Email varchar(100),
    GioiTinh bit,
    DiaChi nvarchar(100)
);
go

create table SuKien (
    MaSK varchar(10) primary key,
    TenSK nvarchar(50),
    HinhThuc bit,
    MucGiamGia varchar(100),
    ThoiGianBatDau date,
    ThoiGianKetThuc date,
    MoTa nvarchar(100),
    TrangThai bit,
    DieuKienApDung bit,
    DieuKienTongTien nvarchar(50)
);
go

create table HoaDon (
    MaHoaDon varchar(10) primary key,
    MaNV varchar(10) not null,
    MaKH varchar(10),
    NgayTao datetime,
    TongTien Money,
    TongTienKM Money,
    TongTienSauKM Money,
    TrangThai nvarchar(30),
    GhiChu nvarchar(100),
    MaSK varchar(10),
    foreign key(MaSK) references SuKien(MaSK),
    foreign key(MaNV) references NhanVien(MaNV),
    foreign key(MaKH) references KhachHang(MaKH)
);
go

create table LoaiSanPham (
    MaLSP varchar(10) primary key,
    TenLSP nvarchar(50),
    TrangThai bit,
    Mota nvarchar(100)
);
go

create table MauSac (
    MaMauSac varchar(10) primary key,
    TenMauSac nvarchar(50),
    TrangThai bit
);
go

create table ChatLieu (
    MaChatLieu varchar(10) primary key,
    TenChatLieu nvarchar(50),
    TrangThai bit
);
go

create table KichThuoc (
    MaKichThuoc varchar(10) primary key,
    TenKichThuoc nvarchar(50),
    TrangThai bit
);
go

create table SanPham (
    MaSanPham varchar(10) primary key,
    TenSanPham nvarchar(50),
    TrangThai bit,
    MaLSP varchar(10) not null,
    XuatXu nvarchar(50),
    MaMauSac varchar(10) not null,
    MaChatLieu varchar(10) not null,
    MaKichThuoc varchar(10) not null,
    SoLuong int,
    Gia money,
    qrCode varchar(50),
    foreign key(MaLSP) references LoaiSanPham(MaLSP),
    foreign key(MaMauSac) references MauSac(MaMauSac),
    foreign key(MaChatLieu) references ChatLieu(MaChatLieu),
    foreign key(MaKichThuoc) references KichThuoc(MaKichThuoc)
);
go

create table HoaDonChiTiet (
    MaHoaDonChiTiet varchar(20) primary key,
    MaSanPham varchar(10) not null,
    MaHoaDon varchar(10) not null,
    SoLuong int,
    DonGia money,
    GhiChu nvarchar(100),
    TrangThai bit,
    foreign key(MaSanPham) references SanPham(MaSanPham),
    foreign key(MaHoaDon) references HoaDon(MaHoaDon)
);
go

create table DoiHang (
    MaDoiHang varchar(10) primary key,
    MaNV varchar(10) not null,
    MaHoaDon varchar(10) not null,
    NgayDoiTra date,
    TrangThai nvarchar(30),
    foreign key(MaNV) references NhanVien(MaNV),
    foreign key(MaHoaDon) references HoaDon(MaHoaDon)
);
go

create table DoiHangChiTiet (
    MaDHCT varchar(10) primary key,
    MaSanPham varchar(10),
    MaDoiHang varchar(10) not null,
    MaHoaDonChiTiet varchar(20) not null,
    SoLuong int,
    MoTa nvarchar(500),
    TrangThai bit,
    foreign key(MaSanPham) references SanPham(MaSanPham),
    foreign key(MaDoiHang) references DoiHang(MaDoiHang),
    foreign key(MaHoaDonChiTiet) references HoaDonChiTiet(MaHoaDonChiTiet)
);
go
insert into NhanVien (MaNV, MaTK, HoTen, GioiTinh, DiaChi, SoDienThoai, CCCD, NgayVaoLam, TrangThai, Anh) values
('NV001', 'TK001', N'Tống Hồng Lan', 1, N'Ninh Bình', '0123456789', '123456789', '2022-01-01', 1, 'anh1.jpg'),
('NV002', 'TK002', N'Phan Chí Kiên', 0, N'Lạng Sơn', '0964980203', '123456788', '2022-01-02', 1, 'anh2.jpg'),
('NV003', 'TK003', N'Đỗ Lan Anh', 1, N'Hưng Yên', '0382132796', '123456787', '2022-01-03', 1, 'anh3.jpg'),
('NV004', 'TK004', N'Đinh Trí Nhật Hùng', 0, N'Thái Bình', '0123456786', '123456786', '2022-01-04', 1, 'anh4.jpg'),
('NV005', 'TK005', N'Nguyễn Thu Hiền', 1, N'Hưng Yên', '0355957972', '123456785', '2022-01-05', 1, 'anh5.jpg'),
('NV006', 'TK006', N'Phùng Văn Hưng', 0, N'Vĩnh Phúc', '0325495477', '123456784', '2022-01-06', 1, 'anh6.jpg'),
('NV007', 'TK007', N'Nguyễn Thành Nam', 0, N'Thái Bình', '0123456783', '123456783', '2022-01-07', 1, 'anh7.jpg'),
('NV008', 'TK008', N'Nguyễn Minh Anh', 1, N'Hà Nội', '0868215840', '123456782', '2024-11-07', 1, 'anh8.jpg'),
('NV009', 'TK009', N'Trần Thanh Thúy', 1, N'Hà Nội', '0966571078', '123456781', '2022-01-09', 1, 'anh9.jpg'),
('NV010', 'TK010', N'Kiều Thị Mai', 0, N'Hải Phòng', '0123456780', '123456780', '2022-01-10', 1, 'anh10.jpg');
insert into ChatLieu (MaChatLieu, TenChatLieu, TrangThai) values
('CL001', N'Thun borip', 1),
('CL002', N'Cotton', 1),
('CL003', N'Borip tăm Hàn', 1),
('CL004', N'Thun gân', 1),
('CL005', N'Thun tăm', 1),
('CL006', N'Bozip', 1),
('CL007', N'Thun cotton', 1),
('CL008', N'Thun', 1),
('CL009', N'Bozip', 1),
('CL010', N'Thun gân', 1);
