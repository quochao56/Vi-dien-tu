-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql-server
-- Generation Time: May 31, 2022 at 12:27 PM
-- Server version: 8.0.27
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webvidientu`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET ucs2 COLLATE ucs2_vietnamese_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf16 COLLATE utf16_vietnamese_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sodu` double NOT NULL DEFAULT '0',
  `cccd_mattruoc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `cccd_matsau` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `activated` bit(1) DEFAULT (false),
  `activate_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngaylap` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`user`, `fullname`, `email`, `phone`, `birthday`, `address`, `password`, `sodu`, `cccd_mattruoc`, `cccd_matsau`, `activated`, `activate_token`, `ngaylap`) VALUES
('5542570679', 'Lê Quốc Hảo', 'quochao2k2@gmail.com', '4524244524', '2022-06-14', 'bình chánh', '$2y$10$h5jRZqpXa7vVA3o3ODyjouNEMIZqNdv268Ww3CUUWFG/9sVk5XD1S', 6006000, 'IMG-629581e9dd0707.67537670_5542570679_fr.png', 'IMG-629581e9dd0707.67537670_5542570679_fr.png', b'0', '3c69e7d798991010cfc1f95f15ffabe0', '2022-05-31 09:48:10'),
('6778766371', 'wi oh', 'kanzukiganji@gmail.com', '1354575519', '2022-05-19', 'fqr2112r', '$2y$10$5J8ipi5cinmQv7DMqwoWJeux/qbIz2/qJrPHjvUikufdAkvfYcVeO', 3400000, 'IMG-6295b91c6b2350.56356705_6778766371_fr.jpg', 'IMG-6295b91c6b2350.56356705_6778766371_fr.jpg', b'0', 'b75abad95ffe705c1bf317e2c92361c8', '2022-05-31 13:43:40'),
('7063623664', 'dfadfa', 'qef@gmail.com', '5452452452', '2022-05-02', 'sdsf', '$2y$10$JGqjIk1WbifUC7turCbPluNqyvJgKrC8jluvuoixszMV5ze8sBGIO', 0, NULL, NULL, b'0', '00359ca3a252c9e7ab962da4f3068367', '2022-05-30 12:43:17'),
('7459248924', 'Thành Danh', 'danh@gmail.com', '0457542522', '2000-01-01', 'Long An', '$2y$10$7kX9rJPzE3uBBx8IHUSA4u1OJkVIYZR5iwGsPyKKTV1FS/BFYTMRe', 0, '', '', b'0', NULL, '2022-05-29 13:31:59'),
('admin', 'Quản Trị Viên', '', '', NULL, '', '$2y$10$ZDiVVFLqQhUQY0tG1JwlzuCvsFNb0omQ/uXNuspostu.LNWgU8e1i', 0, '', '', b'0', '321383569e8b27a721e7e88f20bae75d', '2022-05-29 13:31:59');

--
-- Triggers `account`
--
DELIMITER $$
CREATE TRIGGER `T_insStatus` BEFORE INSERT ON `account` FOR EACH ROW INSERT INTO statusaccount(user) VALUES(new.user)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_account` BEFORE DELETE ON `account` FOR EACH ROW DELETE FROM statusaccount WHERE user = OLD.user
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_giaodich` BEFORE INSERT ON `account` FOR EACH ROW INSERT INTO maOTP(user) VALUES(new.user)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_maotp` BEFORE INSERT ON `account` FOR EACH ROW INSERT INTO maOTP(user) VALUES(new.user)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `time` BEFORE INSERT ON `account` FOR EACH ROW set new.ngaylap = date_add(new.ngaylap, INTERVAL 7 hour)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account_thetindung`
--

CREATE TABLE `account_thetindung` (
  `user` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `thetindung` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `account_thetindung`
--

INSERT INTO `account_thetindung` (`user`, `thetindung`) VALUES
('5767803756', 0),
('6453871860', 1060000);

-- --------------------------------------------------------

--
-- Table structure for table `carddienthoai`
--

CREATE TABLE `carddienthoai` (
  `nhamang` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `maso` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `carddienthoai`
--

INSERT INTO `carddienthoai` (`nhamang`, `maso`) VALUES
('Viettel', '11111'),
('Mobifone', '22222'),
('Vinaphone', '33333');

-- --------------------------------------------------------

--
-- Table structure for table `choduyet`
--

CREATE TABLE `choduyet` (
  `user` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `HoTen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaGD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CMND` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgayLap` datetime NOT NULL,
  `TrangThai` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `choduyet`
--

INSERT INTO `choduyet` (`user`, `HoTen`, `MaGD`, `Email`, `CMND`, `NgayLap`, `TrangThai`) VALUES
('23523532', 'Lê Lai', 'dvsd', 'sgsdg', 'chờ cập nhật', '2022-05-30 04:43:30', 'Đang Chờ'),
('252553255', 'Lê Lợi', 'gfgd', 'dgf', '', '2022-05-30 04:43:30', 'Đang Chờ');

-- --------------------------------------------------------

--
-- Table structure for table `dakhoa`
--

CREATE TABLE `dakhoa` (
  `stt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `HoTen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SDT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgayKhoa` datetime NOT NULL,
  `CMND` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LiDo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dakhoa`
--

INSERT INTO `dakhoa` (`stt`, `user`, `HoTen`, `SDT`, `Email`, `NgayKhoa`, `CMND`, `LiDo`) VALUES
('2', '2562366', 'Nguyễn Huệ', '465773', 'hggmfnfg', '2022-05-30 15:42:59', '436626758', 'Spam'),
('3', '6437713763', 'Lê Lai', '47327272', 'jmtojsdi', '2022-05-30 15:42:59', '0869137', 'Spam'),
('1', '6652657767', 'Quang Trung', '236743735', 'faghr', '2022-05-30 15:42:59', '326772723', 'Spam');

-- --------------------------------------------------------

--
-- Table structure for table `giaodich`
--

CREATE TABLE `giaodich` (
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LoaiGD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaGD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SoTien` int NOT NULL,
  `ThoiGian` datetime NOT NULL,
  `TrangThai` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhiGD` int NOT NULL,
  `NoiDung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ma` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `giaodich`
--

INSERT INTO `giaodich` (`user`, `LoaiGD`, `MaGD`, `SoTien`, `ThoiGian`, `TrangThai`, `PhiGD`, `NoiDung`, `Ma`, `stt`) VALUES
('23098590843', 'Chuyển Tiền', 'chuyentien#1', 100000, '2022-05-30 03:36:13', 'Đã Duyệt', 0, 'Chuyển tiền ví momo', '', '1'),
('25654364563', 'Chuyển Tiền', 'chuyentien#2', 20000000, '2022-05-30 03:36:13', 'Bị Hủy', 100000, 'Chuyển tiền ngân hàng', '', '2'),
('35352666', 'Mua vé phim', 'muave#1', 150000, '2022-05-30 03:36:13', 'Đã Duyệt', 0, 'mua vé', 'phim14244214', ''),
('5346363466', 'Rút tiền', 'ruttien#1', 100000000, '2022-05-30 03:36:13', 'Bị Hủy', 0, 'rút tiền', '', ''),
('562363564523', 'Mua Thẻ', 'muathe#1', 50000, '2022-05-30 03:36:13', 'Đã Duyệt', 0, 'mua thẻ cào', '28375965962592', ''),
('6652657767', 'Rút Tiền', 'ruttien#2', 10000000, '2022-05-30 03:36:13', 'Đã Duyệt', 300000, 'rút về ngân hàng', '', ''),
('734737457373', 'Chuyển Tiền', 'chuyentien#2', 15000000, '2022-05-30 03:43:05', 'Đã Duyệt', 200000, 'chuyển tiền ngân hàng', '', '');

--
-- Triggers `giaodich`
--
DELIMITER $$
CREATE TRIGGER `time_giaodich` BEFORE INSERT ON `giaodich` FOR EACH ROW set new.ThoiGian = date_add(new.ThoiGian, INTERVAL 7 hour)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `lichsuGD`
--

CREATE TABLE `lichsuGD` (
  `user` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `loaiGD` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `maGD` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `SoTien` double NOT NULL DEFAULT '0',
  `TrangThai` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `PhiGD` double NOT NULL DEFAULT '0',
  `NoiDung` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `ThoiGian` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NguoiNhan` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `NguoiChiuPhi` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `lichsuGD`
--

INSERT INTO `lichsuGD` (`user`, `loaiGD`, `maGD`, `SoTien`, `TrangThai`, `PhiGD`, `NoiDung`, `ThoiGian`, `NguoiNhan`, `NguoiChiuPhi`) VALUES
('6453871860', 'Mua thẻ điện thoại', 'p5HrRSKv4q', 10000, '', 0, '', '2022-05-31 08:32:59', NULL, NULL),
('6778766371', 'Rút Tiền', '8vycfEbHI8', 6000000, 'Đã Duyệt', 300000, '', '2022-05-31 08:32:59', '5542570679', '6778766371');

-- --------------------------------------------------------

--
-- Table structure for table `maOTP`
--

CREATE TABLE `maOTP` (
  `user` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `maotp` varchar(30) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `phichuyen` float NOT NULL DEFAULT '0',
  `sotien` double NOT NULL DEFAULT '0',
  `nguoinhan` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `nguoichiuphi` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `trangthai` varchar(64) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `maOTP`
--

INSERT INTO `maOTP` (`user`, `maotp`, `phichuyen`, `sotien`, `nguoinhan`, `nguoichiuphi`, `trangthai`) VALUES
('6778766371', '934937', 300, 6000, '6778766371', '6778766371', 'Đang Chờ');

-- --------------------------------------------------------

--
-- Table structure for table `statusaccount`
--

CREATE TABLE `statusaccount` (
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'chờ xác minh',
  `logininvalid` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statusaccount`
--

INSERT INTO `statusaccount` (`user`, `status`, `logininvalid`) VALUES
('5542570679', 'đã được xác minh', 0),
('6778766371', 'đã được xác minh', 0),
('7063623664', 'đã được xác minh', 0),
('7459248924', 'đã vô hiệu hóa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `thetindung`
--

CREATE TABLE `thetindung` (
  `sothe` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngayhethan` date NOT NULL,
  `macvv` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thetindung`
--

INSERT INTO `thetindung` (`sothe`, `ngayhethan`, `macvv`) VALUES
('111111', '2022-10-10', '411'),
('222222', '2022-11-11', '443'),
('333333', '2022-12-12', '577');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`user`),
  ADD UNIQUE KEY `user` (`user`);

--
-- Indexes for table `account_thetindung`
--
ALTER TABLE `account_thetindung`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `carddienthoai`
--
ALTER TABLE `carddienthoai`
  ADD PRIMARY KEY (`maso`);

--
-- Indexes for table `choduyet`
--
ALTER TABLE `choduyet`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `dakhoa`
--
ALTER TABLE `dakhoa`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `giaodich`
--
ALTER TABLE `giaodich`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `lichsuGD`
--
ALTER TABLE `lichsuGD`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `maOTP`
--
ALTER TABLE `maOTP`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `statusaccount`
--
ALTER TABLE `statusaccount`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `thetindung`
--
ALTER TABLE `thetindung`
  ADD PRIMARY KEY (`sothe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
