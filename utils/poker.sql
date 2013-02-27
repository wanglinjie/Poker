-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2013 年 02 月 24 日 00:34
-- 服务器版本: 5.0.51
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `poker`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `barrack`
-- 

DROP TABLE IF EXISTS `barrack`;
CREATE TABLE IF NOT EXISTS `barrack` (
  `orc_id` int(11) NOT NULL auto_increment COMMENT '管理员id',
  `consumer` varchar(20) character set utf8 collate utf8_bin NOT NULL COMMENT '帐户名',
  `password` varchar(50) character set utf8 collate utf8_bin NOT NULL COMMENT '密码',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY  (`orc_id`),
  UNIQUE KEY `consumer` (`consumer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- 导出表中的数据 `barrack`
-- 

INSERT INTO `barrack` (`orc_id`, `consumer`, `password`, `role_id`) VALUES (5, 0x61646d696e, 0x3230326362393632616335393037356239363462303731353264323334623730, 1);
INSERT INTO `barrack` (`orc_id`, `consumer`, `password`, `role_id`) VALUES (6, 0x7573657231, 0x3230326362393632616335393037356239363462303731353264323334623730, 2);

-- --------------------------------------------------------

-- 
-- 表的结构 `role`
-- 

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL auto_increment COMMENT '角色id',
  `role_type` varchar(40) character set utf8 collate utf8_bin NOT NULL COMMENT '角色类型',
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- 导出表中的数据 `role`
-- 

INSERT INTO `role` (`role_id`, `role_type`) VALUES (1, 0xe7aea1e79086e59198);
INSERT INTO `role` (`role_id`, `role_type`) VALUES (2, 0xe794b5e58a9be7bbb4e4bfaee983a8e997a8);

-- --------------------------------------------------------

-- 
-- 表的结构 `shire`
-- 

DROP TABLE IF EXISTS `shire`;
CREATE TABLE IF NOT EXISTS `shire` (
  `shire_id` int(11) NOT NULL auto_increment COMMENT '报修id(PK)',
  `reporter` varchar(20) character set utf8 collate utf8_bin NOT NULL COMMENT '报修人',
  `report_id` varchar(40) character set utf8 collate utf8_bin NOT NULL COMMENT '报修人工号',
  `report_time` date NOT NULL COMMENT '报修时间',
  `contact_num` varchar(20) character set utf8 collate utf8_bin NOT NULL COMMENT '报修人联系方式',
  `department` varchar(20) character set utf8 collate utf8_bin NOT NULL COMMENT '故障部门或班级',
  `place` varchar(40) character set utf8 collate utf8_bin NOT NULL COMMENT '故障地点',
  `reason` varchar(40) character set utf8 collate utf8_bin NOT NULL COMMENT '故障原因',
  `detail` text character set utf8 collate utf8_bin NOT NULL COMMENT '详细原因',
  `filename` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `broken_item` varchar(20) character set utf8 collate utf8_bin NOT NULL COMMENT '报修物品',
  `state` int(11) NOT NULL default '0' COMMENT '维修状态',
  `state_context` varchar(50) character set utf8 collate utf8_bin NOT NULL COMMENT '维修状态的额外解释',
  `role_id` int(11) NOT NULL,
  `repair_time` date NOT NULL COMMENT '维修时间',
  `feedback` varchar(50) character set utf8 collate utf8_bin NOT NULL COMMENT '安排反馈',
  PRIMARY KEY  (`shire_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=205 ;

-- 
-- 导出表中的数据 `shire`
-- 

