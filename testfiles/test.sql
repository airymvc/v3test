/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50154
 Source Host           : localhost
 Source Database       : sbir

 Target Server Type    : MySQL
 Target Server Version : 50154
 File Encoding         : utf-8

 Date: 01/03/2014 04:01:54 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `createdate` date DEFAULT NULL,
  `isonline` tinyint(11) DEFAULT NULL,
  `isdelete` tinyint(11) DEFAULT NULL,
  `host` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `cautions` varchar(100) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `initial_attend` int(30) DEFAULT NULL,
  `allow_attend` int(30) DEFAULT NULL,
  `final_attend` int(30) DEFAULT NULL,
  `main_img` varchar(50) DEFAULT NULL,
  `other_img` varchar(50) DEFAULT NULL,
  `fansonly` tinyint(11) DEFAULT NULL,
  `url_1` varchar(50) DEFAULT NULL,
  `url_2` varchar(50) DEFAULT NULL,
  `awd_comment` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `activity`
-- ----------------------------
BEGIN;
INSERT INTO `activity` VALUES ('1', 'fans', '2012-03-22', '2012-05-31', '2012-03-15', '0', '0', '2', 'bb', 'bbbbb', 'bbbb', 'bbbb', '20', '60', '40', null, null, '0', 'bbb', 'bbb', 'memo'), ('3', 'act2', '2012-04-06', '2012-05-25', '2012-04-01', '1', '0', '3', 'ahhh', 'aaaa', null, 'dfdfd', '120', '500', '312', null, null, '1', 'ccc', 'ccc', 'no'), ('4', 'lottery', '2012-04-19', '2012-05-28', '2012-05-14', '1', '0', '1', 'cc', 'cccc', null, 'sdfafas', '30', '100', '80', null, null, '1', 'cddd', 'dddd', 'big gift');
COMMIT;

-- ----------------------------
--  Table structure for `activity_mng`
-- ----------------------------
DROP TABLE IF EXISTS `activity_mng`;
CREATE TABLE `activity_mng` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `attendent_id` int(30) NOT NULL,
  `activity_id` int(30) DEFAULT NULL,
  `award_id` int(30) DEFAULT '0',
  `attend_date` date DEFAULT NULL,
  `awarddate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`,`awarddate`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `activity_mng`
-- ----------------------------
BEGIN;
INSERT INTO `activity_mng` VALUES ('1', '1', '3', '1', '2012-04-18', '0000-00-00'), ('2', '2', '1', '2', '2012-04-19', '0000-00-00'), ('3', '3', '4', '3', '2012-04-16', '0000-00-00'), ('4', '4', '3', '0', '2012-04-19', '0000-00-00'), ('5', '1', '4', '0', '2012-04-12', '0000-00-00'), ('6', '2', '3', '2', '2012-04-19', '0000-00-00'), ('7', '3', '1', '1', '2012-04-20', '0000-00-00');
COMMIT;

-- ----------------------------
--  Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `isonline` tinyint(11) DEFAULT '0',
  `isdelete` tinyint(11) DEFAULT '0',
  `url` varchar(45) DEFAULT NULL,
  `image_path` varchar(45) DEFAULT NULL,
  `host_id` int(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ad`
-- ----------------------------
BEGIN;
INSERT INTO `ad` VALUES ('1', 'ad1', '2012-04-03', '1', '0', 'test url', 'test img', null), ('2', 'ad 2', '2012-04-19', '0', '0', 'test url 1', 'test img 2', null), ('3', 'mmmmmm', '2012-04-27', '0', '0', '', 'http://127.0.0.1:80/sbir/webroot/img/Desert.j', null), ('4', 'test abc', '2012-05-02', '0', '0', 'acb', 'http://127.0.0.1:80/sbir/webroot/img/Jellyfis', null);
COMMIT;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `createdate` date DEFAULT NULL,
  `isonline` tinyint(11) DEFAULT NULL,
  `ischeck` tinyint(11) DEFAULT NULL,
  `isdelete` tinyint(11) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('1', 'aaa1', 'aaaa', 'aaa', 'a@b.com', '2012-03-20', '1', '0', '0', null), ('2', 'bbb', 'bbb', 'bbb', 'b@c.com', '2012-03-06', '0', '0', '0', null), ('3', 'ccc', 'ccc', 'ccc', 'c@d.com', '2012-03-16', '1', null, '0', '9df62e693988eb4e1e1444ece0578579'), ('4', 'test5', 'test5', 'test5', '', '2012-04-18', '0', null, '0', 'e3d704f3542b44a621ebed70dc0efe13'), ('5', 'test test', 'test test', '', '', '2012-04-27', '0', null, '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('6', 'xxx', 'xxxx', '', '', '2012-04-27', '0', null, '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('7', 'test abc', 'abc', 'teat abc', 'abc', '2012-05-02', '0', null, '0', 'b4d3b91a695fae916ba10ba47daf4911');
COMMIT;

-- ----------------------------
--  Table structure for `attendent`
-- ----------------------------
DROP TABLE IF EXISTS `attendent`;
CREATE TABLE `attendent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(30) NOT NULL,
  `name` char(30) DEFAULT NULL,
  `img` char(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(11) DEFAULT NULL,
  `tel` int(15) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `ischeck` tinyint(11) DEFAULT NULL,
  `isdelete` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `attendent`
-- ----------------------------
BEGIN;
INSERT INTO `attendent` VALUES ('1', 'a1', '小张', 'img1', 'zhanghongfu@gmail.com', '2012-04-25', '1', '11111', 'adfasdf', '0', '0'), ('2', 'a2', '小王', 'img2', 'wang@c.com', '2012-04-09', '2', '33333', 'dfgsfdhsdfg', '0', '0'), ('3', 'a3', '小李', 'img3', 'li@gmail.com', '2012-04-12', '1', '2222222', 'hjdfgj', '0', '0'), ('4', 'a4', 'zhao', 'img4', 'zhao@gmail.com', '2012-04-03', '1', '4444', 'asdfasd', '0', '0'), ('5', 'a5', 'asdfa', 'img5', 'asdf', '2012-04-23', '1', '2323', 'asdfasdf', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `award`
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `annotation` char(50) DEFAULT NULL,
  `act_id` int(30) DEFAULT NULL,
  `rank` tinyint(30) DEFAULT NULL,
  `img` char(30) DEFAULT NULL,
  `isdetele` tinyint(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `award`
-- ----------------------------
BEGIN;
INSERT INTO `award` VALUES ('1', 'elite', '10', '1000usd', '1', '1', 'ertwert', '0'), ('2', 'walmart GC', '12', '100 dollar', '3', '1', 'rwtyerty', '0'), ('3', 'gift card', '10', '100usd', '1', '2', 'wert', '0');
COMMIT;

-- ----------------------------
--  Table structure for `host`
-- ----------------------------
DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `id` tinyint(30) NOT NULL AUTO_INCREMENT,
  `member_id` int(30) DEFAULT NULL,
  `hostname` char(30) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `iscompany` tinyint(11) DEFAULT NULL,
  `companyname` char(50) DEFAULT NULL,
  `companyid` int(30) DEFAULT NULL,
  `facebookurl` char(50) DEFAULT NULL,
  `contact` char(30) DEFAULT NULL,
  `tel` int(30) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `address` char(50) DEFAULT NULL,
  `officialurl` char(50) DEFAULT NULL,
  `intro` char(100) DEFAULT NULL,
  `category` enum('','others','home','travel','entertainment','3C','food','clothes','make-up') DEFAULT 'others',
  `isdelete` tinyint(11) DEFAULT '0',
  `ischeck` tinyint(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `host`
-- ----------------------------
BEGIN;
INSERT INTO `host` VALUES ('1', null, '中華電信', '2012-05-09', '0', 'asdfasdf', '127', 'adfadsfgasg', 'asdfasdf', '32452354', 'asdfasdf', 'asdfasdf', 'http://cht.com.tw', 'dsfdsfdsfdsfdsfdsfsdfdsfdsfdsfdsfdsfdsfdsfdsfdsfs', '居家生活', '0', '0'), ('2', null, '爾灣大學', '2012-05-10', '1', 'gjdghjdfg', '127', 'fdghfgh', 'wert', '54674567', 'fgdhdfgh', 'asdf', 'DFSGSDFG', 'hjkghk', '旅遊休閒', '0', '0'), ('3', null, '松下公司', '2012-05-04', '0', 'xcvbxcvb', '127', 'etrqetq', 'wertw', '679789', 'zxcvSv', 'asdfasdf', 'DFGSJ', 'hjkghk', '3C電子', '0', '0'), ('4', null, 'AR公司', '2012-05-03', '0', 'asdfasdf', '3452345', 'dsdfwertwert', '的分公司的风格', '23452345', 'drtwert', '沃尔特vwertvwevter', 'ertwertwer', '发个换成白色让他玩', '3C電子', '0', '0'), ('5', '0', 'QA公司', '2012-05-03', '0', '水电费阿斯蒂芬阿萨德', '0', 'wertwertwertrwty', '电饭锅', '453465', 'fghjfghj', '国际私法好地方工会', 'rtyerty', '的感觉到房管局的反光镜', '服飾精品', '0', '0'), ('6', '0', '资源集团', '2012-05-03', '0', '儿童为儿童为儿童', '43563456', 'yrtyertyert', '让他玩儿', '567568', 'hgkjthjkt', '过后就发个黄金分割', 'fghjgh', '过后就发个黄金分割黄金分割胡椒粉各环节', '美妝保養', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `isonline` tinyint(11) DEFAULT NULL,
  `isdelete` tinyint(11) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `member`
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES ('1', 'aaa', '', 'c1', 'a@b.om', '2012-04-18', '1', '0', null), ('2', 'bbb', '', 'w2', 'r@uci.com', '2012-04-03', '1', '0', null), ('3', 'ccc', '', 'li3', 'm@panasonic.com', '2012-04-05', '0', '0', null), ('4', 'mmmm', '', 'mmmm', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('5', 'gggg', '', 'gggg', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('6', 'hhhh', '', 'hhhh', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('7', 'kkk', '', 'kkk', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('8', 'ooo', '', 'ooo', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('9', 'ssss', '', 'ssss', '', '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
