-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2020 at 12:40 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_inv`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `bid` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`bid`, `brand_name`, `status`) VALUES
(1, 'Nestle', '1'),
(2, 'Cadbury', '1'),
(3, 'HP', '1'),
(4, 'Dell', '1'),
(5, 'Motoraola', '1'),
(7, 'One Plus', '1'),
(8, 'Lenovo', '1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `parent_cat` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `parent_cat`, `category_name`, `status`) VALUES
(1, 0, 'Food', '1'),
(2, 1, 'Chocolates', '1'),
(3, 0, 'Electronics', '1'),
(4, 3, 'Mobile Phones', '1'),
(5, 3, 'Computer', '1'),
(7, 0, 'Footwear', '1');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_no` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `sub_total` double NOT NULL,
  `gst` double NOT NULL,
  `discount` double NOT NULL,
  `net_total` double NOT NULL,
  `paid` double NOT NULL,
  `due` double NOT NULL,
  `payment_type` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_no`, `customer_name`, `order_date`, `sub_total`, `gst`, `discount`, `net_total`, `paid`, `due`, `payment_type`) VALUES
(1, 'Tejas ', '2020-04-03', 200, 36, 6, 230, 200, 30, 'Cash'),
(2, 'Charan', '2020-04-03', 120000, 21600, 1600, 140000, 100000, 40000, 'Cheque'),
(3, 'kirti', '2020-05-03', 4410, 793.8, 203.8, 5000, 3000, 2000, 'Draft'),
(4, 'abc', '2020-05-03', 8100, 1458, 0, 9558, 1000, 8558, 'Cash'),
(5, 'Jim', '2020-05-04', 1800, 324, 0, 2124, 2124, 0, 'Cash'),
(6, 'Sriram', '2020-07-05', 20000, 3600, 0, 23600, 0, 23600, 'Cash'),
(7, 'charan', '2020-07-05', 60000, 10800, 10800, 60000, 50000, 10000, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_no`, `product_name`, `price`, `qty`) VALUES
(1, 1, 'Maggi', 20, 10),
(3, 2, 'Legion Y8', 80000, 1),
(4, 2, 'One Plus 7', 40000, 1),
(5, 3, 'Dairy Milk', 90, 49),
(6, 4, 'Dairy Milk', 90, 90),
(7, 5, 'Maggi', 20, 90),
(8, 6, 'Moto G7+', 20000, 1),
(9, 7, 'Inspiron 5000', 60000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` double NOT NULL,
  `product_stock` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `p_status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `cid`, `bid`, `product_name`, `product_price`, `product_stock`, `added_date`, `p_status`) VALUES
(1, 1, 1, 'Maggi', 20, 100, '2020-05-07', '1'),
(2, 2, 2, 'Dairy Milk', 90, 10, '2020-03-05', '1'),
(3, 4, 7, 'One Plus 7', 40000, 19, '2020-03-04', '1'),
(5, 5, 4, 'Inspiron 5000', 60000, 24, '2020-03-04', '1'),
(6, 5, 3, 'Legion Y8', 80000, 9, '2020-03-04', '1'),
(7, 4, 5, 'Moto G7+', 20000, 34, '2020-03-04', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `usertype` varchar(10) NOT NULL,
  `register_date` date NOT NULL,
  `last_login` datetime NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `usertype`, `register_date`, `last_login`, `notes`) VALUES
(1, 'Tejas Vasa', 'tj@gmail.com', '$2y$08$k0nKj3OkVZEozUVFDtRxxeR8i6dp9N62o3LaIKucA.5xoBgi8HXXu', 'Other', '2020-03-04', '2020-05-07 12:05:16', ''),
(2, 'Mohan', 'mk@gmail.com', '$2y$08$zcJEGa8Wq55eeyj0RU1PqOB8rhF0q2L4SMnmTY.wFosExH.pywYYq', 'Admin', '2020-03-04', '2020-05-07 12:05:17', ''),
(3, 'Charan', 'cs@yahoo.com', '$2y$08$zva3QqjO2Ek5dcEd1e58VOP2/yzO4W1kJoo1Nv7XOTBGAFZ6z1XOO', 'Other', '2020-03-04', '2020-05-07 12:05:47', ''),
(4, 'Akash', 'ar@yahoo.com', '$2y$08$3.VIEHtanm5D.tbVXS60dOUak9Jx2dG47RDQZwHSnFAcC1IntMQ86', 'Admin', '2020-03-05', '2020-03-05 07:03:19', ''),
(5, 'Kirti Bhagat ', 'kirtibhagat@gmail.com', '$2y$08$yeqx5Uj7/SgGncXAAel9R.FtG8yCGnjfulD6E/qgqilFQUJ2TgtqW', 'Admin', '2020-03-05', '2020-03-05 08:03:11', ''),
(6, 'sriram', 'sr@gmail.com', '$2y$08$cyWLfuk7HsFfw9kDs6DAvuOuaR8w9nZPQPjNCeiQPEucU.6Uw778u', 'Admin', '2020-03-05', '2020-05-07 12:05:14', ''),
(7, 'Vaibhav Nagpal', 'vn@gmail.com', '$2y$08$7PBp3Y3WXacJvMt/2UPGfOIPM7JFYKyk2RzOK.cDBlH0lD4t7qNsG', 'Other', '2020-04-02', '2020-04-05 11:04:55', ''),
(8, 'Chris', 'cj@gmail.com', '$2y$08$BgaJf8.aAmdSfzZ9771lkeK8zuf2GRCjvKfG7hFHcI2baAg1KBMPK', 'Other', '2020-04-05', '2020-04-05 03:04:19', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_no`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `cid` (`cid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`invoice_no`) REFERENCES `invoice` (`invoice_no`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `brands` (`bid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
