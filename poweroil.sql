-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2016 at 09:15 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `poweroil`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_title` varchar(20) NOT NULL,
  `category_descripiton` varchar(500) NOT NULL,
  `category_order` int(11) NOT NULL,
  `category_update` varchar(50) NOT NULL,
  `category_created` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_title`, `category_descripiton`, `category_order`, `category_update`, `category_created`) VALUES
(1, 'Cooking and culinary', 'This category includes item that has to do with cooking utensils, cooking ingredients and cooking services', 0, '1455996763', '1455996763');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_amount` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applied_trans` int(11) NOT NULL,
  `generated_trans` int(11) NOT NULL,
  `applied_date` varchar(20) NOT NULL,
  `generated_date` varchar(20) NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_no` int(11) NOT NULL AUTO_INCREMENT,
  `item_category` varchar(10) NOT NULL,
  `item_type` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_rate` varchar(10) NOT NULL,
  `item_discount` varchar(10) NOT NULL,
  `item_description` varchar(300) NOT NULL,
  `item_tag` varchar(1000) NOT NULL,
  `item_profile_img` varchar(100) NOT NULL,
  `item_images` varchar(500) NOT NULL,
  `date_created` varchar(10) NOT NULL,
  `last_updated` varchar(10) NOT NULL,
  PRIMARY KEY (`item_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_no`, `item_category`, `item_type`, `item_name`, `item_rate`, `item_discount`, `item_description`, `item_tag`, `item_profile_img`, `item_images`, `date_created`, `last_updated`) VALUES
(1, '1', 0, 'PowerOil 15cl Cookin', '50', '0', 'Poweroil cooking oil is fortified with essential mineral for a healthy living. ', 'Affordable| cooking| sachet', '', '', '1455996954', '1455996954'),
(2, '1', 0, 'PowerOil 30cl Cookin', '100', '', 'PowerOil is full of vitamins', 'Affordable| sachet', '', '', '1455997549', '1455997549'),
(3, '1', 0, 'teasasa', '12', '2', 'aasdasdad', 'sachet', '', '', '1455997725', '1455997725'),
(4, '1', 0, 'rfefwer', '54', '4', 'ewerwer', 'Affordable| cooking', '', '', '1455997835', '1455997835'),
(5, '1', 0, 'dfsdfsdfr', '77', '3', 'sdfsdf sdfs fsdfsdf', 'wefsdfsd fdsfsdf sdfsdf', '', '', '1455997965', '1455997965'),
(6, '1', 0, 'dfsdfsdfr', '77', '3', 'sdfsdf sdfs fsdfsdf', 'wefsdfsd fdsfsdf sdfsdf', '', '', '1455998012', '1455998012'),
(7, '1', 0, 'sdfsdgsdfs', '43', '3', 'dfsfewfwefwefwe wefdsf dsfsdf', 'sasd asdd', '14559984391.jpg', '14559984391.jpg,14559984392.jpg', '1455998439', '1455998439');

-- --------------------------------------------------------

--
-- Table structure for table `order_basket`
--

CREATE TABLE IF NOT EXISTS `order_basket` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `basket_id` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` varchar(10) NOT NULL,
  `discount` varchar(10) NOT NULL,
  `total_amount` varchar(20) NOT NULL,
  `date` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_log`
--

CREATE TABLE IF NOT EXISTS `transaction_log` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `applied_coupon` int(11) NOT NULL,
  `generated_coupon` int(11) NOT NULL,
  `basket_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `tran_status` int(11) NOT NULL,
  `trans_confirmation` int(11) NOT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook_id` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `timestamp` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
