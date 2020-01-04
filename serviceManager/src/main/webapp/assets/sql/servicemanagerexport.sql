-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2019 at 09:45 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `servicemanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `licence_plate` varchar(10) NOT NULL,
  `brand` varchar(10) DEFAULT NULL,
  `model` varchar(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `licence_plate`, `brand`, `model`, `active`) VALUES
(1, 'VN06PYC', 'FORD', 'C MAX', 0),
(2, 'VN39PYC', 'HYUNDAI', 'TUCSON', 0),
(3, 'VN25HUY', 'Mercedes', 'C220', 1),
(4, 'VN25HUY', 'Mercedes', 'C220', 1),
(5, 'VN25HUY', 'Mercedes', 'C220', 1),
(6, 'VN25HUY', 'Mercedes', 'C220', 1),
(7, 'VN02MIC', 'Mercedes', 'E200', 1),
(8, 'vn23rge', 'opel', 'meriva', 0),
(9, 'vn25wlo', 'daewoo', 'cielo', 0),
(10, 'wec', 'wef', 'wrf', 0),
(11, 'ev', 'erv', 'er', 0),
(12, 'werf', 'erf', 'erf', 0),
(13, 'fghxt', 'rdturdu', 'druyruy', 0),
(14, 'guog', '7o8l', 'g78o', 0),
(15, 'hgv', 'fgh', 'dfg', 0),
(16, 'dzfg', 'degr', 'erg', 0),
(17, 'wd', 'wed', 'wefd', 0),
(18, 'jhk,', '.kgj', 'jjjjl.', 0),
(19, 'stdh', 'zdh', 'dth', 0),
(20, 'saerg', 'erg', 'egrgg', 0),
(21, 'fadfsfs', 'sfsef', 'wefef', 0),
(22, 'njk', 'hil', 'hil', 0),
(23, '5tyh', 'rth', 'rth', 0),
(24, 'sthe', 'ththethet', 'hthrht', 0),
(25, 'p[0', '=]', '', 0),
(26, 'bii', 'kulu', 'ulo', 0),
(27, 'qw', 'qw', 'qw', 0),
(28, 'wq', 'qw', 'qw', 0),
(29, 'x', 'x', 'x', 0),
(30, 'hh', '', '', 0),
(31, 'd', 'rf', 'wef', 0),
(32, 'ef', 'wef', 'wef', 0),
(33, 'wef', 'wref', 'ergf', 0),
(34, 'dc', 'rf', 'ref', 0),
(35, 'gkj', 'gk', 'gk', 0),
(36, 'gkxtuk', 'dthdygh', 'sgsdgsrg', 0),
(37, 'erf', 'rfer', 'erferf', 0),
(38, 'jbchcu', 'hv', 'pohc', 0),
(39, 'ghfg', 'fghfgh', 'fghfg', 0),
(40, 'khk', 'hihi', 'hihi', 0),
(41, 'gxtsudu', 'cjjvb', ';k thcv', 0),
(42, 'wf', 'weffwefw', 'wefewfwf', 0),
(43, 'fvav', 'ewrgerge', 'grgerg', 0),
(44, 'ryj', 'tjyjtyj', 'tyjtyj', 0),
(45, 'tyjytjt', 'tyjtyjt', 'tyjtyj', 0),
(46, 'srthrthrt', 'hrthrthr', 'thtrh', 0),
(47, 'rthrtrt', 'hrthrth', 'rthrtht', 0),
(48, 'srth', 'drth', 'rsth', 0),
(49, 'ergerg', 'rgegerg', 'egeerg', 0),
(50, 'ergreg', 'erger', 'ergerg', 0),
(51, 'hchc', 'bch', 'jgfuf', 0),
(52, 'Bdk', 'Bd', 'Hd9e', 0),
(53, 'ktuk', 'tukt', 'uktuk', 0),
(54, 'hfcdh', 'jgh', 'hfxt', 0),
(55, 'iyf', 'ewdwe', 'wed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `insurers`
--

CREATE TABLE `insurers` (
  `insurer_id` int(11) NOT NULL,
  `insurer_name` varchar(20) DEFAULT NULL,
  `insurer_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurers`
--

INSERT INTO `insurers` (`insurer_id`, `insurer_name`, `insurer_active`) VALUES
(1, 'GroupAMA', 0),
(2, 'CITY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_case`
--

CREATE TABLE `service_case` (
  `case_id` int(11) NOT NULL,
  `case_car_id` int(11) NOT NULL,
  `case_workshop_id` int(11) DEFAULT NULL,
  `case_active` tinyint(1) DEFAULT NULL,
  `case_insurer_id` int(11) DEFAULT NULL,
  `case_work_order` int(11) DEFAULT NULL,
  `case_entry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_case`
--

INSERT INTO `service_case` (`case_id`, `case_car_id`, `case_workshop_id`, `case_active`, `case_insurer_id`, `case_work_order`, `case_entry_date`) VALUES
(8, 7, NULL, NULL, NULL, NULL, NULL),
(10, 26, NULL, NULL, NULL, NULL, NULL),
(11, 26, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_users`
--

CREATE TABLE `service_users` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(20) NOT NULL,
  `user_last_name` varchar(20) NOT NULL,
  `user_nickname` varchar(20) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_securitykey` varchar(10) NOT NULL,
  `user_role` varchar(10) NOT NULL,
  `user_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_users`
--

INSERT INTO `service_users` (`user_id`, `user_first_name`, `user_last_name`, `user_nickname`, `user_email`, `user_password`, `user_securitykey`, `user_role`, `user_active`) VALUES
(1, 'Dragos', 'Damian', 'Damdravic', 'damian.dragos@gmail.com', '31228180', '1', 'MANAGER', 1),
(2, 'Anisoara', 'Damian', 'Damannyy', 'damian.anisoara@gmail.com', '31228180', '31', 'ADMIN', 1),
(3, 'Betty', 'Damian', 'Bettydendam', 'bettydendam@gmail.com', '31228180', '1', 'user', 1),
(4, 'asdas', 'adadsad', 'dasdsad', 'ssadadsad', 'adasd', '222', 'asdasd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

CREATE TABLE `workshop` (
  `workshop_id` int(11) NOT NULL,
  `workshop_name` varchar(50) NOT NULL,
  `workshop_description` varchar(40) DEFAULT NULL,
  `workshop_imageUrl` varchar(40) DEFAULT NULL,
  `workshop_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workshop`
--

INSERT INTO `workshop` (`workshop_id`, `workshop_name`, `workshop_description`, `workshop_imageUrl`, `workshop_active`) VALUES
(27, 'Vopsitorie', 'atelier vopsitorie', '#', 0),
(30, 'Mecanica', 'atelier mecanica', '##', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `insurers`
--
ALTER TABLE `insurers`
  ADD PRIMARY KEY (`insurer_id`);

--
-- Indexes for table `service_case`
--
ALTER TABLE `service_case`
  ADD PRIMARY KEY (`case_id`),
  ADD KEY `case_car_id` (`case_car_id`),
  ADD KEY `case_workshop_id` (`case_workshop_id`),
  ADD KEY `case_insurer_id` (`case_insurer_id`);

--
-- Indexes for table `service_users`
--
ALTER TABLE `service_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`workshop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `insurers`
--
ALTER TABLE `insurers`
  MODIFY `insurer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_case`
--
ALTER TABLE `service_case`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `service_users`
--
ALTER TABLE `service_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workshop`
--
ALTER TABLE `workshop`
  MODIFY `workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `service_case`
--
ALTER TABLE `service_case`
  ADD CONSTRAINT `service_case_ibfk_1` FOREIGN KEY (`case_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `service_case_ibfk_2` FOREIGN KEY (`case_workshop_id`) REFERENCES `workshop` (`workshop_id`),
  ADD CONSTRAINT `service_case_ibfk_3` FOREIGN KEY (`case_insurer_id`) REFERENCES `insurers` (`insurer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
