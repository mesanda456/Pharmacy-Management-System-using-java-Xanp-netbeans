-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2024 at 11:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cid` int(10) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `caddress` varchar(100) NOT NULL,
  `cconinfo` varchar(15) NOT NULL,
  `cemail` varchar(50) NOT NULL,
  `ctype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cid`, `cname`, `caddress`, `cconinfo`, `cemail`, `ctype`) VALUES
(123, 'chandana', 'colombo', '382238445', 'mes@gmail.com', 'New'),
(1003, 'manel', 'colombo', '382238446', 'mes@gmail.com', 'Regular'),
(2003, 'amal', 'nigambo', '66666', '11', 'Regular');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `mid` int(10) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `qty` int(20) NOT NULL,
  `fabdate` date NOT NULL,
  `expdate` date NOT NULL,
  `company` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`mid`, `mname`, `price`, `qty`, `fabdate`, `expdate`, `company`) VALUES
(1002, 'salhale', 200, 40, '2024-10-31', '2026-10-31', 'cco'),
(2004, 'vitaminc', 40, 50, '2024-10-09', '2026-10-13', 'acc'),
(3002, 'panadol', 150, 40, '2024-10-16', '2026-10-31', 'cbs');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order` int(20) NOT NULL,
  `oid` varchar(200) NOT NULL,
  `cusid` int(20) NOT NULL,
  `odate` varchar(200) NOT NULL,
  `totp` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`order`, `oid`, `cusid`, `odate`, `totp`) VALUES
(1, 'Bill-190169897234200', 123, '30-10-2024', 1020),
(2, 'Bill-190370353711500', 123, '30-10-2024', 720),
(3, 'Bill-190674697057600', 1003, '30-10-2024', 525),
(4, 'Bill-191508097208300', 1003, '30-10-2024', 285),
(5, 'Bill-192358858403800', 123, '30-10-2024', 435);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order`),
  ADD KEY `cusid` (`cusid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `order` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`cusid`) REFERENCES `customer` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
