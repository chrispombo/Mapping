-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2026 at 09:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `funeraltoril_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`) VALUES
(3, 'admin_toril', '$2y$10$3dziYVb.dxf9H8hMwl8uh.gumnL25vmoKrQqBluLlbthUpbaLm2.u'),
(10, 'admin', '$2y$10$N11nU5JCZRei58klScAszOKesPxS0l/IlympBxp08295W.bgz7lAa');

-- --------------------------------------------------------

--
-- Table structure for table `burial_records`
--

CREATE TABLE `burial_records` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `death_date` date DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `block` varchar(50) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `burial_records`
--

INSERT INTO `burial_records` (`id`, `name`, `death_date`, `section`, `block`, `lot`, `lat`, `lng`, `created_at`) VALUES
(1, 'Jheremi Andilab', '0000-00-00', 'A', '1', '11', 7.04053145, 125.49483731, '2026-02-08 07:33:53'),
(2, 'kean pombo', '2026-02-08', 'A', '2', '11', 7.04060665, 125.49475081, '2026-02-08 08:07:00'),
(3, 'Aj', '2026-02-28', 'A', '1', '63', 7.04107716, 125.49516790, '2026-02-28 08:00:55'),
(4, 'qer', '2026-02-28', 'c', '1', '56', 7.04209337, 125.49496874, '2026-02-28 08:03:20'),
(5, 'kajSD', '0000-00-00', 'A', '1', '456', 7.06108351, 125.55168271, '2026-02-28 08:14:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `burial_records`
--
ALTER TABLE `burial_records`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `burial_records`
--
ALTER TABLE `burial_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
