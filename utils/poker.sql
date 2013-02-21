-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 02 月 21 日 08:56
-- 服务器版本: 5.5.29
-- PHP 版本: 5.4.6-1ubuntu1.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `poker`
--

-- --------------------------------------------------------

--
-- 表的结构 `barrack`
--

CREATE TABLE IF NOT EXISTS `barrack` (
  `orc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `consumer` varchar(20) NOT NULL COMMENT '帐户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  PRIMARY KEY (`orc_id`),
  UNIQUE KEY `consumer` (`consumer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `barrack`
--

INSERT INTO `barrack` (`orc_id`, `consumer`, `password`) VALUES
(1, 'user1', '202cb962ac59075b964b07152d234b70'),
(2, 'user2', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- 表的结构 `shire`
--

CREATE TABLE IF NOT EXISTS `shire` (
  `shire_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报修id(PK)',
  `reporter` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报修人',
  `report_time` date NOT NULL COMMENT '报修时间',
  `contact_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报修人联系方式',
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '故障部门或班级',
  `place` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '故障地点',
  `reason` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '故障原因',
  `detail` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '详细原因',
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `broken_item` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报修物品',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '维修状态',
  `state_context` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '维修状态的额外解释',
  `repair_time` date NOT NULL COMMENT '维修时间',
  `feedback` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '安排反馈',
  PRIMARY KEY (`shire_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=195 ;

--
-- 转存表中的数据 `shire`
--

INSERT INTO `shire` (`shire_id`, `reporter`, `report_time`, `contact_num`, `department`, `place`, `reason`, `detail`, `filename`, `broken_item`, `state`, `state_context`, `repair_time`, `feedback`) VALUES
(155, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(156, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(157, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(158, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(159, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(160, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(161, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(162, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(163, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(164, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(165, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(166, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(167, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(168, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(169, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(170, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(171, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(172, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(173, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(174, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(175, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(176, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(177, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(178, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(179, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(180, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(181, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(182, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(183, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(184, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(185, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(186, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(187, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(188, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(189, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(190, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(191, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(192, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(193, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', ''),
(194, 'å°é»‘', '2013-01-31', '18963168043', 'ä¸‰å…¬å¯“', 'äºŒå±‚åŽ•æ‰€', 'åŽ•æ‰€å µäº†', '', '', 'åŽ•æ‰€', 0, '', '0000-00-00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
