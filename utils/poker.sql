-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 02 月 28 日 10:19
-- 服务器版本: 5.6.10
-- PHP 版本: 5.3.15

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

DROP TABLE IF EXISTS `barrack`;
CREATE TABLE IF NOT EXISTS `barrack` (
  `orc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `consumer` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帐户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`orc_id`),
  UNIQUE KEY `consumer` (`consumer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色类型',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `shire`
--

DROP TABLE IF EXISTS `shire`;
CREATE TABLE IF NOT EXISTS `shire` (
  `shire_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报修id(PK)',
  `reporter` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报修人',
  `report_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报修人工号',
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
  `role_id` int(11) NOT NULL DEFAULT '0',
  `repair_time` date NOT NULL COMMENT '维修时间',
  `feedback` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '安排反馈',
  `auth_check` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`shire_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=206 ;

-- --------------------------------------------------------

--
-- 表的结构 `wizard`
--

DROP TABLE IF EXISTS `wizard`;
CREATE TABLE IF NOT EXISTS `wizard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wizard_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wizard_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55601 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
