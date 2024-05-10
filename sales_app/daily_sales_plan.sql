-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 11:54 AM
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
-- Database: `daily_sales_plan`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `daily_sales_id` int(11) NOT NULL,
  `location_id` text DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `client_contact_no` varchar(20) DEFAULT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `prospect` varchar(10) DEFAULT NULL,
  `demo` varchar(10) DEFAULT NULL,
  `poc` varchar(10) DEFAULT NULL,
  `proposal` varchar(10) DEFAULT NULL,
  `closure` varchar(10) DEFAULT NULL,
  `opportunity` varchar(10) DEFAULT NULL,
  `revenue` decimal(10,2) DEFAULT NULL,
  `advance_amount_proposed` decimal(10,2) DEFAULT NULL,
  `closure_time_frame` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Status` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `user_id`, `daily_sales_id`, `location_id`, `client_name`, `client_address`, `client_contact_no`, `client_email`, `prospect`, `demo`, `poc`, `proposal`, `closure`, `opportunity`, `revenue`, `advance_amount_proposed`, `closure_time_frame`, `remarks`, `created_at`, `updated_at`, `Status`) VALUES
(1, 4, 1, 'sdfsf', 'nikita', 'pune', '7664345627', 'nikita@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 17:58:35', NULL, '0'),
(2, 4, 1, 'sdfsf', 'mayur', 'pune', '6746535346', 'mayur@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 17:59:31', NULL, '0'),
(3, 4, 1, 'sdfsf', 'kavita', 'pune', '8767564654', 'kavita@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 18:00:48', NULL, '0'),
(4, 4, 1, 'sdfsf', 'nimish', 'pune', '9878968766', 'nimish@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 18:01:28', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `daily_sales`
--

CREATE TABLE `daily_sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `location` text NOT NULL,
  `no_call_planned` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_sales`
--

INSERT INTO `daily_sales` (`id`, `user_id`, `date`, `location`, `no_call_planned`, `created_at`, `updated_at`) VALUES
(1, 4, '2024-04-19', 'rfdfv', 4, '2024-04-19 17:49:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lat_long` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Status` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Status` enum('0','1') DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `created_at`, `updated_at`, `Status`, `type`, `admin_id`) VALUES
(1, 'Nikita', 'superadmin@gmail.com', 'nikita', '123456', '2024-04-19 16:26:39', '2024-04-19 16:27:45', '0', 'superadmin', 0),
(2, 'Ankita', 'ankita@gmail.com', 'ankita', 'ankita1234', '2024-04-19 16:28:44', '2024-04-19 16:28:44', '1', 'admin', 1),
(3, 'Mangesh', 'mangesh@gmail.com', 'mangesh', '12345', '2024-04-19 16:30:05', '2024-04-19 16:30:05', '1', 'sales', 1),
(4, 'achal', 'achal@gmail.com', 'achal', 'achal123', '2024-04-19 16:31:21', '2024-04-19 16:31:21', '1', 'sales', 2),
(5, 'Akhilesh Dandi', 'akhileshdandi@gmail.com', 'akhi_4509', '12345', '2024-05-09 06:11:32', NULL, '0', 'admin', NULL),
(6, '', '', '', '', '2024-05-10 09:20:56', NULL, '0', 'admin', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daily_sales_id` (`daily_sales_id`);

--
-- Indexes for table `daily_sales`
--
ALTER TABLE `daily_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `daily_sales`
--
ALTER TABLE `daily_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_daily_sales_id` FOREIGN KEY (`daily_sales_id`) REFERENCES `daily_sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_sales`
--
ALTER TABLE `daily_sales`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
