-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2022 at 06:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jonah`
--
CREATE DATABASE IF NOT EXISTS `jonah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jonah`;

-- --------------------------------------------------------

--
-- Table structure for table `pd`
--

CREATE TABLE `pd` (
  `fname` char(30) DEFAULT NULL,
  `sname` char(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `Blood_group` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pd`
--

INSERT INTO `pd` (`fname`, `sname`, `email`, `password`, `date`, `gender`, `Blood_group`) VALUES
('Jonah', 'Jayasingh', 'jayasinghjonah@gmail.com', 'jonah', '2002-07-11', 'M', 'B+'),
('ghost', 'ghost', 'ghost@gmail.com', 'ghost', '2002-07-11', 'M', 'O-'),
('king', 'king', 'king@gmail.com', 'king', '2000-07-25', 'M', 'O-'),
('tom', 'tom', 'tom@gmail.com', 'tom', '2000-05-25', 'M', 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `pr`
--

CREATE TABLE `pr` (
  `fname` char(30) DEFAULT NULL,
  `sname` char(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pr`
--

INSERT INTO `pr` (`fname`, `sname`, `email`, `hospital_name`, `password`, `gender`) VALUES
('king', 'King', 'King@gmail.com', 'king', 'king', 'M'),
('ghost', 'ghost', 'ghost@gmail.com', 'ghost', 'ghost', 'M');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pd`
--
ALTER TABLE `pd`
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pr`
--
ALTER TABLE `pr`
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `hospital_name` (`hospital_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
