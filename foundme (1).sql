-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 21, 2020 at 08:38 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foundme`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `compigan_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  KEY `fk_users` (`user_id`),
  KEY `compigan_id` (`compigan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `compigans`
--

DROP TABLE IF EXISTS `compigans`;
CREATE TABLE IF NOT EXISTS `compigans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `galary` text NOT NULL,
  `descrption` text NOT NULL,
  `file` text NOT NULL,
  `tags` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `cost` double NOT NULL,
  `duration` int(11) NOT NULL,
  `pending` int(11) NOT NULL DEFAULT '0',
  `updates` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
CREATE TABLE IF NOT EXISTS `donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compigan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `compigan_id` (`compigan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `compigan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `compigan_id` (`compigan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `value`, `user_id`) VALUES
(1, 'First Name', 'ae', 18),
(2, 'First Name', 'ali', 19),
(3, 'First Name', 'ali', 20),
(4, 'Last Name', 'mohammed', 20),
(5, 'Phone', '0775024000', 20),
(6, 'First Name', 'ali', 21),
(7, 'Last Name', 'mohammed', 21),
(8, 'Phone', '0775024000', 21),
(9, 'First Name', '', 22),
(10, 'Last Name', '', 22),
(11, 'Phone', '', 22),
(12, 'First Name', '', 23),
(13, 'Last Name', '', 23),
(14, 'Phone', '', 23),
(15, 'First Name', '', 24),
(16, 'Last Name', '', 24),
(17, 'Phone', '', 24),
(18, 'First Name', 'Mohammed', 25),
(19, 'Last Name', 'Azman', 25),
(20, 'Phone', '0775024000', 25),
(21, 'First Name', 'admin', 26),
(22, 'Last Name', 'admin', 26),
(23, 'Phone', '7750240000', 26);

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

DROP TABLE IF EXISTS `shares`;
CREATE TABLE IF NOT EXISTS `shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `compigan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `compigan_id` (`compigan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `status`, `type`, `created_at`) VALUES
(1, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 14:33:06'),
(2, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 14:37:13'),
(3, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 14:38:28'),
(4, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 14:38:56'),
(5, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 14:58:04'),
(6, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:05:03'),
(7, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:05:05'),
(8, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:05:08'),
(9, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:05:41'),
(10, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:56:14'),
(11, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:56:51'),
(12, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:57:26'),
(13, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 15:57:46'),
(14, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:01:44'),
(15, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:03:05'),
(16, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:03:31'),
(17, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:03:54'),
(18, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:04:05'),
(19, 'azmman2012@gmail.com', '775024000', 1, 'User', '2020-01-20 16:06:43'),
(20, 'azmman2012@gmail.com', '775024000', 1, 'User', '2020-01-20 16:09:48'),
(21, 'azmman2012@gmail.com', '775024000', 1, 'User', '2020-01-20 16:15:22'),
(22, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:15:34'),
(23, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:18:06'),
(24, 'admin@gmail.com', 'admin', 1, 'User', '2020-01-20 16:18:19'),
(25, 'eda@gmail.com', 'f0ce4bfc3a2187057bb4eefdd4ce55fc', 1, 'User', '2020-01-20 16:46:30'),
(26, 'admin@gmail.com', '1d43a95f76d1da7b3c39597ecf00121e', 1, 'Admin', '2020-01-21 08:35:51');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_compigans` FOREIGN KEY (`compigan_id`) REFERENCES `compigans` (`id`),
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `compigans`
--
ALTER TABLE `compigans`
  ADD CONSTRAINT `compigans_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`compigan_id`) REFERENCES `compigans` (`id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`compigan_id`) REFERENCES `compigans` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `shares`
--
ALTER TABLE `shares`
  ADD CONSTRAINT `shares_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shares_ibfk_2` FOREIGN KEY (`compigan_id`) REFERENCES `compigans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
