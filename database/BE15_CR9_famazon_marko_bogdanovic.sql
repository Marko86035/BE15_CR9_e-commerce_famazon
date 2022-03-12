-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 03:38 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be15_cr9_famazon_marko_bogdanovic`
--
CREATE DATABASE IF NOT EXISTS `be15_cr9_famazon_marko_bogdanovic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be15_cr9_famazon_marko_bogdanovic`;

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `fk_product_id` int(11) NOT NULL,
  `fk_payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `addres` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `zip` int(30) NOT NULL,
  `city` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `f_name`, `l_name`, `addres`, `username`, `email`, `zip`, `city`) VALUES
(1, 'Marko', 'Markovic', 'Pfeiffergasse 3', 'marko_m', 'markovic@gmail.com', 1010, 'Wien'),
(2, 'Ben', 'Behoo', 'Kikigasse 4', 'ben_b', 'behoo@gmail.com', 1020, 'Wien'),
(3, 'John', 'Johoo', 'Hallogasse 5', 'john_j', 'johoo@gmail.com', 1030, 'Wien'),
(4, 'Bon', 'Bohoo', 'Kaogasse 6', 'bon_b', 'bohoo@gmail.com', 1040, 'Wien'),
(5, 'Milo', 'Milohoo', 'Kaokaostrasse 7', 'milo_m', 'milohoo@gmail.com', 8010, 'Graz'),
(6, 'Kevin', 'Oto', 'Boasstrasse 8', 'kevin_oto', 'oto@gmail.com', 8042, 'Graz'),
(7, 'Jakob', 'Butler', 'Fletcher Ave 9', 'jakob_b', 'butler@gmail.com', 10001, 'New York'),
(8, 'Mason', 'Bush', 'E South St 99', 'Mason_b', 'bush@gmail.com', 10002, 'New York'),
(9, 'William', 'Green', 'E Hanry St 7', 'william_g', 'green@gmail.com', 75000, 'Paris'),
(10, 'Mickael', 'Gray', 'Maia Atlantis B1', 'mickael_g', 'gray@gmail.com', 75005, 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `fk_customer_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `creditcard` varchar(30) NOT NULL,
  `paypal` varchar(30) NOT NULL,
  `fk_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produces`
--

CREATE TABLE `produces` (
  `fk_shipping_id` int(11) NOT NULL,
  `fk_payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `kind` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `price`, `kind`) VALUES
(1, 'iphone 6', '300e', 'phone'),
(2, 'iphone 8', '500e', 'phone'),
(3, 'iphone 9', '600e', 'phone'),
(4, 'iphone 10', '800e', 'phone'),
(5, 'iphone 11', '900e', 'phone'),
(6, 'tablet 12', '986e', 'tablet'),
(7, 'tablet 13', '960e', 'tablet'),
(8, 'tablet 14', '1100e', 'tablet'),
(9, 'apple_computer 2', '5000e', 'computer'),
(10, 'apple_computer 3', '6000e', 'computer');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_company`
--

CREATE TABLE `shipping_company` (
  `shipping_id` int(11) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `company_addres` varchar(30) NOT NULL,
  `phone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping_company`
--

INSERT INTO `shipping_company` (`shipping_id`, `company_name`, `company_addres`, `phone`) VALUES
(1, 'OllProduct', 'Dadagasse 3', '111-111-111'),
(2, 'HahaOll', 'Piogasse  6', '222-222-222'),
(3, 'OllProduct', 'Dadagasse 3', '333-333-333'),
(4, 'NummerCompany', 'Keissergasse  12', '444-444-444'),
(5, 'LogiCompany', 'Allesstrasse 98', '555-555-555');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD KEY `fk_product_id` (`fk_product_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`fk_customer_id`,`fk_product_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `produces`
--
ALTER TABLE `produces`
  ADD PRIMARY KEY (`fk_shipping_id`,`fk_payment_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shipping_company`
--
ALTER TABLE `shipping_company`
  ADD PRIMARY KEY (`shipping_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipping_company`
--
ALTER TABLE `shipping_company`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `produces`
--
ALTER TABLE `produces`
  ADD CONSTRAINT `produces_ibfk_1` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `produces_ibfk_2` FOREIGN KEY (`fk_shipping_id`) REFERENCES `shipping_company` (`shipping_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
