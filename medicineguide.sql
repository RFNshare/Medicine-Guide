-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2017 at 05:46 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicineguide`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `dId` int(11) NOT NULL,
  `medID` int(11) NOT NULL,
  `deId` int(11) NOT NULL,
  `adId` int(11) NOT NULL,
  `cuID` int(11) NOT NULL,
  `pID` int(11) NOT NULL,
  `aUserName` varchar(40) NOT NULL,
  `aPassword` varchar(40) NOT NULL,
  `aMobile` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ambulance`
--

CREATE TABLE `ambulance` (
  `amId` int(11) NOT NULL,
  `hospitalAddress` varchar(40) NOT NULL,
  `amRegion` varchar(40) NOT NULL,
  `hospitalName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `amId` int(11) NOT NULL,
  `medId` int(11) NOT NULL,
  `cuEmail` varchar(40) NOT NULL,
  `pId` int(11) NOT NULL,
  `cuMobile` varchar(40) NOT NULL,
  `cuAddress` varchar(40) NOT NULL,
  `cuName` varchar(40) NOT NULL,
  `cuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`amId`, `medId`, `cuEmail`, `pId`, `cuMobile`, `cuAddress`, `cuName`, `cuId`) VALUES
(0, 0, 'aa@ff.com', 0, '1234', 'aaa', 'asd', 1),
(0, 0, 'aw@ff.com', 0, '1234', 'asd', 'aaa', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customerlogin`
--

CREATE TABLE `customerlogin` (
  `cuUserName` varchar(40) NOT NULL,
  `cuPassword` varchar(40) NOT NULL,
  `cuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerlogin`
--

INSERT INTO `customerlogin` (`cuUserName`, `cuPassword`, `cuId`) VALUES
('asd', '12345', 1),
('aaa', '12345', 2);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `dId` int(11) NOT NULL,
  `deName` varchar(40) NOT NULL,
  `deMobile` varchar(40) NOT NULL,
  `deRegion` varchar(40) NOT NULL,
  `deId` int(11) NOT NULL,
  `dEmail` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryinfo`
--

CREATE TABLE `deliveryinfo` (
  `deMedicineName` varchar(40) NOT NULL,
  `deAddress` varchar(40) NOT NULL,
  `deContact` int(11) NOT NULL,
  `dId` int(11) NOT NULL,
  `prescriptionImage` varchar(40) NOT NULL,
  `cuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliverylogin`
--

CREATE TABLE `deliverylogin` (
  `dPassword` varchar(40) NOT NULL,
  `dUserName` varchar(40) NOT NULL,
  `deId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `status` tinyint(1) NOT NULL,
  `price` int(11) NOT NULL,
  `medId` int(11) NOT NULL,
  `medName` varchar(40) NOT NULL,
  `scienteficName` varchar(40) NOT NULL,
  `diseaseCategory` varchar(40) NOT NULL,
  `prescribeCategory` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `pId` int(11) NOT NULL,
  `pName` varchar(40) NOT NULL,
  `phMobile` varchar(40) NOT NULL,
  `phAddress` varchar(40) NOT NULL,
  `pRegion` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`pId`, `pName`, `phMobile`, `phAddress`, `pRegion`) VALUES
(3, 'ph1', '1234', 'aaa', 'Mirpur'),
(4, 'ph2', '1234', 'aaa', 'Mirpur');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacylogin`
--

CREATE TABLE `pharmacylogin` (
  `phUserName` varchar(40) NOT NULL,
  `phPassword` int(11) NOT NULL,
  `pId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacylogin`
--

INSERT INTO `pharmacylogin` (`phUserName`, `phPassword`, `pId`) VALUES
('ph1', 1234, 3),
('ph2', 12345, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adId`);

--
-- Indexes for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD PRIMARY KEY (`amId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cuId`);

--
-- Indexes for table `customerlogin`
--
ALTER TABLE `customerlogin`
  ADD PRIMARY KEY (`cuId`),
  ADD UNIQUE KEY `cuUserName` (`cuUserName`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deId`);

--
-- Indexes for table `deliveryinfo`
--
ALTER TABLE `deliveryinfo`
  ADD PRIMARY KEY (`dId`);

--
-- Indexes for table `deliverylogin`
--
ALTER TABLE `deliverylogin`
  ADD PRIMARY KEY (`dUserName`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medId`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `pharmacylogin`
--
ALTER TABLE `pharmacylogin`
  ADD PRIMARY KEY (`pId`),
  ADD UNIQUE KEY `phUserName` (`phUserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ambulance`
--
ALTER TABLE `ambulance`
  MODIFY `amId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customerlogin`
--
ALTER TABLE `customerlogin`
  MODIFY `cuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryinfo`
--
ALTER TABLE `deliveryinfo`
  MODIFY `dId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacylogin`
--
ALTER TABLE `pharmacylogin`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
