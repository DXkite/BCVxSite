-- ----------------------------------------------------------
-- PHP Simple Library XCore 2.0.0 Database Backup File
-- Create On 2016-12-01 13:14:21
-- Host: localhost   Database: 
-- Server version	10.1.10-MariaDB
-- ------------------------------------------------------
/*!40101 SET NAMES utf8 */;

--
-- Create Table article
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `author` bigint(20) NOT NULL COMMENT '作者',
  `categroy` int(11) NOT NULL COMMENT '文章分类',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `abstract` varchar(255) NOT NULL COMMENT '摘要',
  `content` text NOT NULL COMMENT '文章内容',
  `type` tinyint(1) NOT NULL COMMENT '内容类型',
  `view` int(11) NOT NULL COMMENT '阅读',
  `create` int(11) NOT NULL COMMENT '创建时间',
  `update` int(11) NOT NULL COMMENT '最后更新',
  `reply` int(11) NOT NULL COMMENT '回复',
  `allow_reply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可回复',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章状态',
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `categroy` (`categroy`),
  KEY `title` (`title`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `article` (`id`,`author`,`categroy`,`title`,`abstract`,`content`,`type`,`view`,`create`,`update`,`reply`,`allow_reply`,`state`) VALUES ;


--
-- Create Table article_comment
--

DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `article` bigint(20) NOT NULL COMMENT '评论的文章',
  `count` int(11) NOT NULL COMMENT '评论计数',
  `reply` bigint(20) NOT NULL COMMENT '被评论数',
  `author` bigint(20) NOT NULL COMMENT '评论的人',
  `text` varchar(500) NOT NULL COMMENT '评论内容',
  `time` int(11) NOT NULL COMMENT '评论的时间',
  `ip` varchar(20) NOT NULL COMMENT '评论IP',
  `state` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `article` (`article`),
  KEY `count` (`count`),
  KEY `reply` (`reply`),
  KEY `author` (`author`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `article_comment` (`id`,`article`,`count`,`reply`,`author`,`text`,`time`,`ip`,`state`) VALUES ;


--
-- Create Table article_reply
--

DROP TABLE IF EXISTS `article_reply`;
CREATE TABLE `article_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `reply` bigint(20) NOT NULL COMMENT '回复的回复',
  `comment` bigint(20) NOT NULL COMMENT '回复的评论',
  `author` bigint(20) NOT NULL COMMENT '回复的人',
  `text` varchar(500) NOT NULL COMMENT '回复内容',
  `time` int(11) NOT NULL COMMENT '回复的时间',
  `ip` varchar(20) NOT NULL COMMENT '回复IP',
  `state` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `reply` (`reply`),
  KEY `comment` (`comment`),
  KEY `author` (`author`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `article_reply` (`id`,`reply`,`comment`,`author`,`text`,`time`,`ip`,`state`) VALUES ;


--
-- Create Table article_tag
--

DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '索引',
  `article` bigint(20) NOT NULL COMMENT '文章ID',
  `tag` bigint(20) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`),
  KEY `article` (`article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `article_tag` (`id`,`article`,`tag`) VALUES ;


--
-- Create Table categroy
--

DROP TABLE IF EXISTS `categroy`;
CREATE TABLE `categroy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `icon` bigint(20) NOT NULL COMMENT '分类图标资源',
  `name` varchar(20) NOT NULL COMMENT '分类名',
  `slug` varchar(20) NOT NULL COMMENT '英文缩写',
  `discription` varchar(255) NOT NULL COMMENT '分类描述',
  `sort` int(11) NOT NULL COMMENT '排序',
  `count` int(11) NOT NULL COMMENT '分类下的文章',
  `parent` bigint(20) NOT NULL COMMENT '父分类',
  PRIMARY KEY (`id`),
  KEY `icon` (`icon`),
  KEY `name` (`name`),
  KEY `slug` (`slug`),
  KEY `sort` (`sort`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `categroy` (`id`,`icon`,`name`,`slug`,`discription`,`sort`,`count`,`parent`) VALUES ;


--
-- Create Table notification
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `send` bigint(20) NOT NULL COMMENT '发送人',
  `recv` bigint(20) NOT NULL COMMENT '接受人',
  `type` int(11) NOT NULL COMMENT '通知类型',
  `time` int(11) NOT NULL COMMENT '通知时间',
  `state` tinyint(1) NOT NULL COMMENT '状态',
  `data` bigint(20) NOT NULL COMMENT '通知内容',
  PRIMARY KEY (`id`),
  KEY `send` (`send`),
  KEY `recv` (`recv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `notification` (`id`,`send`,`recv`,`type`,`time`,`state`,`data`) VALUES ;


--
-- Create Table notification_data
--

DROP TABLE IF EXISTS `notification_data`;
CREATE TABLE `notification_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `data` text NOT NULL COMMENT '通知数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `notification_data` (`id`,`data`) VALUES ;


--
-- Create Table site_navigation
--

DROP TABLE IF EXISTS `site_navigation`;
CREATE TABLE `site_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `name` varchar(80) NOT NULL COMMENT '导航名',
  `url` varchar(255) NOT NULL COMMENT '导航URL',
  `state` tinyint(1) NOT NULL COMMENT '状态',
  `sort` int(11) NOT NULL COMMENT '排序',
  `parent` bigint(20) NOT NULL COMMENT '父导航',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `state` (`state`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `site_navigation` (`id`,`name`,`url`,`state`,`sort`,`parent`) VALUES ;


--
-- Create Table site_setting
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE `site_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `name` varchar(80) NOT NULL COMMENT '设置KEY',
  `value` varchar(255) NOT NULL COMMENT '设置数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `site_setting` (`id`,`name`,`value`) VALUES ;


--
-- Create Table tag
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类标签',
  `name` varchar(20) NOT NULL COMMENT '标签名',
  `count` int(11) NOT NULL COMMENT '标签下的内容',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `tag` (`id`,`name`,`count`) VALUES ;


--
-- Create Table token
--

DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '令牌ID',
  `user` bigint(20) NOT NULL COMMENT '使用的用户',
  `token` varchar(32) NOT NULL COMMENT '令牌',
  `client` bigint(20) NOT NULL COMMENT '客户端',
  `ip` varchar(32) NOT NULL COMMENT '使用令牌的ID',
  `time` int(11) NOT NULL COMMENT '使用的时间',
  `expire` int(11) NOT NULL COMMENT '过期时间',
  `value` varchar(255) NOT NULL COMMENT '附加值',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `token` (`token`),
  KEY `client` (`client`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;




INSERT INTO `token` (`id`,`user`,`token`,`client`,`ip`,`time`,`expire`,`value`) VALUES ('1','1','353a67e9e501f94d8cc56e4e24d35ede','1','127.0.0.1','1480517970','1480518030','Y2VjNz'),('2','1','40f7bfaa29872c34a3a3bbed1ae0d2a6','1','127.0.0.1','1480517975','1480518035','3532ffc502c1b95f161aba3ea22a8c89'),('3','6','4e84194f39ef6984312ab21dc8666c1a','1','127.0.0.1','1480518696','1480518756','a68d2398db3c2cfa8c73e9b14d0f1fd5'),('4','7','4a91c357ea2155a603a428743c5919b6','1','127.0.0.1','1480518827','1480518887','d60813ff9f598c7f364c03565dd479f1'),('5','1','9089b839ee00726f1f6510cd43712073','1','127.0.0.1','1480520677','1480520737','37da29a3431d25cbfa3e4ea4d23d054d'),('6','8','f5a9ecdd93b8ca9fc714c78f14ec600b','1','127.0.0.1','1480520689','1480520749','d98a4e23a0445c92a3f35e76c4efe2f5'),('7','9','b6117518ac13a285b763fd790e5823dd','2','127.0.0.1','1480563151','1480563211','b392b238652b9a9c92c864b70128b9a5'),('8','1','86cb97627589ba0cef9e779fbadf813c','1','127.0.0.1','1480564711','1480566686','f873745a20c018fbf3d569a165ce2a0a');


--
-- Create Table token_client
--

DROP TABLE IF EXISTS `token_client`;
CREATE TABLE `token_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户端ID',
  `name` varchar(80) NOT NULL COMMENT '客户端名',
  `description` varchar(255) NOT NULL COMMENT '客户端描述',
  `token` varchar(32) NOT NULL COMMENT '客户端识别码',
  `time` int(11) NOT NULL COMMENT '创建时间',
  `beat` int(11) NOT NULL COMMENT '最低心跳',
  `alive` int(11) NOT NULL COMMENT '登陆超时',
  `state` int(1) NOT NULL COMMENT '客户端状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `token` (`token`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;




INSERT INTO `token_client` (`id`,`name`,`description`,`token`,`time`,`beat`,`alive`,`state`) VALUES ('1','WebSite','官方令牌','539055e0d532c34e1a9dc14fe5a3708b','1480511719','60','3600','1'),('2','Test','官方令牌','906c5bf396571717b8bbb1288d0cd535','1480563107','60','3600','1');


--
-- Create Table upload
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `uid` bigint(20) NOT NULL COMMENT '使用用户',
  `name` varchar(80) NOT NULL COMMENT '文件名',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `time` int(11) NOT NULL COMMENT '上传时间',
  `type` varchar(10) NOT NULL COMMENT '扩展名',
  `data` bigint(20) NOT NULL COMMENT '文件数据',
  `use` int(11) NOT NULL COMMENT '是否使用',
  `state` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `data` (`data`),
  KEY `use` (`use`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;




INSERT INTO `upload` (`id`,`uid`,`name`,`size`,`time`,`type`,`data`,`use`,`state`) VALUES ('1','0','dbcreator.sql','9794','1480564414','sql','1','0','1'),('2','1','install.php','26795','1480566627','php','2','0','1');


--
-- Create Table upload_data
--

DROP TABLE IF EXISTS `upload_data`;
CREATE TABLE `upload_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `hash` varchar(32) NOT NULL COMMENT 'MD5哈希',
  `ref` int(11) NOT NULL COMMENT '引用计数',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;




INSERT INTO `upload_data` (`id`,`hash`,`ref`) VALUES ('1','ef9bfb2299c6a55a24c391abbcab446b','2'),('2','ce3bcc28354346aca6d462e343e846cb','1');


--
-- Create Table user
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(13) NOT NULL COMMENT '用户名',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `password` varchar(60) NOT NULL COMMENT '密码HASH',
  `group` bigint(20) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `verify_email` int(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证',
  `avatar` bigint(20) NOT NULL DEFAULT '0' COMMENT '头像ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `group` (`group`),
  KEY `verify_email` (`verify_email`),
  KEY `avatar` (`avatar`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;




INSERT INTO `user` (`id`,`name`,`email`,`password`,`group`,`verify_email`,`avatar`) VALUES ('1','DXkite','DXkite@atd3.com','$2y$10$62nnJZUI3c5jBivF.dHUYuIPeRNYY78TFFpgA8tDCD.HUbe9LPM.6','0','0','0'),('6','DXaaakite','DxKaITE@ATDx3.cn','$2y$10$JY61x8pF6T3jACfnrq3exutFhltwEZZY.kqxZ675sYxueIpTliCJa','0','0','0'),('7','DXaaaaakite','DxKaaaITE@ATDx3.cn','$2y$10$et0wyi6feG0AMO2pd.g56OnC1ovDwP11oCOCB63NksHEdYAZY0oPS','0','0','0'),('8','DXaxaaaaakite','DxKaaxxaITE@ATDx3.cn','$2y$10$NKwZ3LrevblxXdgzmf3nS.mpboQQ3X6JbctC52T4fA4dVbhMz4sF.','0','0','0'),('9','TTHHR','TTHHR','$2y$10$TZlYXwwyIOOSCkN2NhPQ9uKsT31rQHHsRzTGLeGTdHd4a9LB1Wczi','0','0','0');


--
-- Create Table user_group
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `user` bigint(20) NOT NULL COMMENT '用户ID',
  `name` varchar(80) NOT NULL COMMENT '分组名',
  `sort` int(11) NOT NULL COMMENT '排序索引',
  `admin` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '管理网站',
  `upload` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '上传文件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  KEY `name` (`name`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `user_group` (`id`,`user`,`name`,`sort`,`admin`,`upload`) VALUES ;


--
-- Create Table user_option_log
--

DROP TABLE IF EXISTS `user_option_log`;
CREATE TABLE `user_option_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` bigint(20) NOT NULL COMMENT '使用的用户',
  `name` varchar(80) NOT NULL COMMENT '操作名',
  `sketch` varchar(255) NOT NULL COMMENT '操作附加描述',
  `ip` varchar(32) NOT NULL COMMENT '使用令牌的ID',
  `time` int(11) NOT NULL COMMENT '使用的时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `user_option_log` (`id`,`user_id`,`name`,`sketch`,`ip`,`time`) VALUES ;


--
-- Create Table vote_reply
--

DROP TABLE IF EXISTS `vote_reply`;
CREATE TABLE `vote_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `root` bigint(20) NOT NULL COMMENT '文章ID',
  `item` bigint(20) NOT NULL COMMENT '回复ID',
  `user` bigint(20) NOT NULL COMMENT '用户ID',
  `score` int(1) NOT NULL COMMENT '正赞负踩',
  `time` int(11) NOT NULL COMMENT '操作时间',
  `ip` varchar(32) NOT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `item` (`item`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `vote_reply` (`id`,`root`,`item`,`user`,`score`,`time`,`ip`) VALUES ;


