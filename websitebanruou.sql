-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 20, 2023 lúc 06:09 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `websitebanruou`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `CartID` varchar(50) NOT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `ID` varchar(50) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Trend` tinyint(1) DEFAULT NULL,
  `Popular` tinyint(1) DEFAULT NULL,
  `SaleOff` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ID`, `Name`, `Type`, `Price`, `Image`, `Trend`, `Popular`, `SaleOff`) VALUES
('1', 'Sản Phẩm rượu VALDO', '1', 150, 'photoruou/SP VALDO.jpg', 0, 1, 0),
('10', 'Sản Phẩm rượu CHAMPAGNE', '2', 150, 'photoruou/SP CHAMPAGNE.jpg', 0, 1, 1),
('2', 'Sản Phẩm rượu SAUVIGNON BLANC', '2', 75, 'photoruou/SP SAUVIGNON BLANC.jpg', 1, 0, 0),
('3', 'Sản Phẩm rượu RED LABEL', '1', 45, 'photoruou/SP RED LABEL.jpg', 1, 0, 0),
('33', 'ABERFELDY', '4', 95, 'photoruou/thiet-ke-bao-bi-san-pham-7.jpg', 0, 0, 0),
('4', 'Sản Phẩm rượu SP NIKKA WHISKY FROM THE BARREL', '1', 76, 'photoruou/SP NIKKA WHISKY FROM THE BARREL.jpg', 0, 1, 0),
('5', ' LOUIS ESCGENAUER', '1', 65, 'photoruou/SP LOUIS ESCGENAUER.jpg', 0, 0, 0),
('6', 'Sản Phẩm rượu JAMESON', '2', 67, 'photoruou/SP JAMESON.jpg', 1, 1, 0),
('7', 'Sản Phẩm rượu JACOBS CREEK', '1', 65, 'photoruou/SP JACOBS CREEK.jpg', 0, 1, 0),
('8', 'Sản Phẩm rượu HENNESSY', '1', 87, 'photoruou/SP HENNESSY.jpg', 0, 1, 1),
('9', 'Sản Phẩm rượu GALLANTRY WHISKEY', '1', 87, 'photoruou/SP GALLANTRY WHISKEY.jpg', 0, 0, 1),
('95', 'Rượu Jagermeister', '3', 150, 'photoruou/jagermeister-363.jpg', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `producttype`
--

CREATE TABLE `producttype` (
  `typeid` varchar(2) NOT NULL,
  `typename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `producttype`
--

INSERT INTO `producttype` (`typeid`, `typename`) VALUES
('1', 'Rượu Mạnh'),
('2', 'Rượu Nhẹ'),
('3', 'Hàng Nhập Khẩu '),
('4', 'Niên Đại Lớn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_account`
--

CREATE TABLE `user_account` (
  `Username` varchar(30) NOT NULL,
  `Gender` varchar(5) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_account`
--

INSERT INTO `user_account` (`Username`, `Gender`, `Password`) VALUES
('an', 'men', '2'),
('anh', 'men', '1'),
('bo', 'men', '1'),
('nam', 'men', '2'),
('nhanhvananh@gmail.com', 'NAM', '1'),
('nhanvananh@gmail.com', 'NAM', '4');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`Username`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user_account` (`Username`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
