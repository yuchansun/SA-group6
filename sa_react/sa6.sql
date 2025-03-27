-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2025-03-27 03:30:23
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `sa6`
--

-- --------------------------------------------------------

--
-- 資料表結構 `account`
--

CREATE TABLE `account` (
  `User_ID` int(20) NOT NULL,
  `My_favourite` varchar(100) DEFAULT NULL,
  `Password` varchar(60) NOT NULL,
  `Record` varchar(255) DEFAULT NULL,
  `Photo` varchar(100) NOT NULL,
  `Nickname` varchar(60) NOT NULL,
  `Roles` enum('Admin','User','Moderator') NOT NULL,
  `E_mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `discussion_forum`
--

CREATE TABLE `discussion_forum` (
  `forum_id` int(20) NOT NULL,
  `Message_area_id` int(20) NOT NULL,
  `User_id` int(20) NOT NULL,
  `Content` varchar(225) NOT NULL,
  `OrderTime` datetime DEFAULT NULL,
  `Title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `disc_cluster_introduction`
--

CREATE TABLE `disc_cluster_introduction` (
  `Disc_Cluster_name` varchar(20) NOT NULL,
  `Description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `message_area`
--

CREATE TABLE `message_area` (
  `Message_area_id` int(20) NOT NULL,
  `Content` varchar(225) NOT NULL,
  `User_id` int(20) NOT NULL,
  `OrderTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `my_favorites`
--

CREATE TABLE `my_favorites` (
  `User_ID` int(20) NOT NULL,
  `Sch_num` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `school_introduction`
--

CREATE TABLE `school_introduction` (
  `SchoolName` varchar(20) NOT NULL,
  `Sch_Intro` varchar(500) DEFAULT NULL,
  `Dep_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `sch_description`
--

CREATE TABLE `sch_description` (
  `Sch_num` varchar(20) NOT NULL,
  `School_Name` varchar(20) NOT NULL,
  `Department` varchar(20) NOT NULL,
  `Region` varchar(5) NOT NULL,
  `Disc_Cluster` varchar(10) NOT NULL,
  `Schol_Apti` varchar(10) DEFAULT NULL,
  `Talent` varchar(10) DEFAULT NULL,
  `ID` varchar(10) DEFAULT NULL,
  `Plan` varchar(10) DEFAULT NULL,
  `Quota` int(11) NOT NULL,
  `Contact` varchar(225) DEFAULT NULL,
  `link` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `test`
--

CREATE TABLE `test` (
  `test1` int(11) NOT NULL,
  `test2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `to_do_items`
--

CREATE TABLE `to_do_items` (
  `Sch_num` varchar(20) NOT NULL,
  `Data_review` varchar(255) DEFAULT NULL,
  `Interview` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `E_mail` (`E_mail`),
  ADD KEY `idx_nickname` (`Nickname`),
  ADD KEY `idx_email` (`E_mail`);

--
-- 資料表索引 `discussion_forum`
--
ALTER TABLE `discussion_forum`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `Message_area_id` (`Message_area_id`),
  ADD KEY `idx_user_id` (`User_id`),
  ADD KEY `idx_order_time` (`OrderTime`);

--
-- 資料表索引 `disc_cluster_introduction`
--
ALTER TABLE `disc_cluster_introduction`
  ADD PRIMARY KEY (`Disc_Cluster_name`);

--
-- 資料表索引 `message_area`
--
ALTER TABLE `message_area`
  ADD PRIMARY KEY (`Message_area_id`),
  ADD KEY `idx_user_id` (`User_id`),
  ADD KEY `idx_order_time` (`OrderTime`);

--
-- 資料表索引 `my_favorites`
--
ALTER TABLE `my_favorites`
  ADD PRIMARY KEY (`User_ID`,`Sch_num`),
  ADD KEY `Sch_num` (`Sch_num`);

--
-- 資料表索引 `school_introduction`
--
ALTER TABLE `school_introduction`
  ADD PRIMARY KEY (`SchoolName`);

--
-- 資料表索引 `sch_description`
--
ALTER TABLE `sch_description`
  ADD PRIMARY KEY (`Sch_num`),
  ADD KEY `School_Name` (`School_Name`),
  ADD KEY `idx_region` (`Region`),
  ADD KEY `idx_disc_cluster` (`Disc_Cluster`);

--
-- 資料表索引 `to_do_items`
--
ALTER TABLE `to_do_items`
  ADD PRIMARY KEY (`Sch_num`),
  ADD KEY `idx_sch_num` (`Sch_num`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `account`
--
ALTER TABLE `account`
  MODIFY `User_ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `discussion_forum`
--
ALTER TABLE `discussion_forum`
  MODIFY `forum_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message_area`
--
ALTER TABLE `message_area`
  MODIFY `Message_area_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `discussion_forum`
--
ALTER TABLE `discussion_forum`
  ADD CONSTRAINT `discussion_forum_ibfk_1` FOREIGN KEY (`Message_area_id`) REFERENCES `message_area` (`Message_area_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussion_forum_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `account` (`User_ID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `message_area`
--
ALTER TABLE `message_area`
  ADD CONSTRAINT `message_area_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `account` (`User_ID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `my_favorites`
--
ALTER TABLE `my_favorites`
  ADD CONSTRAINT `my_favorites_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `account` (`User_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `my_favorites_ibfk_2` FOREIGN KEY (`Sch_num`) REFERENCES `sch_description` (`Sch_num`) ON DELETE CASCADE;

--
-- 資料表的限制式 `sch_description`
--
ALTER TABLE `sch_description`
  ADD CONSTRAINT `sch_description_ibfk_1` FOREIGN KEY (`School_Name`) REFERENCES `school_introduction` (`SchoolName`) ON DELETE CASCADE;

--
-- 資料表的限制式 `to_do_items`
--
ALTER TABLE `to_do_items`
  ADD CONSTRAINT `to_do_items_ibfk_1` FOREIGN KEY (`Sch_num`) REFERENCES `sch_description` (`Sch_num`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
