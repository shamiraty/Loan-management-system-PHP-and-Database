-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2023 at 10:23 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loanmis`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Fullname` varchar(100) GENERATED ALWAYS AS (concat(`FirstName`,' ',`LastName`)) VIRTUAL,
  `Resident` enum('West Dodoma','Noth Kilimanjaro','Arusha','Coast Region','Darusalam') DEFAULT NULL,
  `NationalID` varchar(100) NOT NULL,
  `RequestedLoan` double DEFAULT NULL,
  `LoanTax` double DEFAULT 10,
  `DirectCost` double DEFAULT 10,
  `TotalLoanCost` double GENERATED ALWAYS AS (`RequestedLoan` * (`LoanTax` + `DirectCost`) / 100) STORED,
  `TakenAmount` double GENERATED ALWAYS AS (`RequestedLoan` - `RequestedLoan` * (`LoanTax` + `DirectCost`) / 100) STORED,
  `ActualDebt` double GENERATED ALWAYS AS (`RequestedLoan` + `RequestedLoan` * (`LoanTax` + `DirectCost`) / 100) STORED,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `RemainAmount` double DEFAULT 0,
  `Status` varchar(100) DEFAULT 'Installments on Progress',
  `password` varchar(250) NOT NULL,
  `AddedBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`FirstName`, `LastName`, `Resident`, `NationalID`, `RequestedLoan`, `LoanTax`, `DirectCost`, `created_at`, `RemainAmount`, `Status`, `password`, `AddedBy`) VALUES
('INDRA', 'MAHENDER', 'Coast Region', '2023-0001', 2000000, 10, 10, '2023-04-08 09:57:23', 0, 'Installments on Progress', '202cb962ac59075b964b07152d234b70', 'james'),
('NARESH ', 'KUMAR', NULL, '2023-0002', 160000, 10, 10, '2023-04-08 09:57:23', 0, 'Installments on Progress', '202cb962ac59075b964b07152d234b70', 'james'),
('ARUN', 'KUMAR', 'Coast Region', '2023-0003', 10000000, 10, 10, '2023-04-08 09:59:34', 11807000, 'Installments on Progress', '202cb962ac59075b964b07152d234b70', 'james'),
('SURENDRA', 'SHARMA', 'Noth Kilimanjaro', '2023-0004', 1500000, 10, 10, '2023-04-08 09:59:34', 0, 'Installments on Progress', '202cb962ac59075b964b07152d234b70', 'james'),
('RAMESH ', ' KUMAR', 'Coast Region', '2023-0005', 1200000, 10, 10, '2023-04-08 10:02:01', 0, 'Installments on Progress', '202cb962ac59075b964b07152d234b70', 'james'),
('ARJUN ', 'CHAND', 'Coast Region', '2023-0006', 5000000, 10, 10, '2023-04-08 10:02:01', 0, 'Complited', '202cb962ac59075b964b07152d234b70', 'james');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Fullname` varchar(100) GENERATED ALWAYS AS (concat(`FirstName`,' ',`LastName`)) VIRTUAL,
  `Resident` enum('West Dodoma','Noth Kilimanjaro','Arusha','Coast Region','Darusalam') DEFAULT NULL,
  `Username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`FirstName`, `LastName`, `Resident`, `Username`) VALUES
('james', 'halfan', 'West Dodoma', 'james');

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `id` int(11) NOT NULL,
  `InstalledAmount` double DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `National_ID` varchar(100) DEFAULT NULL,
  `EmployeeUsername` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `installments`
--

INSERT INTO `installments` (`id`, `InstalledAmount`, `created_at`, `National_ID`, `EmployeeUsername`) VALUES
(11, 10000, '2023-04-08 10:02:46', '2023-0006', 'james'),
(12, 1000, '2023-04-08 10:02:46', '2023-0006', 'james'),
(13, 1000, '2023-04-08 10:03:02', '2023-0006', 'james'),
(14, 1000, '2023-04-08 10:03:02', '2023-0006', 'james'),
(15, 9000, '2023-04-08 10:03:15', '2023-0006', 'james'),
(16, 1000, '2023-04-08 10:03:15', '2023-0006', 'james'),
(17, 2023, '2023-04-08 10:04:06', '2023-0006', 'james'),
(18, 5974977, '2023-04-08 10:06:58', '2023-0006', 'james'),
(20, 1000, '2023-04-08 10:07:56', '2023-0003', 'james'),
(21, 1000, '2023-04-08 10:07:56', '2023-0003', 'james'),
(22, 1000, '2023-04-08 10:08:20', '2023-0003', 'james'),
(23, 90000, '2023-04-08 10:08:20', '2023-0003', 'james'),
(24, 10000, '2023-04-08 10:08:38', '2023-0003', 'james'),
(25, 90000, '2023-04-08 10:08:38', '2023-0003', 'james');

--
-- Triggers `installments`
--
DELIMITER $$
CREATE TRIGGER `compute` AFTER INSERT ON `installments` FOR EACH ROW begin
 set @ActualDebt=
(
  select ActualDebt
  from Customers where
  NationalID=new.National_ID
);
set @totalInstallment=
(
select sum(InstalledAmount)
from Installments where 
National_ID=new.National_ID
);
if @totalInstallment>@ActualDebt
then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'complited';
end if;
update Customers set RemainAmount=@ActualDebt-@totalInstallment 
where Customers.NationalID=new.National_ID;
 if @totalInstallment=@ActualDebt 
 then
 update Customers set Status='Complited'
 where NationalID=new.National_ID;
 end if;
 end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `NationalID` varchar(100) DEFAULT NULL,
  `Heading` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT 'Disapproved',
  `message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`NationalID`),
  ADD KEY `customerIndex` (`NationalID`,`Fullname`),
  ADD KEY `AddedBy` (`AddedBy`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `National_ID` (`National_ID`),
  ADD KEY `EmployeeUsername` (`EmployeeUsername`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD KEY `NationalID` (`NationalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`AddedBy`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_ibfk_1` FOREIGN KEY (`National_ID`) REFERENCES `customers` (`NationalID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `installments_ibfk_2` FOREIGN KEY (`EmployeeUsername`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`NationalID`) REFERENCES `customers` (`NationalID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
