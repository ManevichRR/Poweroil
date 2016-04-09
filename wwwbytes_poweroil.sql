-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 09, 2016 at 02:31 PM
-- Server version: 5.5.42-37.1
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wwwbytes_poweroil`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
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

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_amount` varchar(10) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `applied_trans` int(11) NOT NULL,
  `generated_trans` varchar(100) NOT NULL,
  `applied_date` varchar(20) NOT NULL,
  `generated_date` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_amount`, `user_id`, `applied_trans`, `generated_trans`, `applied_date`, `generated_date`) VALUES
(1, '100', '10154014627988570', 0, 'Your first Coupon', '', '1459849388'),
(2, '100', '10207702897704973', 0, 'First buy', '', '1459858763'),
(3, '100', '10207702897704973', 0, 'First buy', '', '1460220936');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_no` int(11) NOT NULL,
  `item_category` varchar(10) NOT NULL,
  `item_type` varchar(20) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_rate` varchar(10) NOT NULL,
  `item_discount` varchar(10) NOT NULL,
  `item_description` varchar(300) NOT NULL,
  `item_lowest_quantity` int(11) NOT NULL,
  `item_max_quantity` int(11) NOT NULL,
  `item_batch_quantity` int(11) NOT NULL,
  `item_measuring_metric` varchar(50) NOT NULL,
  `item_tag` varchar(1000) NOT NULL,
  `item_profile_img` varchar(100) NOT NULL,
  `item_images` varchar(500) NOT NULL,
  `item_icons` varchar(50) NOT NULL,
  `item_points` varchar(50) NOT NULL,
  `date_created` varchar(10) NOT NULL,
  `last_updated` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_no`, `item_category`, `item_type`, `item_name`, `item_rate`, `item_discount`, `item_description`, `item_lowest_quantity`, `item_max_quantity`, `item_batch_quantity`, `item_measuring_metric`, `item_tag`, `item_profile_img`, `item_images`, `item_icons`, `item_points`, `date_created`, `last_updated`) VALUES
(4, '1', 'Product', '3L Bottle', '1800', '0', 'godies for sale... that''s all and more', 1, 2, 1, 'bottles', 'Affordable, sachet', 'big-bottle.png', 'big-bottle.png', '1460223782icon.png', '100', '1457690464', '1460223784'),
(6, '1', '0', '75CL Bottle', '450', '0', 'this the final test for the Poweroil test engine.', 1, 3, 1, 'bottles', 'Product, Product, Product', 'small-bottle.png', 'small-bottle.png', '1460223813icon.png', '50', '1457690821', '1460223814'),
(8, '1', 'Product', '5CL sachet', '50', '0', 'this is the final description of the product', 10, 100, 10, 'Sachet', 'cooking, oilly', 'sachet.png', 'sachet.png', '1460152714icon.png', '0', '1457765824', '1460152735');

-- --------------------------------------------------------

--
-- Table structure for table `order_basket`
--

CREATE TABLE IF NOT EXISTS `order_basket` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `basket_id` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` varchar(10) NOT NULL,
  `discount` varchar(10) NOT NULL,
  `total_amount` varchar(20) NOT NULL,
  `date` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;

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
(50, 8, '56f815d378462', 1, '100', '5', '100', '1459099091', '10154014627988570'),
(51, 4, '56f9a5922534e', 12, '500', '5', '6000', '1459201426', '0'),
(52, 6, '56f9a5922534e', 6, '400', '5', '2400', '1459201426', '0'),
(53, 8, '56f9a5922534e', 1, '100', '5', '100', '1459201426', '0'),
(54, 4, '56f9a6b9a6842', 12, '500', '5', '6000', '1459201721', '10154014627988570'),
(55, 6, '56f9a6b9a6842', 6, '400', '5', '2400', '1459201721', '10154014627988570'),
(56, 8, '56f9a6b9a6842', 1, '100', '5', '100', '1459201721', '10154014627988570'),
(57, 4, '56f9a743c2943', 12, '500', '5', '6000', '1459201859', '0'),
(58, 6, '56f9a743c2943', 6, '400', '5', '2400', '1459201859', '0'),
(59, 8, '56f9a743c2943', 1, '100', '5', '100', '1459201859', '0'),
(60, 6, '56fd01afbd456', 6, '400', '5', '2400', '1459421615', '10154014627988570'),
(61, 6, '56fd308ae65fd', 8, '400', '5', '3200', '1459433610', '10154014627988570'),
(62, 4, '56fd308ae65fd', 13, '500', '5', '6500', '1459433610', '10154014627988570'),
(63, 8, '56fd35e342712', 2, '100', '5', '200', '1459434979', '10154014627988570'),
(64, 8, '56fd368c64ebe', 3, '100', '5', '300', '1459435148', '10154014627988570'),
(65, 8, '56fd37021e5e8', 3, '100', '5', '300', '1459435266', '10154014627988570'),
(66, 6, '56fd37021e5e8', 7, '400', '5', '2800', '1459435266', '10154014627988570'),
(67, 8, '56fd4d142cbe3', 2, '100', '5', '200', '1459440916', '10154014627988570'),
(68, 6, '56fd4d142cbe3', 7, '400', '5', '2800', '1459440916', '10154014627988570'),
(69, 8, '56fd69a73548b', 2, '100', '5', '200', '1459448231', '10207702897704973'),
(70, 6, '56fd69a73548b', 7, '400', '5', '2800', '1459448231', '10207702897704973'),
(71, 4, '56fd69a73548b', 14, '500', '5', '7000', '1459448231', '10207702897704973'),
(72, 4, '56fe442512659', 3, '1500', '0', '4500', '1459504165', '10154014627988570'),
(73, 8, '56fe442512659', 1, '50', '0', '50', '1459504165', '10154014627988570'),
(74, 6, '56fe442512659', 7, '350', '0', '2450', '1459504165', '10154014627988570'),
(75, 4, '56fe4483da4b4', 2, '1500', '0', '3000', '1459504259', '10154014627988570'),
(76, 6, '56fe4483da4b4', 6, '350', '0', '2100', '1459504259', '10154014627988570'),
(77, 4, '56fe55860764f', 3, '1500', '0', '4500', '1459508614', '10154014627988570'),
(78, 6, '56fe564d24782', 8, '350', '0', '2800', '1459508813', '10154014627988570'),
(79, 6, '56fe8eebd8a95', 7, '350', '0', '2450', '1459523307', '10154014627988570'),
(80, 4, '56fe9cc1637ed', 3, '1500', '0', '4500', '1459526849', '10154014627988570'),
(81, 6, '56fe9cc1637ed', 2, '350', '0', '700', '1459526849', '10154014627988570'),
(82, 4, '56fe9d582ecf7', 1, '1800', '0', '1800', '1459527000', '10154014627988570'),
(83, 4, '56fea3efa0ea3', 2, '1800', '0', '3600', '1459528687', '10154014627988570'),
(84, 8, '56fec82fd20f0', 7, '50', '0', '350', '1459537967', '10207702897704973'),
(85, 6, '56fec82fd20f0', 2, '450', '0', '900', '1459537967', '10207702897704973'),
(86, 4, '56fec82fd20f0', 1, '1800', '0', '1800', '1459537967', '10207702897704973'),
(87, 8, '56fecee026627', 7, '50', '0', '350', '1459539680', '10207702897704973'),
(88, 6, '56fecee026627', 2, '450', '0', '900', '1459539680', '10207702897704973'),
(89, 4, '56fecee026627', 1, '1800', '0', '1800', '1459539680', '10207702897704973'),
(90, 4, '56ffec779ccba', 2, '1800', '0', '3600', '1459612791', '0'),
(91, 4, '570362944b1e4', 2, '1800', '0', '3600', '1459839636', '10154014627988570'),
(92, 6, '570362944b1e4', 3, '450', '0', '1350', '1459839636', '10154014627988570'),
(93, 8, '570362944b1e4', 40, '50', '0', '2000', '1459839636', '10154014627988570'),
(94, 4, '57036b75860ad', 2, '1800', '0', '3600', '1459841909', '0'),
(95, 6, '57036b75860ad', 3, '450', '0', '1350', '1459841909', '0'),
(96, 6, '570380678b4c9', 2, '450', '0', '900', '1459847271', '0'),
(97, 8, '570380678b4c9', 20, '50', '0', '1000', '1459847271', '0'),
(98, 4, '570380678b4c9', 2, '1800', '0', '3600', '1459847271', '0'),
(99, 8, '570383a79f6cb', 10, '50', '0', '500', '1459848103', '10154014627988570'),
(100, 6, '570383a79f6cb', 1, '450', '0', '450', '1459848103', '10154014627988570'),
(101, 4, '570383a79f6cb', 1, '1800', '0', '1800', '1459848103', '10154014627988570'),
(102, 8, '5703848acdca0', 10, '50', '0', '500', '1459848330', '10154014627988570'),
(103, 6, '5703848acdca0', 1, '450', '0', '450', '1459848330', '10154014627988570'),
(104, 4, '5703848acdca0', 1, '1800', '0', '1800', '1459848330', '10154014627988570'),
(105, 8, '570387e84c382', 10, '50', '0', '500', '1459849192', '0'),
(106, 6, '570387e84c382', 1, '450', '0', '450', '1459849192', '0'),
(107, 4, '570387e84c382', 1, '1800', '0', '1800', '1459849192', '0'),
(108, 8, '570388ac6d8f0', 10, '50', '0', '500', '1459849388', '10154014627988570'),
(109, 6, '570388ac6d8f0', 1, '450', '0', '450', '1459849388', '10154014627988570'),
(110, 4, '570388ac6d8f0', 1, '1800', '0', '1800', '1459849388', '10154014627988570'),
(111, 8, '570395bdbf4dd', 20, '50', '0', '1000', '1459852733', '10154014627988570'),
(112, 8, '570396354f66c', 30, '50', '0', '1500', '1459852853', '10154014627988570'),
(113, 6, '570396354f66c', 2, '450', '0', '900', '1459852853', '10154014627988570'),
(114, 4, '570396354f66c', 2, '1800', '0', '3600', '1459852853', '10154014627988570'),
(115, 8, '570396367408e', 30, '50', '0', '1500', '1459852854', '10154014627988570'),
(116, 6, '570396367408e', 2, '450', '0', '900', '1459852854', '10154014627988570'),
(117, 4, '570396367408e', 2, '1800', '0', '3600', '1459852854', '10154014627988570'),
(118, 8, '57039639a3002', 30, '50', '0', '1500', '1459852857', '10154014627988570'),
(119, 6, '57039639a3002', 2, '450', '0', '900', '1459852857', '10154014627988570'),
(120, 4, '57039639a3002', 2, '1800', '0', '3600', '1459852857', '10154014627988570'),
(121, 8, '570396612a40c', 20, '50', '0', '1000', '1459852897', '10154014627988570'),
(122, 6, '570396612a40c', 2, '450', '0', '900', '1459852897', '10154014627988570'),
(123, 8, '5703970983d4e', 20, '50', '0', '1000', '1459853065', '10154014627988570'),
(124, 6, '5703979f6d0fb', 2, '450', '0', '900', '1459853215', '10154014627988570'),
(125, 4, '5703a5976739a', 2, '1800', '0', '3600', '1459856791', '10154014627988570'),
(126, 6, '5703a5976739a', 1, '450', '0', '450', '1459856791', '10154014627988570'),
(127, 8, '5703a5976739a', 10, '50', '0', '500', '1459856791', '10154014627988570'),
(128, 6, '5703ab38d2997', 1, '450', '0', '450', '1459858232', '10154014627988570'),
(129, 8, '5703ab38d2997', 10, '50', '0', '500', '1459858232', '10154014627988570'),
(130, 4, '5703ab38d2997', 1, '1800', '0', '1800', '1459858232', '10154014627988570'),
(131, 6, '5703ad4b4c3c0', 2, '450', '0', '900', '1459858763', '10207702897704973'),
(132, 4, '5703ad4b4c3c0', 2, '1800', '0', '3600', '1459858763', '10207702897704973'),
(133, 8, '5703ad4b4c3c0', 20, '50', '0', '1000', '1459858763', '10207702897704973'),
(134, 4, '5703b49a852a4', 2, '1800', '0', '3600', '1459860634', '10154014627988570'),
(135, 6, '5703b49a852a4', 2, '450', '0', '900', '1459860634', '10154014627988570'),
(136, 8, '5703b49a852a4', 30, '50', '0', '1500', '1459860634', '10154014627988570'),
(137, 8, '5703c6ad9a66d', 10, '50', '0', '500', '1459865261', '10154014627988570'),
(138, 6, '5703c6ad9a66d', 1, '450', '0', '450', '1459865261', '10154014627988570'),
(139, 4, '5703c6ad9a66d', 1, '1800', '0', '1800', '1459865261', '10154014627988570'),
(140, 6, '5705ee5aed1a1', 1, '450', '0', '450', '1460006490', '10154014627988570'),
(141, 8, '5705ee5aed1a1', 10, '50', '0', '500', '1460006490', '10154014627988570'),
(142, 6, '57061f472f3c9', 2, '450', '0', '900', '1460019015', '10154014627988570'),
(143, 4, '57062f3912e58', 2, '1800', '0', '3600', '1460023097', '10154014627988570'),
(144, 6, '57062f3912e58', 2, '450', '0', '900', '1460023097', '10154014627988570'),
(145, 8, '57062f3912e58', 20, '50', '0', '1000', '1460023097', '10154014627988570'),
(146, 8, '57063237a1f4d', 30, '50', '0', '1500', '1460023863', '10154014627988570'),
(147, 4, '57063237a1f4d', 0, '1800', '0', '0', '1460023863', '10154014627988570'),
(148, 4, '570647f2c9189', 2, '1800', '0', '3600', '1460029426', '10154014627988570'),
(149, 6, '570647f2c9189', 3, '450', '0', '1350', '1460029426', '10154014627988570'),
(150, 8, '570647f2c9189', 30, '50', '0', '1500', '1460029426', '10154014627988570'),
(151, 4, '5706493172320', 2, '1800', '0', '3600', '1460029745', '10154014627988570'),
(152, 6, '5706493172320', 3, '450', '0', '1350', '1460029745', '10154014627988570'),
(153, 8, '5706493172320', 30, '50', '0', '1500', '1460029745', '10154014627988570'),
(154, 8, '57064b339e8c8', 20, '50', '0', '1000', '1460030259', '10154014627988570'),
(155, 6, '57064b339e8c8', 2, '450', '0', '900', '1460030259', '10154014627988570'),
(156, 6, '5708d2682d594', 2, '450', '0', '900', '1460195944', '10154014627988570'),
(157, 4, '5708d2682d594', 2, '1800', '0', '3600', '1460195944', '10154014627988570'),
(158, 8, '5708d2682d594', 100, '50', '0', '5000', '1460195944', '10154014627988570'),
(159, 6, '5708d4a9d5494', 1, '450', '0', '450', '1460196521', '10154014627988570'),
(160, 4, '5708d4a9d5494', 1, '1800', '0', '1800', '1460196521', '10154014627988570'),
(161, 8, '57093408320e4', 30, '50', '0', '1500', '1460220936', '10207702897704973'),
(162, 6, '57093408320e4', 3, '450', '0', '1350', '1460220936', '10207702897704973'),
(163, 4, '57093408320e4', 2, '1800', '0', '3600', '1460220936', '10207702897704973');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_log`
--

CREATE TABLE IF NOT EXISTS `transaction_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_log`
--

INSERT INTO `transaction_log` (`trans_id`, `user_id`, `applied_coupon`, `basket_id`, `total_amount`, `billing_address`, `phone`, `tran_status`, `trans_confirmation`, `timeStamp`) VALUES
(1, '2147483647', '0', '56', 8500, '', '', '0', '0', '1459097093'),
(2, '2147483647', '', '56f815d378462', 8500, '   ', '08056666969', 'Pending', '', '1459099117'),
(3, '2147483647', '', '56f815d378462', 8500, '4 salvation Opebi ikeja', '08056666969', 'Pending', '', '1459099259'),
(4, '0', '', '56f9a743c2943', 8500, '   ', '', 'Pending', '', '1459201877'),
(5, '10154014627988570', '', '56fd01afbd456', 2400, '   ', '', 'Pending', '', '1459421676'),
(6, '10154014627988570', '', '57062f3912e58', 5500, '2 Floor, 4 Salvation Off Opebi Ikeja', '08056666969', 'Delivered', '', '1460023175'),
(7, '10154014627988570', '', '5706493172320', 6350, '   ', '', 'Pending', '', '1460029785');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
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
(1, '10154014627988570', 'sholadedokun@yahoo.com', '', '', '', '', '1459849388'),
(3, '10207702897704973', 'buchanora@gmail.com', '', '', '', '', '1460220936');

-- --------------------------------------------------------

--
-- Table structure for table `user_form`
--

CREATE TABLE IF NOT EXISTS `user_form` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_mother_fullname` varchar(50) NOT NULL,
  `user_mother_phone` varchar(20) NOT NULL,
  `user_mother_field` varchar(1500) NOT NULL,
  `user_mother_picture_url` varchar(40) NOT NULL,
  `time_stamp` varchar(20) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_form`
--

INSERT INTO `user_form` (`user_id`, `user_name`, `user_mother_fullname`, `user_mother_phone`, `user_mother_field`, `user_mother_picture_url`, `time_stamp`) VALUES
(1, 'sdfsdfs', 'sdfsdfsdf', 'sdfsdfsdf', 'dfsdfsdfdsfsdf sdfsdf', 'upload/1456226527jpg', '1456226527'),
(2, 'sdfsdfs', 'sdfsdfsdf', 'sdfsdfsdf', 'dfsdfsdfdsfsdf sdfsdf', 'upload/1456226815.jp', '1456226815'),
(3, 'sdfsdfs', 'sdfsdfsdf', 'sdfsdfsdf', 'dfsdfsdfdsfsdf sdfsdf', 'upload/1456227011.jp', '1456227011'),
(4, 'sdfsdfs', 'sdfsdfsdf', 'sdfsdfsdf', 'dfsdfsdfdsfsdf sdfsdf', 'upload/1456227250.jp', '1456227250'),
(5, 'sdfsdfs', 'sdfsdfsdf', 'sdfsdfsdf', 'dfsdfsdfdsfsdf sdfsdf', 'upload/1456227429.jp', '1456227429'),
(6, 'sdfsdfs', 'sdfsdfsdf', 'sdfsdfsdf', 'dfsdfsdfdsfsdf sdfsdf', 'upload/1456227540.jp', '1456227540'),
(7, 'sdfsdfs', 'sdfsdfsdf', 'sdfsdfsdf', 'dfsdfsdfdsfsdf sdfsdf', 'upload/1456227638.jp', '1456227638'),
(8, 'Olushola', 'Mary', '080999999', 'Mother is so good', 'upload/1456228788.jp', '1456228788'),
(9, 'Tester', 'My Mama', '0803234534', 'Momcy is so nice', 'upload/1456229609.jp', '1456229609'),
(10, 'nnn', 'kmk', '0099', 'sadasdada', 'upload/1456230686.pn', '1456230686'),
(11, 'sasasa', 'sasasa', 'sasasa', 'sasaas', 'upload/1456232068.jp', '1456232068'),
(12, 'Osayomi Tosin Grace', 'Mrs Omolade Osayomi', '09033727292', 'She Is A Good Mother In Time Of Need And In Time Of Mentor', 'upload/1456238310.jp', '1456238310'),
(13, 'Osayomi Tosin Grace', 'Mrs Omolade Osayomi', '09033727292', 'She Is A Good Mother In Time Of Need And In Time Of Mentor', 'upload/1456238324.jp', '1456238324'),
(14, 'Osayomi Tosin Grace', 'Mrs Omolade Osayomi', '09033727292', 'She Is A Good Mother In Time Of Need And In Time Of Mentor', 'upload/1456238339.jp', '1456238339'),
(15, '', 'Mrs Yetunde Oduemi', '08076311626', 'On my wedding day my mum prayed for me with tears of joy, we were locked in an emotional embrace for over 5minutes and other extended family members joined in the tears. It was so emotional. It was a single moment in time that I saw and felt my mum''s love and knew I was lucky she was my mum', 'upload/1456238527.jp', '1456238527'),
(16, 'Osayomi Tosin Grace', 'Mrs Omolade Osayomi', '09033727292', 'She Is A Good Mother In Time Of Needs And A Mentor, Happy Mothers Day', 'upload/1456238730.jp', '1456238730'),
(17, 'Osayomi Tosin Grace', 'Mrs Omolade Osayomi', '09033727292', 'She Is A Good Mother In Time Of Needs And A Mentor, Happy Mothers Day', 'upload/1456238897.jp', '1456238897'),
(18, 'EQwraetg', 'eRWGTEA', '32456', 'EFWRGAT', 'upload/1456240561.pn', '1456240561'),
(19, 'sasas', 'daadsafas', '080224', 'fasdfasd', 'upload/1456240646.pn', '1456240646'),
(20, 'Sunday Esther', 'Sunday Dorcas', '07035734640', 'It was a special mtoment for me and my one and only mum  which can never be forgotten in my life time. When i was about to get married she gave me a motherly advice on how to manage family life bcus it was not an easy task as she said, i yielded to her advices uptill now am living happily with my husband and kids. I also took her out for shoppings, i celebrate my mum becos without her my life is meaningless. I love u mum and will always do. #HappyMothersDay ', 'upload/1456240655.jp', '1456240655'),
(21, '', 'Mrs Abigail uloaku Ibe', '08039465545', 'Everyday has always been the best with my mum. Most especially cooking with her in the kitchen.', 'upload/1456240771.jp', '1456240771'),
(22, 'itoroooooooraaaerwet', 'srdfg', '08033210506', 'EWR%TAehzgf', 'upload/1456240993.jp', '1456240993'),
(23, 'sallllaalalaa', 'dsosksksdooooo', '08033210506', 'Smsksjs ddhdhsh', 'upload/1456241230.jp', '1456241230'),
(24, 'kesjsjsjsj  itorooo', 'wjshshstoooo', '08032120087', 'Shebwhw. Ooo', 'upload/1456241327.jp', '1456241327'),
(25, 'Alake Damilola', 'Mrs Alake Theresa Oladele', '08037209248', 'I love you mom. You are the best ', 'upload/1456243709.jp', '1456243709'),
(26, 'Sanusi Semira', 'Mrs Aisha Sanusi', '08033024897', 'My mom.. My jewel.. My everythung\r\n You know I love you from the bottom of my heart ', 'upload/1456244039.jp', '1456244039'),
(27, 'Emmanuel Bobmanuel ', 'Mrs Stella Bobmanuel ', '08068240626', 'You are the best mom. I love you\r\nHappy mother''s day to all mothersb', 'upload/1456244315.jp', '1456244315'),
(28, 'Jkae Williams ', 'Mrs Adenine Williams ', '07032516474', 'I love you Angel. Happy mother''s day ', 'upload/1456244779.jp', '1456244779'),
(29, 'okeke', 'madam okeke', '08012281717', 'O love her so much', 'upload/1456244794.pn', '1456244794'),
(30, 'Alake Damilola', 'Mrs Alake Theresa Oladele', '08037209248', 'I love you mom to the moon and back ', 'upload/1456245045.jp', '1456245045'),
(31, 'Michael Ogunnupe ', 'Mrs Olubunmi Ogunnupe ', '08026332973', 'Iya ni wura. No need for long epistle \r\nI love you mom.......My everything ', 'upload/1456245182.jp', '1456245182'),
(32, 'Semina Sanusi', 'Mrs Sanusi Aisha ', '08033024897', 'My love..... Happy mother''s day best mom ', 'upload/1456245349.jp', '1456245349'),
(33, 'Nenyenwaikuku Smilnf', 'LOLO ISIOMA OKWA', '08034728190 and 0808', 'My best mother moment story was when i travelled with my mum we had so much we went shopping together she spent so much on my items i was so happy we ate stuffs together and we called home and rolled out tongues to them that we were having mad fun while they laughed and envied.My mum is the best and i love her so much!!!', 'upload/1456245356.jp', '1456245356'),
(34, 'Semira Sanusi ', 'Mrs Sanusi Aisha', '08033024897', 'My love...Happy mother''s day best mom ', 'upload/1456245438.jp', '1456245438'),
(35, 'Ssss', 'Ssss', 'Ssss', 'Sssss', 'upload/1456245614.jp', '1456245614'),
(36, 'Michael', 'Mrs Funke Tolufashe ', '08023130869', 'I love you from the bottom of my heart ', 'upload/1456245739.jp', '1456245739'),
(37, 'Oloruntegbe Olagbemi', 'Bose Oloruntegbe', '08033256726', 'I love my mum', 'upload/1456245809.jp', '1456245809'),
(38, 'Olabisi joy ', 'Bola', '08096340753', 'Share a story of your best moment with your mother', 'upload/1456245970.jp', '1456245970'),
(39, 'Demilade', 'Bunmi Oloruntegbe', '08028596753', 'She has been a caring and loving mother', 'upload/1456246228.jp', '1456246228'),
(40, '', 'Mrs Rosemary Oyebade ', '08035769616', 'Appreciating moment i cherished most was when i had my first baby in the hospital, a new mum who doesnt knw anything abt babies, My mom was there praying heavily while am in labor cos i had her voice, she was there till i was discharge, taking care of me.i was filled with Joy thanking her & God to have her around me if not, it wont be so easy for me, Her words of encouragement is foreverly appreciated. Love you mum ', 'upload/1456247541.jp', '1456247541'),
(41, 'BABAJIDE ', 'ELIZABETH WINJOBI', '08038001092', 'My mum means a lot to me while growing up anytime sheâ€™s in kitchen, she made sure I joined her in the kitchen and she thought me how to cook and this has really helped me to survive and be admired by a lot of ladies though am married now.', 'upload/1456248936.jp', '1456248936'),
(42, 'TUNDUN', 'ELIZABETH WINJOBI', '08038001092', 'My mum means a lot to me while growing up anytime sheâ€™s in kitchen, she made sure I joined her in the kitchen and she thought me how to cook and this has really helped me to survive and my hubby prefers to eat my food than to eat outside.', 'upload/1456249039.jp', '1456249039'),
(43, 'KEMI ', 'ELIZABETH WINJOBI', '08038001092', 'My mum means a lot to me while growing up anytime sheâ€™s in kitchen, she made sure I joined her in the kitchen and she thought me how to cook and this has really helped me to survive and my hubby prefers to eat my food than to eat outside.', 'upload/1456249078.jp', '1456249078'),
(44, 'MOJOLA', 'ELIZABETH WINJOBI', '08038001092', 'My mum means a lot to me while growing up anytime sheâ€™s in kitchen, she made sure I joined her in the kitchen and she thought me how to cook and this has really helped me to survive and be admired by a lot of ladies.', 'upload/1456249126.jp', '1456249126'),
(45, 'DAYO', 'MARY FAJEMISIN', '08033490561', 'My mum is a great  woman, I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456249273.jp', '1456249273'),
(46, 'FEMI ', 'MARY FAJEMISIN', '08033490561', 'mum is a great  woman, I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456249324.jp', '1456249324'),
(47, 'Anjolaoluwa Owomoyel', 'Nike Owomoyela', '08067129249', 'When we went to ibadan and we made friends', 'upload/1456249342.jp', '1456249342'),
(48, 'AYOMIDE', 'TUNDUN GBADAMOSI', '08023253931', 'My mum is a great  woman, I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456249503.pn', '1456249503'),
(49, 'AYOMIKUN', 'TUNDUN GBADAMOSI', '08023253931', 'My mum is a great  woman , I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456249566.pn', '1456249566'),
(50, 'POSI', 'tundun gbadamosi', '08023253931', 'My mum is a great  woman, I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.\r\nMy mum is a great  woman , I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.\r\n', 'upload/1456249621.pn', '1456249621'),
(51, 'Deola olorubtegbe', 'Tinuke oloruntegbe', '0806 769 7796', 'I love my mun', 'upload/1456249647.jp', '1456249647'),
(52, 'Bolu Adeoye', 'Yewande Adeoye', '0816 360 1824', 'When you got that contract and we went to celebrate', 'upload/1456249749.jp', '1456249749'),
(53, 'Akeem', 'Mojj', '0812 630 4150', 'I remember when I was very sick. You stayed by my side all through. I love you', 'upload/1456250189.jp', '1456250189'),
(54, 'OPEYEMI', 'MRS ADERIBIGBE', '08033306970', 'My mum is a great  woman, I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.\r\nMy mum is a great  woman , I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.\r\n', 'upload/1456251279.jp', '1456251279'),
(55, 'Rosslyn Efu', 'Mrs serÃ h omabonu Efu', '07067575403', 'D best moment wit my mom, was d day she visited in Port Harcourt a', 'upload/1456254109.jp', '1456254109'),
(56, '', 'Joy oluma ', 'Mrs oluwa ', 'Was when \r\n', 'upload/1456255966.jp', '1456255966'),
(57, 'Ayobola Owodunni', 'Olufunke Idowu', '07030203239', 'She stood by me during the birth of my sons', 'upload/1456256954.jp', '1456256954'),
(58, 'Ngozi Okoli', 'Pauline Eyiuche Okoli ', '08035039396', 'My call to the Nigerian Bar''s Ceremony ', 'upload/1456259670.jp', '1456259670'),
(59, '', 'Patricia Igberase', '07030582965', 'My  mother is the best in the whole world,she has been a pillar of support to  me and my siblings ever since we lost our father.she is a man,because she stood so firm to teach  us morals and how to be responsible even without a father.she really helped me when I delivered my son,she would bath my son,wash  my clothes,my husband''s clothes,mother in law''s clothes and babies clothes.when I asked her why she washed my mother-in-law''s clothes too,she said she is doing it so that I will have a happy home.I have learnt from her what humility is.she would almost knee down to serve everybody food and still pack the plates.she is so God fearing and and can endure longsuffering.she taught me so well and I am so happy for who I am today.Power oil thanks for the opportunity to say this about my wonderful mother.I will always make you happy mum', 'upload/1456260013.jp', '1456260013'),
(60, 'Okhamiogue Eunice', 'Maradesa Caroline Taiwo', '08066300371', 'My best moment with her her was my wedding day that we spent some minutes together in my room while she gave the secret to her 30 years of marriage', 'upload/1456260021.jp', '1456260021'),
(61, 'Onyinye', 'Mrs Oranyia Uju', '08039508565', 'My best moment with my mum was my last birthday which she joyfully celebrated my day with me', 'upload/1456260755.jp', '1456260755'),
(62, 'Onyejekwe Victor ', 'Helen Onyejekwe ', '09052384351', 'the best moment with my mum was when she prevented me from a birthday party, and told me lots of cultural stories that I won''t forget, it was so cool that I learnt many of our tradition . ', 'upload/1456261050.jp', '1456261050'),
(63, 'oseji vivian', 'oseji edith', '08098661386', 'Y best momont with my mom was when we had nothing that day to eat,we we''re all hungry me and my siblings,so she said she had just 50naira with her next she sent me to buy 10naira grounded pepper,#10 seasoning,#20 crayfish and she made pepper soup with it so that day we ate the soup with eba.since that day I just knew she is my all in all.she came through for us and that will always make her the best mum ever.I love you mummy so Happy Mothers Day.', 'upload/1456261105.jp', '1456261105'),
(64, 'Folajimi ogunsanya ', 'Ogunsanya tawakalit yetunde ', '08023363206', 'My mother is a sweet mother,I can remember when I was sick in d sch ,she came around within 1hr if I can remember she was crying seeing me sick ,she took me to d nearest hospital    and told me pls don''t sick I love u and kiss my forehead .I can never forgot dat they she is one in a million ,from dat movement my mum will ask are u alright baby ?I feel on top of d world  for d best mummy ever  .power oil thank for giving me opportunity to express my feeling for my mummy ', 'upload/1456262402.pn', '1456262402'),
(65, '', 'Hart Florence Nwaganga ', '08093683285', 'Mummy told me a story about how she struggled to makes earn, and I was so touch I cried that day. She had to farm for people to get paid.', 'upload/1456262461.jp', '1456262461'),
(66, '', 'Hart Florence Nwaganga', '08093683285', 'Mummy told me her about how she struggled to makes earns,she had to farm for her follow women just to get money. I shade tears', 'upload/1456262634.jp', '1456262634'),
(67, 'Apata kolade', 'Florence Funke Apata', '08035888471', 'The day she paid for my waec form....I was a though moment.', 'upload/1456262635.jp', '1456262635'),
(68, 'Nwankwo Evelyn', 'Nwankwo Felicia Nkechi', '08127134766', 'My best memory was when my mum sold her wrapper at aswani market in Lagos Nigeria just to pay my university tuition fee and we were duped she cried and I promised to buy her a new wrapper. I gained admission into the polytechnic of Ibadan, during my one year industrial attachment I bought her a new wrapper she prayed for me, we were both happy can''t forget that day #my mum the best in the world#', 'upload/1456263083.jp', '1456263083'),
(69, 'Nwankwo Evelyn', 'Nwankwo Felicia Nkechi', '08127134766', 'My best memory was when my mum sold her wrapper at aswani market in Lagos Nigeria just to pay my university tuition fee and we were duped she cried and I promised to buy her a new wrapper. I gained admission into the polytechnic of Ibadan, during my one year industrial attachment I bought her a new wrapper she prayed for me, we were both happy can''t forget that day #my mum the best in the world#', 'upload/1456263114.jp', '1456263114'),
(70, 'Obed Bawa', 'Mrs Esther Bawa', '07031925297', 'My MuM at 63 years but still going strong. were she gets the drive and motivation to keep going bits me. MaMa just want to tell you #ILOVEYOU', 'upload/1456263251.jp', '1456263251'),
(71, 'Atuigwe Chiamaka', 'Atuigwe Hope ', '0806 891 9846', 'My Mom is Late, and i miss her so much R.I.P\r\nThe Mom i have now is my Mother- Inlaw. She filled the vaccum my mom left. I want her to know that i love her so much. My best moment with her was When she voluntarily came for the Omugwo of my First Child Michelle, which my Step Mum bluntly refused to Come. Thats the best moment i had with her. Shes like the mom I never had.', 'upload/1456272918.jp', '1456272918'),
(72, 'Chiamaka Atuigwe', 'Hope Atuigwe', '0806 891 9846', 'My Mom is Late, and i miss her so much R.I.P\r\nThe Mom i have now is my Mother- Inlaw. She filled the vaccum my mom left. I want her to know that i love her so much. My best moment with her was When she voluntarily came for the Omugwo of my First Child Michelle, which my Step Mum bluntly refused to Come. Thats the best moment i had with her. The few months we spent together was aBlissful moment. Shes like the mom I never had.', 'upload/1456273666.jp', '1456273666'),
(73, '', 'Awoyemi Durodola', '09095675720 ', 'Every moment has been wonderful and memorable, but I can remember when I got admission into the higher institution,  as her first child.... Could see the joy N happiness in her actions.... It was really touching memorable because whenever I remember it.. \r\nI jus smile N thank God for giving a love that can never be compared with anything.... ', 'upload/1456352059.jpg', '1456352059'),
(74, 'Udeoji Eberechukwu Adanne ', 'Udeoji Louisa Adaego', '08038210170 ', 'Showing up for my convocation all the way from kaduna to Rivers state by night bus due to financial challenges. I broke down I  tears but I''m glad she could.', 'upload/1456353350.jpg', '1456353350'),
(75, '', 'adebayo oluwatoyin', '08023510124', 'When she was giving me out o my wedding day!', 'upload/1456353649.jpg', '1456353649'),
(76, 'busola', 'adebayo oluwatoyin', '08023510124', 'My wedding period', 'upload/1456353745.jpg', '1456353745'),
(77, '', 'Mrs M-embers Juliana Ikpah', '07033854819', 'Before I got married my dad had a very difficult journey accepting my husband to-be. Everyday I thought of short cuts to it meanwhile am a first child. My mum encouraged me day in day out to continue praying and stay on the right course as she has taught me. Her encouragements gave me new perspectives and even took me closer to The Lord. She made me realise also that I had a responsibility to lead my siblings by example.', 'upload/1456357414.png', '1456357414'),
(78, '', 'Marriam Olufunmilayo', '08039157630', 'My best moment with my mum is just spending my days with her, she''s just too awesome, she''s the best', 'upload/1456357493.jpg', '1456357493'),
(79, 'Bankole Rachael', 'Esther Bankole', '07038152572', 'I lost my father when i was just 8years..,so my mom is the only 1 that brought me and elder ones up,she is so caring and lovely,i remember when i use to sleep on d same bed with her and telling her to face me before i can sleep.Eating together in the same plate.', 'upload/1456361563.jpg', '1456361563'),
(80, 'Bankole Rachael', 'Esther Bankole', '07038152572', 'I lost my father when i was just 8years..,so my mom is the only 1 that brought me and elder ones up,she is so caring and lovely,i remember when i use to sleep on d same bed with her and telling her to face me before i can sleep.Eating together in the same plate.', 'upload/1456361612.jpg', '1456361612'),
(81, 'Bankole Rachael', 'Esther Bankole', '07038152572', 'I lost my father when i was just 8years..,so my mom is the only 1 that brought me and elder ones up,she is so caring and lovely,i remember when i use to sleep on d same bed with her and telling her to face me before i can sleep.Eating together in the same plate.', 'upload/1456361795.jpg', '1456361795'),
(82, 'Adegbiyi Victoria Kehinde ', 'Senewo Christiana Oluwafunmilayo', '08034820380', 'My best moment with my Mum was during my traditional wedding. On that day, I was asked to go and hug and peck my mum.  As soon as I got to her, even though I had told my other siblings that I can never cry. It was easier said than done. We both held each other and cried. Eat time I remember that moment, I miss my mum more. Wish I was still under the same roof.  I love you Mum ', 'upload/1456374035.jpg', '1456374035'),
(83, 'stanley ndubuisi ihuoma', 'mrs beatrice nwanyiakaibeya Ihuoma', '07037249381', 'The best moment I shared with my mum was when she held me in her hands and breast fed me,no other moment will ever surpassthose days even though I was a baby then!', 'upload/1456375450.jpg', '1456375450'),
(84, 'Ugochukwu Kelvin nwoke ', 'blessing nwoke ', '08061158092', 'Share a story of your best moment with your mother\r\nis the love and care she has given to me.dont have best moment because everyday with her has always been my best moment.LOVE YOU MUM ', 'upload/1456378282.jpg', '1456378282'),
(85, 'Awotoye Moninuola', 'Awotoye Amudalat Temilola', '08053201360', 'Ever since my dad''s death, mum has been battling with HBP so bad that she became partialy paralyzed. Buh I thank God she didn''t give in just yet. After gotten the date for my convocation tears flow from my eyes becos nobody will be in attendance. Got home and broke the news to my mum...she uttered ds amazing statement dt send shivers done my spine "mo ma wa,ma kebi wa,ma wa fi ile poti fi ona roka. I can afford to miss out on your day of joy" meaning "I will come,even with my family and there will be plenty to eat and drink" tears of joy this time could not stop we both cried. ofcus she made it down to Akure from Lagos with over 15 family members on a chartered bus! She went all out for me to be happy, if my calculations were right my poor mum spent close to 100000 thousand naira kicked her sickness away to be by my side on that great day! Against all odds, she chose my happiness! No amount of gifts can pay back all her goodies to my life. She is just incredible!!! And this isn''t her first way of showing that. Power oil I will be glad if she gets the token it will go a long way to tell her that she deserves all the award in the world for being the best mum ever. I love Temilola sooooooo much and I am glad God gave her to me without me even asking... He knows I deserve the best. Mum for all those pains you bear to make your kids great, we will make you great,we will make you happy and till your old age we will always appreciate you. Thank you Power oil for been the platform fo', 'upload/1456381414.jpg', '1456381414'),
(86, 'Awotoye Moninuola', 'Awotoye Amudalat Temilola', '08053201360', 'Ever since my dad''s death, mum has been battling with HBP so bad that she became partialy paralyzed. Buh I thank God she didn''t give in just yet. After gotten the date for my convocation tears flow from my eyes becos nobody will be in attendance. Got home and broke the news to my mum...she uttered ds amazing statement dt send shivers done my spine "mo ma wa,ma kebi wa,ma wa fi ile poti fi ona roka. I can afford to miss out on your day of joy" meaning "I will come,even with my family and there will be plenty to eat and drink" tears of joy this time could not stop we both cried. ofcus she made it down to Akure from Lagos with over 15 family members on a chartered bus! She went all out for me to be happy, if my calculations were right my poor mum spent close to 100000 thousand naira kicked her sickness away to be by my side on that great day! Against all odds, she chose my happiness! No amount of gifts can pay back all her goodies to my life. She is just incredible!!! And this isn''t her first way of showing that. Power oil I will be glad if she gets the token it will go a long way to tell her that she deserves all the award in the world for being the best mum ever. I love Temilola sooooooo much and I am glad God gave her to me without me even asking... He knows I deserve the best. Mum for all those pains you bear to make your kids great, we will make you great,we will make you happy and till your old age we will always appreciate you. Thank you Power oil for been the platform fo', 'upload/1456381497.jpg', '1456381497'),
(87, 'Awotoye Moninuola', 'Awotoye Amudalat Temilola', '08053201360', 'Ever since my dad''s death, mum has been battling with HBP so bad that she became partialy paralyzed. Buh I thank God she didn''t give in just yet. After gotten the date for my convocation tears flow from my eyes becos nobody will be in attendance. Got home and broke the news to my mum...she uttered ds amazing statement dt send shivers done my spine "mo ma wa,ma kebi wa,ma wa fi ile poti fi ona roka. I can afford to miss out on your day of joy" meaning "I will come,even with my family and there will be plenty to eat and drink" tears of joy this time could not stop we both cried. ofcus she made it down to Akure from Lagos with over 15 family members on a chartered bus! She went all out for me to be happy, if my calculations were right my poor mum spent close to 100000 thousand naira kicked her sickness away to be by my side on that great day! Against all odds, she chose my happiness! No amount of gifts can pay back all her goodies to my life. She is just incredible!!! And this isn''t her first way of showing that. Power oil I will be glad if she gets the token it will go a long way to tell her that she deserves all the award in the world for being the best mum ever. I love Temilola sooooooo much and I am glad God gave her to me without me even asking... He knows I deserve the best. Mum for all those pains you bear to make your kids great, we will make you great,we will make you happy and till your old age we will always appreciate you. Thank you Power oil for been the platform fo', 'upload/1456381647.jpg', '1456381647'),
(88, 'Awotoye Moninuola', 'Awotoye Amudalat Temilola', '08053201360', 'Ever since my dad''s death, mum has been battling with HBP so bad that she became partialy paralyzed. Buh I thank God she didn''t give in just yet. After gotten the date for my convocation tears flow from my eyes becos nobody will be in attendance. Got home and broke the news to my mum...she uttered ds amazing statement dt send shivers done my spine "mo ma wa,ma kebi wa,ma wa fi ile poti fi ona roka. I can afford to miss out on your day of joy" meaning "I will come,even with my family and there will be plenty to eat and drink" tears of joy this time could not stop we both cried. ofcus she made it down to Akure from Lagos with over 15 family members on a chartered bus! She went all out for me to be happy, if my calculations were right my poor mum spent close to 100000 thousand naira kicked her sickness away to be by my side on that great day! Against all odds, she chose my happiness! No amount of gifts can pay back all her goodies to my life. She is just incredible!!! And this isn''t her first way of showing that. Power oil I will be glad if she gets the token it will go a long way to tell her that she deserves all the award in the world for being the best mum ever. I love Temilola sooooooo much and I am glad God gave her to me without me even asking... He knows I deserve the best. Mum for all those pains you bear to make your kids great, we will make you great,we will make you happy and till your old age we will always appreciate you. Thank you Power oil for been the platform fo', 'upload/1456381766.jpg', '1456381766'),
(89, 'Adigbo Erome ', 'Adigbo Oghenekome ', '08028258887', 'The best moment with my mum was on my convocation day, she surprised me after telling me she couldn''t make ie. I cried when I saw her and was also very excited to the bone', 'upload/1456383096.jpg', '1456383096'),
(90, 'Adigbo Erome', 'Adigbo Oghenekome', '08028258887', 'The best moment with my mum was on my convocation day, when she told me she was not going to make it but still she came, it made me cry cos I was so excited to the bone. I love you so much mum', 'upload/1456383258.jpg', '1456383258'),
(91, 'Rotr Kemfon Ebong', 'Mrs Grace Nkereuwem Ebong', '08081456499', 'My Best Moment With  Mum Is Usually When Am Ill, She Will Watch Over Me Like A Mother Hen And Tries To Make Available All That I Ast For, Even At The Expense Of The Rest Of The Family Members. She Practically Spoon Feeds And Baths Me. She Is Just Amazing And Lovely!', 'upload/1456383489.jpg', '1456383489'),
(92, 'GLORIA K. NWACHUKWU', 'PAULINE NWACHUKWU', '08077542115  ', 'WHAT MAMA HAVE DONE FOR ME, I CAN NOT TELL IT ALL, OH GOD GIVE HER LONG LIVE TO REAP THE FRUIT OF HER LABOUR AMEN.', 'upload/1456385239.jpg', '1456385239'),
(93, 'Omoyemi daramola', 'Adenike olushola bankole-ojo', '07063483387', 'My best moment with my mum has been all through my life time,with no father,no even sister u were there beside me all time.when i cry,u''re by my side when am happy u''re by my side,i cherish you always.happy mothers day to the best mom ever', 'upload/1456386469.jpg', '1456386469'),
(94, 'Mercy inem', 'Patience Ogbonna', '08133539151', 'My best moment with my mom was during our early visit to Abuja 1996. Life was tough and rough but with her life turns of good and blissful. ', 'upload/1456386722.jpg', '1456386722'),
(95, 'Mercy inem Ogbonna', 'Patience Ogbonna', '08133539151', 'My best moment with my mom was during our early visit to Abuja 1996. Life was tough and rough but with her life turns out good and blissful. ', 'upload/1456386808.jpg', '1456386808'),
(96, 'Omoyemi daramola', 'Adenike olushola bankole-ojo', '07063483387', 'Everyday of my life has been My best moment with my momwith no father,u stood by me to see me grow,sacrificing your needs to nuture me,when i cry u were beside me,when am happy,i were there.thanks to you mom.happy mothers day ', 'upload/1456386932.jpg', '1456386932'),
(97, 'Adegoke Busayo', 'Iyabode Adegoke', '08060892543', 'The best moment with my mum was when I got an heartbreak in my relationship my mum stood in gap for me that day fell on Feb 14th last year my mum took me out and she made me her val,she''s always there for me when am in pains', 'upload/1456387849.png', '1456387849'),
(98, 'Udaya Emelda Chidimma', 'Udaya Agnes Nkechineyere nee Eze', '08060936817', 'the best moment wit my mother is when i was a child.she was always their for me,with her stories day ad day.lolz', 'upload/1456388373.jpg', '1456388373'),
(99, 'KOLA', 'KEMI EDICHE', '08073477880', 'My mum is a great  woman , I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456388712.jpg', '1456388712'),
(100, 'JOLA', 'Mary Fajemisin', '08033490561', 'My mum is a great  woman , I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456389276.jpg', '1456389276'),
(101, 'TUNDE', 'MARY FAJEMISIN', '08033490561', 'My mum is a great  woman, I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456389414.jpg', '1456389414'),
(102, 'ETHAN', 'TOMI STONE', '07036558256', 'My mum is a great  woman , I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456389630.jpg', '1456389630'),
(103, '', 'Florence Joshua', '0807 945 6765', 'I remember when I was much younger, I was I''ll and in d village. My uncle took me to the chemist and I was administered some drugs but instead of getting better, I got worst. I was then brought back to WARRI where my mom was. She took me to the hospital and I was tested and the result showed I had bronchial pneumonia. I was asked not to take cold water and never to sleep with fan or air conditioner on. My mom, knowing that I will not do it, every night she will take me to her room, turn off d fan and even when she is sweating, she will put on d fan jiu for my sake. I reality didn''t appreciate it then but after my baby had a similar problem, I was sleeping without fan for days, had rashes all over me, then I began to appreciate my mom like never before. Only very few mp others will sacrifice their comfort for their children. My mom is superb. ', 'upload/1456390473.jpg', '1456390473'),
(104, 'ADEOLU', 'MRS ADERIBIGBE', '08033306970', 'My mum is a great  woman , I will always remember how she caters for us every night after work, how she cooks for us and her food still remains the best. I love you mama.', 'upload/1456390771.jpg', '1456390771'),
(105, 'Nweke Joy .C.', 'Nweke Victory .N.', '07068053334', 'Words ''re nt enough to express hw important my mom is to me. Am very thankful  to Almighty Father for giving me d best mom ever.I LOVE U EZIGBO NNEM. ', 'upload/1456391786.jpg', '1456391786'),
(106, 'Omeje Ogechi', 'Omeje Justina Ukamaka', '07036706257', 'Best moments with my Mother were those days while I was still growing (around 5 to 6 years) and she would carry me on her back whenever we were returning from church, even though she was tired. I love and would always remember those moments.', 'upload/1456392239.jpg', '1456392239'),
(107, 'Elsie Michael', 'Deac. Eno Henry Abia', '08129591729', 'every moment with my mum is well cherished... when she scolds, she has a reason. when I''m downcast, she''s always my hope. she single handedly saw me through all d stages in my academic endeavours... she made sure I''m a graduate. she prays for all her children every morning. my mum is the best', 'upload/1456392589.jpg', '1456392589'),
(108, 'Elsie Michael', 'Deac. Eno Henry Abia', '08129591729', 'every moment with my mum is well cherished... when she scolds, she has a reason. when I''m downcast, she''s always my hope. she single handedly saw me through all d stages in my academic endeavours... she made sure I''m a graduate. she prays for all her children every morning. my mum is the best', 'upload/1456392675.jpg', '1456392675'),
(109, 'chizoba okoli', 'okoli Ann N', '08035645125', 'she has been there for me but my most unforgettable experience with my momma was when I fell Ill and it required surgery ....she defied all odds just for me to get better\r\nher bank account was in reds,she had to stand up to my dad and paternal family, her work was left unattended to,and even her own health! I so much love her\r\n', 'upload/1456393010.jpg', '1456393010'),
(110, 'Elsie Michael', 'Deaconess Eno Henry Abia', '08129591729', 'Every moment with my mum is well cherished. when she scolds, she has a reason for that. when  I''m downcast, she gives me hope. she single handedly sees me through all my academic endeavours, she made sure I''m a graduate. my mum is the best.', 'upload/1456393457.jpg', '1456393457'),
(111, 'adekoya azeezah', 'adekoya sakinah', '08029786778', 'The eid festival', 'upload/1456394804.jpg', '1456394804'),
(112, 'Ann Edim-Ayang', 'mercy Edim-Ayang', '07067823919', 'The best moments have been when we had to work on her garden together.  She will teach me about crops and edible herbs. she has ignited in me an interest in gardening. She has sacrificed enough for my siblings and I. I love her.  ', 'upload/1456400806.png', '1456400806'),
(113, 'Ann Edim-Ayang', 'mercy Edim-Ayang', '07067823919', 'The best moments have been when we had to work on her garden together.  She will teach me about crops and edible herbs. she has ignited in me an interest in gardening. She has sacrificed enough for my siblings and I. I love her.  ', 'upload/1456400806.png', '1456400806'),
(114, 'Ann Edim-Ayang', 'mercy Edim-Ayang', '07067823919', 'The best moments have been when we had to work on her garden together.  She will teach me about crops and edible herbs. she has ignited in me an interest in gardening. She has sacrificed enough for my siblings and I. I love her.  ', 'upload/1456400806.png', '1456400806'),
(115, 'Ann Edim-Ayang', 'mercy Edim-Ayang', '07067823919', 'The best moments have been when we had to work on her garden together.  She will teach me about crops and edible herbs. she has ignited in me an interest in gardening. She has sacrificed enough for my siblings and I. I love her.  ', 'upload/1456400806.png', '1456400806'),
(116, 'Peace Joseph', 'Esther Joseph', '07066617327', 'everyday is my best story moment with my mum', 'upload/1456400821.jpg', '1456400821'),
(117, '', '', '', 'who sat and watch my infant head when sleeping on my credle bed and wept for tears that i should''nt die', 'upload/1456401008.jpg', '1456401008'),
(118, '', '', '', '', 'upload/1456401302.png', '1456401302'),
(119, 'Njideka ', 'Chiogo ', '08033431898', 'The best moment with my mum was wen I was growing up. I was like about 6-7 years and I was sick. My mum left all she was doing just to be sure I was fine. She wasn''t eating because I wasn''t eating too. Again is my education line, she gave me the savings of her life for me to continue my education after my industrial training.  ', 'upload/1456401678.jpg', '1456401678'),
(120, 'Ifeoma Obiora John', 'Francisca Obiora', '08023432888', 'As a widow raising up her 8 children was a big challenge but in this, she was always there for us making sure we would all acquire some level of education. She''s a rare gem and a super heo.', 'upload/1456405532.jpg', '1456405532'),
(121, 'Alhamdu Gyeyok', 'Alhamdu Asabe', '08138668402', 'She is special in her ways, No one else but My Mother....', 'upload/1456407141.jpg', '1456407141'),
(122, '', 'Mrs Fransisca Ngozi Obiakor ', '07039888283', 'I am very close to my mum,  the closest among my siblings although the first daughter but second issue.  My best and unforgettable moment is the period of my wedding. We talked all day and night cos she felt she would miss me most', 'upload/1456407438.jpg', '1456407438'),
(123, '', 'Umeji Nkoli Mary', '08063840416', 'There are many uncountable wonderful moments with my mum, like when i had a stillbirth, she was there 2 give me strenght, and den her wonderful omugwo visits 4 my subsequent kids. She''s truely an Angel dat can''t be joked with.', 'upload/1456414385.jpg', '1456414385'),
(124, '', 'Hadiza abdulkadir', '08145586067', 'She really loves me i can''t live without her when i am not around she will search for me', 'upload/1456419394.jpg', '1456419394'),
(125, 'Khadijat Abdulsalam Mumeen', 'Maryam Abdulsalam Ovayoza', '08036334472', 'We used to quarrel a lot; but she is so sweet and loves us forever! One strong bond we share is her grand son, my son. Recently my boy went over to enjoy his mid term break and when I went to pick him up I felt like staying over there with her. I was jealous my son had taken my space. I wanted to be her little girl again. But, I know with each passing day, she loves me more.', 'upload/1456419408.jpg', '1456419408'),
(126, 'Muhammad madaki', 'Hafsat abdullahi', '08169842669', 'She really love me when i am not around', 'upload/1456419647.jpg', '1456419647'),
(127, 'Khadijat Abdulsalam Mumeen', 'Maryam Abdulsalam Ovayoza', '08036334472', 'Once I was heartbroken! She made me a cup of tea. It meant the world to me, because back then in my home; discipline was the order. It doesn''t matter if you are weak or strong, you can''t cry or emotionally break down. But she let me cry this once; and that experience let me put my trust in her. I still trust her now and forever. She is my confidant.', 'upload/1456419878.jpg', '1456419878'),
(128, 'SEPON ADEBAYO', 'MUNIRAT ABDUL AZEEZ SEPON', '07068685297', 'The best day with my mum was on my younger sister''s marriage ceremony when i snapped with her and my little princess', 'upload/1456422073.jpg', '1456422073'),
(129, 'Mbanefo Goodness ', 'Emily Mbanefo ', '08135106013 ', 'My Mother Who sat and watched my infant head\r\nWhen sleeping on my cradle bed, And tears of\r\nsweet affection shed? My Mother. When pain and\r\nsickness made me cry, Who gazed upon my heavy\r\neye, And wept for fear that I should die? My\r\nMother. Who taught my infant lips to pray And\r\nlove Godâ€™s holy book and day, And walk in\r\nwisdomâ€™s pleasant way? My Mother. And can I\r\never cease to be Affectionate and kind to thee,\r\nWho wast so very kind to me, My Mother? Ah, no!\r\nthe thought I cannot bear, And if God please my\r\nlife to spare I hope I shall reward they care, My\r\nMother. When thou art feeble, old and grey, My\r\nhealthy arm shall be thy stay, And I will soothe\r\nthy pains away, My Mother.I love my mother so much and I will never forget her in my life ', 'upload/1456425023.jpg', '1456425023'),
(130, 'Mbanefo Goodness ', 'Emily Mbanefo ', '08135106013 ', 'My Mother Who sat and watched my infant head\r\nWhen sleeping on my cradle bed, And tears of\r\nsweet affection shed? My Mother. When pain and\r\nsickness made me cry, Who gazed upon my heavy\r\neye, And wept for fear that I should die? My\r\nMother. Who taught my infant lips to pray And\r\nlove Godâ€™s holy book and day, And walk in\r\nwisdomâ€™s pleasant way? My Mother. And can I\r\never cease to be Affectionate and kind to thee,\r\nWho wast so very kind to me, My Mother? Ah, no!\r\nthe thought I cannot bear, And if God please my\r\nlife to spare I hope I shall reward they care, My\r\nMother. When thou art feeble, old and grey, My\r\nhealthy arm shall be thy stay, And I will soothe\r\nthy pains away, My Mother.I love my mother so much and I will never forget her in my life ', 'upload/1456425161.jpg', '1456425161'),
(131, '', '', '', '', 'upload/1456425866.jpg', '1456425866'),
(132, 'Charity Okpanachi ', 'Mrs Blessing Kalu', '08162455583', 'One of my special moment with my mum was when I miscarried my baby,september last year. My mum was there for me,took care of me even with the pains of loosing a baby I forgot it easily because of my mum. She made me see reason to move on,consoled my husband and I and had to take me to our family house to stay with her and she cared for me daily. Made me laugh, pamper me and I forgot about my pain in a short while. Mothers are the best but my mum surpasses them all. I LOVE YOU MUM!! ', 'upload/1456426915.jpg', '1456426915'),
(133, 'oluwakemi odunsi', 'abosede odunsi', '08134284919', 'The best moment I had with her was when my dad left her with the four of us and one day,it was raining and there was nowhere we could stay,I watched my mum carry 4 of us so rain wouldn''t beat us but ofcourse she was very wet but she made sure that we didn''t get wet...I felt like she was all I needed...I love her alot', 'upload/1456429490.jpg', '1456429490'),
(134, 'Dike Lynda Chioma ', 'Mrs Angela N Dike ', '08060449767', 'My best moment was in her womb.... It created a deep connection between us.... I will always love you now and forever mummy.... Happy mother''s day to the best mum in the whole wide world', 'upload/1456430174.jpg', '1456430174'),
(135, 'Dike Lynda Chioma ', 'Mrs Angela N Dike ', '08060449767', 'My best moment was in her womb.... It created a deep connection between us.... I will always love you now and forever mummy.... Happy mother''s day to the best mum in the whole wide world', 'upload/1456430583.jpg', '1456430583'),
(136, '', 'Mrs.Alice Omachi', '08064022123', 'My best moment with my mum was on her 55th birthday last year.', 'upload/1456430803.jpg', '1456430803'),
(137, '', 'Mrs Alice Omachi', '0806422123', 'On her 55th birthday last year', 'upload/1456430948.jpg', '1456430948'),
(138, 'ALAGO OGECHUKWU', 'ALAGO NWANNEDIMMA MARY', '08089968700', '    THE STORY OF MY BEST MOMENT WITH MY MUM\r\n            THE BEST MOMENT I HAVE WITH MY MUM IS THAT FAITHFUL NIGHT MY MUM CALLED ME IN,INTO THEIR ROOM THAT WAS ON 2013 BEING MY SS3. I CAME IN SHE ASKED ME " AFTER YOUR SSSCE WHAT ARE YOU PLANING TO DO ? I CAME TO ME AS A SHOCK BECAUSE I HAVE BEING LOOKING FOR A WAY TO TELL THEM( MY PARENTS) I WANT TO FURTHER MY EDUCATION BUT DUE TO FINANCIAL PROBLEM AM SCARED TO AIR MY VIEW WITHIN ME I FELT EXTRA HAPPY TO SAID IT OUT AT THAT MOMENT .IMMEDIATELY I RESPONDED MUM IF AM GIVING THE OPPORTUNITY I WILL LIKE TO FURTHER MY EDUCATION THAT WHAT I WANT SHE SIGHED AND SAID ANYWAY SINCE FROM YOUR YOUR CHILDHOOD YOU LIKE TO READ AND WRITE BUT DUE TO FINANCIAL PROBLEM AM A BIT NERVOUS BUT WE MUST DO SOMETHING TO SEE YOU THROUGH!. \r\n         ONE DAY SHE CALLED ME AND GAVE ME SOME MONEY AND SAID THIS MONEY WAS GIVEN TO ME BY YOUR DAD HE SAID YOU SHOULD GO AND BUY JAMB FORM. THROUGHOUT THAT DAY I WAS OVER EXCITED I DID AS SHE SAID ,ON FILLING THE JAMB FORM I ASKED HER MUM WHICH INSTITUTIONS WILL I FILL IN? SHE REPLIED ANY OF YOUR CHOICE I SAID INCLUDING UNIVERSITIES SHE SAID YES . \r\n   I FILLED ANANBARA STATE UNIVERSITY , I WROTE MY POST UME PASS THEY GAVE ME THE COURSE OF MY DREAM BIOCHEMISTRY ON THE DAY OF CLEARANCE SHE GAVE ME CLEARANCE MONEY ND SAID YOUR DAD GAVE YOU ON THE DAY OF MY SCHOOL FEES PAYING SHE DID AS USUAL ALTHOUGH MY DAD PAYS FOR MY SCHOOLING.\r\n NOT ALL HE PAID  I KNOW MY MUM CONTRIBUTED BUT SHE WILL NOT MENTION HER SELF ALWAYS', 'upload/1456431813.jpg', '1456431813'),
(139, 'Gift', 'Onuoha Chinwendu  Lilian', '08140114405', 'That was the most beautiful moment of my life when my mum carried me at her back as big as I was at the age of 17,she couldn''t watch me walk when I was sick so she endured the pains my weight gave her and took me home. It was beautiful.', 'upload/1456432391.jpg', '1456432391'),
(140, 'mary', 'Adeyanju oluwafolakemi cecilia', '08062662480', 'A mother is the most valueable treasure you can have.d very momment i enjoyed with my mum was when she played and play pranks with me', 'upload/1456435374.jpg', '1456435374'),
(141, 'Bibiana Bernard ', 'Margaret Bernard ', '07031131886', 'my mum has been so lovely and caring mother,  I always remember this wonderful moment of her,  when I got admission to school, my Dad lost his job,  so he was unable to pay my fee nor settled any of my bill''s,  I was like losing hope,  so my mum sold her wrappers and her new pots,  that was How I was able to secure my admission,  am really proud of having her as a mother. ', 'upload/1456435796.jpg', '1456435796'),
(142, 'Bibiana Bernard ', 'Margaret Bernard ', '07031131886', 'my mum has been so lovely and caring mother,  I always remember this wonderful moment of her,  when I got admission to school, my Dad lost his job,  so he was unable to pay my fee nor settled any of my bill''s,  I was like losing hope,  so my mum sold her wrappers and her new pots,  that was How I was able to secure my admission,  am really proud of having her as a mother. ', 'upload/1456435798.jpg', '1456435798'),
(143, 'ENGR,DURU CHIBUZOR', 'LADY DURU ROSE', '08068833233', 'My best moment with mum is when I was sick she said to me all is well with tears in her eye''s even when all is not ..she depended on God with strong faith..i love you mum..I swear you are my everything.', 'upload/1456437281.jpg', '1456437281'),
(144, 'Oyindamola falade', 'Falade omoTayo', '08035269469', '', 'upload/1456440053.jpg', '1456440053'),
(145, 'Buari Safurat Temmyluv', 'Ayodele Success', '07051074084', ' Everyday with my Mom was\r\nmemorable. There are so many memorable moments with my\r\nmom. But each travel time with my mom is most\r\nmemorable because it is when she is most\r\nrelaxed and happy, when she is most fun and\r\nfunny! I remember, when my mum will take me to the market and say Tope don''t you like this, buy wat you know will be useful for you o.\r\nMy mom success was such a strong but emotional\r\nfigure when I was growing up. Most memorable\r\nwas seeing her working hard through the\r\ntoughest times and giving me lessons Iâ€™ve\r\ncarried on in life â€” she told me to value myself\r\nand finish my education, that itâ€™s the best gift\r\nshe can give me. I love my mom so much, she is\r\nmy pillar, I lean on her and really adore her.', 'upload/1456440717.jpg', '1456440717'),
(146, 'Buari Safurat Temmyluv', 'Ayodele Success', '07051074084', ' Everyday with my Mom was\r\nmemorable. There are so many memorable moments with my\r\nmom. But each travel time with my mom is most\r\nmemorable because it is when she is most\r\nrelaxed and happy, when she is most fun and\r\nfunny! I remember, when my mum will take me to the market and say Tope don''t you like this, buy wat you know will be useful for you o.\r\nMy mom success was such a strong but emotional\r\nfigure when I was growing up. Most memorable\r\nwas seeing her working hard through the\r\ntoughest times and giving me lessons Iâ€™ve\r\ncarried on in life â€” she told me to value myself\r\nand finish my education, that itâ€™s the best gift\r\nshe can give me. I love my mom so much, she is\r\nmy pillar, I lean on her and really adore her.', 'upload/1456440986.jpg', '1456440986'),
(147, '', 'kolawole omowunmi', '08134734427', 'she is greatest,beautiful,gorgeous mom and her prayer and advice keep me moving. ', 'upload/1456441626.jpg', '1456441626'),
(148, 'Chiburuoma Ogbonda', 'Margaret Ogbonda', '0817 912 9411', 'my best moment with my mum was on the 28th of June 2015 and I mark it as my best moment because that was the day my mum cut her first birthday cake in 44yrs.even while writing this,a drop of tear fell off my eyes because I remember the Joy that was written all over her face that day and also the fact that I was able to get a cake for my mum with my own hard earned money was a very big achievement for me.I''m not saying all this because the gift is my main priority but I''m happy I was able to bring out tears of Joy from my mums eyes.forgot to add that someone blessed her with another suprise cake after cutting the one I bought for her.Thank you so much power oil for the opportunity to share my best moment with my mum story. #Thankyoumumforbeingthebestmum', 'upload/1456442539.png', '1456442539'),
(149, 'Ejurule Oritsemeyiwa Joy', 'Ukomatimi Oritsebemiwino Evelyn', '08074846836', 'i offended my mum and she was very angry at me to the extent that she slapped me. after everything, she told me to smile even though she knew i was angry and she advised me as a mother.', 'upload/1456443263.jpg', '1456443263'),
(150, '', 'Mrs Ajibola Omowunmi Ifeoma', '08058894332, 0818623', 'When we both went to K.S Motel to watched movie nd later went to Tantalizare at Mokola ', 'upload/1456445412.png', '1456445412'),
(151, 'Agnes O. Odufuye', 'Josephine A. Odu', '08034511346', 'Every moment spent with her, especially all she gave up to make sure I get the best of things', 'upload/1456458514.jpeg', '1456458514'),
(152, '', 'Mrs Falilat Adesanya', '08033298297', 'D day my mother clocks 50years,it was a real fun dt day', 'upload/1456464583.jpg', '1456464583');
INSERT INTO `user_form` (`user_id`, `user_name`, `user_mother_fullname`, `user_mother_phone`, `user_mother_field`, `user_mother_picture_url`, `time_stamp`) VALUES
(153, '', 'Eunice Marcus ', '07036772812', 'My mum is a sweet mother who fought so hard to give us bright future. Oh mum I hold you so much appreciation ', 'upload/1456467921.jpg', '1456467921'),
(154, 'OKEKE TENDERMERCY OLUEBUBE', 'OKEKE PRICILIA CHIMNKANELE', '08150793335', 'MY MUM HAS BEEN MY BACKBONE, MY FRIEND, MY TWIN, MY ADVISER, AND MY EVERYTHING.  WHERE DO I START?  AM A GRADUATE TODAY IS BECAUSE OF HER, SOLD GROUNDNUT DURING RAIN OR SHINE JUST BECAUSE OF ME TO GO TO SCHOOL. I LOVE HER SO MUCH, HAD NO GOOD WRAPPER OR CLOTHES FOR MY SAKE, WENT HUNGRY FOR ME, WHAT WOULD I HAVE BEEN WITHOUT HER? I CHEERISH EVERY MOMENT WITH HER AND ASK GOD TO KEEP HER HEALTHY FOR ME, SHE IS THE BEST MUM EVER', 'upload/1456468740.jpg', '1456468740'),
(155, 'Geraldine Ogueri', 'Anthonia Chinasa Ogueri', '08060199551', 'My mum is my best friend. I remember when i was cheated and was crying badly, she came to my room and hugged me and asked me to stop crying. It felt nice. I lv u so so so much mum.', 'upload/1456468751.jpg', '1456468751'),
(156, 'mbakwe', 'mbakwe franca', '08066056523', 'Moment story With her was the day she woke me up and whispered into my ear that she is making my favourite soup instead of daddy''s, I couldn''t stop smilling.', 'upload/1456469381.jpg', '1456469381'),
(157, '', 'Adetola Madamidola  Omofuma ', '08077701182', 'I always have a lovely moment with my mom, all the time spent with her is worth it. She is just everything to me and she know how to relate well with me as a tennager. I mostly enjoy the times we go out shopping, because she really has a good taste and she helps me in making the right decisions on what to get. Every moment with her is just the best.', 'upload/1456475610.jpg', '1456475610'),
(158, 'Mark Godson Udoka', 'Mark Precious Oluchi', '07031978471', 'When my mom took care of me while I was in hospital.. she gave me the best care I ever needed...she''s been my pillar since birth.', 'upload/1456476698.jpg', '1456476698'),
(159, 'Inemute oke ', 'Inemute Djebar ', '07064711444 ', 'I was writing exam and I have  something like Apendix, and my brother needed some textbook,but my mom did not have enough money,my dad was absent so mom had to do all herself. She was strong enough to get my brother the textbook and also get me drugs and took me to the hospital. She took care of me and my brothers, I was very happy. We love you so so so so so so so much mom. ', 'upload/1456477141.jpg', '1456477141'),
(160, 'Bright Meek Phronesis Odei', 'Egodi Celebrate Odei', '07030750289', 'First of all, I want to say, Mom I love you. My mum is the best in the world. If I have to come back again to this world, I will still choose her as my mum. My reasons for always loving my mum and wanting to always do her proud is; \r\n1. She is Encouraging.\r\nEven when things are difficult for me, she will always tell me â€œYou Can Do All Things". I will never forget that.\r\n2. She is Supportive\r\nIf and if I ever mention that I need help in a project, sport stuff, internet stuff... etc. My mum goes the extra mile, to make sure it is done, even when of seems impossible. She makes it possible. Most time, I look at her and cry inside me and smile out side. What a mother :) .\r\n3. She is my Hero\r\nI don''t just see a mum, I see a hero. My prayer is that she lives long, to see me do her proud. You are my SUPERWOMAN. I LOVE YOU MUM. GOD BLESS YOU.    #PowerOil_Special_Mothers_Moment', 'upload/1456478214.jpg', '1456478214'),
(161, 'Owoene Amaka', 'Owoene Hope', '08068575239', 'My best moment with my mom was on the day she gave birth to my baby sister. I was with her during the child''s labour until she put to bed.won''t forget the smiles in our faces that day, it was full of love.', 'upload/1456481101.jpg', '1456481101'),
(162, 'Ifeyinwa. c. Anene', 'Patrica .n. Emekene', '08033132176', 'mama i too love u. For the suffer wey u suffer for me , your prayers , advice.has  made who are am today. your shoulder is always there for me to lay my head.i will never forget d only cane you flog me just because i told a lie when i was growing up.that has made me to be truthful in any situlation i found myself. Thank you mum. You are the best mother in th world.', 'upload/1456484692.jpg', '1456484692'),
(163, 'Emmanuel Joshua', 'Celina  Joshua', '08171084656', 'My best moment with my mum is, when i was sick and she would''nt let me lay on the bed but on her laps.giving her full control of taking care of me.', 'upload/1456486348.jpg', '1456486348'),
(164, 'Udoawujo Regina ofili', 'Ofili Joy laetitia', '08055939011', '\r\nMy mum was  with me through out the delivery of my son, she made sure I ate before going to the labor room and was outside waiting and praying till I put to bed..she stayed with me for three days in the hospital and also spent 3 months with me and my family despite her tight schedule. My mother is awesome , always there for us no matter what .I love her much and pray for God to bless her immensely , she shall see her childrens children .amen\r\n', 'upload/1456501076.jpg', '1456501076'),
(165, 'Tonuewa Alice', 'Taiwo', '08138190643', 'Best moment with my mother,on a sweet afternoon when she came back from the market wit things to cook,and I was asked to cook meet nd fried it wit poweroil,I colected d meat wash seasoned and set to cook after tasting the of the meet is good to go then I put my frying pan and pour some quantity of POWER OiI,the first batch of frying me brings me salivating I took 1 from the frying pan immediately I heard d food step of my mum I just hide d meat beside d stove not knowing d meat is already bringing out smoke from where it was hidden,my. Mum jus went there straight nd there she caught me red handed wit my poweroil frying meat,the same day as if that was not enough after making d stew wit power oil our food was served by my mum but d aroma of d poweroil makes me to believe that d meat my 2yr old sis threw on d floor was stil good as I rushed to grab the meat you can''t believe it was my sisters faeces(poopoo) that is on the floor.mum nd dad laughed throughout the night,though my mum is late now 6months ago,but I stil can''t forget that moment I shared wit my mum.I LOVE U SO MUCH MUMMY.', 'upload/1456502627.png', '1456502627'),
(166, 'Tonuewa Alice', 'Taiwo', '08138190643', 'Best moment with my mother,on a sweet afternoon when she came back from the market wit things to cook,and I was asked to cook meet nd fried it wit poweroil,I colected d meat wash seasoned and set to cook after tasting the of the meet is good to go then I put my frying pan and pour some quantity of POWER OiI,the first batch of frying me brings me salivating I took 1 from the frying pan immediately I heard d food step of my mum I just hide d meat beside d stove not knowing d meat is already bringing out smoke from where it was hidden,my. Mum jus went there straight nd there she caught me red handed wit my poweroil frying meat,the same day as if that was not enough after making d stew wit power oil our food was served by my mum but d aroma of d poweroil makes me to believe that d meat my 2yr old sis threw on d floor was stil good as I rushed to grab the meat you can''t believe it was my sisters faeces(poopoo) that is on the floor.mum nd dad laughed throughout the night,though my mum is late now 6months ago,but I stil can''t forget that moment I shared wit my mum.I LOVE U SO MUCH MUMMY.', 'upload/1456502627.png', '1456502627'),
(167, 'Tonuewa Alice', 'Taiwo', '08138190643', 'Best moment with my mother,on a sweet afternoon when she came back from the market wit things to cook,and I was asked to cook meet nd fried it wit poweroil,I colected d meat wash seasoned and set to cook after tasting the of the meet is good to go then I put my frying pan and pour some quantity of POWER OiI,the first batch of frying me brings me salivating I took 1 from the frying pan immediately I heard d food step of my mum I just hide d meat beside d stove not knowing d meat is already bringing out smoke from where it was hidden,my. Mum jus went there straight nd there she caught me red handed wit my poweroil frying meat,the same day as if that was not enough after making d stew wit power oil our food was served by my mum but d aroma of d poweroil makes me to believe that d meat my 2yr old sis threw on d floor was stil good as I rushed to grab the meat you can''t believe it was my sisters faeces(poopoo) that is on the floor.mum nd dad laughed throughout the night,though my mum is late now 6months ago,but I stil can''t forget that moment I shared wit my mum.I LOVE U SO MUCH MUMMY.', 'upload/1456502627.png', '1456502627'),
(168, 'Tonuewa Alice', 'Taiwo', '08138190643', 'Best moment with my mother,on a sweet afternoon when she came back from the market wit things to cook,and I was asked to cook meet nd fried it wit poweroil,I colected d meat wash seasoned and set to cook after tasting the of the meet is good to go then I put my frying pan and pour some quantity of POWER OiI,the first batch of frying me brings me salivating I took 1 from the frying pan immediately I heard d food step of my mum I just hide d meat beside d stove not knowing d meat is already bringing out smoke from where it was hidden,my. Mum jus went there straight nd there she caught me red handed wit my poweroil frying meat,the same day as if that was not enough after making d stew wit power oil our food was served by my mum but d aroma of d poweroil makes me to believe that d meat my 2yr old sis threw on d floor was stil good as I rushed to grab the meat you can''t believe it was my sisters faeces(poopoo) that is on the floor.mum nd dad laughed throughout the night,though my mum is late now 6months ago,but I stil can''t forget that moment I shared wit my mum.I LOVE U SO MUCH MUMMY.', 'upload/1456502627.png', '1456502627'),
(169, 'Omolola Kafayat', 'Akande Abibat Modupe', '07031018161', 'My mum was my role model and mentor.She was always with us the children, she risk many things for our sake. Four years ago, I was the one on a sick bed,almost getting better,she died suddenly without any trace of sickness. Really missed.', 'upload/1456502746.jpg', '1456502746'),
(170, 'Joy chuks', 'Mrs Chioma Chuks', '07039504565', 'helping my mum in kitchen during preparation of meal the little chunks of meat and fish which she passes to me smilling, makes me happy ', 'upload/1456505631.jpg', '1456505631'),
(171, 'Gift Oghenero Ogide', 'Josephine Orode Ogide', '08059009873', 'I remember been very lonely, frustrated and dejected because all my mates were celebrating with their loved ones and their was no body to even tell me "congratulation, you have made it" just as i was hearing from other parents to their children.  Now i just lost my dad and of course i wouldn''t blame her for not been here because she is still mourning her late husband my dad....... But just when i thought i should the ceremony ground, just then i heard her sweet melodious voice behind me with my two elder brothers.  I didnt know i ran to her and hugged her with all the joy i have. I couldn''t have been happier, a mourning mother coming to celebrate with the son and not been the only son she has  made the whole thing so surprising to me. Just then that words came from her mouth  to me "congratulations darling, you have made it". That has been the best day of my life b i will live to remember it and that was  my conguation day from the university  15th Feb. 2013', 'upload/1456508250.jpg', '1456508250'),
(172, 'Uduak Udoh', 'Justina Akpan', '08063084148', 'The best moment story with my mum happened few years ago when I wanted to assist her carry her bag of wines on my head to the bus/stop where she sells but she refused saying I wasn''t used to carrying such load, Instead she asked me to help place the bag on her head, the bag was so heavy that the weight could break ones neck, I shed tears as she carried the load but she smiled and looked at me and said to me "For my sake go to school and become somebody, i am carrying this load today so you would not carry it tomorrow"...... There and then I realised that there is no love like a mothers'' love ~ she is my one in a trillion ~ I love you mum and I''ll make you proud oneday soon. Thank you poweroil for this platform! ', 'upload/1456510089.jpeg', '1456510089'),
(173, 'Uduak Udoh', 'Justina Akpan', '08063084148', 'The best moment story with my mum happened few years ago when I wanted to assist her carry her bag of wines on my head to the bus/stop where she sells but she refused saying I wasn''t used to carrying such load, Instead she asked me to help place the bag on her head, the bag was so heavy that the weight could break ones neck, I shed tears as she carried the load but she smiled and looked at me and said to me "For my sake go to school and become somebody, i am carrying this load today so you would not carry it tomorrow"...... There and then I realised that there is no love like a mothers'' love ~ she is my one in a trillion ~ I love you mum and I''ll make you proud oneday soon. Thank you poweroil for this platform! ', 'upload/1456510234.jpeg', '1456510234'),
(174, 'Obianika calistus ', 'Obianika mercy nwdinaka chukwu ', '08035436631', 'Visit to uk', 'upload/1456510849.jpg', '1456510849'),
(175, 'Ukeh Nkiruka', 'Ukeh Stella Nneka', '07037148777', 'My mum is an assidious woman who will stop at nothing to ensure I and my siblings lack nothing.\r\n   Sometime ago as a junior secondary school student, I forgot my key at home after I was taken to boarding house for that term.Whe n we realized I forgot the key back home.She was so angry but later went back home and brought it for me.Angrily she said"Don''t bother waiting to see me on visiting day because I won''t come"I took that as my punishment.\r\n    On visiting day,I was so sober ready to accept my fate.But all of a sudden,a student from my hostel came to me and said a woman that resembles me is waiting for me at the gate.That moment, I smiled like never before.When I saw her,I hugged her tight.She couldn''t keep to her words because she loves me.Thank you mum for everything. God bless you', 'upload/1456516123.jpg', '1456516123'),
(176, 'Eze Faith Nnenna', 'Eze Jane lebechi', '07037092319', 'it is always a thing of joy to have a virtuous mother.. Always grateful that my mum takes care of her family more than anything ..she is the reason am being a good lady today.. wish I had a heart like hers.\r\n', 'upload/1456518345.jpg', '1456518345'),
(177, 'tom', 'mrs ohagwu laeticia', '07031570714', 'My childhood days', 'upload/1456518468.jpg', '1456518468'),
(178, 'Gift Oghenero Ogide', 'Josephine Orode Ogide', '08059009873', 'I remember been very lonely, frustrated and dejected because all my mates were celebrating with their loved ones and their was no body to even tell me "congratulation, you have made it" just as i was hearing from other parents to their children.  Now i just lost my dad and of course i wouldn''t blame her for not been here because she is still mourning her late husband my dad....... But just when i thought i should the ceremony ground, just then i heard her sweet melodious voice behind me with my two elder brothers.  I didnt know i ran to her and hugged her with all the joy i have. I couldn''t have been happier, a mourning mother coming to celebrate with the son and not been the only son she has  made the whole thing so surprising to me. Just then that words came from her mouth  to me "congratulations darling, you have made it". That has been the best day of my life b i will live to remember it and that was  my conguation day from the university  15th Feb. 2013', 'upload/1456518787.jpg', '1456518787'),
(179, '', '', '', '', 'upload/1456518822.jpg', '1456518822'),
(180, '', '', '', '', 'upload/1456518848.jpg', '1456518848'),
(181, '', 'Hannah Bluejack', '08037061262', 'Every moment with my mother is a best moment. There''s never a dull moment with her. Always so much to laugh about. She single handedly raised us, working very hard to provide all our needs, loving us with a deep love that cannot be explained. She corrects, encourages, supports, prays for us and always has our back no matter what. She is loving and kind, humble, soft-spoken and a good example of what a mother should be. I love her so much and I wish her a Happy Mother''s Day.', 'upload/1456519688.jpg', '1456519688'),
(182, 'Nwachi Afam ', 'Nwachi Stella oshinowo', '08033528959', 'My mother is my first and since teenage dating is harmful she still remains the 2nd female person i can DIE FOR after my little sister.....There are numerous Memories i have shared with this special woman.... Picking just one is quite a tough task...... First i remembered when i went to Universtiy of Port harcourt to represent my sch UNIBEN  in taekwando my mum insisted she followed me maybe cos i was quite small and was in 100 level and new to the Universtiy System... Whatever the reason we both enjoyed blissful moment.. . Jogging with her... her sweet cheers from the stand and all the places we visited together... I Love her to the Moon and a gift would be a little Payment when compared to the huge sum of Love and care i owe her', 'upload/1456520675.jpg', '1456520675'),
(183, 'Uzoegbu Emeka Alexander', 'Uzoegbu Nkechi Christiana', '08085407914', 'A mother''s happiness is like a beacon, lighting up the\r\nfuture but reflected also on the past in the guise of\r\nfond memories. Mother''s love is peace. It need not be\r\nacquired, it\r\nneed not be deserved. My mother is a walking\r\nmiracle, The love of a mother is the veil of a softer\r\nlight\r\nbetween the heart and the heavenly Father.\r\nSometimes the strength of motherhood is greater\r\nthan natural laws, There is nothing in the world of art\r\nlike the songs\r\nmother used to sing, I remember my mother''s\r\nprayers and they have\r\nalways followed me. They have clung to me all my\r\nlife. Tankz Nne', 'upload/1456521342.jpg', '1456521342'),
(184, 'Uzoegbu Emeka Alexander', 'Uzoegbu Nkechi Christiana', '08085407914', 'A mother''s happiness is like a beacon, lighting up the\r\nfuture but reflected also on the past in the guise of\r\nfond memories. Mother''s love is peace. It need not be\r\nacquired, it\r\nneed not be deserved. My mother is a walking\r\nmiracle, The love of a mother is the veil of a softer\r\nlight\r\nbetween the heart and the heavenly Father.\r\nSometimes the strength of motherhood is greater\r\nthan natural laws, There is nothing in the world of art\r\nlike the songs\r\nmother used to sing, I remember my mother''s\r\nprayers and they have\r\nalways followed me. They have clung to me all my\r\nlife. Tankz Nne', 'upload/1456521571.jpg', '1456521571'),
(185, 'anny umoh', 'ikwo sampson', '08029731791', 'The best moment with my mum is when I was at school back then in my ss2,things went bad and she couldn''t afford my fees,she had to borrow despite her ill state till now,denied her self of good things just to make sure I achieve my academic goals and make her proud. Now by God''s grace am a semi-graduate,and am doing my best to put a smile on her face,I pray God preserves her life to reap the fruit of her labour."How I love you mum? #Thanks for being the best mum#', 'upload/1456523163.jpg', '1456523163'),
(186, 'Enendu Chizoba', 'Mrs Constance Enendu', '08038653505', 'During her last visit to my house, my surprised everybody in the house,my ever serious minded mum suddenly turn to babe.she alway want to hang out especially to the popular Chinese restaurant (chop stick) you  can imagine but it was fun fun all the way.', 'upload/1456525997.jpg', '1456525997'),
(187, 'bosede olopade', 'olasunbo Beatrice soyemi', '08025172868', 'I Luv the way she always appreciate me anytime I gave her something. she will pray and pray and pray. i Luv seeing her do this. Luv u trillions times mum. hapi mother''s day. ', 'upload/1456527871.jpg', '1456527871'),
(188, 'Ekoja Okewu', 'Esther Akor', '08038670582', 'Story  story.....  My 3 children will be more than 30 children.Those words sum up my mum. In what other way can i present a short moment in a story format', 'upload/1456528812.jpg', '1456528812'),
(189, '', 'Eno Sylvester Udoh', '08063487197', 'When I came home in the Rain-\r\nFather asked: "why didn''t u take an\r\numbrella??"\r\nSister advised: "why\r\ndidn''t u\r\nwait till the rain stopped??"-\r\nBrother angrily warned: "Only after\r\ngetting\r\na cold u will realize!!"\r\nBut Mother,\r\nwhile\r\ndrying my hair, said:"Stupid Rain!\r\nCouldnâ€™t\r\nit wait till my child comes home??\r\nThat''s\r\nwhy my mother is special. She''ll laugh her ribs out if you remind her of this', 'upload/1456555970.png', '1456555970'),
(190, 'LATIFAT AJETUNMOBI', 'Alhaja Falilat Sola Ajibade', '08147087689', 'She is a widow, she had everything taken from her except for her husband''sname and her children. My mom single handedly saw me through school, today I am a professional nurse. She has 8 of us. At her age she is supposed to be resting, but she is bent on watching others climb the ladder of success, it''s telling on her health and my effort is not significant. I pray she lives long to eat the fruit of her labor and not die from struggling.', 'upload/1456556001.jpg', '1456556001'),
(191, 'Adeoshun Victoria', 'Mrs Olubunmi Adeoshun', '08069778489 ', 'Share a story of your best moment with your mother:A Story Of My Best Moment With My Was When I Was D Sickness Was Terrible Dat She Has 2 Do Everything 4 Me,she Would Feed,bath,and Do Many Other Things 4 Me Becos I Can''t Stand On My Own,she Would Stay With Me And Be Fasting And Praying 4 Me Until I Recover And Gain My Strength Back. ', 'upload/1456556144.jpg', '1456556144'),
(192, 'Anthony Udoezi', 'Appolonia Ogechi Udoezi', '07064418553', 'Our best moment was at Lagos when we went to my big brother''s wedding. She cooked the food and it was delicious. More especially the stew she cooked with power oil because she Love''s it alot, when cooking stew, frying egg and other things. Later my big bro took I and my mummy to a restaurant and some other palaces it was fun and cool staying with my mummy. I love her a lot more especially am her last born so she is always fond of me. ', 'upload/1456557398.jpg', '1456557398'),
(193, 'Gift Oghenero Ogide', 'Josephine Oghenero Ogide', '08059009873', 'I remember been very lonely, frustrated and dejected because all my mates were celebrating with their loved ones and their was no body to even tell me "congratulation, you have made it" just as i was hearing from other parents to their children.  Now i just lost my dad and of course i wouldn''t blame her for not been here because she is still mourning her late husband my dad....... But just when i thought i should the ceremony ground, just then i heard her sweet melodious voice behind me with my two elder brothers.  I didnt know i ran to her and hugged her with all the joy i have. I couldn''t have been happier, a mourning mother coming to celebrate with the son and not been the only son she has  made the whole thing so surprising to me. Just then that words came from her mouth  to me "congratulations darling, you have made it". That has been the best day of my life b i will live to remember it and that was  my conguation day from the university  15th Feb. 2013', 'upload/1456557675.jpg', '1456557675'),
(194, '', 'ndenojuo ngozi', '07067063844', 'Was on her 50th birthday.it was fun,and I will not forget d memory so fast.', 'upload/1456557826.jpg', '1456557826'),
(195, '', 'ndenojuo ngozi', '07067063844', 'Was on her 50th birthday,it was fun and I can''t forget it so fast', 'upload/1456558075.jpg', '1456558075'),
(196, 'LATIFAT AJETUNMOBI', 'Alhaja Falilat Sola Ajibade', '08147087689', 'She is a widow, they took everything away from her except her husband''s name and kids. She single handedly struggled to see that I climb the ladder of success,today I am a professional nurse . She has eight of us,she toils day and night to ensure others climb up too. At her age she is supposed to be resting but she is still struggling. I pray she doesn''t die in her struggle. There is no other like my mother.', 'upload/1456558795.jpg', '1456558795'),
(197, 'Onyegbule-Patrick Patricia Chidinma', 'Patience Aka Solomon', '08060775326', 'The best moment and memory i had with my mother was on the day of my matriculation in the University of Port Harcourt. A day before my matriculation she called me and asked how i was preparing for the matriculation ceremony, i told her that i had no money therefore that i will just go to the Arena and then join other in taking photographs after the speech by the VC. I as well insisted she should just come and join in the pictures even if there is no enough money to celebrate it. On that faithful morning, I was surprised when she called and asked me for description of my lodge very early in morning, when she finally came, hmm!... She made my room mate nd i proud. We didn''t just take photographs as earlier but  celebrated our matriculation with my mum becoming a celebrant too. My Mum is everything I have. I Love you my Dear mother.', 'upload/1456560465.jpeg', '1456560465'),
(198, '', '', '', '', 'upload/1456560489.jpeg', '1456560489'),
(199, '', '', '', '', 'upload/1456560506.jpeg', '1456560506'),
(200, '', '', '', '', 'upload/1456560529.jpeg', '1456560529'),
(201, '', '', '', '', 'upload/1456560546.jpeg', '1456560546'),
(202, 'Onyegbule-Patrick Patricia Chidinma', 'Patience Aka Solomon', '08060775326', 'The best moment and memory i had with my mother was on the day of my matriculation in the University of Port Harcourt. A day before my matriculation she called me and asked how i was preparing for the matriculation ceremony, i told her that i had no money therefore that i will just go to the Arena and then join other in taking photographs after the speech by the VC. I as well insisted she should just come and join in the pictures even if there is no enough money to celebrate it. On that faithful morning, I was surprised when she called and asked me for description of my lodge very early in morning, when she finally came, hmm!... She made my room mate nd i proud. We didn''t just take photographs as earlier but  celebrated our matriculation with my mum becoming a celebrant too. My Mum is everything I have. I Love you my Dear mother.', 'upload/1456560610.jpeg', '1456560610'),
(203, 'Lawal Omotolashe Omobolaji', 'Lawal Rashidat Adebola', '0805883224', 'My mummy is indeed a best mummy in the world because she could sacrifice anything to make life worth living for me.\r\nI could remember my final semester in school when I was doing my project and my supervisor was giving me tough time and she insisted that I may not graduate from school.\r\nI was so down and sick because my mummy was expecting to be home preparing for my convocation and yet am battling with my project and supervisor. \r\nWhen the problem persist, I have no choice than to explain the problem am facing to my mother, when she heard, she couldn''t hold but to find solution to my problem, she was like "my son that suppose to graduate this year " what can be the hindrance, I went home to give my mother the number of my supervisor, and she called her, she begged and talked to my supervisor on my behalf.\r\nMy supervisor succumbed and she freed me.\r\n\r\nIf my mother didn''t not intervened, it may cost me another year in school.\r\nMy mother is indeed a great and indispensable to my life.\r\n\r\nI love my mother!!!!!', 'upload/1456560941.png', '1456560941'),
(204, 'Itohan Antak ', 'Praise Okoawo.', '08054019835', 'My mum suggested a car be bought for me as a surprise  wedding present. On my wedding day, I was astonish to receive a car as my wedding  gift. This was purely her handwork. she usually says, I can do anything for you, my first lady.  I also remember when my Jamb result was seized, I was devastated, Mum told me not to worry. Before I knew it, She had coughed out a huge amount of money for me to get a pre-degree form, instead of staying at home for another 1year, and paid the tuition fees too. I love her so much and pray she eats the fruit of her labour.', 'upload/1456561180.jpg', '1456561180'),
(205, 'Bello Olanrewaju', 'Bello Margaret', '07058392307', 'My best moment with my mother is usually when she''s preparing our meal. She will always want to ask me what I want to eat and not want pleases her. So our gist during this time is usually very lively because she loves me to be with her in the kitchen. Those time  I call her "My irreplaceable".', 'upload/1456561528.jpg', '1456561528'),
(206, 'Fatusi Oyindamola', 'Alhaja kafayat Fatusi', '08081769757', 'I didn''t get into the university when I was supposed to because I didn''t pass the exam and I was so depressed and one of the things that made me depressed was what my mum was going to say. Surprisingly, she consoled me and encouraged me to try harder the next year. I''m in my second year in the university now', 'upload/1456562536.jpg', '1456562536'),
(207, 'Loveth Oforah ', 'Irene Oforah', '07036443500', 'Was a memory not to forget...Danced with  her and her steps made us laugh. She is the best', 'upload/1456563898.jpg', '1456563898'),
(208, 'Loveth Oforah ', 'Irene Oforah', '07036443500', 'Was a memory not to forget...Danced with  her and her steps made us laugh. She is the best', 'upload/1456564032.jpg', '1456564032'),
(209, 'Nwankudu Chidinma Olive', 'Nwankudu Ezinne', '07035100484', '*One Xmas period I was very sick and admitted in the hospital.  It was time for the family to travel down to the village for xmas and new year holidays. My mum told them to go. So They all left and only both of us stayed back in town because of my health. I was really moved. We later went to meet them when my health improved.\r\n*Earlier this year, I went to braid my hair in my mums working Place. She told a colleague of hers to make the hair for me. She stayed there with me till I finished with the hair and that was in the Evening. I was begging her to leave that I will come back when I''m done but she refused.', 'upload/1456564373.jpeg', '1456564373'),
(210, 'Anyanwu ogochukwu christiana', 'Mrs Maria Anyanwu', '07066933038', 'My best moment was when I did something really bad and instead of flogging or shouting on me, she sat me down and talked to me. \r\nI told her everything and I apologized , she embraced me. I can still feel that embrace till this moment. That''s my best moment because I thought she will scold me or even slap me. ', 'upload/1456564828.jpg', '1456564828'),
(211, 'Oforah ebere loveth', 'Irene Oforah ', '07036443500', 'Share a story of your best moment with your mother  My 24th birthday was fun filled with mom, she came for a burial and stay for my birthday..and dat night was d best moment ever with her..we gisted, did small mother and daughter amebo..ate good food. I hated my mom cos she always flog me and restricted me from some friend,we jst started getting along and I feel so loved and important...I appreciate all d days she flogged me, it made me focused, God fearing, useful and reserved. ..I love my mom, she is d best!\r\n', 'upload/1456565504.jpg', '1456565504'),
(212, '', 'Ezinne Adamma Onyemauwa ', '07061621803', 'My mum is the best mother in the whole world. Shs is both mother and father to I and siblings. A duty she did perfectly with love and joy. Mum I love you so much that I won''t blink an eye lid. My prayer daily is that God will always keep you alive to enjoy your sweat. Mum if there is any thing like reincarnation you will always be my mother. I love mum and nobody will ever take your place in my heart Ezinne Adamma my sweet mother.  ', 'upload/1456568578.png', '1456568578'),
(213, '', 'Comfort Sunday Danson ', '08028668044', 'The best moment with my mum was the day i decided to give her a treat, she was full of smiles. ', 'upload/1456570448.jpg', '1456570448'),
(214, '', 'Comfort Sunday Danson ', '08028668044', 'The best moment with my mum was the day i decided to give her a treat, she was full of smiles. ', 'upload/1456570548.jpg', '1456570548'),
(215, '', 'TAIWO ADEYEMI', '07061957245', 'My mother is great woman, many stories about her,  but this particular one is special. My brother has be on sick bed since,  my mother has to abandon her booming business to take care of him,  she is still  be the one carry his fierce and urine for long, she still very strong', 'upload/1456571297.jpg', '1456571297'),
(216, 'Ezejiugo juliet ogechukwu', 'Ezejiugo okafor Anthonia Ijeoma', '07034331668', 'The best moment wit mum was weneva she heard say i wont get married. it provokes her. she teaches me determination. hw to b optimistic, dnt bliv in failure. she is d best\r\n\r\n\r\n\r\n', 'upload/1456575436.jpg', '1456575436'),
(217, 'Mustapha yusuf', 'Aisha adamu', '07031378604', 'I really love my mum when i am not around she scared. ', 'upload/1456575780.jpg', '1456575780'),
(218, 'Abdulkadir adamu', 'Adda musa', '09030162163', 'My mum is the best mum ever she really loves me so much. ', 'upload/1456575896.jpg', '1456575896'),
(219, 'nansat', 'Rachael', '07062746002', 'all the moments shared with my mum is so great that I do not have a best moment. my mum is just amazing. if I am to come black in another life time, I wish to come back as her daughter. I love you mum.', 'upload/1456581619.jpeg', '1456581619'),
(220, 'ojo Temitope A', 'ojo Abimbola janet', '08038691835', 'my mum is the best mother in the whole world. I remembered when I gained admission to institution she was the only one there for me and God. she''s my gold, my jewel. love u mum', 'upload/1456583094.jpg', '1456583094'),
(221, 'Chioma peters', 'Mrs Glory Peters', '07034254431', 'Every day of my life is my best moments with my mum, from the day I was born till now. But times that am most grateful to have her is when I think of other women who are sepeeated from their husband''s and they leave their children. But my mum never did, she has stood us( her children )in good and bad times. She is my biggest fan, especially night she had to spend in the hospital with me without complaining, she has sacrificed her own life so that we her children can have it better. Everyday I ask God to bless me because that''s the only way I did he able to pay her back, I don''t even know if material things will be enough to say thank you to my best friend, my rock, my nurse, my pillar, my caretaker, my queen. God bless you sweet mother!', 'upload/1456583405.jpg', '1456583405'),
(222, '', 'Folake Adesanya', '08092717846', 'When I put to bed on 7/7/2015.... She has been a pillar of support. Up til now. How would I have coped with baby, home duties and career. Thank God for my Mum. I call her Mamere. She has sacrificed so much for me just so I can achieve my dreams. She is Darasimi''s boo of life. I love you Mamere.', 'upload/1456587964.jpg', '1456587964'),
(223, '', 'Mrs Oladeji Florence Olajire ', '08023897727', 'We had our moment few minutes after I had my first child. She had this sweet proud,fulfilled and knowing smile on her face and a greater love,respect,adoration and appreciation shew clearly on my face. The moment needed no words as holding of hands was more than enough and the bond became stronger as I was welcome to motherhood', 'upload/1456653221.jpg', '1456653221'),
(224, 'Adeleke', 'Tawakalitu', '08060108079', 'All moments have been the best ', 'upload/1456678833.jpg', '1456678833'),
(225, 'Afolabi Muyideen', 'Mrs Afolabi', '09031635464', 'The year my mother told me "My son,there is no market and money" but Christmas coming then. On 23rd of December,my mother took me to a boutique for shopping. It really pained when I realized that she bought everything for me that day on loan and that boutique manager was her friend. I was like "mum I do want all this,I want you. I love my mother.', 'upload/1456776514.jpg', '1456776514'),
(226, 'Muyideen', 'Mrs Abimbola', '09031635463', 'The year my mother told me "My son,there is no market and money" but Christmas coming then. On 23rd of December,my mother took me to a boutique for shopping. It really pained when I realized that she bought everything for me that day on loan and that boutique manager was her friend. I was like "mum I do want all this,I want you. I love you mama.', 'upload/1456777289.jpg', '1456777289'),
(227, 'Kelechi Njoku', 'Keziah Njoku', '07034347458', 'While growing up, she showed me that I needed to be disciplined to be successful. She assisted my father to provide for the family through her hair dressing and food business but she metamorphosed into a typist after attending a commercial school, which she had used to make a countless financial input in the family including training all her children up to the tertiary level in education. She even introduced me to GOD. \r\nFurthermore, during  my marriage last two years- in 2014, she exhibited what I could call â€˜a backboneâ€™ as she provided financial support even when I didnâ€™t expect it from her. \r\nToday I can still talk of what she on the  11th day of March 2015 to be precise.  I learnt that my wife had been ill as she is pregnant. She travelled to Owerri from Lagos  in December of 2014 because she believed that my own mother would give her the desired and required care in pregnancy than me her husband. And when I called my mum  that day at about 7.20 p.m. she told me that she had gone to a pharmacy to get the drugs her nurse prescribed for my wife. She had been telling me on phone that I should concentrate because she had everything under control. What would I had done if my mother had not been there with those motherly love flowing in her veins in this era when daughters-in-laws run away from their mothers-in-laws but my wife chose to tap from my mother.\r\n In fact I give that award to my dearest mother Mrs. Kez Njoku because her motherly love is unquantifiable.  She is ', 'upload/1456834861.jpg', '1456834861'),
(228, 'ochei stella', 'ochei ifeoma', '08188489763', 'my best moment with my mother is the day she took me to her village,and taking me round, to steam.', 'upload/1456904054.jpg', '1456904054'),
(229, 'Chinyere Emeka-Ojo', 'Juliet Obaji', '08166327962', 'I have several memorable moments with my mom but this one stands out. I just had my baby recently and my mom was with me throughout the whole birthing process. From the moment i had my first contraction she was there encouraging me, massaging me and of course praying for me, until i delivered my baby. She was the first to see and hold my baby after the medical team. It was a very special moment for me and i was glad we went through it together. I love you mama and i pray God keeps us alive to share many more memorable moments together, amen.', 'upload/1456954564.jpg', '1456954564'),
(230, '', 'Theresa Ijego Ogbonnaya ', '08136506778', 'She borrowed money just to ensure u didn''t get kicked out of school and  she sarcrificed a lot for my siblings and I', 'upload/1456966501.jpg', '1456966501'),
(231, 'odoemena obiageri blessing ', 'blessing raphael odoemena ', '08030948725', 'My best moment with my mother was when I was in secondary school.. I was very ill and I was sent home.. There was no money in d house fr hospital bills.. So I had to recieve home made treatment.. My mum like never before took care of me in an exceptional manner.. From bathing ms to spoon feeding me.. To borrowing money to get me drugs.. She was like a super hero in d movies..never had I ceen anyone so caring.. Nd our time spent together meant a lot to me even of I was on my sick bed.. We shared a lotta stories.. She made me tell her stories about school so I wouldn''t feel my pain.. Even with all the fever I could still manage a good laugh.. She indeed is a blessing like her name implies.. D bond between us is so strong..', 'upload/1456982378.jpg', '1456982378'),
(232, 'I  want power oil to give my mum something very sp', 'Madam Adedoyin Olaitan Adebajo ', '08184165413', 'I was very stubborn and naughty when I was in secondary school, anytime I fight in the school, I will be sent home to call my parents but my dad will tell me I''m not his daughter that only my mum knows where she got me, only my mum will go with me crying and pleading with the school authority. She always support me in any situation even till now the is always there for me. I love her so much because she is the best.', 'upload/1456997694.jpg', '1456997694'),
(233, 'EGHEOSE  HAYBLE', 'ADESUWA  BEATRICE HAYBLE', '08023370808', 'My mom makes me feel special, she sometimes carries me to a  toy shop and tells me to pick  any toy of my choice. This makes me very excited. The last time I pickMy mom makes me feel special, she sometimes carries me to a  toy shop and tells me to pick  any toy of my choice. This makes me very excited. The last time she took me to a shopping mall and asked me to pick any toy, i picked my favourite toy (toy gun with bullet that stick) I was so happy.ed my favourite toy (toy gun with bullet that stick) I was so happy.', 'upload/1456998343.jpg', '1456998343'),
(234, 'Saka Oladimeji', 'Saka Olufunmilayo ', '07036616085', 'Everytime with mommy is love touchable!!!!', 'upload/1457003027.jpg', '1457003027'),
(235, 'Amazing Ihuoma', 'Lucy Ihuoma', '08064760122', 'My first Child bearing experince was easier because she was around me to guide me\r\n', 'upload/1457006691.jpg', '1457006691'),
(236, 'Patrick Njoku', 'Mrs. Kelechi Njoku', '08032322571', 'In my father''s absence, she had been my backbone in my education for now that l am still a student.', 'upload/1457006922.jpg', '1457006922'),
(237, 'Nwakaego Onyeakazi', 'Nkechinyere Onyeakazi', '07032663487', 'I realised that my mum is great after I went through labour and had my baby. Still she was there to care for me for 2  months', 'upload/1457007583.jpg', '1457007583'),
(238, 'Igbokoyi Muibat ', 'Igbokoyi Risikat', '07089836112', 'There has never been a time that has not been great with my mother.However,if i had to choose a specific one that made an impact on my life it would be when I gave birth to my daughter,she took care of me and my daughter   ', 'upload/1457012923.jpg', '1457012923'),
(239, 'Hart Victoria', 'Tochukwu Hart', '08037406788', 'One of the best moment I shared with my mum was when I travelled to see my mum in Lagos. For some time we weren''t close but coming to spend few weeks with her made me truly realize how much she meant to me. She taught me thing''s I couldn''t do, though she shouts at me but with love. She always taught me how to live my own home when I get married. Sometimes we will spend the day talking and watching movies until we slept, I will cook and she will cook and ohh how I wish I hadn''t made myself distant from her because to me I realize I''m a fool and I have promised myself to always put a smile on her face. Those moments to me were very very precious to me. I sincerely love my mum.', 'upload/1457085834.jpg', '1457085834'),
(240, 'Hart Victoria', 'Tochukwu Hart', '08037406788', 'One of the best moment I shared with my mum was when I travelled to see my mum in Lagos. For some time we weren''t close but coming to spend few weeks with her made me truly realize how much she meant to me. She taught me thing''s I couldn''t do, though she shouts at me but with love. She always taught me how to live my own home when I get married. Sometimes we will spend the day talking and watching movies until we slept, I will cook and she will cook and ohh how I wish I hadn''t made myself distant from her because to me I realize I''m a fool and I have promised myself to always put a smile on her face. Those moments to me were very very precious to me. I sincerely love my mum.', 'upload/1457085880.jpg', '1457085880'),
(241, 'Bemigho Mofe', 'Bemigho Gloria Bawo', '+2348032361895', 'MY MOTHER\r\nOf all the persons in the world, my mother loves me most, and I also love her from the core of my heart. To me, she is like a living goddess who takes all kinds of pain and care for my sake. When I am sick, she spends sleepless nights by my sick-bed. When I come first in my class examination, she becomes perhaps the happiest person on earth. From my childhood, I have been greatly influenced by my mother. She has always guided me in the right path in every step of my life. She has taught me discipline, manners, and the sense of duty towards others in the family and in the society. She has taught me to love my country and my countrymen. \r\nEvery time she would sit me down and listen, listen to every word I had to say. She would give me advice on that situation, advice such as: where to go, who to talk to, how and what to say. I know our mothers may not always be correct or have the right opinion, but in most cases we may not consider it, or completely understand it.\r\nMy mother is an ideal woman in my life. ', 'upload/1457126333.jpg', '1457126333'),
(242, 'egwu eberechukwu', 'lady mercy o.a eze', '07033725470', 'My moment story was when my mum came for my son omugwo visit and carry him as the grand ma I was very happy mama obodo we love u for being there.', 'upload/1457165131.jpg', '1457165131');

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
-- Indexes for table `user_form`
--
ALTER TABLE `user_form`
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
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_no` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `order_basket`
--
ALTER TABLE `order_basket`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `transaction_log`
--
ALTER TABLE `transaction_log`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_form`
--
ALTER TABLE `user_form`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=243;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
