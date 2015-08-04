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


-- ----------------------------
--  Table structure for  activity 
-- ----------------------------

CREATE TABLE  activity  (
   id  int NOT NULL,
   title  varchar(30) NOT NULL,
   startdate  date NOT NULL,
   enddate  date NOT NULL,
   createdate  date DEFAULT NULL,
   isonline  tinyint DEFAULT NULL,
   isdelete  tinyint DEFAULT NULL,
   host  varchar(30) DEFAULT NULL,
   category  varchar(30) DEFAULT NULL,
   description  varchar(100) DEFAULT NULL,
   cautions  varchar(100) DEFAULT NULL,
   location  varchar(30) DEFAULT NULL,
   initial_attend  int DEFAULT NULL,
   allow_attend  int DEFAULT NULL,
   final_attend  int DEFAULT NULL,
   main_img  varchar(50) DEFAULT NULL,
   other_img  varchar(50) DEFAULT NULL,
   fansonly  tinyint DEFAULT NULL,
   url_1  varchar(50) DEFAULT NULL,
   url_2  varchar(50) DEFAULT NULL,
   awd_comment  char(50) DEFAULT NULL,
  PRIMARY KEY ( id )
);

-- ----------------------------
--  Records of  activity 
-- ----------------------------

INSERT INTO  activity  VALUES ('1', 'fans', '2012-03-22', '2012-05-31', '2012-03-15', '0', '0', '2', 'bb', 'bbbbb', 'bbbb', 'bbbb', '20', '60', '40', null, null, '0', 'bbb', 'bbb', 'memo'), ('3', 'act2', '2012-04-06', '2012-05-25', '2012-04-01', '1', '0', '3', 'ahhh', 'aaaa', null, 'dfdfd', '120', '500', '312', null, null, '1', 'ccc', 'ccc', 'no'), ('4', 'lottery', '2012-04-19', '2012-05-28', '2012-05-14', '1', '0', '1', 'cc', 'cccc', null, 'sdfafas', '30', '100', '80', null, null, '1', 'cddd', 'dddd', 'big gift');




-- ----------------------------
--  Table structure for  activity_mng 
-- ----------------------------
CREATE TABLE  activity_mng  (
   id  int NOT NULL,
   attendent_id  int NOT NULL,
   activity_id  int DEFAULT NULL,
   award_id  int DEFAULT '0',
   attend_date  varchar(30) DEFAULT NULL,
   awarddate  varchar(30) NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY ( id , awarddate )
);

-- ----------------------------
--  Records of  activity_mng 
-- ----------------------------

INSERT INTO  activity_mng  VALUES ('1', '1', '3', '1', '2012-04-18', '0000-00-00'), ('2', '2', '1', '2', '2012-04-19', '0000-00-00'), ('3', '3', '4', '3', '2012-04-16', '0000-00-00'), ('4', '4', '3', '0', '2012-04-19', '0000-00-00'), ('5', '1', '4', '0', '2012-04-12', '0000-00-00'), ('6', '2', '3', '2', '2012-04-19', '0000-00-00'), ('7', '3', '1', '1', '2012-04-20', '0000-00-00');


-- ----------------------------
--  Table structure for  ad 
-- ----------------------------

CREATE TABLE  ad  (
   id  int NOT NULL,
   name  varchar(30) DEFAULT NULL,
   createdate  date DEFAULT NULL,
   isonline  tinyint DEFAULT '0',
   isdelete  tinyint DEFAULT '0',
   url  varchar(45) DEFAULT NULL,
   image_path  varchar(45) DEFAULT NULL,
   host_id  int DEFAULT NULL,
  PRIMARY KEY ( id )
);

-- ----------------------------
--  Records of  ad 
-- ----------------------------

INSERT INTO  ad  VALUES ('1', 'ad1', '2012-04-03', '1', '0', 'test url', 'test img', null), ('2', 'ad 2', '2012-04-19', '0', '0', 'test url 1', 'test img 2', null), ('3', 'mmmmmm', '2012-04-27', '0', '0', '', 'http://127.0.0.1:80/sbir/webroot/img/Desert.j', null), ('4', 'test abc', '2012-05-02', '0', '0', 'acb', 'http://127.0.0.1:80/sbir/webroot/img/Jellyfis', null);





-- ----------------------------
--  Table structure for  admin 
-- ----------------------------

CREATE TABLE  admin  (
   id  int NOT NULL,
   account_id  varchar(30) NOT NULL,
   name  varchar(30) NOT NULL,
   pwd  varchar(30) NOT NULL,
   email  varchar(30) NOT NULL,
   createdate  date DEFAULT NULL,
   isonline  tinyint DEFAULT NULL,
   ischeck  tinyint DEFAULT NULL,
   isdelete  tinyint DEFAULT NULL,
   salt  varchar(50) DEFAULT NULL,
  PRIMARY KEY ( id )
);

-- ----------------------------
--  Records of  admin 
-- ----------------------------

INSERT INTO  admin  VALUES ('1', 'aaa1', 'aaaa', 'aaa', 'a@b.com', '2012-03-20', '1', '0', '0', null), ('2', 'bbb', 'bbb', 'bbb', 'b@c.com', '2012-03-06', '0', '0', '0', null), ('3', 'ccc', 'ccc', 'ccc', 'c@d.com', '2012-03-16', '1', null, '0', '9df62e693988eb4e1e1444ece0578579'), ('4', 'test5', 'test5', 'test5', '', '2012-04-18', '0', null, '0', 'e3d704f3542b44a621ebed70dc0efe13'), ('5', 'test test', 'test test', '', '', '2012-04-27', '0', null, '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('6', 'xxx', 'xxxx', '', '', '2012-04-27', '0', null, '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('7', 'test abc', 'abc', 'teat abc', 'abc', '2012-05-02', '0', null, '0', 'b4d3b91a695fae916ba10ba47daf4911');


-- ----------------------------
--  Table structure for  attendent 
-- ----------------------------

CREATE TABLE  attendent  (
   id  int NOT NULL,
   account_id  varchar(30) NOT NULL,
   name  char(30) DEFAULT NULL,
   img  char(30) DEFAULT NULL,
   email  varchar(30) DEFAULT NULL,
   birthday  date DEFAULT NULL,
   gender  tinyint DEFAULT NULL,
   tel  int DEFAULT NULL,
   address  varchar(30) DEFAULT NULL,
   ischeck  tinyint DEFAULT NULL,
   isdelete  tinyint DEFAULT NULL,
  PRIMARY KEY ( id )
);

-- ----------------------------
--  Records of  attendent 
-- ----------------------------

INSERT INTO  attendent  VALUES ('1', 'a1', '小张', 'img1', 'zhanghongfu@gmail.com', '2012-04-25', '1', '11111', 'adfasdf', '0', '0'), ('2', 'a2', '小王', 'img2', 'wang@c.com', '2012-04-09', '2', '33333', 'dfgsfdhsdfg', '0', '0'), ('3', 'a3', '小李', 'img3', 'li@gmail.com', '2012-04-12', '1', '2222222', 'hjdfgj', '0', '0'), ('4', 'a4', 'zhao', 'img4', 'zhao@gmail.com', '2012-04-03', '1', '4444', 'asdfasd', '0', '0'), ('5', 'a5', 'asdfa', 'img5', 'asdf', '2012-04-23', '1', '2323', 'asdfasdf', '0', '0');




-- ----------------------------
--  Table structure for  award 
-- ----------------------------

CREATE TABLE  award  (
   id  int NOT NULL,
   name  char(30) DEFAULT NULL,
   quota  int DEFAULT NULL,
   annotation  char(50) DEFAULT NULL,
   act_id  int DEFAULT NULL,
   rank  tinyint DEFAULT NULL,
   img  char(30) DEFAULT NULL,
   isdetele  tinyint DEFAULT '0',
  PRIMARY KEY ( id )
);

-- ----------------------------
--  Records of  award 
-- ----------------------------

INSERT INTO  award  VALUES ('1', 'elite', '10', '1000usd', '1', '1', 'ertwert', '0'), ('2', 'walmart GC', '12', '100 dollar', '3', '1', 'rwtyerty', '0'), ('3', 'gift card', '10', '100usd', '1', '2', 'wert', '0');




-- ----------------------------
--  Table structure for  host 
-- ----------------------------

CREATE TABLE  host  (
   id  tinyint NOT NULL,
   member_id  int DEFAULT NULL,
   hostname  char(30) DEFAULT NULL,
   createdate  date DEFAULT NULL,
   iscompany  tinyint DEFAULT NULL,
   companyname  char(50) DEFAULT NULL,
   companyid  int DEFAULT NULL,
   facebookurl  char(50) DEFAULT NULL,
   contact  char(30) DEFAULT NULL,
   tel  int DEFAULT NULL,
   email  char(30) DEFAULT NULL,
   address  char(50) DEFAULT NULL,
   officialurl  char(50) DEFAULT NULL,
   intro  char(100) DEFAULT NULL,
   category  varchar(30) DEFAULT 'others',
   isdelete  tinyint DEFAULT '0',
   ischeck  tinyint DEFAULT '0',
  PRIMARY KEY ( id )
);

-- ----------------------------
--  Records of  host 
-- ----------------------------

INSERT INTO  host  VALUES ('1', null, '中華電信', '2012-05-09', '0', 'asdfasdf', '127', 'adfadsfgasg', 'asdfasdf', '32452354', 'asdfasdf', 'asdfasdf', 'http://cht.com.tw', 'dsfdsfdsfdsfdsfdsfsdfdsfdsfdsfdsfdsfdsfdsfdsfdsfs', '居家生活', '0', '0'), ('2', null, '爾灣大學', '2012-05-10', '1', 'gjdghjdfg', '127', 'fdghfgh', 'wert', '54674567', 'fgdhdfgh', 'asdf', 'DFSGSDFG', 'hjkghk', '旅遊休閒', '0', '0'), ('3', null, '松下公司', '2012-05-04', '0', 'xcvbxcvb', '127', 'etrqetq', 'wertw', '679789', 'zxcvSv', 'asdfasdf', 'DFGSJ', 'hjkghk', '3C電子', '0', '0'), ('4', null, 'AR公司', '2012-05-03', '0', 'asdfasdf', '3452345', 'dsdfwertwert', '的分公司的风格', '23452345', 'drtwert', '沃尔特vwertvwevter', 'ertwertwer', '发个换成白色让他玩', '3C電子', '0', '0'), ('5', '0', 'QA公司', '2012-05-03', '0', '水电费阿斯蒂芬阿萨德', '0', 'wertwertwertrwty', '电饭锅', '453465', 'fghjfghj', '国际私法好地方工会', 'rtyerty', '的感觉到房管局的反光镜', '服飾精品', '0', '0'), ('6', '0', '资源集团', '2012-05-03', '0', '儿童为儿童为儿童', '43563456', 'yrtyertyert', '让他玩儿', '567568', 'hgkjthjkt', '过后就发个黄金分割', 'fghjgh', '过后就发个黄金分割黄金分割胡椒粉各环节', '美妝保養', '0', '0');





-- ----------------------------
--  Table structure for  member 
-- ----------------------------

CREATE TABLE  member  (
   id  int NOT NULL,
   account_id  varchar(30) NOT NULL,
   pwd  varchar(30) NOT NULL,
   name  varchar(30) DEFAULT NULL,
   email  varchar(30) DEFAULT NULL,
   createdate  date DEFAULT NULL,
   isonline  tinyint DEFAULT NULL,
   isdelete  tinyint DEFAULT NULL,
   salt  varchar(50) DEFAULT NULL,
  PRIMARY KEY ( id )
);

-- ----------------------------
--  Records of  member 
-- ----------------------------

INSERT INTO  member  VALUES ('1', 'aaa', '', 'c1', 'a@b.om', '2012-04-18', '1', '0', null), ('2', 'bbb', '', 'w2', 'r@uci.com', '2012-04-03', '1', '0', null), ('3', 'ccc', '', 'li3', 'm@panasonic.com', '2012-04-05', '0', '0', null), ('4', 'mmmm', '', 'mmmm', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('5', 'gggg', '', 'gggg', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('6', 'hhhh', '', 'hhhh', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('7', 'kkk', '', 'kkk', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('8', 'ooo', '', 'ooo', null, '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e'), ('9', 'ssss', '', 'ssss', '', '2012-04-27', '0', '0', 'd41d8cd98f00b204e9800998ecf8427e');
