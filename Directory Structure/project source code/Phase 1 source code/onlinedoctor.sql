-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2022 at 12:41 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlinedoctor`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE IF NOT EXISTS `appointments` (
  `appointid` int(11) NOT NULL AUTO_INCREMENT,
  `doctorid` int(11) DEFAULT NULL,
  `patientid` int(11) DEFAULT NULL,
  `appointmentdate` datetime DEFAULT NULL,
  `symptoms` varchar(300) DEFAULT NULL,
  `prescriptionfile` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`appointid`),
  KEY `doctorid` (`doctorid`),
  KEY `patientid` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `appointments`
--


-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `accountnumber` varchar(40) NOT NULL,
  `customername` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `accounttype` varchar(50) DEFAULT NULL,
  `cardnumber` bigint(20) DEFAULT NULL,
  `expirydate` varchar(50) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`accountnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`accountnumber`, `customername`, `address`, `mobile`, `email`, `accounttype`, `cardnumber`, `expirydate`, `cvv`, `balance`) VALUES
('1111', 'asdf', 'asdf', '123123213', 'rajesh@gmail.com', 'save', 1111, '12', 123, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE IF NOT EXISTS `doctors` (
  `doctorid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `hospitalname` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `experiance` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `doctorphoto` varchar(200) DEFAULT NULL,
  `certificatefile` varchar(150) DEFAULT NULL,
  `consultfee` float DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `accountnumber` varchar(100) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  `opentime` varchar(50) DEFAULT NULL,
  `closetime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doctorid`),
  UNIQUE KEY `email` (`email`),
  KEY `accountnumber` (`accountnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctorid`, `name`, `hospitalname`, `address`, `state`, `city`, `qualification`, `specialization`, `experiance`, `mobile`, `email`, `doctorphoto`, `certificatefile`, `consultfee`, `password`, `accountnumber`, `registerdate`, `opentime`, `closetime`) VALUES
(2, 'asdf', 'asdf', 'sdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', '9729837123', 'doc@gmail.com', '3982158671_abc.png', '6156155681_mobile2.png', 12, '1234', '1111', '2022-10-23', '12:00am', '12:pm');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patientid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patientid`, `name`, `address`, `mobile`, `email`, `password`, `registerdate`) VALUES
(1, 'kumar', 'warangal', '98723234', 'kumar@gmail.com', '1234', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  `doctorid` int(11) DEFAULT NULL,
  `patientid` int(11) DEFAULT NULL,
  `paydate` datetime DEFAULT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`paymentid`),
  KEY `doctorid` (`doctorid`),
  KEY `patientid` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `payments`
--


-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE IF NOT EXISTS `pharmacy` (
  `pharmacyid` int(11) NOT NULL AUTO_INCREMENT,
  `shopname` varchar(200) DEFAULT NULL,
  `ownername` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pharmacyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pharmacy`
--


-- --------------------------------------------------------

--
-- Table structure for table `pharmacyprescriptions`
--

CREATE TABLE IF NOT EXISTS `pharmacyprescriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacyid` int(11) DEFAULT NULL,
  `patientid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `prescriptionfile` varchar(150) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pharmacyid` (`pharmacyid`),
  KEY `patientid` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pharmacyprescriptions`
--


-- --------------------------------------------------------

--
-- Table structure for table `transcations`
--

CREATE TABLE IF NOT EXISTS `transcations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `toaccountnumber` bigint(20) DEFAULT NULL,
  `fromaccountnumber` bigint(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transcations`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctors` (`doctorid`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patients` (`patientid`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`accountnumber`) REFERENCES `bank` (`accountnumber`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctors` (`doctorid`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patients` (`patientid`);

--
-- Constraints for table `pharmacyprescriptions`
--
ALTER TABLE `pharmacyprescriptions`
  ADD CONSTRAINT `pharmacyprescriptions_ibfk_1` FOREIGN KEY (`pharmacyid`) REFERENCES `pharmacy` (`pharmacyid`),
  ADD CONSTRAINT `pharmacyprescriptions_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patients` (`patientid`);
