-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 09, 2020 lúc 09:53 AM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quan_ly_truong_mam_non`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `dem_giao-vien` (IN `Nhap` VARCHAR(250))  NO SQL
BEGIN
SELECT
COUNT(*)
FROM giaovien
WHERE quequan = Nhap;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sap_xep_giao_vien` ()  NO SQL
SELECT *
FROM giaovien
ORDER BY magv DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tim_giao_vien` (IN `Nhap` VARCHAR(250))  NO SQL
BEGIN
	SELECT *
	FROM giaovien
	WHERE quequan = Nhap;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `xoa_giao_vien` (IN `Nhap` VARCHAR(250))  NO SQL
BEGIN
DELETE
FROM giaovien
WHERE magv = Nhap;
END$$

--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dem_giao_vien` (`Nhap` VARCHAR(250)) RETURNS INT(11) NO SQL
BEGIN
DECLARE S INT(255) DEFAULT '';
SET S = (SELECT  COUNT(*) FROM giaovien WHERE quequan = Nhap);
RETURN S;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `tinh_luong` (`luongcoban` INT, `hesoluong` INT) RETURNS INT(11) NO SQL
BEGIN
DECLARE C INT(255) DEFAULT '';
SET C = (luongcoban*hesoluong);
RETURN C;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `xem_ngay_sinh` (`Nhap` VARCHAR(50)) RETURNS DATE NO SQL
BEGIN
DECLARE S INT(255) DEFAULT '';
SET S = (SELECT ngaysinh FROM giaovien WHERE Nhap = magv);
RETURN S;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_giao_vien`
--

CREATE TABLE `chi_tiet_giao_vien` (
  `magv` varchar(30) NOT NULL,
  `bangcap` varchar(30) NOT NULL,
  `trinhdo` varchar(30) NOT NULL,
  `hesoluong` int(30) NOT NULL,
  `luongcoban` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_giao_vien`
--

INSERT INTO `chi_tiet_giao_vien` (`magv`, `bangcap`, `trinhdo`, `hesoluong`, `luongcoban`) VALUES
('a01', 'kha', '12/12', 3, 4000000),
('a02', 'gioi', '12/12', 4, 6000000),
('a03', 'gioi', '12/12', 2, 4000000),
('a04', 'gioi', '11/12', 3, 3000000),
('a05', 'kha', '12/12', 3, 5000000),
('a06', 'gioi', '12/12', 2, 6000000),
('a07', 'kha', '12/12', 4, 4000000),
('a08', 'kha', '12/12', 2, 5000000),
('a09', 'gioi', '12/12', 4, 7000000),
('b01', 'kha', '12/12', 2, 6000000),
('b02', 'gioi', '12/12', 5, 6000000),
('b03', 'gioi', '12/12', 2, 6000000),
('b04', 'gioi', '12/12', 4, 4000000),
('b05', 'gioi', '12/12', 3, 5000000),
('b06', 'trungbinh', '12/12', 2, 6000000),
('b07', 'kha', '12/12', 3, 6000000),
('b08', 'kha', '12/12', 3, 6000000),
('b09', 'kha', '12/12', 3, 6000000),
('c01', 'gioi', '12/12', 3, 6000000),
('c02', 'gioi', '12/12', 2, 6000000),
('c03', 'gioi', '12/12', 3, 4000000),
('c04', 'gioi', '12/12', 3, 4000000),
('c05', 'gioi', '12/12', 3, 6000000),
('c06', 'kha', '12/12', 2, 6000000),
('c07', 'gioi', '12/12', 3, 6000000),
('c08', 'gioi', '12/12', 3, 4000000),
('c09', 'kha', '12/12', 3, 4000000),
('d01', 'gioi', '12/12', 3, 6000000),
('d02', 'gioi', '12/12', 3, 6000000),
('d03', 'gioi', '12/12', 3, 6000000),
('d04', 'gioi', '11/12', 3, 6000000),
('d05', 'gioi', '12/12', 4, 4000000),
('d06', 'gioi', '12/12', 3, 6000000),
('d07', 'kha', '12/12', 3, 6000000),
('d08', 'gioi', '12/12', 3, 4000000),
('d09', 'gioi', '12/12', 3, 6000000),
('e01', 'gioi', '12/12', 3, 6000000),
('e02', 'gioi', '12/12', 3, 6000000),
('e03', 'gioi', '12/12', 3, 4000000),
('e04', 'gioi', '12/12', 4, 6000000),
('e05', 'gioi', '12/12', 5, 6000000),
('e06', 'gioi', '12/12', 3, 6000000),
('e07', 'gioi', '12/12', 3, 6000000),
('e08', 'gioi', '12/12', 3, 6000000),
('e09', 'kha', '12/12', 3, 6000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaovien`
--

CREATE TABLE `giaovien` (
  `stt` int(50) NOT NULL,
  `magv` varchar(20) NOT NULL,
  `hoten` varchar(50) NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `dienthoai` varchar(20) NOT NULL,
  `dantoc` varchar(30) NOT NULL,
  `quequan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `giaovien`
--

INSERT INTO `giaovien` (`stt`, `magv`, `hoten`, `ngaysinh`, `gioitinh`, `email`, `dienthoai`, `dantoc`, `quequan`) VALUES
(2, 'a02', 'nguyen van giang', '1977-01-09', 'nam', 'nguyennam@gmail.com', '0213213123', 'kinh', 'da nang'),
(3, 'a03', 'nguyen van a', '1988-09-09', 'nam', 'nguyena@gmail.com', '023213213', 'k?nh', 'da nang'),
(5, 'a05', 'le thi a', '1967-09-02', 'nu', 'abx@gmail.com', '012323213', 'kinh', 'da nang'),
(6, 'a06', 'le thi ca', '1988-08-06', 'nu', 'asdsa@gmail.com', '0123213123', 'kinh', 'ha noi'),
(7, 'a07', 'le dieu a', '1977-09-02', 'nu', 'jjasd@gmail.com', '023213123', 'kinh', 'da nang'),
(9, 'a09', 'lê thi c', '1972-01-08', 'nu', 'addd@gmail.com', '092321312', 'kinh', 'da nang'),
(10, 'b01', 'lê v?n l', '1972-01-08', 'nam', 'tttt@gmail.com', '02321312', 'thai', 'da nang'),
(11, 'b02', 'nguyen van vu', '1970-01-08', 'nam', 'aaa@gmail.com', '0213213123', 'thai', 'da nang'),
(12, 'b03', 'le van toi', '1977-09-01', 'nam', 'jjj@gmail.com', '023213123', 'kinh', 'ha noi'),
(13, 'b04', 'nguyen thi c', '1972-01-02', 'nu', 'abx@gmail.com', '0129932131', 'thai', 'da nang'),
(14, 'b05', 'nguyen a', '1972-01-12', 'nam', 'yyy@gmail.com', '012321312', 'kinh', 'da nang'),
(15, 'b06', 'nguyen abc', '1977-09-24', 'nam', 'abc@gmail.com', '029922212', 'thai', 'da nang'),
(16, 'b07', 'nguyen mm', '1977-01-18', 'nam', 'hhh@gmail.com', '0123213123', 'kinh', 'da nang'),
(17, 'b08', 'nguyen k', '1972-01-19', 'nu', 'kkk@gmail.com', '01232131', 'kinh', 'da nang'),
(18, 'b09', 'nguyen thi abx', '1972-01-17', 'nu', 'jjj@gmail.com', '012321312', 'kinh', 'da nang'),
(19, 'c01', 'nguyen kj', '1977-01-25', 'nam', 'kkk@gmail.com', '01233213', 'kinh', 'ha noi'),
(20, 'c02', 'nguyen thi p', '1972-01-28', 'nu', 'hhh@gmail.com', '08823213213', 'kinh', 'da nang'),
(21, 'c03', 'nguyen thi u', '1977-01-24', 'nu', 'nu@gmail.com', '023212131', 'kinh', 'ha noi'),
(22, 'c04', 'nguyen thi q', '1972-01-19', 'nu', 'nguyen@gmail.com', '088882222', 'thai', 'ha noi');

--
-- Bẫy `giaovien`
--
DELIMITER $$
CREATE TRIGGER `Insert` BEFORE INSERT ON `giaovien` FOR EACH ROW INSERT INTO `chucvu`
VALUES(null,new.hoten,'insert',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_YEYE` BEFORE INSERT ON `giaovien` FOR EACH ROW INSERT INTO `hoc_sinh`
VALUES(null,new.Magv,'insert',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` BEFORE UPDATE ON `giaovien` FOR EACH ROW INSERT INTO `lishsu`
VALUES(new.Hoten,'Update',now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `giao_vien_khong_phai_la_dantoc_kinh`
-- (See below for the actual view)
--
CREATE TABLE `giao_vien_khong_phai_la_dantoc_kinh` (
`stt` int(50)
,`magv` varchar(20)
,`hoten` varchar(50)
,`ngaysinh` date
,`gioitinh` varchar(20)
,`email` varchar(20)
,`dienthoai` varchar(20)
,`dantoc` varchar(30)
,`quequan` varchar(50)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `gv_bang_gioi`
-- (See below for the actual view)
--
CREATE TABLE `gv_bang_gioi` (
`hoten` varchar(50)
,`bangcap` varchar(30)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoc_sinh`
--

CREATE TABLE `hoc_sinh` (
  `stt` int(20) NOT NULL,
  `malop` varchar(20) NOT NULL,
  `hoten` varchar(50) NOT NULL,
  `nhomtuoi` varchar(20) NOT NULL,
  `noisinh` varchar(20) NOT NULL,
  `diachi` varchar(30) NOT NULL,
  `sdt` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `hoc_sinh`
--

INSERT INTO `hoc_sinh` (`stt`, `malop`, `hoten`, `nhomtuoi`, `noisinh`, `diachi`, `sdt`) VALUES
(30, 'a1', 'nguyen van lam', '2-3', 'hue', 'hue', '0123123123'),
(1, 'a2', 'nguyen van giang', '1-2', 'ha noi', 'ha noi', '09222222211'),
(35, 'a3', 'nguyen van dat', '1-2', 'da nang', 'da nang', '0129933212'),
(27, 'a4', 'le binh', '1-2', 'ha noi', 'ha noi', '012312312123'),
(2, 'a5', 'nguyen van an', '2-3', 'hue', 'hue', '0213213123123'),
(4, 'a6', 'trinh thang binh', '2-3', 'da nang', 'da nang', '01203123213'),
(26, 'a7', 'nguyen ha', '2-3', 'hue', 'hue', '0999222'),
(39, 'a8', 'nguyen van vu', '1-2', 'da nang', 'da nang', '01232132132'),
(17, 'a9', 'le thi nhu quynh', '2-3', 'hue', 'hue', '0911231233'),
(19, 'b1', 'vo van hieu', '2-3', 'da nang', 'da nang', '02112332442'),
(13, 'b2', 'nguyen van dung', '1-2', 'hue', 'hue', '01221312312'),
(32, 'b3', 'nguyen nhu thuy', '1-2', 'hue', 'hue', '012312392212'),
(31, 'b4', 'nguyen dinh duong', '2-3', 'da nang', 'da nang', '0777222321'),
(3, 'b6', 'nguyen van tinh', '1-2', 'ha noi', 'ha noi', '0123448959'),
(36, 'b7', 'nguyen thanh dat', '1-2', 'hue', 'hue', '0123123123'),
(33, 'b8', 'nguyen van duc', '2-3', 'hue', 'hue', '012321312312'),
(34, 'b9', 'nguyen thi ngan', '2-3', 'da nang', 'da nang', '0128883333'),
(29, 'c1', 'le nhu quynh', '2-3', 'hue', 'hue', '0229299222'),
(37, 'c2', 'nguyen dong nhi', '2-3', 'hue', 'hue', '0123123123'),
(7, 'c5', 'nguyen van ha', '2-3', 'hue', 'hue', '0987762222'),
(24, 'c6', 'le thi minh', '1-2', 'da nang', 'da nang', '012312312312'),
(8, 'c7', 'le thi hoa', '1-2', 'ha noi', 'ha noi', '0123213213'),
(38, 'c8', 'nguyen van hung', '2-3', 'hue', 'hue', '012312312312'),
(25, 'c9', 'le hoa', '2-3', 'da nang', 'da nang', '012323233213'),
(21, 'd1', 'nguyen nhu thu', '2-3', 'hue', 'hue', '0123123123'),
(28, 'd2', 'quach nhu xuan', '1-2', 'hcm', 'hcm', '01299922121'),
(14, 'd4', 'le thi binh', '2-3', 'hue', 'hue', '012366666'),
(9, 'd5', 'le thi van', '2-3', 'ha noi', 'ha noi', '01223232323'),
(18, 'd6', 'nguyen thi tu', '1-2', 'ha noi', 'ha noi', '0911394222'),
(11, 'd7', 'nguyen thi giang', '1-2', 'quang tri', 'da nang', '0999922222'),
(6, 'd9', 'nguyen van tien', '2-3', 'da nang', 'da nang', '07677777777'),
(15, 'e1', 'ho thi hoa', '2-3', 'da nang', 'da nang', '0122312312'),
(20, 'e2', 'vo thi hoa', '2-3', 'ha noi', 'ha noi', '0232222222'),
(40, 'e3', 'nguyen dinh vu', '2-3', 'hue', 'hue', '0123123999'),
(5, 'e4', 'ho van lai', '1-2', 'hue', 'hue', '0123123123'),
(16, 'e5', 'le thi thu', '1-2', 'da nang', 'da nang', '01231288'),
(10, 'e6', 'le thi nhu', '2-3', 'ha noi', 'ha noi', '09999999999'),
(22, 'e7', 'nguyen thi dieu quynh', '1-2', 'hue ', 'hue', '01239999'),
(12, 'e8', 'nguyen van hau', '2-3', 'da nang', 'da nang', '01200002222'),
(23, 'e9', 'dinh tra my', '2-3', 'ha noi', 'ha noi', '02321312312');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `hoc_sinh_1_2_sinh_o_hue`
-- (See below for the actual view)
--
CREATE TABLE `hoc_sinh_1_2_sinh_o_hue` (
`hoten` varchar(50)
,`nhomtuoi` varchar(20)
,`noisinh` varchar(20)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `hoc_sinh_co_noi_sinh_ha_noi`
-- (See below for the actual view)
--
CREATE TABLE `hoc_sinh_co_noi_sinh_ha_noi` (
`noisinh` varchar(20)
,`hoten` varchar(50)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_hoc`
--

CREATE TABLE `lop_hoc` (
  `malop` varchar(50) NOT NULL,
  `tenlop` varchar(50) NOT NULL,
  `nhomtuoi` varchar(20) NOT NULL,
  `magv` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `lop_hoc`
--

INSERT INTO `lop_hoc` (`malop`, `tenlop`, `nhomtuoi`, `magv`) VALUES
('a1', 'mau giao nho', '1-2', 'a01'),
('a2', 'mau giao nho ', '1-2', 'a02'),
('a3', 'mau giao nho', '1-2', 'a03'),
('a4', 'mau giao nho', '1-2', 'a04'),
('a5', 'mau giao nho', '1-2', 'a05'),
('a6', 'mau giao nho', '1-2', 'a06'),
('a7', 'mau giao lon', '2-3', 'a07'),
('a8', 'mau giao lon', '2-3', 'a08'),
('a9', 'mau giao lon', '2-3', 'a09'),
('b1', 'mau giao be', '1-2', 'b01'),
('b2', 'mau giao lon', '2-3', 'b02'),
('b3', 'mau giao lon', '2-3', 'b03'),
('b4', 'mau giao lon', '2-3', 'b04'),
('b5', 'mau giao nho', '1-2', 'b05'),
('b6', 'mau giao lon', '2-3', 'b06'),
('b7', 'mau giao lon', '2-3', 'b07'),
('b8', 'mau giao nho', '1-2', 'b08'),
('b9', 'mau giao lon', '2-3', 'b09'),
('c1', 'mau giao lon', '2-3', 'c01'),
('c2', 'mau giao lon', '2-3', 'c02'),
('c3', 'mau giao lon ', '2-3', 'c03'),
('c4', 'mau giao lon ', '2-3', 'c04'),
('c5', 'mau giao lon', '2-3', 'c05'),
('c6', 'mau giao nho ', '1-2', 'c06'),
('c7', 'mau giao nho', '1-2', 'c07'),
('c8', 'mau giao lon', '2-3', 'c08'),
('c9', 'mau giao lon', '2-3', 'c09'),
('d1', 'mau giao lon', '2-3', 'd01'),
('d2', 'mau giao lon', '2-3', 'd02'),
('d3', 'mau giao lon', '2-3', 'd03'),
('d4', 'mau giao nho', '1-2', 'd04'),
('d5', 'mau giao lon', '2-3', 'd05'),
('d6', 'mau giao nho', '1-2', 'd06'),
('d7', 'mau giao nho', '1-2', 'd07'),
('d8', 'mau giao nho', '1-2', 'd08'),
('d9', 'mau giao lon', '2-3', 'd09'),
('e1', 'mau giao nho', '1-2', 'e01'),
('e2', 'mau giao lon ', '2-3', 'e02'),
('e3', 'mau giao nho', '1-2', 'e03'),
('e4', 'mau giao nho', '1-2', 'e04'),
('e5', 'mau giao lon', '2-3', 'e05'),
('e6', 'mau giao be', '1-2', 'e06'),
('e7', 'mau giao nho', '1-2', 'e07'),
('e8', 'mau giao lon', '2-3', 'e08'),
('e9', 'mau giao nho', '1-2', 'e09');

-- --------------------------------------------------------

--
-- Cấu trúc cho view `giao_vien_khong_phai_la_dantoc_kinh`
--
DROP TABLE IF EXISTS `giao_vien_khong_phai_la_dantoc_kinh`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `giao_vien_khong_phai_la_dantoc_kinh`  AS  select `giaovien`.`stt` AS `stt`,`giaovien`.`magv` AS `magv`,`giaovien`.`hoten` AS `hoten`,`giaovien`.`ngaysinh` AS `ngaysinh`,`giaovien`.`gioitinh` AS `gioitinh`,`giaovien`.`email` AS `email`,`giaovien`.`dienthoai` AS `dienthoai`,`giaovien`.`dantoc` AS `dantoc`,`giaovien`.`quequan` AS `quequan` from `giaovien` where `giaovien`.`dantoc` = 'thai' ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `gv_bang_gioi`
--
DROP TABLE IF EXISTS `gv_bang_gioi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gv_bang_gioi`  AS  select `giaovien`.`hoten` AS `hoten`,`chi_tiet_giao_vien`.`bangcap` AS `bangcap` from (`giaovien` join `chi_tiet_giao_vien`) where `giaovien`.`magv` = `chi_tiet_giao_vien`.`magv` and `chi_tiet_giao_vien`.`bangcap` = 'gioi' ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `hoc_sinh_1_2_sinh_o_hue`
--
DROP TABLE IF EXISTS `hoc_sinh_1_2_sinh_o_hue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hoc_sinh_1_2_sinh_o_hue`  AS  select `hoc_sinh`.`hoten` AS `hoten`,`hoc_sinh`.`nhomtuoi` AS `nhomtuoi`,`hoc_sinh`.`noisinh` AS `noisinh` from `hoc_sinh` where `hoc_sinh`.`nhomtuoi` = '1-2' and `hoc_sinh`.`noisinh` = 'hue' ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `hoc_sinh_co_noi_sinh_ha_noi`
--
DROP TABLE IF EXISTS `hoc_sinh_co_noi_sinh_ha_noi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hoc_sinh_co_noi_sinh_ha_noi`  AS  select `hoc_sinh`.`noisinh` AS `noisinh`,`hoc_sinh`.`hoten` AS `hoten` from `hoc_sinh` where `hoc_sinh`.`noisinh` = 'ha noi' ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chi_tiet_giao_vien`
--
ALTER TABLE `chi_tiet_giao_vien`
  ADD PRIMARY KEY (`magv`);

--
-- Chỉ mục cho bảng `giaovien`
--
ALTER TABLE `giaovien`
  ADD PRIMARY KEY (`magv`);

--
-- Chỉ mục cho bảng `hoc_sinh`
--
ALTER TABLE `hoc_sinh`
  ADD PRIMARY KEY (`malop`),
  ADD KEY `hoten` (`hoten`);

--
-- Chỉ mục cho bảng `lop_hoc`
--
ALTER TABLE `lop_hoc`
  ADD PRIMARY KEY (`malop`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
