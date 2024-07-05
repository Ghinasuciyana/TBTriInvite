-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 05, 2024 at 04:16 AM
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
-- Database: `triinvite`
--

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khitan_data`
--

CREATE TABLE `khitan_data` (
  `id` int(11) NOT NULL,
  `namaDikhitan` varchar(255) DEFAULT NULL,
  `namaOrangTua` varchar(255) DEFAULT NULL,
  `tanggalAcara` date DEFAULT NULL,
  `jamAcara` time DEFAULT NULL,
  `lokasiAcara` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khitan_data`
--

INSERT INTO `khitan_data` (`id`, `namaDikhitan`, `namaOrangTua`, `tanggalAcara`, `jamAcara`, `lokasiAcara`) VALUES
(1, 'kimo', 'bardia', '2024-07-05', '10:29:00', 'garut'),
(7, 'nsnsn', '1wsa', '2024-07-10', '10:52:00', 'gart'),
(9, 'an1', '1234', '2024-07-07', '10:15:00', 'csq'),
(10, '123442', 'msmsms', '2024-07-06', '11:17:00', 'msmsm'),
(11, 'umm', 'asda', '2024-07-10', '09:23:00', 'gart'),
(12, 'hahas', 'qsas', '2024-07-05', '10:32:00', 'gartt'),
(13, 'gakk', 'asdc', '2024-07-06', '10:38:00', 'garut'),
(14, 'bsmmm', 'gah', '2024-07-11', '10:54:00', 'sssaq'),
(15, 'bsmmm', 'gah', '2024-07-11', '10:54:00', 'sssaq'),
(16, 'bsmmm', 'gah', '2024-07-11', '10:54:00', 'sssaq'),
(17, 'nmbvc', 'klo', '2024-07-19', '11:05:00', 'bru'),
(18, 'nmaa', 'otr', '2024-07-12', '11:12:00', 'gatt'),
(19, 'garr', 'kala', '2024-07-13', '12:01:00', 'gartt'),
(20, 'radut', 'kino&kimii', '2024-07-27', '22:27:00', 'garut'),
(21, 'radut', 'kino&kimii', '2024-07-27', '22:27:00', 'garut'),
(22, 'hahha', 'awsa', '2024-07-18', '17:01:00', 'garutt'),
(23, 'roy', 'sarti & monti', '2024-07-31', '10:00:00', 'banten'),
(24, 'unee', 'amakak', '2024-07-18', '08:36:00', 'byb'),
(25, 'nnama', 'othahha', '2024-07-26', '10:43:00', 'grtt');

-- --------------------------------------------------------

--
-- Table structure for table `selected_packages`
--

CREATE TABLE `selected_packages` (
  `id` int(11) NOT NULL,
  `selectedPackage` varchar(255) NOT NULL,
  `selectedPackagePrice` decimal(10,2) NOT NULL,
  `packageDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selected_packages`
--

INSERT INTO `selected_packages` (`id`, `selectedPackage`, `selectedPackagePrice`, `packageDescription`) VALUES
(29, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(34, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(35, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(36, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(37, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(38, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(39, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(40, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(41, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(42, 'Paket 3', 200000.00, 'VIP: Rp.200.000/masa aktif 30 hari'),
(43, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(44, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(45, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(46, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(47, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(48, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(49, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(50, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(51, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(52, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(53, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(54, 'Paket 3', 200000.00, 'VIP: Rp.200.000/masa aktif 30 hari'),
(55, 'Paket 3', 200000.00, 'VIP: Rp.200.000/masa aktif 30 hari'),
(56, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(57, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(58, 'Paket 2', 110000.00, 'Medium: Rp.110.000/masa aktif 14 hari'),
(59, 'Paket 1', 70000.00, 'Standar: Rp.70.000/masa aktif 7 hari'),
(60, 'Paket 3', 200000.00, 'VIP: Rp.200.000/masa aktif 30 hari'),
(61, 'Paket 3', 200000.00, 'VIP: Rp.200.000/masa aktif 30 hari');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `selectedPackage` varchar(255) NOT NULL,
  `packagePrice` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `selectedPackage`, `packagePrice`, `payment_method`, `created_at`) VALUES
(4, 'Paket 2', 110000.00, 'Gopay', '2024-07-04 08:27:40'),
(15, 'Paket 1', 70000.00, 'Gopay', '2024-07-04 09:40:10'),
(16, 'Paket 3', 200000.00, 'Gopay', '2024-07-04 09:42:37'),
(17, 'Paket 3', 200000.00, 'OVO', '2024-07-04 09:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(0, 'gina', '123', '$2y$10$CwtcRYws/rmCIckDOO1MOuCbxQoY1JqNjLj/D02av7FC8BL0UUdZq'),
(0, 'user1', '111@gmailcom', '$2y$10$b5GbybqtAnrcWBQaucZyduWtJot6hreg8YzblzwAgnzAhd/MIdaJW');

-- --------------------------------------------------------

--
-- Table structure for table `wedding_data`
--

CREATE TABLE `wedding_data` (
  `id` int(11) NOT NULL,
  `namaMempelaiWanita` varchar(255) DEFAULT NULL,
  `orangTuaWanita` varchar(255) DEFAULT NULL,
  `anakKeWanita` varchar(255) DEFAULT NULL,
  `namaMempelaiPria` varchar(255) DEFAULT NULL,
  `orangTuaPria` varchar(255) DEFAULT NULL,
  `anakKePria` varchar(255) DEFAULT NULL,
  `tanggalAkad` date DEFAULT NULL,
  `jamAkad` time DEFAULT NULL,
  `tanggalResepsi` date DEFAULT NULL,
  `jamResepsi` time DEFAULT NULL,
  `lokasiAcara` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `khitan_data`
--
ALTER TABLE `khitan_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selected_packages`
--
ALTER TABLE `selected_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wedding_data`
--
ALTER TABLE `wedding_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `khitan_data`
--
ALTER TABLE `khitan_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `selected_packages`
--
ALTER TABLE `selected_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wedding_data`
--
ALTER TABLE `wedding_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
