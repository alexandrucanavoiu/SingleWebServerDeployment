############ SQL

-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2020 at 03:14 PM
-- Server version: 5.7.29
-- PHP Version: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postfix`
--

-- --------------------------------------------------------

--
-- Table structure for table `virtual_aliases`
--

CREATE TABLE `virtual_aliases` (
`id` int(11) NOT NULL,
`domain_id` int(11) NOT NULL,
`source` varchar(100) NOT NULL,
`destination` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_domains`
--

CREATE TABLE `virtual_domains` (
`id` int(11) NOT NULL,
`name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_users`
--

CREATE TABLE `virtual_users` (
`id` int(11) NOT NULL,
`domain_id` int(11) NOT NULL,
`password` varchar(106) NOT NULL,
`email` varchar(100) NOT NULL,
`user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `virtual_aliases`
--
ALTER TABLE `virtual_aliases`
ADD PRIMARY KEY (`id`),
ADD KEY `domain_id` (`domain_id`);

--
-- Indexes for table `virtual_domains`
--
ALTER TABLE `virtual_domains`
ADD PRIMARY KEY (`id`);

--
-- Indexes for table `virtual_users`
--
ALTER TABLE `virtual_users`
ADD PRIMARY KEY (`id`),
ADD KEY `domain_id` (`domain_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `virtual_aliases`
--
ALTER TABLE `virtual_aliases`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_domains`
--
ALTER TABLE `virtual_domains`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_users`
--
ALTER TABLE `virtual_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `virtual_aliases`
--
ALTER TABLE `virtual_aliases`
ADD CONSTRAINT `virtual_aliases_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `virtual_users`
--
ALTER TABLE `virtual_users`
ADD CONSTRAINT `virtual_users_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;