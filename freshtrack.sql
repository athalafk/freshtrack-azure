-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2025 at 10:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freshtrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

USE railway;

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 'Beras', 'kg', '2025-03-26 12:08:06', '2025-03-30 04:31:56'),
(2, 'Minyak Goreng', 'liter', '2025-03-26 12:08:06', '2025-03-26 12:08:06'),
(3, 'Gula', 'kg', '2025-03-26 12:08:06', '2025-03-26 12:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `batch_barang`
--

CREATE TABLE `batch_barang` (
  `id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `tanggal_kadaluarsa` date NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `batch_barang`
--

INSERT INTO `batch_barang` (`id`, `barang_id`, `tanggal_kadaluarsa`, `stok`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-03-31', 50, '2025-03-26 12:08:06', '2025-03-30 04:08:53'),
(2, 1, '2026-03-30', 10, '2025-03-26 12:08:06', '2025-03-26 12:08:06'),
(3, 2, '2025-04-30', 40, '2025-03-26 12:08:06', '2025-03-26 12:08:06'),
(4, 3, '2025-10-01', 10, '2025-03-26 12:08:06', '2025-03-26 12:08:06'),
(5, 3, '2025-07-27', 20, '2025-03-26 12:08:06', '2025-03-26 12:08:06'),
(6, 1, '2026-04-15', 60, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(7, 1, '2026-05-30', 70, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(8, 2, '2026-04-30', 80, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(9, 3, '2026-10-01', 90, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(10, 3, '2026-07-27', 100, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(11, 1, '2027-04-15', 10, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(12, 1, '2027-03-30', 20, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(13, 2, '2027-04-30', 30, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(14, 3, '2027-10-01', 40, '2025-03-30 04:51:49', '2025-03-30 04:51:49'),
(15, 3, '2027-07-27', 50, '2025-03-30 04:51:49', '2025-03-30 04:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staf') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2b$10$aqVJYck02x4pRvDMtWt6R.iDfT5u0KLay6w.43lsIQghJ3fsGNo3G', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch_barang`
--
ALTER TABLE `batch_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `batch_barang`
--
ALTER TABLE `batch_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch_barang`
--
ALTER TABLE `batch_barang`
  ADD CONSTRAINT `batch_barang_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
