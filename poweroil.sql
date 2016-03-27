-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Mar 27, 2016 at 07:41 PM
-- Server version: 5.5.42
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Poweroil`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(20) NOT NULL,
  `category_descripiton` varchar(500) NOT NULL,
  `category_order` int(11) NOT NULL,
  `category_update` varchar(50) NOT NULL,
  `category_created` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_title`, `category_descripiton`, `category_order`, `category_update`, `category_created`) VALUES
(1, 'Cooking and culinary', 'This category includes item that has to do with cooking utensils, cooking ingredients and cooking services', 0, '1455996763', '1455996763');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_amount` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applied_trans` int(11) NOT NULL,
  `generated_trans` int(11) NOT NULL,
  `applied_date` varchar(20) NOT NULL,
  `generated_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_no` int(11) NOT NULL,
  `item_category` varchar(10) NOT NULL,
  `item_type` varchar(20) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_rate` varchar(10) NOT NULL,
  `item_discount` varchar(10) NOT NULL,
  `item_description` varchar(300) NOT NULL,
  `item_lowest_quantity` int(11) NOT NULL,
  `item_measuring_metric` varchar(50) NOT NULL,
  `item_tag` varchar(1000) NOT NULL,
  `item_profile_img` varchar(100) NOT NULL,
  `item_images` varchar(500) NOT NULL,
  `date_created` varchar(10) NOT NULL,
  `last_updated` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_no`, `item_category`, `item_type`, `item_name`, `item_rate`, `item_discount`, `item_description`, `item_lowest_quantity`, `item_measuring_metric`, `item_tag`, `item_profile_img`, `item_images`, `date_created`, `last_updated`) VALUES
(4, '1', 'Service', '1.5 Liter Bottle', '500', '5', 'godies for sale... that''s all and more', 12, 'Sachet', 'Affordable, sachet', '14591003191.jpg', '14591003191.jpg,14591003001.jpg', '1457690464', '1459100337'),
(6, '1', '0', '50CL Bottle', '400', '5', 'this the final test for the Poweroil test engine.', 6, 'bottles', 'Product, Product, Product', '14591003871.jpg', '14591003871.jpg', '1457690821', '1459100394'),
(8, '1', 'Product', '10 CL sachet', '100', '5', 'this is the final description of the product', 1, 'dozens', 'cooking, oilly', '14591004461.jpg', '14591004461.jpg', '1457765824', '1459100452');

-- --------------------------------------------------------

--
-- Table structure for table `order_basket`
--

CREATE TABLE `order_basket` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `basket_id` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` varchar(10) NOT NULL,
  `discount` varchar(10) NOT NULL,
  `total_amount` varchar(20) NOT NULL,
  `date` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_basket`
--

INSERT INTO `order_basket` (`order_id`, `item_id`, `basket_id`, `quantity`, `rate`, `discount`, `total_amount`, `date`, `user_id`) VALUES
(4, 4, '56f7f01bd3e21', 12, '500', '5', '6000', '1459089435', '10154014627988570'),
(5, 6, '56f7f01bd3e21', 6, '400', '5', '2400', '1459089435', '10154014627988570'),
(6, 8, '56f7f01bd3e21', 1, '100', '5', '100', '1459089435', '10154014627988570'),
(7, 4, '56f7f3b986e0f', 12, '500', '5', '6000', '1459090361', '10154014627988570'),
(8, 6, '56f7f3b986e0f', 6, '400', '5', '2400', '1459090361', '10154014627988570'),
(9, 8, '56f7f3b986e0f', 1, '100', '5', '100', '1459090361', '10154014627988570'),
(10, 4, '56f7f3fc7fc8f', 12, '500', '5', '6000', '1459090428', '10154014627988570'),
(11, 6, '56f7f3fc7fc8f', 6, '400', '5', '2400', '1459090428', '10154014627988570'),
(12, 8, '56f7f3fc7fc8f', 1, '100', '5', '100', '1459090428', '10154014627988570'),
(13, 4, '56f7f68454944', 12, '500', '5', '6000', '1459091076', '10154014627988570'),
(14, 6, '56f7f68454944', 6, '400', '5', '2400', '1459091076', '10154014627988570'),
(15, 8, '56f7f68454944', 1, '100', '5', '100', '1459091076', '10154014627988570'),
(16, 4, '56f7f6d3636f8', 12, '500', '5', '6000', '1459091155', '10154014627988570'),
(17, 6, '56f7f6d3636f8', 6, '400', '5', '2400', '1459091155', '10154014627988570'),
(18, 8, '56f7f6d3636f8', 1, '100', '5', '100', '1459091155', '10154014627988570'),
(19, 4, '56f7f869e3735', 12, '500', '5', '6000', '1459091561', '0'),
(20, 6, '56f7f869e3735', 6, '400', '5', '2400', '1459091561', '0'),
(21, 8, '56f7f869e3735', 1, '100', '5', '100', '1459091561', '0'),
(22, 4, '56f7f8797c3f8', 12, '500', '5', '6000', '1459091577', '10154014627988570'),
(23, 6, '56f7f8797c3f8', 6, '400', '5', '2400', '1459091577', '10154014627988570'),
(24, 4, '56f7f8e881dab', 12, '500', '5', '6000', '1459091688', '10154014627988570'),
(25, 6, '56f7f8e881dab', 6, '400', '5', '2400', '1459091688', '10154014627988570'),
(26, 8, '56f7f8e881dab', 1, '100', '5', '100', '1459091688', '10154014627988570'),
(27, 4, '56f7f97714d64', 12, '500', '5', '6000', '1459091831', '10154014627988570'),
(28, 6, '56f7f97714d64', 6, '400', '5', '2400', '1459091831', '10154014627988570'),
(29, 8, '56f7f97714d64', 1, '100', '5', '100', '1459091831', '10154014627988570'),
(30, 4, '56f7f9bae5ed8', 12, '500', '5', '6000', '1459091898', '10154014627988570'),
(31, 6, '56f7f9bae5ed8', 6, '400', '5', '2400', '1459091898', '10154014627988570'),
(32, 8, '56f7f9bae5ed8', 1, '100', '5', '100', '1459091898', '10154014627988570'),
(33, 4, '56f7fa35d6bc7', 12, '500', '5', '6000', '1459092021', '10154014627988570'),
(34, 6, '56f7fa35d6bc7', 6, '400', '5', '2400', '1459092021', '10154014627988570'),
(35, 8, '56f7fa35d6bc7', 1, '100', '5', '100', '1459092021', '10154014627988570'),
(36, 4, '56f7fdab76d9d', 12, '500', '5', '6000', '1459092907', '10154014627988570'),
(37, 6, '56f7fdab76d9d', 6, '400', '5', '2400', '1459092907', '10154014627988570'),
(38, 8, '56f7fdab76d9d', 1, '100', '5', '100', '1459092907', '10154014627988570'),
(39, 4, '56f80a89dada9', 12, '500', '5', '6000', '1459096201', '10154014627988570'),
(40, 6, '56f80a89dada9', 6, '400', '5', '2400', '1459096201', '10154014627988570'),
(41, 8, '56f80a89dada9', 1, '100', '5', '100', '1459096201', '10154014627988570'),
(42, 4, '56f80c51e7f46', 12, '500', '5', '6000', '1459096657', '10154014627988570'),
(43, 6, '56f80c51e7f46', 6, '400', '5', '2400', '1459096657', '10154014627988570'),
(44, 8, '56f80c51e7f46', 1, '100', '5', '100', '1459096657', '10154014627988570'),
(45, 4, '56f80cf231e42', 12, '500', '5', '6000', '1459096818', '10154014627988570'),
(46, 6, '56f80cf231e42', 6, '400', '5', '2400', '1459096818', '10154014627988570'),
(47, 8, '56f80cf231e42', 1, '100', '5', '100', '1459096818', '10154014627988570'),
(48, 4, '56f815d378462', 12, '500', '5', '6000', '1459099091', '10154014627988570'),
(49, 6, '56f815d378462', 6, '400', '5', '2400', '1459099091', '10154014627988570'),
(50, 8, '56f815d378462', 1, '100', '5', '100', '1459099091', '10154014627988570');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_log`
--

CREATE TABLE `transaction_log` (
  `trans_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `applied_coupon` varchar(50) NOT NULL,
  `basket_id` varchar(50) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `billing_address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `tran_status` varchar(15) NOT NULL,
  `trans_confirmation` varchar(20) NOT NULL,
  `timeStamp` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_log`
--

INSERT INTO `transaction_log` (`trans_id`, `user_id`, `applied_coupon`, `basket_id`, `total_amount`, `billing_address`, `phone`, `tran_status`, `trans_confirmation`, `timeStamp`) VALUES
(1, '2147483647', '0', '56', 8500, '', '', '0', '0', '1459097093'),
(2, '2147483647', '', '56f815d378462', 8500, '   ', '08056666969', 'Pending', '', '1459099117'),
(3, '2147483647', '', '56f815d378462', 8500, '4 salvation Opebi ikeja', '08056666969', 'Pending', '', '1459099259');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int(11) NOT NULL,
  `facebook_id` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `timestamp` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`user_id`, `facebook_id`, `email`, `phone`, `address`, `city`, `state`, `timestamp`) VALUES
(2, '10154014627988570', 'sholadedokun@yahoo.com', '', '', '', '', '1459087062'),
(3, '0', '', '', '', '', '', '1459091561');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_no`);

--
-- Indexes for table `order_basket`
--
ALTER TABLE `order_basket`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `transaction_log`
--
ALTER TABLE `transaction_log`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_no` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `order_basket`
--
ALTER TABLE `order_basket`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `transaction_log`
--
ALTER TABLE `transaction_log`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
