-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2024 at 10:24 AM
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
-- Database: `atm`
--
CREATE DATABASE IF NOT EXISTS `atm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `atm`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_username` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_username`, `admin_password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `date_and_time`
--

CREATE TABLE `date_and_time` (
  `date_and_time_id` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `date_and_time`
--

INSERT INTO `date_and_time` (`date_and_time_id`, `date`, `time`, `status`) VALUES
(4, '28/10/2024', '00:00:10', ''),
(5, '29/10/2024', '06:07:00', ''),
(6, '29/10/2024', '06:29:00', ''),
(7, '29/10/2024', '08:55:00', 'Late'),
(8, '29/10/2024', '08:55:00', 'Late'),
(9, '29/10/2024', '09:05:00', 'Late'),
(10, '29/10/2024', '09:06:00', 'Late'),
(11, '29/10/2024', '11:39:00', 'Late'),
(12, '29/10/2024', '05:15:00', 'Late'),
(13, '30/10/2024', '05:10:00', 'Late'),
(14, '30/10/2024', '07:25 PM', 'Late'),
(15, '30/10/2024', '07:30 PM', 'on time'),
(16, '30/10/2024', '07:31 PM', 'Late'),
(17, '30/10/2024', '07:31 PM', 'Late');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `sched_id` int(11) NOT NULL,
  `sched_start` varchar(50) NOT NULL,
  `sched_end` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`sched_id`, `sched_start`, `sched_end`) VALUES
(1, '08:00 AM', '04:00 PM'),
(2, '01:00 AM', '09:00 PM'),
(3, '07:30 PM', '11:00PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `date_and_time`
--
ALTER TABLE `date_and_time`
  ADD PRIMARY KEY (`date_and_time_id`);

--
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`sched_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `date_and_time`
--
ALTER TABLE `date_and_time`
  MODIFY `date_and_time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `sched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `attendance_mgmt_system`
--
CREATE DATABASE IF NOT EXISTS `attendance_mgmt_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `attendance_mgmt_system`;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `Semester` int(1) NOT NULL,
  `Section` varchar(1) NOT NULL,
  `Department` varchar(3) NOT NULL,
  `CTID` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`Semester`, `Section`, `Department`, `CTID`) VALUES
(2, 'A', 'BT', 'FID15BT005'),
(2, 'B', 'BT', 'FID15BT004'),
(4, 'A', 'BT', 'FID15BT001'),
(4, 'A', 'CSE', 'FID15CS001'),
(4, 'B', 'BT', 'FID15BT002');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `FID` varchar(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `DOB` date NOT NULL,
  `Branch` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`FID`, `Name`, `DOB`, `Branch`) VALUES
('FID15BT020', 'Monica Geller Bing', '1980-04-08', 'BT'),
('FID15CS002', 'Chandler Bing', '1970-04-12', 'CSE'),
('FID15EC001', 'John Wick', '2017-05-01', 'EC'),
('FID15EE001', 'Indiana Jones', '2017-05-02', 'EE'),
('FID15ME001', 'Raon Lee', '2017-05-04', 'ME');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FID` varchar(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Section` varchar(1) NOT NULL,
  `Subject Code` varchar(6) NOT NULL,
  `SEM` varchar(1) NOT NULL,
  `Dep` varchar(3) NOT NULL,
  `Hours Taken` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FID`, `Name`, `DOB`, `Section`, `Subject Code`, `SEM`, `Dep`, `Hours Taken`) VALUES
('FID15BT001', 'Kanye West', '1970-12-23', 'A', '15BT44', '4', 'BT', 28),
('FID15BT001', 'Kanye West', '1970-12-23', 'B', '15BT25', '2', 'BT', 25),
('FID15BT002', 'Elvis Presley', '1970-11-23', 'A', '15BT24', '2', 'BT', 25),
('FID15BT002', 'Elvis Presley', '1970-11-23', 'A', '15BT46', '4', 'BT', 25),
('FID15BT002', 'Elvis Presley', '1970-11-23', 'B', '15BT41', '4', 'BT', 25),
('FID15BT004', 'Neymar ', '1986-03-05', 'A', '15BT45', '4', 'BT', 25),
('FID15BT004', 'Neymar', '1986-03-05', 'B', '15BT23', '2', 'BT', 25),
('FID15BT005', 'James West', '1970-11-24', 'A', '15BT22', '2', 'BT', 25),
('FID15BT006', 'James East', '1970-11-25', 'A', '15BT25', '2', 'BT', 25),
('FID15BT007', 'John Rambo', '1970-11-26', 'A', '15BT21', '2', 'BT', 25),
('FID15BT007', 'John Rambo', '1970-11-25', 'A', '15BT23', '2', 'BT', 25),
('FID15BT008', 'Smith Jones', '2017-05-06', 'A', '15BT41', '4', 'BT', 25),
('FID15BT009', 'Miller Davis', '2017-05-17', 'A', '15BT43', '4', 'BT', 28),
('FID15BT010', 'Hall Lopez ', '2017-05-25', 'A', '15BT42', '4', 'BT', 25),
('FID15BT011', 'Milnes Davos', '2017-06-17', 'B', '15BT43', '4', 'BT', 25),
('FID15BT012', 'Halls Lee ', '2016-05-25', 'B', '15BT42', '4', 'BT', 25),
('FID15BT013', 'Jerry Tom', '2017-05-22', 'B', '15BT45', '4', 'BT', 25),
('FID15BT014', 'Dan Brown', '2017-04-04', 'B', '15BT46', '4', 'BT', 25),
('FID15BT015', 'Taylor Swift', '2017-05-31', 'B', '15BT44', '4', 'BT', 25),
('FID15BT016', 'Harris Will', '1970-11-23', 'B', '15BT24', '2', 'BT', 25),
('FID15BT017', 'Scott Free', '2017-05-19', 'B', '15BT22', '2', 'BT', 25),
('FID15BT018', 'Paul Walker', '1980-12-04', 'B', '15BT21', '2', 'BT', 25),
('FID15CS001', 'Jon Snow', '1978-11-08', 'A', '15CS41', '4', 'CSE', 25);

-- --------------------------------------------------------

--
-- Table structure for table `messageimages`
--

CREATE TABLE `messageimages` (
  `MsgID` int(11) NOT NULL DEFAULT 0,
  `Images` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `MsgID` int(11) NOT NULL DEFAULT 0,
  `ToID` varchar(10) NOT NULL,
  `FromID` varchar(10) NOT NULL,
  `Content` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`MsgID`, `ToID`, `FromID`, `Content`) VALUES
(1, 'FID15BT001', '1KS15BT001', 'Hello!!!!!!! '),
(2, 'Admin', '1KS15BT001', 'Hello from 1ks15bt001. Testing the usage of messages with Admin Inbox. Have you received the entire message???????'),
(3, '1ks15BT001', 'Admin', 'Hello from the admin.\nI didn\'t get your message.'),
(4, '1KS15BT001', 'Admin', 'Hey!! 1ks15BT001\nI\'m the Admin.  You can call me the \"Master\".\nDo you understand?'),
(5, 'FID15BT001', 'Admin', 'Admin \nHey!! 1ks15BT001\nI\'m the Admin.  You can call me the \"Master\".\nDo you understand?\n1KS15BT001\nHello from 1ks15bt001. Testing the usage of messages with Admin Inbox. Have you received the entire message???????'),
(6, '1KS15BT001', 'Admin', 'Hey!! 1ks15BT001\nI\'m the Admin.  You can call me the \"Master\".\nDo you understand?'),
(7, '1KS15BT001', '1KS15BT001', 'My message box isn\'t working. Can I get some help here?'),
(8, 'FID15BT001', '1KS15BT001', 'Request for leave\n2017-11-11----------18:05\n1KS15BT001\n Leave Date : 2017-11-07\n Number of Days : 5\n Request :\nCasual Leave.'),
(9, 'FID15BT001', '1KS15BT001', 'Incorrect Attendance\n2017-11-11------------------18:10\n1KS15BT001English	0'),
(10, 'Admin', '1KS15BT001', 'Oh dear me!'),
(11, 'FID15BT001', '1KS15BT001', '1KS15BT001\nYes Master\nAdmin\nHey!! 1ks15BT001\nI\'m the Admin.  You can call me the \"Master\".\nDo you understand?'),
(12, 'Admin', '1KS15BT001', 'Yes Master'),
(13, 'Admin', '1KS15BT001', 'Yes Master'),
(14, '1KS15BT001', '1KS15BT001', 'Well it\'s working now.'),
(15, 'Admin', '1KS15BT001', 'My scroll bar isn\'t working'),
(16, 'FID15BT001', '1KS15BT001', ' Submission of Medical Certificate\n2017-11-11	18:43'),
(17, 'FID15BT001', 'Admin', 'helosdfuafkafluksdgfluasdlifalsdfla'),
(18, 'Admin', 'FID15BT001', 'Hello'),
(19, '1KS15BT001', 'FID15BT001', 'HAHAHHAHA'),
(20, 'Admin', 'FID15BT001', '2017-11-11------------------23:31\nFID15BT001\nhey I need some changes \n\n-------------------------------------------------------------------\n\n'),
(21, 'FID15BT001', '1KS15BT001', ' Submission of Medical Certificate\n2017-11-11	23:38'),
(22, '1KS15BT001', 'Admin', 'You were absent today for Microbiology Class.'),
(23, 'Admin', '1KS15BT001', 'No! I wasn\'t.\nActually I was. Please don\'t tell a soul. Promise?'),
(24, 'FID15BT001', '1KS15BT001', 'Incorrect Attendance\n2017-11-18------------------21:05\n1KS15BT001organic chemistry	0'),
(25, 'FID15BT001', '1KS15BT001', 'Request for leave\n2017-11-18----------21:07\n1KS15BT001\n Leave Date : 2017-11-01\n Number of Days : 5\n Request :\nlgkhlkcyyix'),
(26, '1KS15BT001', 'Admin', 'You were absent today for Microbiology Class.'),
(27, '1KS15BT001', 'FID15BT001', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `USN` varchar(10) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Class` varchar(1) NOT NULL,
  `SEM` int(1) NOT NULL,
  `Dep` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `DOB`, `Class`, `SEM`, `Dep`) VALUES
('1KS15BT001', '1996-12-29', 'A', 4, 'BT'),
('1KS15BT002', '1996-01-01', 'A', 4, 'BT'),
('1KS15BT003', '1996-02-02', 'B', 4, 'BT'),
('1KS15CS001', '1996-01-01', 'A', 4, 'CSE'),
('1KS15CS002', '1996-12-23', 'A', 4, 'CSE'),
('1KS15CS003', '1996-02-29', 'A', 4, 'CSE'),
('1KS15CS004', '1996-04-23', 'A', 4, 'CSE'),
('1KS15CS005', '1996-04-13', 'A', 4, 'CSE'),
('1KS15CS006', '1996-01-03', 'A', 4, 'CSE'),
('1KS15CS007', '1996-01-09', 'A', 4, 'CSE'),
('1KS15CS008', '1996-10-30', 'A', 4, 'CSE'),
('1KS15CS009', '1996-11-03', 'A', 4, 'CSE'),
('1KS15CS010', '1996-05-16', 'A', 4, 'CSE'),
('1KS15CS011', '1996-06-13', 'A', 4, 'CSE'),
('1KS15CS012', '1996-03-03', 'A', 4, 'CSE'),
('1KS15CS013', '1996-01-15', 'A', 4, 'CSE'),
('1KS16BT001', '1996-01-01', 'A', 2, 'BT'),
('1KS16BT002', '1996-01-02', 'A', 2, 'BT'),
('1KS16BT003', '1996-01-01', 'B', 2, 'BT');

-- --------------------------------------------------------

--
-- Table structure for table `student attendance`
--

CREATE TABLE `student attendance` (
  `USN` varchar(10) NOT NULL,
  `Subject Code` varchar(6) NOT NULL,
  `Attendance` int(11) NOT NULL DEFAULT 0,
  `Absent Days` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student attendance`
--

INSERT INTO `student attendance` (`USN`, `Subject Code`, `Attendance`, `Absent Days`) VALUES
('1KS15BT001', '15BT41', 24, '2017-10-23'),
('1KS15BT001', '15BT42', 23, '2017-09-10 2017-11-05'),
('1KS15BT001', '15BT43', 25, '2017-10-23 2017-11-01 2017-11-02 2017-11-02 2017-11-16'),
('1KS15BT001', '15BT44', 28, ''),
('1KS15BT001', '15BT45', 24, '2017-10-23'),
('1KS15BT001', '15BT46', 22, '2017-09-10 2017-11-05 2017-07-22'),
('1KS15BT002', '15BT41', 24, '2017-10-23'),
('1KS15BT002', '15BT42', 23, '2017-09-10 2017-11-05'),
('1KS15BT002', '15BT43', 25, '2017-10-23'),
('1KS15BT002', '15BT44', 25, '2017-10-23'),
('1KS15BT002', '15BT45', 24, '2017-10-23'),
('1KS15BT002', '15BT46', 22, '2017-09-10 2017-11-05 2017-07-22'),
('1KS15BT003', '15BT41', 24, '2017-10-23'),
('1KS15BT003', '15BT42', 23, '2017-09-10 2017-11-05'),
('1KS15BT003', '15BT43', 24, '2017-10-23'),
('1KS15BT003', '15BT44', 24, '2017-10-23'),
('1KS15BT003', '15BT45', 24, '2017-10-23'),
('1KS15BT003', '15BT46', 22, '2017-09-10 2017-11-05 2017-07-22'),
('1KS16BT001', '15BT21', 20, '2017-19-23  2017-43-12  324-234-234'),
('1KS16BT001', '15BT22', 23, '2017-09-10 2017-11-05'),
('1KS16BT001', '15BT23', 24, '2017-10-23'),
('1KS16BT001', '15BT24', 24, '2017-10-23'),
('1KS16BT001', '15BT25', 24, '2017-10-23'),
('1KS16BT002', '15BT21', 24, '2017-10-23'),
('1KS16BT002', '15BT22', 23, '2017-09-10 2017-11-05'),
('1KS16BT002', '15BT23', 24, '2017-10-23'),
('1KS16BT002', '15BT24', 24, '2017-10-23'),
('1KS16BT002', '15BT25', 24, '2017-10-23'),
('1KS16BT003', '15BT21', 24, '2017-10-23'),
('1KS16BT003', '15BT22', 23, '2017-09-10 2017-11-05'),
('1KS16BT003', '15BT23', 24, '2017-10-23'),
('1KS16BT003', '15BT24', 24, '2017-10-23'),
('1KS16BT003', '15BT25', 24, '2017-10-23');

--
-- Triggers `student attendance`
--
DELIMITER $$
CREATE TRIGGER `HoursCheckonInsert` BEFORE INSERT ON `student attendance` FOR EACH ROW SET NEW.Attendance = IF(
    NOT EXISTS(
      SELECT *
      FROM Faculty AS f
      JOIN `Student Attendance` AS s ON s.`Subject Code` = f.`Subject Code`
      JOIN Student AS k ON k.SEM = f.Sem AND k.Class=f.Section AND k.uSN = s.USN 
      WHERE  NEW.Attendance > f.`Hours Taken`),
    NEW.Attendance,
    NULL)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `HoursCheckonUpdate` BEFORE UPDATE ON `student attendance` FOR EACH ROW SET NEW.Attendance = IF(
    NOT EXISTS(
     SELECT *
      FROM Faculty AS f
      JOIN `Student Attendance` AS s ON s.`Subject Code` = f.`Subject Code`
      JOIN Student AS k ON k.SEM = f.Sem AND k.Class=f.Section AND k.uSN = s.USN 
      WHERE  NEW.Attendance > f.`Hours Taken` AND k.USN=NEW.USN AND s.`Subject Code`= NEW.`Subject Code`),
    NEW.Attendance,
    NULL)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `Subject` varchar(40) NOT NULL,
  `Subject Code` varchar(6) NOT NULL,
  `Dep` varchar(3) NOT NULL,
  `Sem` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`Subject`, `Subject Code`, `Dep`, `Sem`) VALUES
('CAED', '15BT21', 'BT', 2),
('Chemistry', '15BT22', 'BT', 2),
('Environmental Studies', '15BT23', 'BT', 2),
('Mathematics 2', '15BT24', 'BT', 2),
('Programming in C', '15BT25', 'BT', 2),
('English', '15BT41', 'BT', 4),
('Environmental Biotechnology', '15BT42', 'BT', 4),
('Microbial Diversity', '15BT43', 'BT', 4),
('Microbiology', '15BT44', 'BT', 4),
('Organic Chemistry', '15BT45', 'BT', 4),
('Mathematics 4', '15BT46', 'BT', 4),
('Data Structures', '15CS41', 'CSE', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`Semester`,`Section`,`Department`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Branch`) USING BTREE;

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FID`,`Section`,`Subject Code`,`SEM`,`Dep`),
  ADD KEY `Subject Code` (`Subject Code`),
  ADD KEY `Dep` (`Dep`);

--
-- Indexes for table `messageimages`
--
ALTER TABLE `messageimages`
  ADD PRIMARY KEY (`MsgID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`MsgID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`USN`),
  ADD KEY `SEM` (`SEM`,`Class`,`Dep`);

--
-- Indexes for table `student attendance`
--
ALTER TABLE `student attendance`
  ADD PRIMARY KEY (`USN`,`Subject Code`),
  ADD KEY `Subject Code` (`Subject Code`),
  ADD KEY `USN` (`USN`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`Subject Code`),
  ADD KEY `Semester` (`Sem`),
  ADD KEY `Department` (`Dep`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`Branch`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`Subject Code`) REFERENCES `subjects` (`Subject Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`Dep`) REFERENCES `department` (`Branch`);

--
-- Constraints for table `messageimages`
--
ALTER TABLE `messageimages`
  ADD CONSTRAINT `messageimages_ibfk_1` FOREIGN KEY (`MsgID`) REFERENCES `messages` (`MsgID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`SEM`,`Class`,`Dep`) REFERENCES `class` (`Semester`, `Section`, `Department`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student attendance`
--
ALTER TABLE `student attendance`
  ADD CONSTRAINT `dfgdfg` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student attendance_ibfk_1` FOREIGN KEY (`Subject Code`) REFERENCES `subjects` (`Subject Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `ASDAD` FOREIGN KEY (`Sem`) REFERENCES `class` (`Semester`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`Dep`) REFERENCES `department` (`Branch`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `attend_monitor_sys`
--
CREATE DATABASE IF NOT EXISTS `attend_monitor_sys` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `attend_monitor_sys`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `attendance_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `in_time` varchar(50) NOT NULL DEFAULT '',
  `out_time` varchar(50) NOT NULL DEFAULT '',
  `archived` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`attendance_id`, `first_name`, `last_name`, `user_id`, `department_id`, `schedule_id`, `in_time`, `out_time`, `archived`) VALUES
(1, 'marky', 'dela cruz', 1, 1111, 1, '08:00 AM', '01:00 PM', 0),
(2, 'Angelo', 'Reyes', 2, 1111, 2, '08:00 AM', '04:00 PM', 0),
(4, 'Michael', 'Smith', 3, 1111, 2, '08:00 AM', '04:00 PM', 1),
(5, 'Rachelle', 'Yambao', 4, 1111, 1, '8:00AM', '4:00PM', 0),
(6, 'ryan', 'cruz', 5, 1111, 1, '', '', 0),
(8, 'ryze', 'Mano', 5, 1111, 1, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`department_id`, `department_name`) VALUES
(1111, 'student'),
(1112, 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `schedule_id` int(11) NOT NULL,
  `sched_start` varchar(50) NOT NULL,
  `sched_end` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`schedule_id`, `sched_start`, `sched_end`) VALUES
(1, '08:00 AM', '04:00 PM'),
(2, '01:00 PM', '09:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `username`, `password`, `user_type`) VALUES
(1, 'marky123', '123456', 2),
(2, 'reyes123', '789456', 2),
(3, 'micheal123', '123456', 2),
(4, 'Maya123', '123456', 2),
(5, 'honda123', '123', 2),
(6, 'camera123', '123456', 2),
(7, 'admin', 'admin123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `tbl_attendance_tbl_schedule_fr` (`schedule_id`),
  ADD KEY `tbl_attendance_tbl_department_fr` (`department_id`),
  ADD KEY `tbl_attendance_tbl_user_fr` (`user_id`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1113;

--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD CONSTRAINT `tbl_attendance_tbl_department_fr` FOREIGN KEY (`department_id`) REFERENCES `tbl_department` (`department_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_attendance_tbl_schedule_fr` FOREIGN KEY (`schedule_id`) REFERENCES `tbl_schedule` (`schedule_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_attendance_tbl_user_fr` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);
--
-- Database: `base`
--
CREATE DATABASE IF NOT EXISTS `base` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `base`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `morning_in` time DEFAULT NULL,
  `morning_out` time DEFAULT NULL,
  `afternoon_in` time DEFAULT NULL,
  `afternoon_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `date`, `email`, `morning_in`, `morning_out`, `afternoon_in`, `afternoon_out`) VALUES
(3, '2021-10-01', 'diosdado.villacampa@deped.gov.ph', '07:30:00', '12:00:00', '12:30:00', '16:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `biometrics`
--

CREATE TABLE `biometrics` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `am_in` time DEFAULT NULL,
  `am_out` time DEFAULT NULL,
  `pm_in` time DEFAULT NULL,
  `pm_out` time DEFAULT NULL,
  `bio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personnels`
--

CREATE TABLE `personnels` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fb` text DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `bio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personnels`
--

INSERT INTO `personnels` (`id`, `firstname`, `lastname`, `middlename`, `position`, `role`, `email`, `fb`, `status`, `bio_id`) VALUES
(170, 'NIUBIE', 'ALTAYA', 'DELUMBAR', 'T III', NULL, 'niubie.altaya@deped.gov.ph', 'https://www.facebook.com/niubie.altaya.5', 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE `systems` (
  `id` int(11) NOT NULL,
  `system_logo` text DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `system_acronym` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `system_logo`, `system_name`, `system_acronym`) VALUES
(1, 'b5ef89d7e97a6162a705fcd1432a06a6.jpg', 'Time Record System', 'WFH');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `address`, `avatar`) VALUES
(2, '::1', 'admin', '$2y$10$yNOenO2kp5FrRKgM/V78o.JFpfK2kJli9UMmAwI1fMQW8J/lzcE22', 'cajanr02@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1628636671, 1643541754, 1, 'Roni', 'Cajan', 'Looc Proper', '81cb8d65a41192af7d318fcc3c8cca8c.png'),
(3, '2001:4455:5b4:4300:418:56c8:7a1:3950', 'hrofficer', '$2y$10$L0e5/wNaBcb3nc3VmQLMGeCZiWRygy5mHfNCq9U0DrVw6qc6axMje', 'arnoldjr.amboang@deped.gov.ph', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1641969906, 1641969982, 1, 'Arnold Jr', 'Amboang', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(9, 2, 1),
(10, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `biometrics`
--
ALTER TABLE `biometrics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personnels`
--
ALTER TABLE `personnels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT for table `biometrics`
--
ALTER TABLE `biometrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personnels`
--
ALTER TABLE `personnels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `dblibrary_management_system`
--
CREATE DATABASE IF NOT EXISTS `dblibrary_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dblibrary_management_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_authors`
--

CREATE TABLE `tbl_authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(25) NOT NULL,
  `author_phone` varchar(25) NOT NULL,
  `author_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_authors`
--

INSERT INTO `tbl_authors` (`author_id`, `author_name`, `author_phone`, `author_address`) VALUES
(1, 'harper Lee', '091254678', 'Mindoro'),
(2, 'F. Scott Fitzger', '09456786', 'Manila');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_books`
--

CREATE TABLE `tbl_books` (
  `books_id` int(11) NOT NULL,
  `books_title` varchar(25) NOT NULL,
  `author_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `pub_id` int(11) NOT NULL,
  `books_pages` varchar(10) NOT NULL,
  `books_edition` varchar(10) NOT NULL,
  `archived` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_books`
--

INSERT INTO `tbl_books` (`books_id`, `books_title`, `author_id`, `cat_id`, `pub_id`, `books_pages`, `books_edition`, `archived`) VALUES
(1, 'To Kill a Mockingbird', 1, 2024001, 1, '281', '1st', 0),
(2, 'The Catcher in the Rye', 2, 2024003, 2, '180', '1st', 0),
(4, 'the Great Kristine', 2, 2024001, 1, '182', '3rd', 0),
(6, 'the Great Gatsby', 1, 2024001, 2, '150', '5th', 0),
(7, 'Antic Hay', 2, 2024001, 2, '180', '2nd', 0),
(8, 'As I Lay Dying', 2, 2024003, 2, '2', '180', 0),
(10, 'the animal kingdom', 1, 2024001, 1, '50', '1st', 0),
(11, 'My Name', 1, 2024002, 1, '110', '1st', 0),
(12, 'the clown', 1, 2024002, 2, '110', '1st', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(25) NOT NULL,
  `cat_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`cat_id`, `cat_name`, `cat_description`) VALUES
(2024001, 'Fiction', 'Imagination'),
(2024002, 'Computer Science', 'algorithm'),
(2024003, 'Classic Literature', 'History');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_publishers`
--

CREATE TABLE `tbl_publishers` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(25) NOT NULL,
  `pub_phone` varchar(12) NOT NULL,
  `pub_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_publishers`
--

INSERT INTO `tbl_publishers` (`pub_id`, `pub_name`, `pub_phone`, `pub_address`) VALUES
(1, 'J.B Lippincott &Co.', '024546', 'Malabon Manila'),
(2, 'Charles Scribner', '02654564', 'Metro Manila');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_fullname` varchar(50) NOT NULL,
  `user_phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_password`, `user_fullname`, `user_phone`) VALUES
(1, 'Winter123', '12345', 'Winter Summer', 94532658);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_authors`
--
ALTER TABLE `tbl_authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `tbl_books`
--
ALTER TABLE `tbl_books`
  ADD PRIMARY KEY (`books_id`),
  ADD KEY `tbl_books_tbl_authors_fr` (`author_id`),
  ADD KEY `tbl_books_tbl_categories_fr` (`cat_id`),
  ADD KEY `tbl_books_tbl_publishers_fr` (`pub_id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_publishers`
--
ALTER TABLE `tbl_publishers`
  ADD PRIMARY KEY (`pub_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_authors`
--
ALTER TABLE `tbl_authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_books`
--
ALTER TABLE `tbl_books`
  MODIFY `books_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2024004;

--
-- AUTO_INCREMENT for table `tbl_publishers`
--
ALTER TABLE `tbl_publishers`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_books`
--
ALTER TABLE `tbl_books`
  ADD CONSTRAINT `tbl_books_tbl_authors_fr` FOREIGN KEY (`author_id`) REFERENCES `tbl_authors` (`author_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_books_tbl_categories_fr` FOREIGN KEY (`cat_id`) REFERENCES `tbl_categories` (`cat_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_books_tbl_publishers_fr` FOREIGN KEY (`pub_id`) REFERENCES `tbl_publishers` (`pub_id`) ON UPDATE CASCADE;
--
-- Database: `eas_db`
--
CREATE DATABASE IF NOT EXISTS `eas_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eas_db`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `username` char(6) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `department_id` char(3) NOT NULL,
  `shift_id` int(1) NOT NULL,
  `location_id` int(1) NOT NULL,
  `in_time` int(11) NOT NULL,
  `notes` varchar(120) NOT NULL,
  `image` varchar(50) NOT NULL,
  `lack_of` varchar(11) NOT NULL,
  `in_status` varchar(15) NOT NULL,
  `out_time` int(11) NOT NULL,
  `out_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `username`, `employee_id`, `department_id`, `shift_id`, `location_id`, `in_time`, `notes`, `image`, `lack_of`, `in_status`, `out_time`, `out_status`) VALUES
(45, 'ADM011', 011, 'ADM', 1, 1, 1589178316, 'sdf', 'item-200511-8f5d7be1a1.jpg', 'None', 'Late', 1589178477, 'Early'),
(48, 'ADM011', 011, 'ADM', 1, 1, 1589381121, '', 'item-200513-ad6953a07e.jpg', 'Notes', 'Late', 1589381127, 'Over Time'),
(49, 'PCD010', 010, 'PCD', 2, 1, 1589384432, 'asdasd', '', 'None,image', 'Late', 1589384514, 'Over Time'),
(50, 'ADM011', 011, 'ADM', 1, 1, 1589391038, '', '', 'Notes,image', 'On Time', 1589391056, 'Early'),
(51, 'PCD010', 010, 'PCD', 3, 1, 1622553388, 'testing', 'item-210601-3946bb00df.png', 'None', 'Late', 1622553470, 'Over Time'),
(52, 'PCD010', 010, 'PCD', 3, 2, 1631893356, 'none', '', 'None,image', 'Late', 1631893413, 'Over Time'),
(53, 'STD026', 026, 'STD', 1, 1, 1631894335, 'none', '', 'None,image', 'Late', 1631894403, 'Over Time'),
(54, 'ADM011', 011, 'ADM', 1, 2, 1631894692, 'demo', '', 'None,image', 'Late', 1631894696, 'Over Time'),
(55, 'QCD027', 027, 'QCD', 6, 2, 1631499386, 'none..', '', 'None,image', 'Late', 1631529057, 'Early'),
(56, 'QCD027', 027, 'QCD', 6, 2, 1631583036, 'none', '', 'None,image', 'Late', 1631611849, 'Early'),
(58, 'QCD027', 027, 'QCD', 6, 1, 1631733350, 'none', '', 'None,image', 'Late', 1631797356, 'Early'),
(59, 'QCD027', 027, 'QCD', 6, 4, 1631863331, 'none', '', 'None,image', 'Late', 1631896539, 'Early'),
(60, 'QCD027', 027, 'QCD', 6, 1, 1631214919, 'none', '', 'None,image', 'Late', 1631250936, 'Over Time'),
(61, 'STD026', 026, 'STD', 1, 2, 1631493955, 'none', '', 'None,image', 'On Time', 1631523613, 'Over Time'),
(62, 'ADM011', 011, 'ADM', 1, 1, 1631584873, 'none', '', 'None,image', 'Late', 1631621603, 'Over Time'),
(63, 'QCD027', 027, 'QCD', 6, 2, 1632109417, 'this is a demo note!', '', 'None,image', 'Late', 1632109437, 'Early'),
(64, 'ACD002', 002, 'ACD', 2, 3, 1632109840, 'demo demo', '', 'None,image', 'On Time', 1632109845, 'Early'),
(65, 'STD026', 026, 'STD', 1, 2, 1632109903, 'test', '', 'None,image', 'Late', 1632109905, 'Early'),
(66, 'ITD028', 028, 'ITD', 7, 7, 1654738570, 'Sample Time-In', 'item-220609-6dc7d7e8fe.png', 'None', 'On Time', 1654738629, 'Early'),
(71, 'HRD030', 030, 'HRD', 7, 7, 1654756719, 'Sample Note only', 'item-220609-496d1ceffe.png', 'None', 'Late', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` char(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
('ACD', 'Accounting Department'),
('ADM', 'Admin Department'),
('HRD', 'Human Resource Department'),
('ITD', 'Information Technology Department - Updated'),
('PCD', 'Production Controller Department'),
('PLD', 'Planner Department'),
('QCD', 'Quality Control Department'),
('SCD', 'Security Department'),
('STD', 'Store Department');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `gender` char(1) NOT NULL,
  `image` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_date` date NOT NULL,
  `shift_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `gender`, `image`, `birth_date`, `hire_date`, `shift_id`) VALUES
(001, 'John Smith', 'jsmith@mail.com', 'M', 'default.png', '1996-07-15', '2020-03-05', 7),
(025, 'Admin ', 'admin@admin.com', 'M', 'default.png', '0000-00-00', '0000-00-00', 0),
(028, 'Mark Cooper', 'mcooper@mail.com', 'M', 'item-220609-64856edd56.png', '1997-06-23', '2021-04-20', 7),
(030, 'Claire Blake', 'cblake@mail.com', 'F', 'item-220609-97e2f7f0fe.png', '1997-10-14', '2020-03-05', 7);

-- --------------------------------------------------------

--
-- Table structure for table `employee_department`
--

CREATE TABLE `employee_department` (
  `id` int(3) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `department_id` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_department`
--

INSERT INTO `employee_department` (`id`, `employee_id`, `department_id`) VALUES
(1, 001, 'HRD'),
(2, 002, 'ACD'),
(3, 003, 'QCD'),
(4, 004, 'SCD'),
(5, 005, 'STD'),
(6, 006, 'ACD'),
(7, 007, 'PLD'),
(8, 008, 'STD'),
(9, 009, 'STD'),
(10, 010, 'PCD'),
(21, 011, 'ADM'),
(25, 024, 'HRD'),
(26, 026, 'STD'),
(27, 027, 'QCD'),
(28, 028, 'ITD'),
(30, 030, 'HRD');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(1) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`) VALUES
(1, 'Home'),
(2, 'Office'),
(3, 'Store'),
(4, 'Site'),
(6, 'Field'),
(7, 'XYZ Client Office');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(1) NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `start`, `end`) VALUES
(1, '08:00:00', '16:00:00'),
(2, '13:00:00', '21:00:00'),
(3, '18:00:00', '02:00:00'),
(4, '03:15:02', '02:05:05'),
(5, '07:00:00', '18:25:00'),
(6, '01:00:00', '12:00:00'),
(7, '09:30:00', '18:30:00'),
(8, '23:23:23', '23:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` char(6) NOT NULL,
  `password` varchar(128) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `role_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `employee_id`, `role_id`) VALUES
('ACD002', '$2y$10$5nv5ehyMVdljfKJ6izsOqOimsbv.cbzU.XLB9ji9zbA.eICdSrNvO', 002, 2),
('ADM011', '$2y$10$BKpQcs4XKavCcYdFWujzx.Xqb7r9eNkDrOYss2VNXrMJUUpm1agUC', 011, 2),
('admin', '$2y$10$tG8hnh7w.yiJL7fjlRCmkuHBwi0QI6DHFXmc1s6X3cAFuw5pRfO/O', 025, 1),
('HRD001', '$2y$10$7rLSvRVyTQORapkDOqmkhetjF6H9lJHngr4hJMSM2lHObJbW5EQh6', 001, 2),
('HRD030', '$2y$10$nGeEuKaPiQ45O6Yvt3BxGuxY.BN.IfMsxP4nWMkM.yXxQkTRyRfDa', 030, 2),
('ITD028', '$2y$10$vQQ80W50S/rsXThp2YkQ5uH3XKej4bZE68L7Cfz9.MVcQ0EiJo.Hy', 028, 2),
('PCD010', '$2y$10$BKpQcs4XKavCcYdFWujzx.Xqb7r9eNkDrOYss2VNXrMJUUpm1agUC', 010, 2),
('QCD027', '$2y$10$peALJo.JKZyD6uMBd41UfuHGQSJe7ExOfDhPITvDbSRRXeWUGY9xy', 027, 2),
('STD005', '$2y$10$hr35h1fIySFYCSRVL2jRD.RuYa9WtJCEJkkqvQfPboYK7VwURpLim', 005, 2),
('STD008', '$2y$10$8PGnFaiZPYtcIGrwzMmVZuNKbUb/A88f0NZOA9QVgHaUIJ6ddg.Si', 008, 2),
('STD026', '$2y$10$8WNMvEEgNPWyRuSeeLDE1uXwnBkYNJE/heLT1zWbsUfYb/wKFyYIy', 026, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `id` int(2) NOT NULL,
  `role_id` int(1) NOT NULL,
  `menu_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(2) NOT NULL,
  `menu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'Master'),
(3, 'Attendance'),
(4, 'Profile'),
(5, 'Report');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(1) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `user_submenu`
--

CREATE TABLE `user_submenu` (
  `id` int(2) NOT NULL,
  `menu_id` int(2) NOT NULL,
  `title` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_submenu`
--

INSERT INTO `user_submenu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Department', 'master', 'fas fa-fw fa-building', 1),
(3, 2, 'Shift', 'master/shift', 'fas fa-fw fa-exchange-alt', 1),
(4, 2, 'Employee', 'master/employee', 'fas fa-fw fa-id-badge', 1),
(5, 2, 'Location', 'master/location', 'fas fa-fw fa-map-marker-alt', 1),
(6, 3, 'Attendance Form', 'attendance', 'fas fa-fw fa-clipboard-list', 1),
(7, 3, 'Statistics', 'attendance/stats', 'fas fa-fw fa-chart-pie', 0),
(8, 4, 'My Profile', 'profile', 'fas fa-fw fa-id-card', 1),
(9, 2, 'Users', 'master/users', 'fas fa-fw fa-users', 1),
(11, 5, 'Print Report', 'report', 'fas fa-fw fa-paste', 1),
(12, 3, 'History', 'attendance/history', 'fas fa-fw fa-th-list', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shift_id_fk_e` (`shift_id`);

--
-- Indexes for table `employee_department`
--
ALTER TABLE `employee_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_department_ibfk_1` (`employee_id`),
  ADD KEY `employee_department_ibfk_2` (`department_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `employee_department`
--
ALTER TABLE `employee_department`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_submenu`
--
ALTER TABLE `user_submenu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_access`
--
ALTER TABLE `user_access`
  ADD CONSTRAINT `user_access_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `user_menu` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_access_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD CONSTRAINT `user_submenu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `user_menu` (`id`) ON UPDATE CASCADE;
--
-- Database: `hrm`
--
CREATE DATABASE IF NOT EXISTS `hrm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hrm`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_user` varchar(30) NOT NULL,
  `admin_pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_user`, `admin_pass`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_academic_rank`
--

CREATE TABLE `tbl_academic_rank` (
  `rank_id` int(3) NOT NULL,
  `rank_name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_academic_rank`
--

INSERT INTO `tbl_academic_rank` (`rank_id`, `rank_name`) VALUES
(1, 'Instructor I'),
(2, 'Instructor II'),
(3, 'Instructor III'),
(9, 'Assistant Professor I'),
(10, 'Assistant Professor II'),
(11, 'Assistant Professor III'),
(12, 'Assistant Professor IV'),
(13, 'Associate Professor II'),
(14, 'Associate Professor I'),
(15, 'Associate Professor III'),
(16, 'Associate Professor IV'),
(17, 'Associate Professor V'),
(18, 'Professor I'),
(19, 'Professor II'),
(20, 'Professor III'),
(21, 'Professor IV'),
(22, 'Professor V'),
(23, 'Professor VI'),
(24, 'Professor VII'),
(26, 'Professor VIII');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `dept_id` int(3) NOT NULL,
  `dept_name` char(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`dept_id`, `dept_name`) VALUES
(2, 'College of Education'),
(3, 'College of Arts and Science'),
(4, 'College of Industrial Technology'),
(5, 'Institute of Industrial Technology'),
(6, 'College of Business Management and Accountancy'),
(7, 'College of Fisheries'),
(8, 'College of Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_files`
--

CREATE TABLE `tbl_files` (
  `file_id` int(7) NOT NULL,
  `file_name` varchar(500) NOT NULL,
  `per_id` int(6) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `date_uploaded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_files`
--

INSERT INTO `tbl_files` (`file_id`, `file_name`, `per_id`, `filetype`, `date_uploaded`) VALUES
(32, 'uploads/1.jpg', 74, 'jpg', '0000-00-00'),
(33, 'uploads/1..5.png', 68, 'png', '0000-00-00'),
(34, 'uploads/', 69, '', '0000-00-00'),
(35, 'uploads/', 68, '', '0000-00-00'),
(36, 'uploads/evaluation-for-capstone.docx', 68, 'docx', '2017-02-03'),
(37, 'uploads/[fmovies.to] The Flash 3 - 06.srt', 67, 'srt', '2017-02-03'),
(38, 'uploads/activity_sheet3 (1).docx', 99, 'docx', '2017-02-04'),
(39, 'uploads/amCharts (1).csv', 100, 'csv', '2017-02-04'),
(40, 'uploads/Penguins.jpg', 99, 'jpg', '2017-02-04'),
(41, 'uploads/FlowchartApplication 2.docx', 106, 'docx', '2017-02-04'),
(42, 'uploads/evaluation-for-capstone.docx', 111, 'docx', '2017-02-04'),
(43, 'uploads/Koala.jpg', 100, 'jpg', '2017-02-04'),
(44, 'uploads/Jellyfish.jpg', 100, 'jpg', '2017-02-04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gass_rank`
--

CREATE TABLE `tbl_gass_rank` (
  `gass_id` int(3) NOT NULL,
  `gass_name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_gass_rank`
--

INSERT INTO `tbl_gass_rank` (`gass_id`, `gass_name`) VALUES
(1, 'Administrative Aide I'),
(2, 'Administrative Aide II'),
(3, 'Administrative Aide III'),
(4, 'Administrative Aide IV'),
(5, 'Administrative Aide V'),
(6, 'Administrative Aide VI'),
(7, 'Administrative Assistant I'),
(8, 'Administrative Assistant II'),
(9, 'Administrative Assistant III'),
(10, 'Administrative Assistant IV'),
(11, 'Administrative Assistant V'),
(12, 'Administrative Officer I'),
(13, 'Administrative Officer II'),
(14, 'Administrative Officer III'),
(15, 'Administrative Officer IV'),
(16, 'Administrative Officer V'),
(17, 'Chief Administrative Officer'),
(18, 'SUC President I'),
(19, 'SUC President II'),
(20, 'SUC President III'),
(21, 'SUC President IV'),
(22, 'SUC President V'),
(23, 'Guidance Counselor I'),
(24, 'Guidance Counselor II'),
(25, 'Guidance Counselor III'),
(26, 'Dentist I'),
(27, 'Dentist II'),
(28, 'Dentist III'),
(29, 'Nurse I'),
(30, 'Nurse II'),
(31, 'Nurse III'),
(32, 'Registrar I'),
(33, 'Registrar II'),
(34, 'Registrar III'),
(35, 'Registrar IV'),
(36, 'Registrar V'),
(37, 'Security Guard I'),
(38, 'Security Guard II'),
(39, 'Security Guard III'),
(40, 'Security Guard IV'),
(42, 'College Librarian I');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personnel`
--

CREATE TABLE `tbl_personnel` (
  `per_id` int(6) NOT NULL,
  `per_firstname` char(20) NOT NULL,
  `per_middlename` char(20) NOT NULL,
  `per_lastname` char(20) NOT NULL,
  `per_suffix` char(2) NOT NULL,
  `pos_id` int(3) NOT NULL,
  `per_gender` char(6) NOT NULL,
  `per_status` char(8) NOT NULL,
  `per_address` varchar(150) NOT NULL,
  `per_date_of_birth` date NOT NULL,
  `per_place_of_birth` varchar(150) NOT NULL,
  `per_date_of_original_appointment` date NOT NULL,
  `per_eligibility` varchar(20) NOT NULL,
  `per_campus` char(14) NOT NULL,
  `dept_id` int(3) NOT NULL,
  `per_designation` varchar(50) NOT NULL,
  `per_tin_no` varchar(20) NOT NULL,
  `per_gsis_bp_no` varchar(15) NOT NULL,
  `per_pagibig_no` varchar(14) NOT NULL,
  `per_plantilla_no` int(25) NOT NULL,
  `promote_id` int(5) NOT NULL,
  `per_contact_no` varchar(20) NOT NULL,
  `rank_id` int(3) NOT NULL,
  `bs_name` varchar(50) NOT NULL,
  `bs_year` year(4) NOT NULL,
  `bs_school` varchar(50) NOT NULL,
  `ms_name` varchar(50) NOT NULL,
  `ms_with_unit` varchar(12) NOT NULL,
  `ms_year` year(4) NOT NULL,
  `ms_school` varchar(50) NOT NULL,
  `dr_name` varchar(50) NOT NULL,
  `dr_year` year(4) NOT NULL,
  `dr_with_unit` varchar(12) NOT NULL,
  `dr_school` varchar(50) NOT NULL,
  `other_degree` varchar(50) NOT NULL,
  `other_year` year(4) NOT NULL,
  `other_school` varchar(50) NOT NULL,
  `per_image` varchar(1000) NOT NULL,
  `date_modified` date NOT NULL,
  `gass_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_personnel`
--

INSERT INTO `tbl_personnel` (`per_id`, `per_firstname`, `per_middlename`, `per_lastname`, `per_suffix`, `pos_id`, `per_gender`, `per_status`, `per_address`, `per_date_of_birth`, `per_place_of_birth`, `per_date_of_original_appointment`, `per_eligibility`, `per_campus`, `dept_id`, `per_designation`, `per_tin_no`, `per_gsis_bp_no`, `per_pagibig_no`, `per_plantilla_no`, `promote_id`, `per_contact_no`, `rank_id`, `bs_name`, `bs_year`, `bs_school`, `ms_name`, `ms_with_unit`, `ms_year`, `ms_school`, `dr_name`, `dr_year`, `dr_with_unit`, `dr_school`, `other_degree`, `other_year`, `other_school`, `per_image`, `date_modified`, `gass_id`) VALUES
(165, 'Leny', '', 'Perez', '', 52, 'Female', 'Single', 'no where to-be found', '2024-10-23', 'arizona philippines', '2024-10-19', 'boss', 'Talisay', 2, 'Part-Time', '132-131-321', '242-423-423', '242-423-424', 534656, 0, '+639 000-000-000', 1, 'BS IT', 2024, 'FCPC', 'MANAGEMENT', '82 units', 2024, 'FCPC', 'MANAGEMENT', 0000, '', '', '', 0000, '', '', '2024-10-18', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personnel_master_file`
--

CREATE TABLE `tbl_personnel_master_file` (
  `per_id` int(7) NOT NULL,
  `per_firstname` char(20) NOT NULL,
  `per_middlename` char(20) NOT NULL,
  `per_lastname` char(20) NOT NULL,
  `per_suffix` char(2) NOT NULL,
  `pos_id` int(3) NOT NULL,
  `per_gender` char(6) NOT NULL,
  `per_status` char(8) NOT NULL,
  `per_address` varchar(150) NOT NULL,
  `per_date_of_birth` date NOT NULL,
  `per_place_of_birth` varchar(150) NOT NULL,
  `per_date_of_original_appointment` date NOT NULL,
  `per_eligibility` varchar(20) NOT NULL,
  `per_campus` char(14) NOT NULL,
  `dept_id` int(3) NOT NULL,
  `per_designation` varchar(50) NOT NULL,
  `per_tin_no` varchar(20) NOT NULL,
  `per_gsis_bp_no` varchar(15) NOT NULL,
  `per_pagibig_no` varchar(14) NOT NULL,
  `per_plantilla_no` int(25) NOT NULL,
  `promote_id` int(5) NOT NULL,
  `per_contact_no` varchar(20) NOT NULL,
  `rank_id` int(3) NOT NULL,
  `bs_name` varchar(50) NOT NULL,
  `bs_year` year(4) NOT NULL,
  `bs_school` varchar(50) NOT NULL,
  `ms_name` varchar(50) NOT NULL,
  `ms_with_unit` varchar(12) NOT NULL,
  `ms_year` year(4) NOT NULL,
  `ms_school` varchar(50) NOT NULL,
  `dr_name` varchar(50) NOT NULL,
  `dr_with_unit` varchar(12) NOT NULL,
  `dr_year` year(4) NOT NULL,
  `dr_school` varchar(50) NOT NULL,
  `other_degree` varchar(50) NOT NULL,
  `other_year` year(4) NOT NULL,
  `other_school` varchar(50) NOT NULL,
  `per_image` varchar(1000) NOT NULL,
  `date_modified` date NOT NULL,
  `gass_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_personnel_master_file`
--

INSERT INTO `tbl_personnel_master_file` (`per_id`, `per_firstname`, `per_middlename`, `per_lastname`, `per_suffix`, `pos_id`, `per_gender`, `per_status`, `per_address`, `per_date_of_birth`, `per_place_of_birth`, `per_date_of_original_appointment`, `per_eligibility`, `per_campus`, `dept_id`, `per_designation`, `per_tin_no`, `per_gsis_bp_no`, `per_pagibig_no`, `per_plantilla_no`, `promote_id`, `per_contact_no`, `rank_id`, `bs_name`, `bs_year`, `bs_school`, `ms_name`, `ms_with_unit`, `ms_year`, `ms_school`, `dr_name`, `dr_with_unit`, `dr_year`, `dr_school`, `other_degree`, `other_year`, `other_school`, `per_image`, `date_modified`, `gass_id`) VALUES
(165, 'Leny', '', 'Perez', '', 52, 'Female', 'Single', 'no where to-be found', '2024-10-23', 'arizona philippines', '2024-10-19', 'boss', 'Talisay', 2, 'Part-Time', '132-131-321', '242-423-423', '242-423-424', 534656, 0, '+639 000-000-000', 1, 'BS IT', 2024, 'FCPC', 'MANAGEMENT', '82 units', 2024, 'FCPC', '', '0', 0000, '', '', 0000, '', '', '2024-10-17', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_position`
--

CREATE TABLE `tbl_position` (
  `pos_id` int(3) NOT NULL,
  `pos_name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_position`
--

INSERT INTO `tbl_position` (`pos_id`, `pos_name`) VALUES
(41, 'Chairperson'),
(42, 'PME, Coordinator'),
(43, 'SSG Adviser'),
(44, 'Chair, BSIS'),
(45, 'Chair, BSE'),
(46, 'Chair, Graduate School'),
(47, 'CIMD Coordinator'),
(48, 'Chair, SAS'),
(49, 'Coordinator, Extension'),
(50, 'PPDM, IGP'),
(51, 'OSA Coordinator'),
(52, 'SSD In-Charge'),
(53, 'Criminology Chairperson'),
(54, 'Chair, BS Industrial Technology'),
(55, 'Chair, Extension'),
(56, 'Student Teaching Supervisor'),
(57, 'Discipline Officer'),
(58, 'Dean, Fortune Towne'),
(59, 'Fisheries Chairperson'),
(60, 'Business Administration Chairperson'),
(61, 'NSTP Coordinator'),
(62, 'Executive Director'),
(63, 'Dean. College of Fisheries'),
(64, 'Research Coordinator, Technopacer Adviser'),
(65, 'IGP Coordinator'),
(66, 'Chair, BSIS                                  ICT C'),
(67, 'Acting Registrar'),
(68, 'Assistant Discipline Officer'),
(69, 'Chair, BSOA'),
(70, 'Alumni Coordinator'),
(71, 'Dean IT'),
(72, 'Education Chairperson, Student Teaching Supervisor'),
(73, 'ECS Coordinator'),
(74, 'Director, PME'),
(75, 'Chair, BSA'),
(76, 'Chairperson, Information Technology'),
(77, 'Adviser, SSG'),
(78, 'Chair, BSACT'),
(79, 'Sports Coordinator'),
(80, 'Guidance Counselor'),
(81, 'SUC President'),
(82, 'NoWhere');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotion`
--

CREATE TABLE `tbl_promotion` (
  `promote_id` int(5) NOT NULL,
  `per_id` int(6) NOT NULL,
  `rank_id` int(3) NOT NULL,
  `date_promoted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_promotion`
--

INSERT INTO `tbl_promotion` (`promote_id`, `per_id`, `rank_id`, `date_promoted`) VALUES
(1, 67, 2, '2015-12-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_academic_rank`
--
ALTER TABLE `tbl_academic_rank`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `tbl_files`
--
ALTER TABLE `tbl_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `tbl_gass_rank`
--
ALTER TABLE `tbl_gass_rank`
  ADD PRIMARY KEY (`gass_id`);

--
-- Indexes for table `tbl_personnel`
--
ALTER TABLE `tbl_personnel`
  ADD PRIMARY KEY (`per_id`);

--
-- Indexes for table `tbl_position`
--
ALTER TABLE `tbl_position`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `tbl_promotion`
--
ALTER TABLE `tbl_promotion`
  ADD PRIMARY KEY (`promote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_academic_rank`
--
ALTER TABLE `tbl_academic_rank`
  MODIFY `rank_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `dept_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_files`
--
ALTER TABLE `tbl_files`
  MODIFY `file_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_gass_rank`
--
ALTER TABLE `tbl_gass_rank`
  MODIFY `gass_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_personnel`
--
ALTER TABLE `tbl_personnel`
  MODIFY `per_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `tbl_position`
--
ALTER TABLE `tbl_position`
  MODIFY `pos_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `tbl_promotion`
--
ALTER TABLE `tbl_promotion`
  MODIFY `promote_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'library_ms', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"tbl_authors\",\"tbl_books\",\"tbl_categories\",\"tbl_publishers\",\"tbl_users\"],\"table_structure[]\":[\"tbl_authors\",\"tbl_books\",\"tbl_categories\",\"tbl_publishers\",\"tbl_users\"],\"table_data[]\":[\"tbl_authors\",\"tbl_books\",\"tbl_categories\",\"tbl_publishers\",\"tbl_users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'server', 'attend_monitor_sys', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"atm\",\"attendance_mgmt_system\",\"attend_monitor_sys\",\"base\",\"dblibrary_management_system\",\"eas_db\",\"hrm\",\"phpmyadmin\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"attend_monitor_sys\",\"table\":\"tbl_attendance\"},{\"db\":\"attend_monitor_sys\",\"table\":\"tbl_user\"},{\"db\":\"attend_monitor_sys\",\"table\":\"tbl_schedule\"},{\"db\":\"atm\",\"table\":\"date_and_time\"},{\"db\":\"atm\",\"table\":\"tbl_schedule\"},{\"db\":\"dblibrary_management_system\",\"table\":\"tbl_users\"},{\"db\":\"dblibrary_management_system\",\"table\":\"tbl_books\"},{\"db\":\"dblibrary_management_system\",\"table\":\"tbl_categories\"},{\"db\":\"attend_monitor_sys\",\"table\":\"tbl_department\"},{\"db\":\"dblibrary_management_system\",\"table\":\"tbl_publishers\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('attend_monitor_sys', 'tbl_attendance', 'first_name'),
('dblibrary_management_system', 'tbl_books', 'books_title');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'atm', 'tbl_schedule', '{\"sorted_col\":\"`tbl_schedule`.`sched_start` DESC\"}', '2024-10-29 20:59:35'),
('root', 'dblibrary_management_system', 'tbl_categories', '{\"sorted_col\":\"`tbl_category`.`cat_id` DESC\"}', '2024-10-22 14:08:57'),
('root', 'eas_db', 'attendance', '{\"sorted_col\":\"`attendance`.`department_id` ASC\"}', '2024-10-24 04:03:39'),
('root', 'eas_db', 'user_submenu', '{\"sorted_col\":\"`user_submenu`.`title` DESC\"}', '2024-10-24 04:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-10-31 09:23:34', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
