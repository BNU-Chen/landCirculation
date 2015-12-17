/*
SQLyog Ultimate v8.32 
MySQL - 5.6.21-log : Database - mysql_land_circulation
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysql_land_circulation` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mysql_land_circulation`;

/*Table structure for table `action_group_code` */

DROP TABLE IF EXISTS `action_group_code`;

CREATE TABLE `action_group_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `actionGroupCode` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actionGroupCaption` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `action_group_code` */

insert  into `action_group_code`(`id`,`pid`,`actionGroupCode`,`actionGroupCaption`) values (1,NULL,'010000','转出方'),(2,1,'010100','流转申请'),(3,1,'010200','电子交易'),(4,1,'010300','网签合同'),(5,1,'010400','合同备案'),(6,NULL,'020000','转入方'),(7,6,'020100','需求登记'),(8,6,'020200','电子交易'),(9,NULL,'030000','代理机构'),(10,NULL,'040000','监管机构'),(11,10,'040100','申请审核'),(12,10,'040200','申请公示'),(13,10,'040300','电子交易'),(14,10,'040400','网签合同'),(15,10,'040500','合同备案'),(16,10,'040600','流转监管'),(17,NULL,'050000','用户管理'),(18,17,'050100','用户审核'),(19,17,'050200','权限管理'),(20,NULL,'060000','系统管理'),(21,20,'060100','功能管理'),(22,20,'060200','角色管理'),(23,20,'060300','参数设置');

/*Table structure for table `action_list` */

DROP TABLE IF EXISTS `action_list`;

CREATE TABLE `action_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionCode` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actionCaption` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actionUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actionGroupId` int(11) DEFAULT NULL,
  `actionGroupCode` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `action_list` */

/*Table structure for table `apply` */

DROP TABLE IF EXISTS `apply`;

CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transferType` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferTypeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flowDefId` int(11) DEFAULT NULL,
  `currentStepId` int(11) DEFAULT NULL,
  `currentStatusId` int(11) DEFAULT NULL,
  `currentMsgId` int(11) DEFAULT NULL,
  `applyCode` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applyDate` date DEFAULT NULL,
  `applierId` int(11) DEFAULT NULL,
  `applierUserName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applierIDCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picIDCode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tranferReason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tranferEconomicbkground` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landProvince` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `landProvinceName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCity` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `landCityName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCounty` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `landCountyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTown` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `landTownName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landVillage` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `landVillageName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landGroup` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `landAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landRegionCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landRgArea` double DEFAULT '0',
  `paddyfieldRgArea` double DEFAULT '0',
  `drylandRgArea` double DEFAULT '0',
  `landRealArea` double DEFAULT NULL,
  `paddyfieldRealArea` double DEFAULT NULL,
  `drylandRealArea` double DEFAULT NULL,
  `landNumber` int(11) DEFAULT NULL,
  `rightAuthType` int(11) DEFAULT '1',
  `landWarrantId` int(11) DEFAULT NULL,
  `landWarrantCode` varchar(23) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landContractCode` varchar(23) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulationType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulationTypeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userType` varchar(2) COLLATE utf8_unicode_ci DEFAULT '01',
  PRIMARY KEY (`id`),
  KEY `applierId` (`applierId`) USING BTREE,
  KEY `originalContractWarrantId` (`landWarrantId`) USING BTREE,
  KEY `flowDefId` (`flowDefId`) USING BTREE,
  KEY `currentStepId` (`currentStepId`) USING BTREE,
  KEY `currentStatusId` (`currentStatusId`) USING BTREE,
  KEY `currentMsgId` (`currentMsgId`) USING BTREE,
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`applierId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_4` FOREIGN KEY (`flowDefId`) REFERENCES `flowdef` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_5` FOREIGN KEY (`currentStepId`) REFERENCES `stepdef` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_6` FOREIGN KEY (`currentStatusId`) REFERENCES `statusdef` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_8` FOREIGN KEY (`landWarrantId`) REFERENCES `landwarrant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_9` FOREIGN KEY (`currentMsgId`) REFERENCES `rtnmsgdef` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `apply` */

insert  into `apply`(`id`,`transferType`,`transferTypeName`,`flowDefId`,`currentStepId`,`currentStatusId`,`currentMsgId`,`applyCode`,`applyDate`,`applierId`,`applierUserName`,`applierIDCode`,`picIDCode`,`picName`,`picTel`,`picEmail`,`picAddress`,`tranferReason`,`tranferEconomicbkground`,`landProvince`,`landProvinceName`,`landCity`,`landCityName`,`landCounty`,`landCountyName`,`landTown`,`landTownName`,`landVillage`,`landVillageName`,`landGroup`,`landAddress`,`landRegionCode`,`landRgArea`,`paddyfieldRgArea`,`drylandRgArea`,`landRealArea`,`paddyfieldRealArea`,`drylandRealArea`,`landNumber`,`rightAuthType`,`landWarrantId`,`landWarrantCode`,`landContractCode`,`circulationType`,`circulationTypeName`,`userType`) values (85,'1','委托交易',1,3,9,9,NULL,'2014-04-17',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会','2','重庆市长寿区双龙镇双龙社区居委会','500115127201',149.289,91,58.289,188,124,64,5,1,5,'12345678901234567890','12345612345612345616','01','出租',NULL),(86,'1','委托交易',1,3,8,8,NULL,'2014-04-19',9,'洪秋雨','512223197311146672','512223197311146672','洪秋雨','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会','12',NULL,NULL,280,150,130,300,160,140,NULL,2,6,'12345678901234567890','12345678901234567890','01','出租',NULL),(87,'1','委托交易',1,3,8,8,NULL,'2014-04-19',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会','15',NULL,NULL,250,50,200,250,50,200,1,1,NULL,'123456789012345556',NULL,'01','出租',NULL),(103,'1','委托交易',1,3,9,9,NULL,'2014-07-04',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127001','双龙社区居委会','8','重庆市长寿区双龙镇双龙社区居委会',NULL,50,50,NULL,50,50,NULL,1,1,9,'12345678901234567890',NULL,'01','出租',NULL),(104,'1','委托交易',1,4,11,11,NULL,'2014-07-07',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127200','龙滩村委会',NULL,'重庆市长寿区双龙镇龙滩村委会',NULL,220,100,120,250,100,150,2,1,10,'12123456789067889000',NULL,'01','出租',NULL),(109,'1','委托交易',1,2,4,4,NULL,'2014-07-07',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127203','长寿寨村委会',NULL,'重庆市长寿区双龙镇长寿寨村委会',NULL,50,50,NULL,54,54,NULL,1,NULL,NULL,NULL,NULL,'01','出租',NULL),(110,'0','协议流转',1,3,9,9,NULL,'2014-07-07',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会',NULL,'重庆市长寿区双龙镇谷黄村委会',NULL,51,51,NULL,56,56,NULL,1,1,11,'12345678901234567898',NULL,'01','出租',NULL),(113,'0','协议流转',1,3,8,8,NULL,'2014-07-08',9,'丁广勇','512223197311146672','512223197311146672','丁广勇','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(114,'0','协议流转',1,3,8,8,NULL,'2014-07-08',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115128','龙河镇','500115128242','四坪村委会',NULL,'重庆市长寿区龙河镇四坪村委会',NULL,162.987,162.987,0,166.31,166.31,NULL,3,1,15,'12345678900998887779',NULL,'01','出租',NULL),(115,'1','委托交易',1,3,7,7,NULL,'2014-07-08',9,'王文东','512223197311146672','512223197311146672','王文东','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115128','龙河镇','500115128242','四坪村委会',NULL,'重庆市长寿区龙河镇四坪村委会',NULL,64,30,34,75.56,35,40.56,2,1,12,'12345678903456789045',NULL,'01','出租',NULL),(116,'1','委托交易',1,2,4,4,NULL,'2014-07-08',9,'洪秋雨','512223197311146672','512223197311146672','洪秋雨','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115128','龙河镇','500115128240','永兴村委会',NULL,'重庆市长寿区龙河镇永兴村委会',NULL,139,50,89,139,50,89,2,1,13,'12345678902345678907',NULL,'01','出租',NULL),(142,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,'12341324123432413241','02','入股',NULL),(143,'1','委托交易',1,1,1,1,NULL,'2014-09-19',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(144,'1','委托交易',1,1,1,1,NULL,'2014-09-19',9,'蒋丽君','512223197311146672','512223197311146672','蒋丽君','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(145,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'丁广勇','512223197311146672','512223197311146672','丁广勇','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(146,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'洪秋雨','512223197311146672','512223197311146672','洪秋雨','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(147,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'丁广勇','512223197311146672','512223197311146672','丁广勇','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(148,'1','委托交易',1,1,1,1,NULL,'2014-09-19',9,'蒋丽君','512223197311146672','512223197311146672','蒋丽君','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(149,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(150,'1','委托交易',1,1,1,1,NULL,'2014-09-19',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04','转包',NULL),(151,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04','转包',NULL),(152,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'丁广勇','512223197311146672','512223197311146672','丁广勇','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04','转包',NULL),(153,'1','委托交易',1,1,1,1,NULL,'2014-09-19',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(154,'1','委托交易',1,1,1,1,NULL,'2014-09-19',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05','互换',NULL),(155,'1','委托交易',1,1,1,1,NULL,'2014-09-19',9,'蒋丽君','512223197311146672','512223197311146672','蒋丽君','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05','互换',NULL),(156,'0','协议流转',1,1,1,1,NULL,'2014-09-19',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05','互换',NULL),(158,'0','协议流转',1,1,1,1,NULL,'2014-09-23',15,'洪秋雨','12345672','12345672','洪秋雨',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(159,'1','委托交易',1,1,1,1,NULL,'2014-09-23',15,'蒋丽君','12345672','12345672','蒋丽君',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(160,'0','协议流转',1,1,1,1,NULL,'2014-09-23',15,'廖明义','12345672','12345672','廖明义',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(161,'1','委托交易',1,1,1,1,NULL,'2014-09-23',15,'牛宏志','12345672','12345672','牛宏志',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(162,'0','协议流转',1,1,1,1,NULL,'2014-09-23',15,'崔礼宾','12345672','12345672','崔礼宾',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(163,'1','委托交易',1,1,1,1,NULL,'2014-09-23',15,'王文东','12345672','12345672','王文东',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(164,'0','协议流转',1,1,1,1,NULL,'2014-09-23',15,'王文东','12345672','12345672','王文东',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04','转包',NULL),(165,'1','委托交易',1,1,1,1,NULL,'2014-09-23',15,'牛宏志','12345672','12345672','牛宏志',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04','转包',NULL),(166,'0','协议流转',1,1,1,1,NULL,'2014-09-23',15,'廖明义','12345672','12345672','廖明义',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05','互换',NULL),(167,'1','委托交易',1,1,1,1,NULL,'2014-09-23',15,'蒋丽君','12345672','12345672','蒋丽君',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05','互换',NULL),(173,'1','委托交易',1,1,1,1,NULL,'2014-10-10',9,'王文东','512223197311146672','512223197311146672','王文东','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(174,'0','协议流转',1,1,1,1,NULL,'2014-10-27',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05','互换',NULL),(188,'0','协议流转',1,1,1,1,NULL,'2014-10-30',18,'洪秋雨','512223197311146678','512223197311146678','洪秋雨',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,'12345678900987654321','01','出租',NULL),(191,'0','协议流转',1,3,9,9,NULL,'2015-09-10',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,32,NULL,35,35,NULL,1,1,16,'22312312312312312442',NULL,'01','出租',NULL),(193,'0','协议流转',1,3,8,8,NULL,'2015-09-10',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,23,NULL,25,25,NULL,1,1,17,'20152342342353453453',NULL,'01','出租',NULL),(194,'0','协议流转',1,4,10,10,NULL,'2015-09-10',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,30,NULL,29,29,NULL,1,1,18,'23423423432432342343',NULL,'01','出租',NULL),(195,'0','协议流转',1,3,7,7,NULL,'2015-09-10',9,'丁广勇','512223197311146672','512223197311146672','丁广勇','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,333,333,NULL,333,333,NULL,1,1,19,'23423423434342423443',NULL,'01','出租',NULL),(196,'0','协议流转',1,3,7,7,NULL,'2015-09-10',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50000,50000,NULL,50000,50000,NULL,1,1,20,'22222222222222222222',NULL,'01','出租',NULL),(197,'0','协议流转',1,3,7,7,NULL,'2015-09-10',9,'王文东','512223197311146672','512223197311146672','王文东','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60000,60000,NULL,60000,60000,NULL,1,2,21,'22222222222222222222','22222222222222222222','01','出租',NULL),(198,'0','协议流转',1,2,4,4,NULL,'2015-11-01',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90000,90000,NULL,90000,90000,NULL,1,1,22,'22222222222222222222',NULL,'01','出租',NULL),(199,'0','协议流转',1,2,4,4,NULL,'2015-09-11',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22222,22222,NULL,2222,2222,NULL,2,1,23,'22222222222222222222',NULL,'01','出租',NULL),(200,'0','协议流转',1,2,4,4,NULL,'2015-09-11',9,'洪秋雨','512223197311146672','512223197311146672','洪秋雨','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11111111,11111111,NULL,1111111,1111111,NULL,1,2,NULL,NULL,'11111111111111111111','01','出租',NULL),(201,'0','协议流转',1,3,6,6,NULL,'2015-09-11',9,'洪秋雨','512223197311146672','512223197311146672','洪秋雨','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会',NULL,'重庆市长寿区双龙镇谷黄村委会',NULL,333333,333333,NULL,333333,333333,NULL,1,2,NULL,NULL,'22222222222222222222','01','出租',NULL),(202,'0','协议流转',1,1,1,1,NULL,'2015-09-11',9,'洪秋雨','512223197311146672','512223197311146672','洪秋雨','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(203,'0','协议流转',1,1,1,1,NULL,'2015-12-08',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(204,'1','委托交易',1,1,1,1,NULL,'2015-12-08',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(205,'0','协议流转',1,1,1,1,NULL,'2015-12-08',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(206,'1','委托交易',1,1,1,1,NULL,'2015-12-08',9,'蒋丽君','512223197311146672','512223197311146672','蒋丽君','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(207,'0','协议流转',1,1,1,1,NULL,'2015-12-08',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02','入股',NULL),(208,'0','协议流转',1,1,1,1,NULL,'2015-12-08',9,'王文东','512223197311146672','512223197311146672','王文东','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(209,'1','委托交易',1,1,1,1,NULL,'2015-12-08',9,'廖明义','512223197311146672','512223197311146672','廖明义','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'03','转让',NULL),(210,'0','协议流转',1,1,1,1,NULL,'2015-12-08',9,'姜超','512223197311146672','512223197311146672','姜超','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(211,'1','委托交易',1,1,1,1,NULL,'2015-12-08',9,'崔礼宾','512223197311146672','512223197311146672','崔礼宾','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(212,'0','协议流转',1,1,1,1,NULL,'2015-12-08',9,'刘纯波','512223197311146672','512223197311146672','刘纯波','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL),(213,'1','委托交易',1,1,1,1,NULL,'2015-12-08',9,'刘纯波','512223197311146672','512223197311146672','刘纯波','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01','出租',NULL);

/*Table structure for table `applypost_response` */

DROP TABLE IF EXISTS `applypost_response`;

CREATE TABLE `applypost_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postApplyId` int(11) DEFAULT NULL,
  `applyId` int(11) DEFAULT NULL,
  `question` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responserName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responserIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responserTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responserEmail` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responserAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recorderId` int(11) DEFAULT NULL,
  `dealType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dealComment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dealerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postApplyId` (`postApplyId`),
  KEY `applyId` (`applyId`),
  KEY `recorderId` (`recorderId`),
  KEY `dealerId` (`dealerId`),
  CONSTRAINT `applypost_response_ibfk_1` FOREIGN KEY (`postApplyId`) REFERENCES `post_apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `applypost_response_ibfk_2` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `applypost_response_ibfk_3` FOREIGN KEY (`recorderId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `applypost_response_ibfk_4` FOREIGN KEY (`dealerId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `applypost_response` */

insert  into `applypost_response`(`id`,`postApplyId`,`applyId`,`question`,`responserName`,`responserIdcode`,`responserTel`,`responserEmail`,`responserAddress`,`recorderId`,`dealType`,`dealComment`,`dealerId`) values (7,25,85,'测试，假设有问题。','张三','123456789012345678','12345678901','1234@qq.com','测试地址啊',9,'1','基测试 苦',9),(8,27,103,'若需地苦魂牵梦萦 革','刘劳而无功 ','512223197311146673','18602314132','12@qq.com','重庆设若劳而无功奇才地',9,'1','问题不存在。',9),(9,30,110,'sdfsdf','wang','410182198609389847','18910505453','','sfsdf',9,NULL,NULL,NULL),(10,30,110,'sdfsdf','wang','410182198609389847','18910505453','','sfsdf',9,NULL,NULL,NULL),(11,31,191,'3434 夺天地夺夺在城在','顶替','353453453454564564','43434343434','','34343434',9,NULL,NULL,NULL),(12,31,191,'3434 夺天地夺夺在城在','顶替','353453453454564564','43434343434','','34343434',9,NULL,NULL,NULL),(13,32,195,'234234234','2432424','234234234234234234','23234234234','234234@163.com','234234324234234',9,'1','asdasd',9),(14,32,195,'234234234','2432424','234234234234234234','23234234234','234234@163.com','234234324234234',9,'1','asdasdasdasdasdasdasdasdasd',9),(15,34,197,'333333333333333333333','werwer','333333333333333333','32432323233','33333333@163.com','333333333333333333333333333',9,'1','5ty5y',9),(16,34,197,'333333333333333333333','werwer','333333333333333333','32432323233','33333333@163.com','333333333333333333333333333',9,'1','rtyvrytyy6y',9),(17,35,198,'asdasdad','3434','111111111111111111','34344344334','11111@163.com','asdasdasd',9,'1','sdasd',9);

/*Table structure for table `bidenroll` */

DROP TABLE IF EXISTS `bidenroll`;

CREATE TABLE `bidenroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollNo` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidpostId` int(11) DEFAULT NULL,
  `bidType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applyEndDate` date DEFAULT NULL,
  `bidDate` datetime DEFAULT NULL,
  `bidderId` int(11) DEFAULT NULL,
  `bidderIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidderName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picIdcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depositeReceiptPathname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusMsg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewResult` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewComment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bidpostId` (`bidpostId`),
  KEY `bidderId` (`bidderId`),
  KEY `reviewerId` (`reviewerId`),
  CONSTRAINT `bidenroll_ibfk_1` FOREIGN KEY (`bidpostId`) REFERENCES `bidpost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bidenroll_ibfk_2` FOREIGN KEY (`bidderId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bidenroll_ibfk_3` FOREIGN KEY (`reviewerId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bidenroll` */

insert  into `bidenroll`(`id`,`enrollNo`,`bidpostId`,`bidType`,`applyEndDate`,`bidDate`,`bidderId`,`bidderIdcode`,`bidderName`,`picIdcode`,`picName`,`picTel`,`picEmail`,`picAddress`,`depositeReceiptPathname`,`status`,`statusMsg`,`reviewResult`,`reviewComment`,`reviewerId`) values (1,'2014500115127000060001',7,'01','2014-09-18','2014-09-18 07:30:00',9,NULL,NULL,'512223197311146672','李文涛','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0501','竞标结果已发布，中标','0',NULL,9),(2,'2014500115127000060002',7,'01','2014-09-18','2014-09-18 07:30:00',9,NULL,NULL,'512223197311146672','牛宏志','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0502','竞标结果已发布，未中标','0',NULL,9),(3,'2014500115127000070001',4,'01','2014-09-18','2014-09-19 08:00:00',9,NULL,NULL,'512223197311146672','牛宏志','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0501','竞标结果已发布，中标','0',NULL,9),(4,'2014500115127000070002',4,'01','2014-09-18','2014-09-19 08:00:00',9,NULL,NULL,'512223197311146672','李文涛','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0502','竞标结果已发布，未中标','0',NULL,9),(5,'2014500115127000070003',4,'01','2014-09-18','2014-09-19 08:00:00',9,NULL,NULL,'512223197311146672','李文涛','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0502','竞标结果已发布，未中标','0',NULL,9),(6,'2014500115127000070004',4,'01','2014-09-18','2014-09-19 08:00:00',9,NULL,NULL,'512223197311146672','王晓楠','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0301','电子招标标书已提交，等待开标。','0',NULL,9),(7,'2014500115127000070005',4,'01','2014-09-18','2014-09-19 08:00:00',9,NULL,NULL,'512223197311146672','牛宏志','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0301','电子招标标书已提交，等待开标。','0',NULL,9),(8,'2014500115127000070001',5,'01','2014-09-18','2014-09-19 00:00:00',9,NULL,NULL,'512223197311146672','王晓楠','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0201','竞标报名审核通过！','0',NULL,9),(9,'2014500115127000070002',5,'01','2014-09-18','2014-09-19 00:00:00',9,NULL,NULL,'512223197311146672','王晓楠','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0501','竞标结果已发布，中标','0',NULL,9),(10,'2014500115127000070003',5,'01','2014-09-18','2014-09-19 00:00:00',9,NULL,NULL,'512223197311146672','蒋丽君','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0201','竞标报名审核通过！','0',NULL,9),(11,'2015500115127000010001',9,'01','2015-09-30','2015-09-22 08:00:00',9,'512223197311146672','刘纯波','512223197311146672','蒋丽君','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0301','电子招标标书已提交，等待开标。','0',NULL,9),(12,NULL,9,'01','2015-09-30','2015-09-22 08:00:00',9,'512223197311146672','刘纯波','512223197311146672','牛宏志','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0100','投标报名尚未提交，请于报名截止日前提交！',NULL,NULL,9),(13,'2015500115127000010002',9,'01','2015-09-30','2015-09-22 08:00:00',9,'512223197311146672','刘纯波','512223197311146672','蒋丽君','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0301','电子招标标书已提交，等待开标。','0',NULL,9),(14,'2015500115127000010003',9,'01','2015-09-30','2015-09-22 08:00:00',9,'512223197311146672','刘纯波','512223197311146672','牛宏志','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,'0301','电子招标标书已提交，等待开标。','0',NULL,9);

/*Table structure for table `bidpost` */

DROP TABLE IF EXISTS `bidpost`;

CREATE TABLE `bidpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posterId` int(11) DEFAULT NULL,
  `posterName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  `bidType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidTypename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landRgArea` double(10,3) DEFAULT NULL,
  `drylandRgArea` double(10,3) DEFAULT NULL,
  `paddyfieldRgArea` double(10,3) DEFAULT NULL,
  `drylandBaseprice` decimal(10,0) DEFAULT NULL,
  `paddyfieldBaseprice` decimal(10,0) DEFAULT NULL,
  `deposit` decimal(10,0) DEFAULT NULL,
  `applyStartDate` date DEFAULT NULL,
  `applyEndDate` date DEFAULT NULL,
  `bidDate` datetime DEFAULT NULL,
  `picName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picTel` decimal(11,0) DEFAULT NULL,
  `picEmail` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posterId` (`posterId`),
  CONSTRAINT `bidpost_ibfk_1` FOREIGN KEY (`posterId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bidpost` */

insert  into `bidpost`(`id`,`posterId`,`posterName`,`postNo`,`publishDate`,`bidType`,`bidTypename`,`landRgArea`,`drylandRgArea`,`paddyfieldRgArea`,`drylandBaseprice`,`paddyfieldBaseprice`,`deposit`,`applyStartDate`,`applyEndDate`,`bidDate`,`picName`,`picTel`,`picEmail`,`picAddress`,`status`) values (2,9,'李俊山','201450011512700007','2014-09-16','01',NULL,NULL,NULL,NULL,'800','1001','80000','2014-06-01','2014-09-18','2014-09-19 00:00:00','张三','12345678901','12345@qq.com','重庆市长寿县双龙镇红旗村1组','02'),(3,9,'王东','201450011512700007','2014-09-17','01',NULL,250.000,200.000,50.000,'700','800','169200','2014-09-16','2014-09-18','2014-09-19 17:40:00','王五','13912345678','21345@qq.com','重庆市长寿县双龙镇','02'),(4,9,'王东','201450011512700007','2014-09-17','01','公开招标',126.000,26.000,100.000,'800','950','108700','2014-07-01','2014-09-18','2014-09-19 08:00:00','张三','13910231234','1234@qq.com','双龙镇镇政府','04'),(5,9,'洪秋雨','201450011512700007','2014-09-18','01','公开招标',NULL,NULL,NULL,'900','1000','40000','2014-07-01','2014-09-18','2014-09-19 00:00:00','李四','12345678901','12@qq.com','双龙镇政府一楼101','04'),(6,9,'洪秋雨','201450011512700007','2014-09-16','01',NULL,NULL,NULL,NULL,'800',NULL,'10000','2014-07-07','2014-07-18','2014-09-19 00:00:00','刘五','13913214112','1341@qq.com','13413','02'),(7,9,'李俊山','201450011512700006','2014-08-25','01','公开招标',280.000,130.000,150.000,'800',NULL,'40000','2014-08-20','2014-09-18','2014-09-18 07:30:00','刘二','2312345677','123@qq.com','重庆市长寿区双龙镇政府农村土地流转服务中心','04'),(8,9,'李俊山','201550011512700000','2015-09-10','01','公开招标',280.000,130.000,150.000,'900','56','37600','2014-09-01','2014-09-18','2014-09-19 09:40:00','刘二','13919899797','123@qq.com','测试地址不得事','02'),(9,9,'王东','201550011512700001','2015-09-10','01','公开招标',540.000,240.000,300.000,'4','4','600','2015-09-09','2015-09-30','2015-09-22 08:00:00','测试','18910505453','123@163.com','asdfsdfsaf','02'),(10,9,'李俊山',NULL,NULL,NULL,NULL,30.000,NULL,30.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01'),(11,9,'王东',NULL,NULL,NULL,NULL,185.987,0.000,185.990,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'01');

/*Table structure for table `bidpost_detail` */

DROP TABLE IF EXISTS `bidpost_detail`;

CREATE TABLE `bidpost_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidpostId` int(11) DEFAULT NULL,
  `applyId` int(11) DEFAULT NULL,
  `applierName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applierIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landRgArea` double DEFAULT NULL,
  `drylandRgArea` double(255,2) DEFAULT NULL,
  `paddyfieldRgArea` double(255,2) DEFAULT NULL,
  `rightAuthType` int(11) DEFAULT NULL,
  `landwarrantCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landcontractCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applyId` (`applyId`),
  KEY `bidpostId` (`bidpostId`),
  CONSTRAINT `bidpost_detail_ibfk_2` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bidpost_detail_ibfk_3` FOREIGN KEY (`bidpostId`) REFERENCES `bidpost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bidpost_detail` */

insert  into `bidpost_detail`(`id`,`bidpostId`,`applyId`,`applierName`,`applierIdcode`,`landRgArea`,`drylandRgArea`,`paddyfieldRgArea`,`rightAuthType`,`landwarrantCode`,`landcontractCode`,`landAddress`) values (38,4,85,'张冲','512223197311146672',126,26.00,100.00,1,'12345678901234567890','12345612345612345616','前进红旗2'),(43,7,86,'张冲','512223197311146672',280,130.00,150.00,2,'12345678901234567890','12345678901234567890','50011512750011512720112'),(47,3,87,'张冲','512223197311146672',250,200.00,50.00,1,'123456789012345556',NULL,'50011512750011512720115'),(50,9,104,'田立新','512223197311146672',220,120.00,100.00,1,'12123456789067889000',NULL,'500115127500115127200null'),(51,9,109,'马亦奇','512223197311146672',50,NULL,50.00,NULL,NULL,NULL,'500115127500115127203null'),(53,9,104,'马亦奇','512223197311146672',220,120.00,100.00,1,'12123456789067889000',NULL,'500115127500115127200null'),(54,9,109,'田立新','512223197311146672',50,NULL,50.00,NULL,NULL,NULL,'500115127500115127203null'),(55,9,113,'田立新','512223197311146672',NULL,NULL,NULL,NULL,NULL,NULL,'nullnullnull'),(56,8,86,'张冲','512223197311146672',280,130.00,150.00,2,'12345678901234567890','12345678901234567890','50011512750011512720112'),(57,11,193,'田立新','512223197311146672',23,NULL,23.00,1,'20152342342353453453',NULL,'nullnullnull'),(58,11,114,'马亦奇','512223197311146672',162.987,0.00,162.99,1,'12345678900998887779',NULL,'500115128500115128242null'),(59,10,194,'张冲','512223197311146672',30,NULL,30.00,1,'23423423432432342343',NULL,'nullnullnull');

/*Table structure for table `bidtender` */

DROP TABLE IF EXISTS `bidtender`;

CREATE TABLE `bidtender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidpostId` int(11) DEFAULT NULL,
  `bidenrollId` int(11) DEFAULT NULL,
  `enrollNo` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidderId` int(11) DEFAULT NULL,
  `bidderIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidderName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddyfieldprice` int(11) DEFAULT NULL,
  `drylandprice` int(11) DEFAULT NULL,
  `totalprice` int(11) DEFAULT NULL,
  `increaserate` int(11) DEFAULT NULL,
  `tenderFilePathname` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewResult` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewComment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bidderId` (`bidderId`),
  KEY `bidtender_ibfk_1` (`bidpostId`),
  KEY `bidtender_ibfk_2` (`bidenrollId`),
  CONSTRAINT `bidtender_ibfk_1` FOREIGN KEY (`bidenrollId`) REFERENCES `bidenroll` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bidtender_ibfk_2` FOREIGN KEY (`bidpostId`) REFERENCES `bidpost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bidtender_ibfk_3` FOREIGN KEY (`bidderId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bidtender` */

insert  into `bidtender`(`id`,`bidpostId`,`bidenrollId`,`enrollNo`,`bidderId`,`bidderIdcode`,`bidderName`,`paddyfieldprice`,`drylandprice`,`totalprice`,`increaserate`,`tenderFilePathname`,`status`,`reviewResult`,`reviewComment`) values (6,7,1,'2014500115127000060001',9,NULL,'田立新',900,800,425000,5,'upload/bid/20140912092704828.docx','0301','0',NULL),(7,7,2,'2014500115127000060002',9,NULL,'崔礼宾',900,800,425000,5,'upload/bid/20140916102608146.docx','0302','0',NULL),(8,4,3,'2014500115127000070001',9,NULL,'田立新',900,800,349800,5,'upload/bid/20140917131720875.docx','0301','0',NULL),(9,4,4,'2014500115127000070002',9,NULL,'崔礼宾',950,800,362300,5,'upload/bid/20140917131738015.docx','0302','0',NULL),(10,4,5,'2014500115127000070003',9,NULL,'李菊',960,900,380400,5,'upload/bid/20140917131807359.docx','0302','0',NULL),(11,4,7,'2014500115127000070005',9,NULL,'田立新',950,800,362300,5,'upload/bid/20140918100047203.docx','0101',NULL,NULL),(12,4,6,'2014500115127000070004',9,NULL,'李菊',950,900,377900,6,'upload/bid/20140918100109812.docx','0101',NULL,NULL),(13,5,9,'2014500115127000070002',9,NULL,'李菊',900,850,357600,7,'upload/bid/20140918100129218.docx','0301','0',NULL),(14,9,11,'2015500115127000010001',9,'512223197311146672','崔礼宾',NULL,NULL,NULL,NULL,NULL,'0101',NULL,NULL),(15,9,13,'2015500115127000010002',9,'512223197311146672','田立新',NULL,NULL,NULL,NULL,NULL,'0101',NULL,NULL),(16,9,14,'2015500115127000010003',9,'512223197311146672','田立新',NULL,NULL,NULL,NULL,NULL,'0101',NULL,NULL);

/*Table structure for table `bidwinnerpost` */

DROP TABLE IF EXISTS `bidwinnerpost`;

CREATE TABLE `bidwinnerpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postId` int(11) DEFAULT NULL,
  `postNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posterId` int(11) DEFAULT NULL,
  `posterName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  `applyEndDate` date DEFAULT NULL,
  `bidDate` datetime DEFAULT NULL,
  `landRgArea` double(255,2) DEFAULT NULL,
  `drylandRgArea` double DEFAULT NULL,
  `paddyfieldRgArea` double DEFAULT NULL,
  `bidType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidTypename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drylandBaseprice` decimal(10,0) DEFAULT NULL,
  `paddyfieldBaseprice` decimal(10,0) DEFAULT NULL,
  `deposit` decimal(10,0) DEFAULT NULL,
  `bidenrollId` int(11) DEFAULT NULL,
  `enrollNo` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidtenderId` int(11) DEFAULT NULL,
  `bidderId` int(11) DEFAULT NULL,
  `bidderIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bidderName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddyfieldprice` int(11) DEFAULT NULL,
  `drylandprice` int(11) DEFAULT NULL,
  `totalprice` int(11) DEFAULT NULL,
  `increaserate` int(11) DEFAULT NULL,
  `tenderFilePathname` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picIdcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `winnerpostNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `winnerpostPublishdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bidwinnerpost` */

insert  into `bidwinnerpost`(`id`,`postId`,`postNo`,`posterId`,`posterName`,`publishDate`,`applyEndDate`,`bidDate`,`landRgArea`,`drylandRgArea`,`paddyfieldRgArea`,`bidType`,`bidTypename`,`drylandBaseprice`,`paddyfieldBaseprice`,`deposit`,`bidenrollId`,`enrollNo`,`bidtenderId`,`bidderId`,`bidderIdcode`,`bidderName`,`paddyfieldprice`,`drylandprice`,`totalprice`,`increaserate`,`tenderFilePathname`,`picIdcode`,`picName`,`picTel`,`picEmail`,`picAddress`,`winnerpostNo`,`winnerpostPublishdate`) values (1,4,'201450011512700007',9,'王晓楠','2014-09-17','2014-09-17','2014-09-17 08:00:00',406.00,156,250,'01','公开招标','800','950','108700',5,'2014500115127000070003',10,9,NULL,'刘纯波',960,900,380400,5,'upload/bid/20140917131807359.docx','512223197311146672','刘纯波','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL),(2,7,'201450011512700006',9,'王文东','2014-08-25','2014-09-16','2014-09-16 07:30:00',500.00,250,250,'01','公开招标','800',NULL,'40000',2,'2014500115127000060002',7,9,NULL,'刘纯波',900,800,425000,5,'upload/bid/20140916102608146.docx','512223197311146672','刘纯波','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村',NULL,NULL),(3,4,'201450011512700007',9,'王晓楠','2014-09-17','2014-09-17','2014-09-17 08:00:00',406.00,156,250,'01','公开招标','800','950','108700',3,'2014500115127000070001',8,9,NULL,'刘纯波',900,800,349800,5,'upload/bid/20140917131720875.docx','512223197311146672','刘纯波','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村','201450011512700007',NULL),(4,7,'201450011512700006',9,'王文东','2014-08-25','2014-09-18','2014-09-18 07:30:00',500.00,250,250,'01','公开招标','800',NULL,'40000',1,'2014500115127000060001',6,9,NULL,'刘纯波',900,800,425000,5,'upload/bid/20140912092704828.docx','512223197311146672','刘纯波','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村','201450011512700007','2014-09-18'),(5,4,'201450011512700007',9,'廖明义','2014-09-17','2014-09-18','2014-09-19 08:00:00',406.00,156,250,'01','公开招标','800','950','108700',3,'2014500115127000070001',8,9,NULL,'刘纯波',900,800,349800,5,'upload/bid/20140917131720875.docx','512223197311146672','刘纯波','13910656911','liucb@irsa.ac.cn','双龙镇红旗村1组双龙镇红旗村','201450011512700007','2014-09-19');

/*Table structure for table `circulation_demand` */

DROP TABLE IF EXISTS `circulation_demand`;

CREATE TABLE `circulation_demand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setupDate` datetime DEFAULT NULL,
  `demanderId` int(11) DEFAULT NULL,
  `demanderType` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `demanderTypeName` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `demanderIdcode` varchar(18) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `demanderName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `demanderAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `demanderTel` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `demanderEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddress` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landProvince` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landProvinceName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCity` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCityName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCounty` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCountyName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTown` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTownName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landVillage` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landVillageName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTeam` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '不限',
  `circulationType` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulationTypeName` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landDuration` int(11) DEFAULT NULL,
  `landType` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTypeName` varchar(10) DEFAULT NULL,
  `landArea` double(15,3) DEFAULT NULL,
  `landPrice` int(11) DEFAULT NULL,
  `landUseType` varchar(20) DEFAULT NULL,
  `picIdcode` varchar(18) DEFAULT NULL,
  `picName` varchar(20) DEFAULT NULL,
  `picTel` varchar(11) DEFAULT NULL,
  `picAddress` varchar(255) DEFAULT NULL,
  `picEmail` varchar(255) DEFAULT NULL,
  `demanderDescript` varchar(255) DEFAULT NULL,
  `projectDescript` varchar(255) DEFAULT NULL,
  `currentStatusCode` varchar(2) DEFAULT NULL,
  `currentReturnMsg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `demanderId` (`demanderId`),
  CONSTRAINT `circulation_demand_ibfk_1` FOREIGN KEY (`demanderId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `circulation_demand` */

insert  into `circulation_demand`(`id`,`setupDate`,`demanderId`,`demanderType`,`demanderTypeName`,`demanderIdcode`,`demanderName`,`demanderAddress`,`demanderTel`,`demanderEmail`,`landAddress`,`landProvince`,`landProvinceName`,`landCity`,`landCityName`,`landCounty`,`landCountyName`,`landTown`,`landTownName`,`landVillage`,`landVillageName`,`landTeam`,`circulationType`,`circulationTypeName`,`landDuration`,`landType`,`landTypeName`,`landArea`,`landPrice`,`landUseType`,`picIdcode`,`picName`,`picTel`,`picAddress`,`picEmail`,`demanderDescript`,`projectDescript`,`currentStatusCode`,`currentReturnMsg`) values (24,'2014-10-30 13:09:16',9,'01','身份证','512223197311146672','李菊','双龙镇红旗村1组双龙镇红旗村','13910656911','liucb@irsa.ac.cn','重庆市市辖区长寿区双龙镇飞石村委会','50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127202','飞石村委会','12','04','转包',3,'01','水田',3.000,900,'种菜','512223197311146674','刘三','13910656922','重庆市长寿区双龙镇政府','998876@qq.com','个人','种菜','02','已提交，等待审核。'),(25,'2014-10-30 13:46:29',9,'01','身份证','512223197311146672','马亦奇','双龙镇红旗村1组双龙镇红旗村','13910656911','liucb@irsa.ac.cn','重庆市市辖区长寿区龙河镇四坪村委会','50','重庆市','5001','市辖区','500115','长寿区','500115128','龙河镇','500115128242','四坪村委会','10组','01','出租',10,'03','水田旱地均可',12.000,900,'种菜','512223197311146674','刘三','13910656922','重庆市长寿区双龙镇政府','998876@qq.com','个人','种菜','02','已提交，等待审核。'),(26,'2014-10-30 13:51:50',9,'01','身份证','512223197311146672','王文东','双龙镇红旗村1组双龙镇红旗村','13910656911','liucb@irsa.ac.cn','重庆市市辖区长寿区双龙镇谷黄村委会','50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会','1组','01','出租',4,'02','旱地',10.000,900,'种花','512223197311146674','刘三','13910656922','重庆市长寿区双龙镇政府','998876@qq.com','个人','种花','01','已新建，等待完善提交。'),(27,'2015-12-08 21:45:37',9,'01','身份证','512223197311146672','刘纯波','双龙镇红旗村1组双龙镇红旗村','13910656911','liucb@irsa.ac.cn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'512223197311146674','刘三','13910656922','重庆市长寿区双龙镇政府','998876@qq.com',NULL,NULL,'01','已新建，等待完善提交。'),(28,'2015-12-08 22:49:52',9,'01','身份证','512223197311146672','刘纯波','双龙镇红旗村1组双龙镇红旗村','13910656911','liucb@irsa.ac.cn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'512223197311146674','刘三','13910656922','重庆市长寿区双龙镇政府','998876@qq.com',NULL,NULL,'01','已新建，等待完善提交。'),(29,'2015-12-08 23:05:14',9,'01','身份证','512223197311146672','刘纯波','双龙镇红旗村1组双龙镇红旗村','13910656911','liucb@irsa.ac.cn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'512223197311146674','刘三','13910656922','重庆市长寿区双龙镇政府','998876@qq.com',NULL,NULL,'01','已新建，等待完善提交。');

/*Table structure for table `code_city` */

DROP TABLE IF EXISTS `code_city`;

CREATE TABLE `code_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceCode` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `code_city` */

insert  into `code_city`(`id`,`code`,`name`,`provinceCode`) values (1,'5001','市辖区','50'),(2,'5002','县','50'),(3,'5003','市','50'),(4,'1101','市辖区','11'),(5,'1102','县','11'),(6,'4301','长沙市','43'),(7,'4302','株洲市','43');

/*Table structure for table `code_county` */

DROP TABLE IF EXISTS `code_county`;

CREATE TABLE `code_county` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cityCode` char(4) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `code_county` */

insert  into `code_county`(`id`,`code`,`name`,`cityCode`) values (1,'500101','万州区','5001'),(2,'500102','涪陵区','5001'),(3,'500103','渝中区','5001'),(4,'500104','大渡口区','5001'),(5,'500105','江北区','5001'),(6,'500106','沙坪坝区','5001'),(7,'500107','九龙坡区','5001'),(8,'500108','南岸区','5001'),(9,'500109','北碚区','5001'),(10,'500110','万盛区','5001'),(11,'500111','双桥区','5001'),(12,'500112','渝北区','5001'),(13,'500113','巴南区','5001'),(14,'500114','黔江区','5001'),(15,'500115','长寿区','5001'),(16,'500200','綦江县','5002'),(17,'500223','潼南县','5002'),(18,'500224','铜梁县','5002'),(19,'500225','大足县','5002'),(20,'500226','荣昌县','5002'),(21,'500227','璧山县','5002'),(22,'500228','梁平县','5002'),(23,'500229','城口县','5002'),(24,'500230','丰都县','5002'),(25,'500231','垫江县','5002'),(26,'500232','武隆县','5002'),(27,'500233','忠县','5002'),(28,'500234','开县','5002'),(29,'500235','云阳县','5002'),(30,'500236','奉节县','5002'),(31,'500237','巫山县','5002'),(32,'500238','巫溪县','5002'),(33,'500240','石柱土家族自治县','5002'),(34,'500241','秀山土家族苗族自治县','5002'),(35,'500242','酉阳土家族苗族自治县','5002'),(36,'500243','彭水苗族土家族自治县','5002'),(37,'500381','江津市','5003'),(38,'500382','合川市','5003'),(39,'500383','永川市','5003'),(40,'500384','南川市','5003');

/*Table structure for table `code_province` */

DROP TABLE IF EXISTS `code_province`;

CREATE TABLE `code_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `code_province` */

insert  into `code_province`(`id`,`code`,`name`) values (1,'50','重庆市'),(2,'11','北京市'),(3,'43','湖南省');

/*Table structure for table `code_town` */

DROP TABLE IF EXISTS `code_town`;

CREATE TABLE `code_town` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countyCode` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `code_town` */

insert  into `code_town`(`id`,`code`,`name`,`countyCode`) values (1,'500115001','凤城街道办事处','500115'),(2,'500115002','晏家街道办事处','500115'),(3,'500115122','江南镇','500115'),(4,'500115123','邻封镇','500115'),(5,'500115124','但渡镇','500115'),(6,'500115125','云集镇','500115'),(7,'500115126','长寿湖镇','500115'),(8,'500115127','双龙镇','500115'),(9,'500115128','龙河镇','500115'),(10,'500115129','石堰镇','500115'),(11,'500115130','云台镇','500115'),(12,'500115131','海棠镇','500115'),(13,'500115132','葛兰镇','500115'),(14,'500115133','新市镇','500115'),(15,'500115134','渡舟镇','500115'),(16,'500115135','八颗镇','500115'),(17,'500115136','洪湖镇','500115'),(18,'500115137','万顺镇','500115');

/*Table structure for table `code_village` */

DROP TABLE IF EXISTS `code_village`;

CREATE TABLE `code_village` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `townCode` char(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `code_village` */

insert  into `code_village`(`id`,`code`,`name`,`townCode`) values (1,'500115127001','双龙社区居委会','500115127'),(2,'500115127200','龙滩村委会','500115127'),(3,'500115127201','谷黄村委会','500115127'),(4,'500115127202','飞石村委会','500115127'),(5,'500115127203','长寿寨村委会','500115127'),(6,'500115127204','联合村委会','500115127'),(7,'500115127205','罗围村委会','500115127'),(8,'500115127206','尖山村委会','500115127'),(9,'500115127207','红岩村委会','500115127'),(10,'500115127208','群力村委会','500115127'),(11,'500115127209','连丰村委会','500115127'),(12,'500115127210','天堂村委会','500115127'),(13,'500115128240','永兴村委会','500115128'),(14,'500115128241','仁和村委会','500115128'),(15,'500115128242','四坪村委会','500115128'),(16,'500115128243','太和村委会','500115128'),(17,'500115128244','咸丰村委会','500115128'),(18,'500115128245','堰塘村委会','500115128'),(19,'500115128246','合兴村委会','500115128'),(20,'500115128247','盐井凼村委会','500115128'),(21,'500115128248','明丰村委会','500115128'),(22,'500115128249','九龙村委会','500115128'),(23,'500115128250','保合村委会','500115128'),(24,'500115128251','长安村委会','500115128'),(25,'500115128252','龙河村委会','500115128'),(26,'500115128253','金明村委会','500115128'),(27,'500115128254','河堰村委会','500115128'),(28,'500115128255','骑龙村委会','500115128'),(29,'500115128256','明星村委会','500115128');

/*Table structure for table `conpensation_record` */

DROP TABLE IF EXISTS `conpensation_record`;

CREATE TABLE `conpensation_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddressName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landArea` double(11,3) DEFAULT NULL,
  `payeeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amountPayable` int(11) DEFAULT NULL,
  `actualPayments` int(11) DEFAULT NULL,
  `payedPercent` double(5,2) DEFAULT NULL,
  `payerName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reportYear` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `paymentdocPathFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `conpensation_record` */

insert  into `conpensation_record`(`id`,`contractNo`,`landAddressName`,`transferName`,`transferIdcode`,`landArea`,`payeeName`,`amountPayable`,`actualPayments`,`payedPercent`,`payerName`,`reportYear`,`paymentDate`,`paymentdocPathFilename`) values (1,'201450011512700001','重庆市长寿区双龙镇双龙社区居委会','廖明义','512223197311146672',91.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `contract_assignment` */

DROP TABLE IF EXISTS `contract_assignment`;

CREATE TABLE `contract_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractBaseId` int(11) DEFAULT NULL,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `businessProjectName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType` int(11) DEFAULT '1',
  `payType11` int(11) DEFAULT NULL,
  `payType12` int(11) DEFAULT NULL,
  `payType21` int(11) DEFAULT NULL,
  `payType22` int(11) DEFAULT NULL,
  `payType23` int(11) DEFAULT NULL,
  `payType31` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paytimeType` int(11) DEFAULT '1',
  `paytimeType11` int(11) DEFAULT NULL,
  `paytimeType12` int(11) DEFAULT NULL,
  `paytimeType13` int(11) DEFAULT NULL,
  `paytimeType21` int(11) DEFAULT NULL,
  `paytimeType22` int(11) DEFAULT NULL,
  `paytimeType23` int(11) DEFAULT NULL,
  `paytimeType31` date DEFAULT NULL,
  `paytimeType41` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `compensation` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferType` int(11) DEFAULT '1',
  `landtransferType21` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landtransferOtherDatum` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferDate` date DEFAULT NULL,
  `transferorOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `transfereeOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `endcirculationDisposal` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractModify` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractBreach11` int(11) DEFAULT NULL,
  `contractBreach12` int(11) DEFAULT NULL,
  `contractBreach21` int(11) DEFAULT NULL,
  `contractBreach22` int(11) DEFAULT NULL,
  `contractBreach31` double DEFAULT NULL,
  `contractBreach41` double DEFAULT NULL,
  `contractBreach71` int(11) DEFAULT NULL,
  `contractBreach81` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other11` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other21` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other51` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `authentication` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `contractBaseId` (`contractBaseId`),
  CONSTRAINT `contract_assignment_ibfk_1` FOREIGN KEY (`contractBaseId`) REFERENCES `contract_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contract_assignment` */

/*Table structure for table `contract_base` */

DROP TABLE IF EXISTS `contract_base`;

CREATE TABLE `contract_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulationType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulationTypeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferType` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ApplyId` int(11) DEFAULT NULL,
  `transferId` int(11) DEFAULT NULL,
  `transferIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferAgentId` int(11) DEFAULT NULL,
  `transferAgentName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeId` int(11) DEFAULT NULL,
  `transfeeIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeePicId` int(11) DEFAULT NULL,
  `transfeePicIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeePicName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeePicAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeePicTel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeePicEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeAgentId` int(11) DEFAULT NULL,
  `transfeeAgentName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddressCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddressName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landProvinceCode` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landProvinceName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCityCode` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCityName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCountyCode` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCountyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTownCode` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTownName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landVillageCode` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landVillageName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landRgArea` double(13,3) DEFAULT '0.000',
  `paddyfieldRgArea` double(13,3) DEFAULT '0.000',
  `drylandRgArea` double(13,3) DEFAULT '0.000',
  `landRealArea` double DEFAULT NULL,
  `paddyfieldRealArea` double DEFAULT NULL,
  `drylandRealArea` double DEFAULT NULL,
  `landNumber` int(11) DEFAULT NULL,
  `rightAuthType` int(11) DEFAULT '1',
  `landWarrantId` int(11) DEFAULT NULL,
  `landWarrantCode` varchar(23) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landContractCode` varchar(23) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(255) DEFAULT NULL,
  `fromDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `toDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `approvedDate` datetime DEFAULT NULL,
  `reviewResult` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewComment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewerId` int(11) DEFAULT NULL,
  `reviewerIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ApllyId` (`ApplyId`),
  KEY `landWarrantId` (`landWarrantId`),
  CONSTRAINT `contract_base_ibfk_1` FOREIGN KEY (`ApplyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contract_base_ibfk_3` FOREIGN KEY (`landWarrantId`) REFERENCES `landwarrant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contract_base` */

insert  into `contract_base`(`id`,`contractNo`,`circulationType`,`circulationTypeName`,`transferType`,`ApplyId`,`transferId`,`transferIdcode`,`transferName`,`transferAddress`,`transferTel`,`transferEmail`,`transferAgentId`,`transferAgentName`,`transfeeId`,`transfeeIdcode`,`transfeeName`,`transfeeAddress`,`transfeeTel`,`transfeeEmail`,`transfeePicId`,`transfeePicIdcode`,`transfeePicName`,`transfeePicAddress`,`transfeePicTel`,`transfeePicEmail`,`transfeeAgentId`,`transfeeAgentName`,`landAddressCode`,`landAddressName`,`landProvinceCode`,`landProvinceName`,`landCityCode`,`landCityName`,`landCountyCode`,`landCountyName`,`landTownCode`,`landTownName`,`landVillageCode`,`landVillageName`,`landRgArea`,`paddyfieldRgArea`,`drylandRgArea`,`landRealArea`,`paddyfieldRealArea`,`drylandRealArea`,`landNumber`,`rightAuthType`,`landWarrantId`,`landWarrantCode`,`landContractCode`,`duration`,`fromDate`,`toDate`,`approvedDate`,`reviewResult`,`reviewComment`,`reviewerId`,`reviewerIdcode`,`reviewerName`) values (118,'201450011512700001','01','出租','1',85,9,'512223197311146672','丁广勇','双龙镇红旗村1组双龙镇红旗村','13910656911',NULL,NULL,NULL,9,NULL,'刘纯波',NULL,'13910656911',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'500115127201','重庆市长寿区双龙镇双龙社区居委会','50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会',149.289,91.000,58.289,188,124,64,5,1,5,'12345678901234567890','12345612345612345616',7,'2014-09-30 00:00:00','2021-10-29 00:00:00','2014-10-09 10:25:05','0','测试，有问题的情况。',NULL,NULL,NULL),(121,'','01','出租','1',86,9,'512223197311146672','邵伟','双龙镇红旗村1组双龙镇红旗村','13910656911',NULL,NULL,NULL,9,NULL,'刘纯波',NULL,'13910656911',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会',280.000,150.000,130.000,300,160,140,NULL,2,6,'12345678901234567890','12345678901234567890',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,NULL,'01','出租','0',110,9,'512223197311146672','姜超','双龙镇红旗村1组双龙镇红旗村','13910656911',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'重庆市长寿区双龙镇谷黄村委会','50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会',51.000,51.000,NULL,56,56,NULL,1,1,11,'12345678901234567898',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,NULL,'01','出租','0',113,9,'512223197311146672','李文涛','双龙镇红旗村1组双龙镇红旗村','13910656911',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,NULL,'01','出租','0',114,9,'512223197311146672','王晓楠','双龙镇红旗村1组双龙镇红旗村','13910656911',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'重庆市长寿区龙河镇四坪村委会','50','重庆市','5001','市辖区','500115','长寿区','500115128','龙河镇','500115128242','四坪村委会',162.987,162.987,0.000,166.31,166.31,NULL,3,1,15,'12345678900998887779',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,NULL,'01','出租','0',193,9,'512223197311146672','蒋丽君','双龙镇红旗村1组双龙镇红旗村','13910656911',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23.000,23.000,NULL,25,25,NULL,1,1,17,'20152342342353453453',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `contract_exchange` */

DROP TABLE IF EXISTS `contract_exchange`;

CREATE TABLE `contract_exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractBaseId` int(11) DEFAULT NULL,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `businessProjectName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType` int(11) DEFAULT '1',
  `payType11` int(11) DEFAULT NULL,
  `payType12` int(11) DEFAULT NULL,
  `payType21` int(11) DEFAULT NULL,
  `payType22` int(11) DEFAULT NULL,
  `payType23` int(11) DEFAULT NULL,
  `payType31` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paytimeType` int(11) DEFAULT '1',
  `paytimeType11` int(11) DEFAULT NULL,
  `paytimeType12` int(11) DEFAULT NULL,
  `paytimeType13` int(11) DEFAULT NULL,
  `paytimeType21` int(11) DEFAULT NULL,
  `paytimeType22` int(11) DEFAULT NULL,
  `paytimeType23` int(11) DEFAULT NULL,
  `paytimeType31` date DEFAULT NULL,
  `paytimeType41` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `compensation` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferType` int(11) DEFAULT '1',
  `landtransferType21` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landtransferOtherDatum` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferDate` date DEFAULT NULL,
  `transferorOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `transfereeOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `endcirculationDisposal` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractModify` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractBreach11` int(11) DEFAULT NULL,
  `contractBreach12` int(11) DEFAULT NULL,
  `contractBreach21` int(11) DEFAULT NULL,
  `contractBreach22` int(11) DEFAULT NULL,
  `contractBreach31` double DEFAULT NULL,
  `contractBreach41` double DEFAULT NULL,
  `contractBreach71` int(11) DEFAULT NULL,
  `contractBreach81` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other11` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other21` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other51` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `authentication` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `contractBaseId` (`contractBaseId`),
  CONSTRAINT `contract_exchange_ibfk_1` FOREIGN KEY (`contractBaseId`) REFERENCES `contract_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contract_exchange` */

/*Table structure for table `contract_rent` */

DROP TABLE IF EXISTS `contract_rent`;

CREATE TABLE `contract_rent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractBaseId` int(11) DEFAULT NULL,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `businessProjectName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areaType` int(255) DEFAULT '1',
  `landArea` double(255,3) DEFAULT '0.000',
  `drylandArea` double(255,3) DEFAULT '0.000',
  `paddyfieldArea` double(255,3) DEFAULT '0.000',
  `payType` int(1) DEFAULT '1',
  `payType11` int(11) DEFAULT '0',
  `payType12` int(11) DEFAULT '0',
  `payType13String` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType13` bigint(255) DEFAULT '0',
  `payType14` int(255) DEFAULT '0',
  `payType21` int(11) DEFAULT '0',
  `payType22` int(11) DEFAULT '1',
  `payType22Name` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType23` bigint(255) DEFAULT '0',
  `payType24` int(255) DEFAULT '0',
  `payType25` int(255) DEFAULT '1',
  `payType25Name` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType26` bigint(255) DEFAULT '0',
  `payType27` int(11) DEFAULT '0',
  `payType31` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `paytimeType` int(11) DEFAULT '1',
  `paytimeType11` int(11) DEFAULT NULL,
  `paytimeType12` int(11) DEFAULT NULL,
  `paytimeType13` int(11) DEFAULT NULL,
  `paytimeType21` int(11) DEFAULT NULL,
  `paytimeType22` int(11) DEFAULT NULL,
  `paytimeType23` int(11) DEFAULT NULL,
  `paytimeType31` date DEFAULT NULL,
  `paytimeType41` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `compensation` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferType` int(11) DEFAULT '1',
  `landtransferType21` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landtransferOtherDatum` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferDate` date DEFAULT NULL,
  `transferOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `transfeeOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `endcirculationDisposal` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractModify` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractBreach11` int(11) DEFAULT NULL,
  `contractBreach12` int(11) DEFAULT NULL,
  `contractBreach21` int(11) DEFAULT NULL,
  `contractBreach22` int(11) DEFAULT NULL,
  `contractBreach31` bigint(20) DEFAULT NULL,
  `contractBreach41` bigint(20) DEFAULT NULL,
  `contractBreach71` int(11) DEFAULT NULL,
  `contractBreach81` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other11` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other21` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other51` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `authentication` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `contractBaseId` (`contractBaseId`),
  CONSTRAINT `contract_rent_ibfk_1` FOREIGN KEY (`contractBaseId`) REFERENCES `contract_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contract_rent` */

insert  into `contract_rent`(`id`,`contractBaseId`,`contractNo`,`businessProjectName`,`areaType`,`landArea`,`drylandArea`,`paddyfieldArea`,`payType`,`payType11`,`payType12`,`payType13String`,`payType13`,`payType14`,`payType21`,`payType22`,`payType22Name`,`payType23`,`payType24`,`payType25`,`payType25Name`,`payType26`,`payType27`,`payType31`,`paytimeType`,`paytimeType11`,`paytimeType12`,`paytimeType13`,`paytimeType21`,`paytimeType22`,`paytimeType23`,`paytimeType31`,`paytimeType41`,`compensation`,`landtransferType`,`landtransferType21`,`landtransferOtherDatum`,`landtransferDate`,`transferOtherRight`,`transfeeOtherRight`,`endcirculationDisposal`,`contractModify`,`contractBreach11`,`contractBreach12`,`contractBreach21`,`contractBreach22`,`contractBreach31`,`contractBreach41`,`contractBreach71`,`contractBreach81`,`other11`,`other21`,`other51`,`authentication`) values (108,118,'201450011512700001',NULL,1,91.000,149.289,58.289,1,950,850,'壹拾捌万贰仟贰佰柒拾元整',182270,5,900,1,'黄谷',52460,600,1,'黄谷',89573,5,'无',1,30,8,30,NULL,NULL,NULL,NULL,'','另行协商。',1,NULL,'无','2014-10-08','无','无','全部无偿归甲方所有。','无',10,30,10,30,108700,108700,90,'无','归甲方所有。','无','无',1),(111,121,'',NULL,1,150.000,280.000,130.000,1,900,800,'叁拾肆万壹仟元整',341000,5,0,1,'黄谷',0,0,1,'黄谷',0,0,'无',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','无',1,NULL,'无',NULL,'无','无','无','无',NULL,NULL,NULL,NULL,40000,40000,NULL,'无','无','无','无',1),(112,122,NULL,NULL,1,51.000,51.000,NULL,1,0,0,NULL,NULL,0,0,1,'黄谷',0,0,1,'黄谷',0,0,'无',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','无',1,NULL,'无',NULL,'无','无','无','无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'无','无','无','无',1),(113,123,NULL,NULL,1,NULL,NULL,NULL,1,0,0,NULL,NULL,0,0,1,'黄谷',0,0,1,'黄谷',0,0,'无',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','无',1,NULL,'无',NULL,'无','无','无','无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'无','无','无','无',1),(114,124,NULL,NULL,1,162.987,162.987,0.000,1,0,0,NULL,0,0,0,1,'黄谷',0,0,1,'黄谷',0,0,'无',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','无',1,NULL,'无',NULL,'无','无','无','无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'无','无','无','无',1),(115,125,NULL,NULL,1,23.000,23.000,NULL,1,0,0,NULL,NULL,0,0,1,'黄谷',0,0,1,'黄谷',0,0,'无',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','无',1,NULL,'无',NULL,'无','无','无','无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'无','无','无','无',1);

/*Table structure for table `contract_share` */

DROP TABLE IF EXISTS `contract_share`;

CREATE TABLE `contract_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractBaseId` int(11) DEFAULT NULL,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `businessProjectName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType` int(11) DEFAULT '1',
  `payType11` int(11) DEFAULT NULL,
  `payType12` int(11) DEFAULT NULL,
  `payType21` int(11) DEFAULT NULL,
  `payType22` int(11) DEFAULT NULL,
  `payType23` int(11) DEFAULT NULL,
  `payType31` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paytimeType` int(11) DEFAULT '1',
  `paytimeType11` int(11) DEFAULT NULL,
  `paytimeType12` int(11) DEFAULT NULL,
  `paytimeType13` int(11) DEFAULT NULL,
  `paytimeType21` int(11) DEFAULT NULL,
  `paytimeType22` int(11) DEFAULT NULL,
  `paytimeType23` int(11) DEFAULT NULL,
  `paytimeType31` date DEFAULT NULL,
  `paytimeType41` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `compensation` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferType` int(11) DEFAULT '1',
  `landtransferType21` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landtransferOtherDatum` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferDate` date DEFAULT NULL,
  `transferorOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `transfereeOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `endcirculationDisposal` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractModify` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractBreach11` int(11) DEFAULT NULL,
  `contractBreach12` int(11) DEFAULT NULL,
  `contractBreach21` int(11) DEFAULT NULL,
  `contractBreach22` int(11) DEFAULT NULL,
  `contractBreach31` double DEFAULT NULL,
  `contractBreach41` double DEFAULT NULL,
  `contractBreach71` int(11) DEFAULT NULL,
  `contractBreach81` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other11` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other21` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other51` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `authentication` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `contractBaseId` (`contractBaseId`),
  CONSTRAINT `contract_share_ibfk_1` FOREIGN KEY (`contractBaseId`) REFERENCES `contract_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contract_share` */

/*Table structure for table `contract_subcontract` */

DROP TABLE IF EXISTS `contract_subcontract`;

CREATE TABLE `contract_subcontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractBaseId` int(11) DEFAULT NULL,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `businessProjectName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType` int(11) DEFAULT '1',
  `payType11` int(11) DEFAULT NULL,
  `payType12` int(11) DEFAULT NULL,
  `payType21` int(11) DEFAULT NULL,
  `payType22` int(11) DEFAULT NULL,
  `payType23` int(11) DEFAULT NULL,
  `payType31` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paytimeType` int(11) DEFAULT '1',
  `paytimeType11` int(11) DEFAULT NULL,
  `paytimeType12` int(11) DEFAULT NULL,
  `paytimeType13` int(11) DEFAULT NULL,
  `paytimeType21` int(11) DEFAULT NULL,
  `paytimeType22` int(11) DEFAULT NULL,
  `paytimeType23` int(11) DEFAULT NULL,
  `paytimeType31` date DEFAULT NULL,
  `paytimeType41` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `compensation` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferType` int(11) DEFAULT '1',
  `landtransferType21` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landtransferOtherDatum` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferDate` date DEFAULT NULL,
  `transferorOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `transfereeOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `endcirculationDisposal` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractModify` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractBreach11` int(11) DEFAULT NULL,
  `contractBreach12` int(11) DEFAULT NULL,
  `contractBreach21` int(11) DEFAULT NULL,
  `contractBreach22` int(11) DEFAULT NULL,
  `contractBreach31` double DEFAULT NULL,
  `contractBreach41` double DEFAULT NULL,
  `contractBreach71` int(11) DEFAULT NULL,
  `contractBreach81` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other11` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other21` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other51` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `authentication` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `contractBaseId` (`contractBaseId`),
  CONSTRAINT `contract_subcontract_ibfk_1` FOREIGN KEY (`contractBaseId`) REFERENCES `contract_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contract_subcontract` */

/*Table structure for table `contractfilling` */

DROP TABLE IF EXISTS `contractfilling`;

CREATE TABLE `contractfilling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplyId` int(11) DEFAULT NULL,
  `contractfillingNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fillingDate` date DEFAULT NULL,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulationType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulationTypeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferType` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromDate` datetime DEFAULT NULL,
  `toDate` datetime DEFAULT NULL,
  `transferId` int(11) DEFAULT NULL,
  `transferIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transferEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeId` int(11) DEFAULT NULL,
  `transfeeIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfeeEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landArea` double(255,3) DEFAULT '0.000',
  `drylandArea` double(255,3) DEFAULT '0.000',
  `paddyfieldArea` double(255,3) DEFAULT '0.000',
  `payType` int(1) DEFAULT '1',
  `payType11` int(11) DEFAULT '0',
  `payType12` int(11) DEFAULT '0',
  `payType13String` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType13` bigint(255) DEFAULT '0',
  `payType14` int(255) DEFAULT '0',
  `payType21` int(11) DEFAULT '0',
  `payType22` int(11) DEFAULT '1',
  `payType22Name` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType23` bigint(255) DEFAULT '0',
  `payType24` int(255) DEFAULT '0',
  `payType25` int(255) DEFAULT '1',
  `payType25Name` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payType26` bigint(255) DEFAULT '0',
  `payType27` int(11) DEFAULT '0',
  `payType31` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `reviewResult` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewComment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `reviewerId` int(11) DEFAULT NULL,
  `reviewerIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddressCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddressName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landProvinceCode` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landProvinceName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCityCode` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCityName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCountyCode` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landCountyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTownCode` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landTownName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landVillageCode` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landVillageName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ApplyId` (`ApplyId`),
  CONSTRAINT `contractfilling_ibfk_1` FOREIGN KEY (`ApplyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contractfilling` */

insert  into `contractfilling`(`id`,`ApplyId`,`contractfillingNo`,`fillingDate`,`contractNo`,`circulationType`,`circulationTypeName`,`transferType`,`fromDate`,`toDate`,`transferId`,`transferIdcode`,`transferName`,`transferAddress`,`transferTel`,`transferEmail`,`transfeeId`,`transfeeIdcode`,`transfeeName`,`transfeeAddress`,`transfeeTel`,`transfeeEmail`,`landArea`,`drylandArea`,`paddyfieldArea`,`payType`,`payType11`,`payType12`,`payType13String`,`payType13`,`payType14`,`payType21`,`payType22`,`payType22Name`,`payType23`,`payType24`,`payType25`,`payType25Name`,`payType26`,`payType27`,`payType31`,`reviewResult`,`reviewComment`,`approvedDate`,`reviewerId`,`reviewerIdcode`,`reviewerName`,`landAddressCode`,`landAddressName`,`landProvinceCode`,`landProvinceName`,`landCityCode`,`landCityName`,`landCountyCode`,`landCountyName`,`landTownCode`,`landTownName`,`landVillageCode`,`landVillageName`) values (6,85,'201450011512700000',NULL,'201450011512700001','01','出租','1','2014-09-30 00:00:00','2021-10-29 00:00:00',9,'512223197311146672','刘纯波','双龙镇红旗村1组双龙镇红旗村','13910656911',NULL,9,NULL,'刘纯波',NULL,'13910656911',NULL,91.000,149.289,58.289,1,950,850,'壹拾捌万贰仟贰佰柒拾元整',182270,5,900,1,'黄谷',52460,600,1,'黄谷',89573,5,'无','0',NULL,NULL,NULL,NULL,NULL,'500115127201','重庆市长寿区双龙镇双龙社区居委会','50','重庆市','5001','市辖区','500115','长寿区','500115127','双龙镇','500115127201','谷黄村委会');

/*Table structure for table `contractfillingimg` */

DROP TABLE IF EXISTS `contractfillingimg`;

CREATE TABLE `contractfillingimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractfillingId` int(11) DEFAULT NULL,
  `contractNo` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractfillingimgPathFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractfillingimgSn` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contractfillingId` (`contractfillingId`),
  CONSTRAINT `contractfillingimg_ibfk_1` FOREIGN KEY (`contractfillingId`) REFERENCES `contractfilling` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `contractfillingimg` */

insert  into `contractfillingimg`(`id`,`contractfillingId`,`contractNo`,`contractfillingimgPathFilename`,`contractfillingimgSn`) values (1,6,'201450011512700001','/upload/contract/upload/contract/20141016151506781.jpg',1),(2,6,'201450011512700001','/upload/contract/upload/contract/20141016151515640.jpg',2),(3,6,'201450011512700001','/upload/contract/upload/contract/20141016151523234.jpg',3),(4,6,'201450011512700001','/upload/contract/upload/contract/20141016151533046.jpg',5),(5,6,'201450011512700001','/upload/contract/upload/contract/20141016151542375.jpg',4);

/*Table structure for table `flowdef` */

DROP TABLE IF EXISTS `flowdef`;

CREATE TABLE `flowdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flowCode` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flowName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flowDesc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `flowdef` */

insert  into `flowdef`(`id`,`flowCode`,`flowName`,`flowDesc`) values (1,'01','协议出租','农村土地承包经营权协议出租');

/*Table structure for table `landcontractimg` */

DROP TABLE IF EXISTS `landcontractimg`;

CREATE TABLE `landcontractimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyId` int(11) DEFAULT NULL,
  `owerId` int(11) DEFAULT NULL,
  `owerIDCode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pgno` int(11) DEFAULT NULL,
  `description` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landcontractimgPathFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `landcontractimg_ibfk_2` (`applyId`),
  KEY `landcontractimg_ibfk_1` (`owerId`),
  CONSTRAINT `landcontractimg_ibfk_1` FOREIGN KEY (`owerId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `landcontractimg_ibfk_2` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `landcontractimg` */

insert  into `landcontractimg`(`id`,`applyId`,`owerId`,`owerIDCode`,`contractCode`,`pgno`,`description`,`landcontractimgPathFilename`) values (51,188,18,'512223197311146678','12345678900987654321',1,NULL,'/upload/apply/upload/landcontractimg/20141030141107179.JPG');

/*Table structure for table `landwarrant` */

DROP TABLE IF EXISTS `landwarrant`;

CREATE TABLE `landwarrant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warrantCode` varchar(23) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applyId` int(11) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `ownerIDCode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warrantImgPathname12` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warrantImgPathname34` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warrantImgPathname56` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warrantImgPathname78` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warrantImgPathname90` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owerId` (`ownerId`),
  CONSTRAINT `landwarrant_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `user_person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `landwarrant` */

insert  into `landwarrant`(`id`,`warrantCode`,`applyId`,`ownerId`,`ownerIDCode`,`warrantImgPathname12`,`warrantImgPathname34`,`warrantImgPathname56`,`warrantImgPathname78`,`warrantImgPathname90`) values (1,'12345678900987654321',59,9,'512223197311146672','upload/warrant/20140416111823500.jpg','upload/warrant/20140416111828953.jpg','upload/warrant/20140416111833640.jpg','upload/warrant/20140416111838921.jpg','upload/warrant/20140416111842843.jpg'),(2,NULL,72,9,'512223197311146672',NULL,NULL,NULL,NULL,NULL),(3,NULL,73,9,'512223197311146672','upload/warrant/20140417105151125.jpg',NULL,NULL,NULL,NULL),(4,NULL,83,9,'512223197311146672','upload/warrant/20140417111012906.jpg',NULL,NULL,NULL,NULL),(5,NULL,85,9,'512223197311146672','upload/warrant/20140429180947940.jpg','upload/warrant/20140429180954018.jpg','upload/warrant/20140429181000658.jpg','upload/warrant/20140429181007049.jpg','upload/warrant/20140417150549968.jpg'),(6,NULL,86,9,'512223197311146672',NULL,NULL,NULL,NULL,NULL),(7,NULL,88,9,'512223197311146672','upload/warrant/20140422134642832.jpg',NULL,NULL,NULL,NULL),(8,NULL,101,9,'洪秋雨','upload/warrant/20140701170927546.jpg','upload/warrant/20140701170933218.jpg','upload/warrant/20140701170938031.jpg','upload/warrant/20140701170943609.jpg','upload/warrant/20140701170948890.jpg'),(9,NULL,103,9,'王晓楠',NULL,NULL,NULL,NULL,NULL),(10,NULL,104,9,'廖明义','upload/warrant/20140707150941796.jpg','upload/warrant/20140707150950046.jpg','upload/warrant/20140707150955859.jpg','upload/warrant/20140707151002531.jpg','upload/warrant/20140707151008265.jpg'),(11,NULL,110,9,'崔礼宾','upload/warrant/20140707165534218.jpg','upload/warrant/20140707165540703.jpg','upload/warrant/20140707165545265.jpg','upload/warrant/20140707165552000.jpg','upload/warrant/20140707165556703.jpg'),(12,NULL,115,9,'洪秋雨','upload/warrant/20140825100953781.jpg','upload/warrant/20140825100959421.jpg','upload/warrant/20140825101005156.jpg','upload/warrant/20140825101012250.jpg','upload/warrant/20140825101016687.jpg'),(13,NULL,116,9,'王晓楠','upload/warrant/20140911145618140.jpg','upload/warrant/20140911145622843.jpg','upload/warrant/20140911145627718.jpg','upload/warrant/20140911145633546.jpg','upload/warrant/20140911145637000.jpg'),(14,NULL,117,9,'崔礼宾','upload/warrant/20140911150003562.jpg','upload/warrant/20140911150006921.jpg','upload/warrant/20140911150010843.jpg','upload/warrant/20140911150015515.jpg','upload/warrant/20140911150019046.jpg'),(15,NULL,114,9,'王晓楠','upload/warrant/20141016190345640.jpg','upload/warrant/20141016190349703.jpg','upload/warrant/20141016190353312.jpg','upload/warrant/20141016190358843.jpg','upload/warrant/20141016190402812.jpg'),(16,NULL,191,9,'崔礼宾',NULL,NULL,NULL,NULL,NULL),(17,NULL,193,9,'廖明义',NULL,NULL,NULL,NULL,NULL),(18,NULL,194,9,'洪秋雨',NULL,NULL,NULL,NULL,NULL),(19,NULL,195,9,'崔礼宾',NULL,NULL,NULL,NULL,NULL),(20,NULL,196,9,'廖明义',NULL,NULL,NULL,NULL,NULL),(21,NULL,197,9,'洪秋雨',NULL,NULL,NULL,NULL,NULL),(22,NULL,198,9,'崔礼宾',NULL,NULL,NULL,NULL,NULL),(23,NULL,199,9,'洪秋雨',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `parcel` */

DROP TABLE IF EXISTS `parcel`;

CREATE TABLE `parcel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) DEFAULT NULL,
  `parcelCode` varchar(23) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rgArea` double DEFAULT NULL,
  `realArea` double DEFAULT NULL,
  `basicFarmland` int(11) DEFAULT NULL,
  `east` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `south` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `west` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `north` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parcel_ibfk_1` (`applicationId`),
  CONSTRAINT `parcel_ibfk_1` FOREIGN KEY (`applicationId`) REFERENCES `apply` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `parcel` */

insert  into `parcel`(`id`,`applicationId`,`parcelCode`,`type`,`rgArea`,`realArea`,`basicFarmland`,`east`,`south`,`west`,`north`) values (178,85,'123456789012345678','1',45,56,3,'我要','','',''),(179,85,'123456789012345678','1',34,34,3,'34567890','','',''),(180,85,'123456789012345678','1',12,34,3,'','','',''),(181,85,'123456789012345678','2',23.789,28,3,'','','',''),(182,85,'123456789012345678','2',34.5,36,3,'','','','456789'),(193,104,'123456789012345678','1',100,100,3,'张三','李四','王五','河'),(194,104,'123456789012345678','2',120,150,2,'河','公路','张本','李四'),(195,103,'500115127001243431','1',50,50,3,'张三','李四','王五','陈六'),(196,109,'500115127203122332','1',50,54,3,'河','公路','张三','李四'),(197,110,'500115127201122323','1',51,56,1,'张二','刘二','河','公路'),(198,115,'123456789012345678','1',30,35,3,'河','公路','张三','李四'),(199,115,'123456789098765432','2',34,40.56,3,'张三','李四','王一','河'),(200,116,'500115128240123456','1',50,50,1,'河','公路','水渠','张三'),(201,116,'500115128240687889','2',89,89,2,'江','河','张三','李四'),(208,147,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,114,'500115128242788888','1',89,90,2,'测试东','测试南','测试西','测试北'),(212,114,'500115128242098888','1',50,50.98,2,'东','南','西','北'),(213,114,'500115128242345454','1',23.987,25.33,1,'测试东','南','测试西','北'),(214,188,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,191,'123456789987654321','1',32,35,2,'在','顶替要可想而知','枯','枯'),(217,193,'234234234343434343','1',23,25,3,'橱柜在','苛','械','械'),(218,194,'234234234323423234','1',30,29,3,'21312','123123','123123','123123'),(219,195,'243234234234324343','1',333,333,3,'3333','333','33','33'),(220,196,'142342342342342342','1',50000,50000,2,'22222','22','22222','22222'),(221,197,'222222222222222222','1',60000,60000,2,'222222222222222222','22222222222','222222222222222','22222222222222222'),(222,198,'111111111112222222','1',90000,90000,2,'2222','2222','2222','2222'),(223,199,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,199,'222222222222222222','1',22222,2222,2,'2222','2222','2222','2222'),(225,200,'222222222222222222','1',11111111,1111111,3,'1111111111','11111111111111','1111111','111111111'),(226,201,'500115127201333333','1',333333,333333,3,'3333333333','333333333333','333333333','33333333333');

/*Table structure for table `post_apply` */

DROP TABLE IF EXISTS `post_apply`;

CREATE TABLE `post_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Idcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `posterId` int(11) DEFAULT NULL,
  `poster` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsePicname` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responseTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responseEmail` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responseAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posterId` (`posterId`),
  CONSTRAINT `post_apply_ibfk_1` FOREIGN KEY (`posterId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `post_apply` */

insert  into `post_apply`(`id`,`Idcode`,`startDate`,`endDate`,`posterId`,`poster`,`responsePicname`,`responseTel`,`responseEmail`,`responseAddress`,`status`,`publishDate`) values (25,NULL,'2014-05-01','2014-05-20',9,'王东','刘二','12345678901','1234@qq.com','苦苦苦地魂牵梦萦 ','02','2014-06-20'),(26,NULL,'2014-08-01','2014-08-24',9,'田立新','刘三','13021341234','134@qq.com','重庆市长寿区双龙镇政府','02','2015-09-10'),(27,NULL,'2014-07-07','2014-07-10',9,'毛友德','刘三','13910343243','123@qq.com','重庆市长寿区双龙镇','02','2014-07-07'),(28,NULL,'2014-08-11','2014-08-19',9,'王东','刘一','13910651341','123@qq.com','重庆市长寿区','02','2015-09-10'),(29,NULL,NULL,NULL,9,'杨建明',NULL,NULL,NULL,NULL,'02','2014-08-25'),(30,NULL,'2014-09-10','2014-09-18',9,'田立新','张三','12345678901','345@qq.com','重庆市国土局','02','2014-09-19'),(31,NULL,'2015-09-08','2015-09-09',9,'杨建明','张三','18910202323','wang@163.com','村村枯无可奈何要','02','2015-09-10'),(32,NULL,NULL,NULL,9,'毛友德',NULL,NULL,NULL,NULL,'02','2015-09-10'),(33,NULL,NULL,NULL,9,'田立新',NULL,NULL,NULL,NULL,'02','2015-09-10'),(34,NULL,'2015-09-01','2015-09-30',9,'王东','2222222222','22222222222','222@163.c0m','22222222222222222222222222','02','2015-09-10'),(35,NULL,'2015-09-08','2015-09-10',9,'田立新','w22222','22222222222','2222@163.com','wwwwwwwwwwwwwww','02','2015-09-10'),(36,NULL,NULL,NULL,9,'毛友德',NULL,NULL,NULL,NULL,'01',NULL);

/*Table structure for table `postdetail_apply` */

DROP TABLE IF EXISTS `postdetail_apply`;

CREATE TABLE `postdetail_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postId` int(11) DEFAULT NULL,
  `applyId` int(11) DEFAULT NULL,
  `applierName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applierIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rightAuthType` int(11) DEFAULT NULL,
  `landwarrantCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landcontractCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landRgArea` double DEFAULT NULL,
  `paddyfeildRgArea` double DEFAULT NULL,
  `drylandRgArea` double DEFAULT NULL,
  `responseNumber` int(11) DEFAULT NULL,
  `propertreatNumber` int(11) DEFAULT NULL,
  `objectionNumber` int(11) DEFAULT NULL,
  `nottreatNumber` int(11) DEFAULT NULL,
  `resultCode` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `applyId` (`applyId`),
  CONSTRAINT `postdetail_apply_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post_apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postdetail_apply_ibfk_2` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `postdetail_apply` */

insert  into `postdetail_apply`(`id`,`postId`,`applyId`,`applierName`,`applierIdcode`,`landAddress`,`rightAuthType`,`landwarrantCode`,`landcontractCode`,`landRgArea`,`paddyfeildRgArea`,`drylandRgArea`,`responseNumber`,`propertreatNumber`,`objectionNumber`,`nottreatNumber`,`resultCode`) values (29,25,85,'王文东','512223197311146672','前进红旗null',1,'12345678901234567890','12345612345612345616',1264403,1250824,13579,1,0,0,1,'02'),(31,25,86,'崔礼宾','512223197311146672','nullnullnull',2,'12345678901234567890','12345678901234567890',NULL,NULL,NULL,0,0,0,0,'01'),(35,26,87,'杨建明','512223197311146672','nullnullnull',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'01'),(36,27,103,'姜超','512223197311146672','5001151275001151270018',1,'12345678901234567890',NULL,50,50,NULL,1,0,0,1,'02'),(37,27,104,'崔礼宾','512223197311146672','500115127500115127200null',1,'12123456789067889000',NULL,220,100,120,0,0,0,0,'01'),(39,29,115,'仲胜侠','512223197311146672','500115128500115128242null',1,'12345678903456789045',NULL,64,30,34,NULL,NULL,NULL,NULL,NULL),(40,30,110,'仲胜侠','512223197311146672','500115127500115127201null',1,'12345678901234567898',NULL,50,50,NULL,2,0,0,2,'02'),(41,30,113,'王文东','512223197311146672','nullnullnull',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'01'),(42,31,191,'杨建明','512223197311146672','nullnullnull',1,'22312312312312312442',NULL,32,32,NULL,2,0,0,2,'02'),(43,31,114,'姜超','512223197311146672','500115128500115128242null',1,'12345678900998887779',NULL,162.987,162.987,0,0,0,0,0,'01'),(44,31,193,'仲胜侠','512223197311146672','nullnullnull',1,'20152342342353453453',NULL,23,23,NULL,0,0,0,0,'01'),(46,28,194,'崔礼宾','512223197311146672','nullnullnull',1,'23423423432432342343',NULL,30,30,NULL,0,0,0,0,'01'),(47,32,195,'杨建明','512223197311146672','nullnullnull',1,'23423423434342423443',NULL,333,333,NULL,NULL,NULL,NULL,NULL,NULL),(48,33,196,'王文东','512223197311146672','nullnullnull',1,'22222222222222222222',NULL,50000,50000,NULL,NULL,NULL,NULL,NULL,NULL),(49,34,197,'姜超','512223197311146672','nullnullnull',2,'22222222222222222222','22222222222222222222',60000,60000,NULL,NULL,NULL,NULL,NULL,NULL),(50,35,198,'杨建明','512223197311146672','nullnullnull',1,'22222222222222222222',NULL,90000,90000,NULL,1,0,0,1,'02'),(53,36,201,'王文东','512223197311146672','500115127500115127201null',2,NULL,'22222222222222222222',333333,333333,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `province_code` */

DROP TABLE IF EXISTS `province_code`;

CREATE TABLE `province_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `province_code` */

/*Table structure for table `rentcontract` */

DROP TABLE IF EXISTS `rentcontract`;

CREATE TABLE `rentcontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyId` int(11) DEFAULT NULL,
  `transfereeType` int(11) DEFAULT NULL,
  `transfereePersonId` int(11) DEFAULT NULL,
  `transfereeCompanyId` int(11) DEFAULT NULL,
  `dateFrom` date DEFAULT '2014-05-01',
  `dateTo` date DEFAULT '2014-05-01',
  `areaType` int(11) DEFAULT '2',
  `payType` int(11) DEFAULT '1',
  `payType11` int(11) DEFAULT NULL,
  `payType12` int(11) DEFAULT NULL,
  `payType21` int(11) DEFAULT NULL,
  `payType22` int(11) DEFAULT NULL,
  `payType23` int(11) DEFAULT NULL,
  `payType31` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paytimeType` int(11) DEFAULT '1',
  `paytimeType11` int(11) DEFAULT NULL,
  `paytimeType12` int(11) DEFAULT NULL,
  `paytimeType13` int(11) DEFAULT NULL,
  `paytimeType21` int(11) DEFAULT NULL,
  `paytimeType22` int(11) DEFAULT NULL,
  `paytimeType23` int(11) DEFAULT NULL,
  `paytimeType31` date DEFAULT '2014-05-01',
  `paytimeType41` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `compensation` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferType` int(11) DEFAULT '1',
  `landtransferType21` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landtransferOtherDatum` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `landtransferDate` date DEFAULT NULL,
  `transferorOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `transfereeOtherRight` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `endcirculationDisposal` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractModify` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `contractBreach11` int(11) DEFAULT NULL,
  `contractBreach12` int(11) DEFAULT NULL,
  `contractBreach21` int(11) DEFAULT NULL,
  `contractBreach22` int(11) DEFAULT NULL,
  `contractBreach31` double DEFAULT NULL,
  `contractBreach41` double DEFAULT NULL,
  `contractBreach71` int(11) DEFAULT NULL,
  `contractBreach81` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other11` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other21` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `other51` varchar(200) COLLATE utf8_unicode_ci DEFAULT '无',
  `authentication` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `rentcontract_ibfk_3` (`transfereeCompanyId`),
  KEY `transfereePersonId` (`transfereePersonId`),
  KEY `applyId` (`applyId`),
  CONSTRAINT `rentcontract_ibfk_3` FOREIGN KEY (`transfereeCompanyId`) REFERENCES `transferee_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rentcontract_ibfk_4` FOREIGN KEY (`transfereePersonId`) REFERENCES `transferee_person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rentcontract_ibfk_5` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rentcontract` */

insert  into `rentcontract`(`id`,`applyId`,`transfereeType`,`transfereePersonId`,`transfereeCompanyId`,`dateFrom`,`dateTo`,`areaType`,`payType`,`payType11`,`payType12`,`payType21`,`payType22`,`payType23`,`payType31`,`paytimeType`,`paytimeType11`,`paytimeType12`,`paytimeType13`,`paytimeType21`,`paytimeType22`,`paytimeType23`,`paytimeType31`,`paytimeType41`,`compensation`,`landtransferType`,`landtransferType21`,`landtransferOtherDatum`,`landtransferDate`,`transferorOtherRight`,`transfereeOtherRight`,`endcirculationDisposal`,`contractModify`,`contractBreach11`,`contractBreach12`,`contractBreach21`,`contractBreach22`,`contractBreach31`,`contractBreach41`,`contractBreach71`,`contractBreach81`,`other11`,`other21`,`other51`,`authentication`) values (2,85,NULL,4,NULL,'2014-04-01','2014-04-01',1,1,1000,10,NULL,NULL,NULL,NULL,1,30,9,1,NULL,NULL,NULL,NULL,NULL,'无							',1,NULL,'无								','2014-04-01','无','无','无','无',10,30,10,30,100000,100000,90,'无','无','无','无',1),(7,86,1,8,NULL,'2014-05-06','2014-05-06',2,1,1000,10,NULL,NULL,NULL,NULL,1,30,9,1,NULL,NULL,NULL,NULL,NULL,'无',1,NULL,'无','2014-05-06','无','无','无','无',10,30,20,30,10000,10000,30,'无','无','无','无',1),(8,87,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,103,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,104,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,109,1,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,110,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,113,1,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,114,1,26,NULL,'2014-10-16','2014-10-28',2,1,900,5,NULL,NULL,NULL,NULL,1,30,8,30,NULL,NULL,NULL,NULL,NULL,'无',1,NULL,'无','2014-10-16','无','无','无','无',10,30,10,30,10000,10000,30,'无','无','无','无',1),(28,115,1,25,NULL,'2014-09-01','2034-08-31',2,1,800,5,NULL,NULL,NULL,NULL,1,30,9,1,NULL,NULL,NULL,NULL,NULL,'无',1,NULL,'无','2014-08-26','无','无','无','无',20,30,20,30,100000,100000,30,'无','无','无','无',1),(29,116,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,147,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,154,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,144,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,142,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,156,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,151,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,158,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,188,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,191,1,27,NULL,'2015-09-08','2015-09-16',2,3,NULL,NULL,NULL,NULL,NULL,'仍仍仍仍人在枯',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'枯枯枯要枯','枯',1,NULL,'枯','2015-09-15','枯','枯','枯','枯要',3,3,3,3,3,3,4,'枯枯','3枯','枯','枯',2),(46,193,1,NULL,NULL,'2015-09-08','2015-09-30',2,1,600,3,NULL,NULL,NULL,NULL,1,8,9,30,NULL,NULL,NULL,NULL,NULL,'要苛',1,NULL,'顶替','2015-09-17','枯','枯','枯','三',5,7,3,6,455,555,3,'顶替','枯枯','枯要','枯要',1),(47,194,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,195,1,29,NULL,'2015-09-10','2016-12-21',2,1,222,2,NULL,NULL,NULL,NULL,1,2,7,2,NULL,NULL,NULL,NULL,NULL,'22222',1,NULL,'222','2015-09-09','222','2222','2222222','2222',2222,2,2,2,222,222,2,'22222222','22222','222222','22222',1),(49,196,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,197,1,31,NULL,'2015-06-01','2015-09-30',2,3,NULL,NULL,NULL,NULL,NULL,'2222222222222',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2222222222','222222',2,NULL,'222222222222','2015-09-16','222222222222222','22222222222222222222222','22222222222222222222','22222222222222222222',2,2,2,2,222,222,2,'222222222222222','22222222222222222222','22222222222222','222222222222222',1),(51,198,1,32,NULL,'2015-09-08','2015-09-11',2,1,11,1,NULL,NULL,NULL,NULL,1,1,1,1,NULL,NULL,NULL,NULL,NULL,'111111111',1,NULL,'11111111111111111','2015-09-09','11111111111111111','11111111111111111','11111111111111111','11111111111111',1,1,1,1,11111111,111111,1,'11111111111','11111111111111','1111111111111111','1111111111111',1),(52,199,1,33,NULL,'2015-09-08','2015-09-11',2,1,2222,2,NULL,NULL,NULL,NULL,1,2,2,2,NULL,NULL,NULL,NULL,NULL,'2',1,NULL,'22','2015-09-09','22','222','2222','2222',2,2,2,2,222,222,2,'222222222222222','222222','22222222','22222222',1),(53,200,1,34,NULL,'2015-09-08','2015-09-11',2,1,1,1,NULL,NULL,NULL,NULL,1,1,1,1,NULL,NULL,NULL,NULL,NULL,'1',1,NULL,'1','2015-09-09','1111','1111','1111','1111',1,1,1,1,111,111,1,'11111','111','1111','11111',1),(54,201,1,35,NULL,'2015-09-07','2015-09-11',2,1,2,2,NULL,NULL,NULL,NULL,1,2,2,2,NULL,NULL,NULL,NULL,NULL,'2',1,NULL,'222','2015-09-09','22222','2222222','222222','22222222',2,22,2,2,2222,2222,2,'2','2222','222','2222',1),(55,202,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `review_apply` */

DROP TABLE IF EXISTS `review_apply`;

CREATE TABLE `review_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyId` int(11) DEFAULT NULL,
  `reviewResult` int(1) DEFAULT NULL,
  `reviewAdvice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applyId` (`applyId`),
  CONSTRAINT `review_apply_ibfk_1` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `review_apply` */

insert  into `review_apply`(`id`,`applyId`,`reviewResult`,`reviewAdvice`) values (5,85,1,'信息不全，不能通过。'),(6,86,0,'不想让您过'),(7,87,0,NULL),(8,103,0,NULL),(11,104,0,NULL),(12,109,0,NULL),(13,114,0,NULL),(14,115,0,NULL),(15,110,0,NULL),(16,113,0,NULL),(17,116,0,NULL),(18,191,0,NULL),(19,193,0,NULL),(20,194,0,NULL),(21,195,0,NULL),(22,196,0,NULL),(23,197,0,NULL),(24,198,0,NULL),(25,199,0,NULL),(26,200,0,NULL),(27,201,0,NULL);

/*Table structure for table `review_userperson` */

DROP TABLE IF EXISTS `review_userperson`;

CREATE TABLE `review_userperson` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserPerson_ID` int(11) DEFAULT NULL,
  `UserPerson_UserID` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserPerson_UserName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Result` tinyint(1) DEFAULT NULL,
  `Advice` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Reviewer_ID` int(11) DEFAULT NULL,
  `Reviewer_UserID` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Reviewer_UserName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReviewDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserPerson_ID` (`UserPerson_ID`) USING BTREE,
  KEY `review_userperson_ibfk_2` (`Reviewer_ID`),
  CONSTRAINT `review_userperson_ibfk_1` FOREIGN KEY (`UserPerson_ID`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_userperson_ibfk_2` FOREIGN KEY (`Reviewer_ID`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `review_userperson` */

insert  into `review_userperson`(`ID`,`UserPerson_ID`,`UserPerson_UserID`,`UserPerson_UserName`,`Result`,`Advice`,`Reviewer_ID`,`Reviewer_UserID`,`Reviewer_UserName`,`ReviewDatetime`) values (2,9,'512223197311146672','丁广勇',0,NULL,9,'512223197311146672','刘纯波',NULL),(3,9,'512223197311146672','丁广勇',0,'信息不完整。',9,'512223197311146672','刘纯波',NULL),(6,9,'512223197311146672','杨建明',0,NULL,9,'512223197311146672','刘纯波',NULL),(7,9,'512223197311146672','邵伟',0,NULL,9,'512223197311146672','刘纯波',NULL),(8,9,'512223197311146672','邵伟',0,NULL,9,'512223197311146672','刘纯波',NULL),(9,9,'512223197311146672','杨建明',0,'信息不全。',9,'512223197311146672','刘纯波',NULL),(14,9,'512223197311146672','丁广勇',0,'  dfas fa dafasf',9,'512223197311146672','刘纯波','2014-04-11 10:35:27'),(15,9,'512223197311146672','杨建明',0,'  jgj jh j',9,'512223197311146672','刘纯波','2014-04-14 18:03:33');

/*Table structure for table `role_code` */

DROP TABLE IF EXISTS `role_code`;

CREATE TABLE `role_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleCode` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `role_code` */

insert  into `role_code`(`id`,`roleCode`,`roleName`) values (1,'0101','转出方'),(2,'0201','转入方'),(3,'0301','中介机构'),(4,'0401','监管机构'),(5,'0501','用户注册审核岗'),(6,'0502','用户权限分配岗'),(7,'0601','系统管理员');

/*Table structure for table `rtnmsgdef` */

DROP TABLE IF EXISTS `rtnmsgdef`;

CREATE TABLE `rtnmsgdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgCode` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msgText` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rtnmsgdef` */

insert  into `rtnmsgdef`(`id`,`msgCode`,`msgText`) values (1,'01010101','新建申请成功，请及时填报提交。'),(2,'01010201','申请提交成功,等待审核。'),(3,'01020101','正在审核。'),(4,'01020201','审核通过。'),(5,'01020301','审核未通过，请修改后重新提交。'),(6,'01030101','公示公告拟定中'),(7,'01030201','公示中'),(8,'01030301','公示通过'),(9,'01030401','公示未通过'),(10,'01040101','等待发布招标公告'),(11,'01040201','招标公告已发布，开始接收竞标报名'),(13,'01040301','竞标报名已截止'),(14,'01040401','投标已截止，等待开标'),(15,'01040501','开标已结束，评标中'),(16,'01040601','竞标结果已公示，等网签合同'),(17,'01050101','等待修改提交网签合同'),(18,'01050201','网签合同已提交，等待审核'),(19,'01050301','网签合同审核已通过，可下载打印'),(20,'01050401','网签合同审核未通过，请及时修改重报'),(21,'01050501','等待修改提交合同备案材料'),(22,'01050601','合同备案材料已提交，等待审核'),(23,'01050701','合同备案审核通过，备案成功'),(24,'01050801','合同备案审核未通过，请及时修改重报');

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flowDefId` int(11) DEFAULT NULL,
  `flowInstanceId` int(11) DEFAULT NULL,
  `finishedDatetime` datetime DEFAULT NULL,
  `currentStepId` int(11) DEFAULT NULL,
  `currentStatusId` int(11) DEFAULT NULL,
  `currentMsgId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flowDefId` (`flowDefId`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`flowDefId`) REFERENCES `flowdef` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5324 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `status` */

insert  into `status`(`id`,`flowDefId`,`flowInstanceId`,`finishedDatetime`,`currentStepId`,`currentStatusId`,`currentMsgId`) values (11,NULL,33,'2014-04-03 20:33:46',1,1,1),(12,NULL,34,'2014-04-03 20:34:14',1,1,1),(13,NULL,35,'2014-04-03 20:34:50',1,1,1),(14,NULL,36,'2014-04-03 20:34:51',1,1,1),(15,NULL,37,'2014-04-03 20:34:52',1,1,1),(16,NULL,38,'2014-04-03 20:34:53',1,1,1),(17,NULL,39,'2014-04-03 20:34:54',1,1,1),(18,NULL,40,'2014-04-03 20:34:55',1,1,1),(19,NULL,41,'2014-04-03 20:34:56',1,1,1),(20,NULL,42,'2014-04-03 20:34:58',1,1,1),(21,NULL,43,'2014-04-03 20:35:22',1,1,1),(22,NULL,44,'2014-04-03 20:35:32',1,1,1),(23,NULL,44,'2014-04-03 20:35:33',1,2,2),(24,NULL,44,'2014-04-03 20:36:28',1,2,2),(25,NULL,44,'2014-04-03 20:36:28',1,2,2),(26,NULL,45,'2014-04-03 20:48:38',1,1,1),(27,NULL,44,'2014-04-03 20:48:41',1,2,2),(28,NULL,44,'2014-04-03 20:50:05',1,2,2),(29,NULL,44,'2014-04-03 20:50:06',1,2,2),(30,NULL,44,'2014-04-03 22:21:43',1,2,2),(31,NULL,44,'2014-04-03 22:21:44',1,2,2),(32,NULL,46,'2014-04-03 22:27:42',1,1,1),(33,NULL,47,'2014-04-03 22:27:46',1,1,1),(34,NULL,48,'2014-04-03 22:27:47',1,1,1),(35,NULL,47,'2014-04-03 23:16:56',1,2,2),(36,NULL,47,'2014-04-03 23:22:00',1,2,2),(37,NULL,47,'2014-04-03 23:22:01',1,2,2),(38,NULL,47,'2014-04-03 23:22:28',1,2,2),(39,NULL,47,'2014-04-03 23:22:57',1,2,2),(40,NULL,47,'2014-04-03 23:23:18',1,2,2),(41,NULL,47,'2014-04-04 08:35:09',1,2,2),(42,NULL,47,'2014-04-04 09:16:33',1,2,2),(43,NULL,47,'2014-04-04 09:23:17',1,2,2),(44,NULL,49,'2014-04-04 10:36:31',1,1,1),(45,NULL,50,'2014-04-04 10:36:43',1,1,1),(46,NULL,51,'2014-04-04 10:36:44',1,1,1),(47,NULL,52,'2014-04-04 10:36:47',1,1,1),(48,NULL,53,'2014-04-04 10:59:02',1,1,1),(49,NULL,47,'2014-04-04 11:19:52',1,2,2),(50,NULL,47,'2014-04-04 11:21:35',1,2,2),(51,NULL,47,'2014-04-04 11:25:22',1,2,2),(52,NULL,47,'2014-04-04 11:25:23',1,2,2),(53,NULL,47,'2014-04-04 11:38:35',1,2,2),(54,NULL,47,'2014-04-04 11:38:35',1,2,2),(55,NULL,47,'2014-04-04 14:49:33',1,2,2),(56,NULL,47,'2014-04-04 14:49:33',1,2,2),(57,NULL,47,'2014-04-04 15:37:21',1,2,2),(58,NULL,47,'2014-04-04 15:37:22',1,2,2),(59,NULL,47,'2014-04-04 16:02:10',1,2,2),(60,NULL,47,'2014-04-04 16:02:11',1,2,2),(61,NULL,47,'2014-04-04 16:05:30',1,2,2),(62,NULL,47,'2014-04-04 16:05:31',1,2,2),(63,NULL,47,'2014-04-04 16:06:54',1,2,2),(64,NULL,47,'2014-04-04 16:06:54',1,2,2),(65,NULL,47,'2014-04-04 16:10:57',1,2,2),(66,NULL,47,'2014-04-04 16:10:58',1,2,2),(67,NULL,47,'2014-04-04 16:34:07',1,2,2),(68,NULL,47,'2014-04-04 16:34:08',1,2,2),(69,NULL,47,'2014-04-04 16:38:11',1,2,2),(70,NULL,47,'2014-04-04 16:38:11',1,2,2),(71,NULL,47,'2014-04-04 16:55:19',1,2,2),(72,NULL,47,'2014-04-04 16:55:20',1,2,2),(73,NULL,47,'2014-04-04 17:16:34',1,2,2),(74,NULL,47,'2014-04-04 17:16:35',1,2,2),(75,NULL,47,'2014-04-04 17:18:31',1,2,2),(76,NULL,47,'2014-04-04 17:18:32',1,2,2),(77,NULL,47,'2014-04-04 17:25:22',1,2,2),(78,NULL,47,'2014-04-04 17:25:24',1,2,2),(79,NULL,47,'2014-04-04 17:28:29',1,2,2),(80,NULL,47,'2014-04-04 17:28:30',1,2,2),(81,NULL,47,'2014-04-04 17:29:19',1,2,2),(82,NULL,47,'2014-04-04 17:29:19',1,2,2),(83,NULL,47,'2014-04-04 17:33:27',1,2,2),(84,NULL,47,'2014-04-04 17:33:27',1,2,2),(85,NULL,47,'2014-04-04 17:38:09',1,2,2),(86,NULL,47,'2014-04-04 17:38:10',1,2,2),(87,NULL,47,'2014-04-04 17:43:02',1,2,2),(88,NULL,47,'2014-04-04 17:43:02',1,2,2),(89,NULL,47,'2014-04-04 17:49:56',1,2,2),(90,NULL,47,'2014-04-04 17:49:57',1,2,2),(91,NULL,47,'2014-04-04 17:59:30',1,2,2),(92,NULL,47,'2014-04-04 17:59:30',1,2,2),(93,NULL,47,'2014-04-04 18:03:02',1,2,2),(94,NULL,47,'2014-04-04 18:03:02',1,2,2),(95,NULL,47,'2014-04-04 18:04:59',1,2,2),(96,NULL,47,'2014-04-04 18:04:59',1,2,2),(97,NULL,47,'2014-04-04 19:57:08',1,2,2),(98,NULL,47,'2014-04-04 19:59:04',1,2,2),(99,NULL,47,'2014-04-04 19:59:05',1,2,2),(100,NULL,47,'2014-04-04 20:03:53',1,2,2),(101,NULL,47,'2014-04-04 20:03:54',1,2,2),(102,NULL,47,'2014-04-04 20:04:07',1,2,2),(103,NULL,47,'2014-04-04 20:09:43',1,2,2),(104,NULL,47,'2014-04-04 20:09:43',1,2,2),(105,NULL,47,'2014-04-04 20:09:56',1,2,2),(106,NULL,47,'2014-04-04 20:11:29',1,2,2),(107,NULL,47,'2014-04-04 20:11:30',1,2,2),(108,NULL,47,'2014-04-04 20:11:37',1,2,2),(109,NULL,47,'2014-04-04 20:11:38',1,2,2),(110,NULL,47,'2014-04-04 20:12:13',1,2,2),(111,NULL,47,'2014-04-04 20:17:21',1,2,2),(112,NULL,47,'2014-04-04 20:17:23',1,2,2),(113,NULL,47,'2014-04-04 20:17:56',1,2,2),(114,NULL,47,'2014-04-04 20:18:01',1,2,2),(115,NULL,47,'2014-04-04 20:22:40',1,2,2),(116,NULL,47,'2014-04-04 20:22:40',1,2,2),(117,NULL,47,'2014-04-04 20:23:54',1,2,2),(118,NULL,47,'2014-04-04 20:23:55',1,2,2),(119,NULL,47,'2014-04-04 20:26:09',1,2,2),(120,NULL,47,'2014-04-04 20:26:15',1,2,2),(121,NULL,47,'2014-04-04 20:26:24',1,2,2),(122,NULL,47,'2014-04-04 20:27:00',1,2,2),(123,NULL,47,'2014-04-04 20:38:53',1,2,2),(124,NULL,47,'2014-04-04 20:38:55',1,2,2),(125,1,54,'2014-04-05 08:33:31',NULL,NULL,NULL),(126,NULL,55,'2014-04-05 08:35:37',NULL,NULL,NULL),(127,NULL,56,'2014-04-05 09:06:40',1,1,1),(128,NULL,57,'2014-04-05 09:07:28',1,1,1),(129,NULL,58,'2014-04-05 09:07:30',1,1,1),(130,NULL,56,'2014-04-05 09:13:45',1,2,2),(131,NULL,56,'2014-04-05 09:13:46',1,2,2),(132,NULL,56,'2014-04-05 09:15:30',1,2,2),(133,NULL,56,'2014-04-05 09:15:31',1,2,2),(134,NULL,59,'2014-04-05 10:39:38',1,1,1),(135,NULL,58,'2014-04-05 11:03:55',1,2,2),(136,NULL,58,'2014-04-05 11:03:56',1,2,2),(137,NULL,58,'2014-04-05 11:08:02',1,2,2),(138,NULL,58,'2014-04-05 11:08:02',1,2,2),(139,NULL,58,'2014-04-05 11:15:09',1,2,2),(140,NULL,58,'2014-04-05 11:15:09',1,2,2),(141,NULL,58,'2014-04-05 11:18:43',1,2,2),(142,NULL,58,'2014-04-05 11:18:43',1,2,2),(143,NULL,58,'2014-04-05 11:30:32',1,2,2),(144,NULL,58,'2014-04-05 11:30:32',1,2,2),(145,NULL,58,'2014-04-05 11:31:46',1,2,2),(146,NULL,58,'2014-04-05 11:31:48',1,2,2),(147,NULL,58,'2014-04-05 11:33:10',1,2,2),(148,NULL,58,'2014-04-05 11:33:10',1,2,2),(149,NULL,58,'2014-04-05 11:36:18',1,2,2),(150,NULL,58,'2014-04-05 11:36:18',1,2,2),(151,NULL,58,'2014-04-05 12:18:54',1,2,2),(152,NULL,58,'2014-04-05 12:18:54',1,2,2),(153,NULL,60,'2014-04-05 12:19:01',1,1,1),(154,NULL,58,'2014-04-05 12:27:53',1,2,2),(155,NULL,58,'2014-04-05 12:27:53',1,2,2),(156,NULL,58,'2014-04-05 12:28:06',1,2,2),(157,NULL,58,'2014-04-05 12:30:36',1,2,2),(158,NULL,58,'2014-04-05 12:30:54',1,2,2),(159,NULL,58,'2014-04-05 12:32:31',1,2,2),(160,NULL,58,'2014-04-05 12:55:42',1,2,2),(161,NULL,58,'2014-04-05 12:56:52',1,2,2),(162,NULL,58,'2014-04-05 13:01:18',1,2,2),(163,NULL,61,'2014-04-05 16:56:47',1,1,1),(164,NULL,62,'2014-04-05 16:56:49',1,1,1),(165,NULL,63,'2014-04-05 16:58:10',1,1,1),(166,NULL,58,'2014-04-05 17:06:19',1,2,2),(167,NULL,58,'2014-04-05 17:14:50',1,2,2),(168,NULL,58,'2014-04-05 17:14:51',1,2,2),(169,NULL,58,'2014-04-05 17:18:13',1,2,2),(170,NULL,58,'2014-04-05 17:18:14',1,2,2),(171,NULL,58,'2014-04-05 17:18:28',1,2,2),(172,NULL,58,'2014-04-05 17:18:29',1,2,2),(173,NULL,58,'2014-04-05 17:20:06',1,2,2),(174,NULL,58,'2014-04-05 17:20:07',1,2,2),(175,NULL,58,'2014-04-05 18:10:39',1,2,2),(176,NULL,58,'2014-04-05 18:10:40',1,2,2),(177,NULL,58,'2014-04-05 18:24:43',1,2,2),(178,NULL,58,'2014-04-05 18:26:02',1,2,2),(179,NULL,58,'2014-04-05 18:26:03',1,2,2),(180,NULL,58,'2014-04-05 18:49:40',1,2,2),(181,NULL,58,'2014-04-05 18:49:40',1,2,2),(182,NULL,58,'2014-04-05 18:49:49',1,2,2),(183,NULL,58,'2014-04-05 18:49:49',1,2,2),(184,NULL,58,'2014-04-05 18:51:22',1,2,2),(185,NULL,58,'2014-04-05 18:51:22',1,2,2),(186,NULL,59,'2014-04-05 18:51:31',1,2,2),(187,NULL,59,'2014-04-05 18:51:32',1,2,2),(188,NULL,58,'2014-04-05 18:51:53',1,2,2),(189,NULL,58,'2014-04-05 18:51:54',1,2,2),(190,NULL,58,'2014-04-05 18:52:33',1,2,2),(191,NULL,58,'2014-04-05 18:52:34',1,2,2),(192,NULL,58,'2014-04-05 18:53:58',1,2,2),(193,NULL,58,'2014-04-05 18:53:58',1,2,2),(194,NULL,58,'2014-04-05 18:53:59',1,2,2),(195,NULL,58,'2014-04-05 18:53:59',1,2,2),(196,NULL,58,'2014-04-05 18:54:01',1,2,2),(197,NULL,58,'2014-04-05 18:54:01',1,2,2),(198,NULL,58,'2014-04-05 18:54:03',1,2,2),(199,NULL,58,'2014-04-05 18:54:04',1,2,2),(200,NULL,58,'2014-04-05 18:54:05',1,2,2),(201,NULL,58,'2014-04-05 18:54:05',1,2,2),(202,NULL,58,'2014-04-05 18:54:06',1,2,2),(203,NULL,58,'2014-04-05 18:54:07',1,2,2),(204,NULL,58,'2014-04-05 18:54:08',1,2,2),(205,NULL,58,'2014-04-05 18:54:08',1,2,2),(206,NULL,58,'2014-04-05 18:54:10',1,2,2),(207,NULL,58,'2014-04-05 18:54:11',1,2,2),(208,NULL,58,'2014-04-05 18:54:12',1,2,2),(209,NULL,58,'2014-04-05 18:54:12',1,2,2),(210,NULL,58,'2014-04-05 18:54:14',1,2,2),(211,NULL,58,'2014-04-05 18:54:14',1,2,2),(212,NULL,58,'2014-04-05 18:59:27',1,2,2),(213,NULL,58,'2014-04-05 18:59:27',1,2,2),(214,NULL,58,'2014-04-05 19:08:43',1,2,2),(215,NULL,58,'2014-04-05 19:08:44',1,2,2),(216,NULL,58,'2014-04-05 19:09:05',1,2,2),(217,NULL,58,'2014-04-05 19:13:09',1,2,2),(218,NULL,58,'2014-04-05 19:13:09',1,2,2),(219,NULL,58,'2014-04-05 19:14:00',1,2,2),(220,NULL,58,'2014-04-05 19:35:49',1,2,2),(221,NULL,58,'2014-04-05 19:35:50',1,2,2),(222,NULL,58,'2014-04-05 19:36:56',1,2,2),(223,NULL,58,'2014-04-05 19:42:03',1,2,2),(224,NULL,58,'2014-04-05 19:42:03',1,2,2),(225,NULL,58,'2014-04-05 19:42:04',1,2,2),(226,NULL,58,'2014-04-05 19:42:05',1,2,2),(227,NULL,58,'2014-04-05 19:42:06',1,2,2),(228,NULL,58,'2014-04-05 19:42:06',1,2,2),(229,NULL,58,'2014-04-05 19:42:10',1,2,2),(230,NULL,58,'2014-04-05 19:42:10',1,2,2),(231,NULL,58,'2014-04-05 19:42:11',1,2,2),(232,NULL,58,'2014-04-05 19:42:11',1,2,2),(233,NULL,58,'2014-04-05 19:42:15',1,2,2),(234,NULL,58,'2014-04-05 19:42:16',1,2,2),(235,NULL,58,'2014-04-05 19:42:17',1,2,2),(236,NULL,58,'2014-04-05 19:42:17',1,2,2),(237,NULL,58,'2014-04-05 19:44:54',1,2,2),(238,NULL,58,'2014-04-05 19:44:54',1,2,2),(239,NULL,58,'2014-04-05 19:51:59',1,2,2),(240,NULL,58,'2014-04-05 19:52:00',1,2,2),(241,NULL,58,'2014-04-05 19:58:30',1,2,2),(242,NULL,58,'2014-04-05 19:58:31',1,2,2),(243,NULL,58,'2014-04-05 20:00:40',1,2,2),(244,NULL,58,'2014-04-05 20:00:41',1,2,2),(245,NULL,58,'2014-04-05 20:02:06',1,2,2),(246,NULL,58,'2014-04-05 20:02:06',1,2,2),(247,NULL,58,'2014-04-05 20:03:00',1,2,2),(248,NULL,58,'2014-04-05 20:03:00',1,2,2),(249,NULL,58,'2014-04-05 20:04:37',1,2,2),(250,NULL,58,'2014-04-05 20:04:38',1,2,2),(251,NULL,58,'2014-04-05 20:08:09',1,2,2),(252,NULL,58,'2014-04-05 20:08:09',1,2,2),(253,NULL,58,'2014-04-05 20:16:33',1,2,2),(254,NULL,58,'2014-04-05 20:21:59',1,2,2),(255,NULL,58,'2014-04-05 20:37:00',1,2,2),(256,NULL,58,'2014-04-05 20:37:00',1,2,2),(257,NULL,58,'2014-04-05 20:38:57',1,2,2),(258,NULL,58,'2014-04-05 20:42:00',1,2,2),(259,NULL,58,'2014-04-05 20:47:05',1,2,2),(260,NULL,58,'2014-04-05 20:47:05',1,2,2),(261,NULL,58,'2014-04-05 20:48:06',1,2,2),(262,NULL,58,'2014-04-05 20:48:07',1,2,2),(263,NULL,58,'2014-04-05 20:48:41',1,2,2),(264,NULL,58,'2014-04-05 20:48:42',1,2,2),(265,NULL,58,'2014-04-05 20:54:56',1,2,2),(266,NULL,58,'2014-04-05 20:54:56',1,2,2),(267,NULL,58,'2014-04-05 20:55:35',1,2,2),(268,NULL,58,'2014-04-05 20:55:35',1,2,2),(269,NULL,58,'2014-04-05 21:01:30',1,2,2),(270,NULL,58,'2014-04-05 21:01:30',1,2,2),(271,NULL,58,'2014-04-05 22:47:08',1,2,2),(272,NULL,58,'2014-04-05 22:47:09',1,2,2),(273,NULL,58,'2014-04-05 22:47:54',1,2,2),(274,NULL,58,'2014-04-05 22:48:03',1,2,2),(275,NULL,58,'2014-04-05 22:48:04',1,2,2),(276,NULL,58,'2014-04-05 22:48:51',1,2,2),(277,NULL,58,'2014-04-05 22:49:19',1,2,2),(278,NULL,58,'2014-04-05 22:49:19',1,2,2),(279,NULL,58,'2014-04-05 22:51:03',1,2,2),(280,NULL,58,'2014-04-05 22:53:31',1,2,2),(281,NULL,58,'2014-04-05 22:53:40',1,2,2),(282,NULL,58,'2014-04-05 22:54:11',1,2,2),(283,NULL,58,'2014-04-05 22:54:11',1,2,2),(284,NULL,58,'2014-04-05 22:54:55',1,2,2),(285,NULL,58,'2014-04-05 22:56:50',1,2,2),(286,NULL,58,'2014-04-05 22:56:50',1,2,2),(287,NULL,58,'2014-04-05 23:00:14',1,2,2),(288,NULL,58,'2014-04-05 23:21:21',1,2,2),(289,NULL,58,'2014-04-05 23:21:22',1,2,2),(290,NULL,58,'2014-04-05 23:22:33',1,2,2),(291,NULL,58,'2014-04-05 23:22:33',1,2,2),(292,NULL,58,'2014-04-05 23:22:59',1,2,2),(293,NULL,58,'2014-04-05 23:40:03',1,2,2),(294,NULL,58,'2014-04-05 23:40:04',1,2,2),(295,NULL,58,'2014-04-05 23:40:38',1,2,2),(296,NULL,58,'2014-04-05 23:40:51',1,2,2),(297,NULL,58,'2014-04-05 23:40:51',1,2,2),(298,NULL,64,'2014-04-05 23:44:02',1,1,1),(299,NULL,64,'2014-04-05 23:44:05',1,2,2),(300,NULL,64,'2014-04-05 23:44:05',1,2,2),(301,NULL,64,'2014-04-05 23:44:59',1,2,2),(302,NULL,58,'2014-04-05 23:45:08',1,2,2),(303,NULL,58,'2014-04-05 23:45:09',1,2,2),(304,NULL,58,'2014-04-06 00:18:58',1,2,2),(305,NULL,58,'2014-04-06 00:18:58',1,2,2),(306,NULL,58,'2014-04-06 00:21:32',1,2,2),(307,NULL,58,'2014-04-06 00:21:32',1,2,2),(308,NULL,58,'2014-04-06 00:21:50',1,2,2),(309,NULL,58,'2014-04-06 00:25:33',1,2,2),(310,NULL,58,'2014-04-06 00:25:34',1,2,2),(311,NULL,58,'2014-04-06 00:25:47',1,2,2),(312,NULL,58,'2014-04-06 00:26:48',1,2,2),(313,NULL,58,'2014-04-06 00:28:56',1,2,2),(314,NULL,58,'2014-04-06 00:28:56',1,2,2),(315,NULL,58,'2014-04-06 08:00:17',1,2,2),(316,NULL,58,'2014-04-06 08:02:22',1,2,2),(317,NULL,58,'2014-04-06 08:02:22',1,2,2),(318,NULL,58,'2014-04-06 08:03:03',1,2,2),(319,NULL,58,'2014-04-06 08:33:15',1,2,2),(320,NULL,58,'2014-04-06 08:33:16',1,2,2),(321,NULL,58,'2014-04-06 08:33:27',1,2,2),(322,NULL,58,'2014-04-06 08:39:51',1,2,2),(323,NULL,58,'2014-04-06 08:41:28',1,2,2),(324,NULL,58,'2014-04-06 08:52:55',1,2,2),(325,NULL,58,'2014-04-06 08:55:35',1,2,2),(326,NULL,58,'2014-04-06 08:55:35',1,2,2),(327,NULL,58,'2014-04-06 08:59:25',1,2,2),(328,NULL,58,'2014-04-06 08:59:25',1,2,2),(329,NULL,58,'2014-04-06 09:00:32',1,2,2),(330,NULL,58,'2014-04-06 09:00:33',1,2,2),(331,NULL,58,'2014-04-06 09:01:13',1,2,2),(332,NULL,58,'2014-04-06 09:01:13',1,2,2),(333,NULL,58,'2014-04-06 09:02:04',1,2,2),(334,NULL,58,'2014-04-06 09:02:05',1,2,2),(335,NULL,58,'2014-04-06 09:02:43',1,2,2),(336,NULL,58,'2014-04-06 09:02:43',1,2,2),(337,NULL,58,'2014-04-06 09:03:39',1,2,2),(338,NULL,58,'2014-04-06 09:03:40',1,2,2),(339,NULL,58,'2014-04-06 09:04:42',1,2,2),(340,NULL,58,'2014-04-06 09:04:43',1,2,2),(341,NULL,58,'2014-04-06 09:06:23',1,2,2),(342,NULL,58,'2014-04-06 09:06:24',1,2,2),(343,NULL,58,'2014-04-06 11:53:42',1,2,2),(344,NULL,58,'2014-04-06 11:53:43',1,2,2),(345,NULL,58,'2014-04-06 11:55:20',1,2,2),(346,NULL,58,'2014-04-06 11:55:20',1,2,2),(347,NULL,58,'2014-04-06 12:13:13',1,2,2),(348,NULL,58,'2014-04-06 12:13:13',1,2,2),(349,NULL,58,'2014-04-06 12:14:02',1,2,2),(350,NULL,58,'2014-04-06 12:14:03',1,2,2),(351,NULL,58,'2014-04-06 12:14:51',1,2,2),(352,NULL,58,'2014-04-06 12:14:51',1,2,2),(353,NULL,58,'2014-04-06 12:15:32',1,2,2),(354,NULL,58,'2014-04-06 12:15:33',1,2,2),(355,NULL,58,'2014-04-06 12:17:29',1,2,2),(356,NULL,58,'2014-04-06 12:17:29',1,2,2),(357,NULL,58,'2014-04-06 12:18:27',1,2,2),(358,NULL,58,'2014-04-06 12:18:28',1,2,2),(359,NULL,58,'2014-04-06 12:20:13',1,2,2),(360,NULL,58,'2014-04-06 12:20:14',1,2,2),(361,NULL,58,'2014-04-06 12:20:51',1,2,2),(362,NULL,58,'2014-04-06 12:20:51',1,2,2),(363,NULL,58,'2014-04-06 12:24:37',1,2,2),(364,NULL,58,'2014-04-06 12:24:37',1,2,2),(365,NULL,58,'2014-04-06 12:27:16',1,2,2),(366,NULL,58,'2014-04-06 12:27:16',1,2,2),(367,NULL,58,'2014-04-06 12:27:54',1,2,2),(368,NULL,58,'2014-04-06 12:27:54',1,2,2),(369,NULL,58,'2014-04-06 12:28:40',1,2,2),(370,NULL,58,'2014-04-06 12:28:40',1,2,2),(371,NULL,58,'2014-04-06 12:29:08',1,2,2),(372,NULL,58,'2014-04-06 12:29:09',1,2,2),(373,NULL,58,'2014-04-06 12:30:20',1,2,2),(374,NULL,58,'2014-04-06 12:30:20',1,2,2),(375,NULL,58,'2014-04-06 12:30:59',1,2,2),(376,NULL,58,'2014-04-06 12:31:00',1,2,2),(377,NULL,58,'2014-04-06 12:32:25',1,2,2),(378,NULL,58,'2014-04-06 12:32:26',1,2,2),(379,NULL,58,'2014-04-06 12:33:31',1,2,2),(380,NULL,58,'2014-04-06 12:33:32',1,2,2),(381,NULL,58,'2014-04-06 12:34:05',1,2,2),(382,NULL,58,'2014-04-06 12:34:05',1,2,2),(383,NULL,58,'2014-04-06 12:35:19',1,2,2),(384,NULL,58,'2014-04-06 12:35:19',1,2,2),(385,NULL,58,'2014-04-06 12:36:24',1,2,2),(386,NULL,58,'2014-04-06 12:36:24',1,2,2),(387,NULL,58,'2014-04-06 12:49:29',1,2,2),(388,NULL,58,'2014-04-06 12:49:30',1,2,2),(389,NULL,58,'2014-04-06 12:51:02',1,2,2),(390,NULL,58,'2014-04-06 12:51:02',1,2,2),(391,NULL,58,'2014-04-06 12:52:19',1,2,2),(392,NULL,58,'2014-04-06 12:52:19',1,2,2),(393,NULL,58,'2014-04-06 12:54:24',1,2,2),(394,NULL,58,'2014-04-06 12:54:24',1,2,2),(395,NULL,58,'2014-04-06 12:55:28',1,2,2),(396,NULL,58,'2014-04-06 12:55:29',1,2,2),(397,NULL,58,'2014-04-06 12:58:41',1,2,2),(398,NULL,58,'2014-04-06 12:58:41',1,2,2),(399,NULL,58,'2014-04-06 13:00:25',1,2,2),(400,NULL,58,'2014-04-06 13:00:26',1,2,2),(401,NULL,58,'2014-04-06 13:01:14',1,2,2),(402,NULL,58,'2014-04-06 13:01:15',1,2,2),(403,NULL,58,'2014-04-06 13:02:44',1,2,2),(404,NULL,58,'2014-04-06 13:02:45',1,2,2),(405,NULL,58,'2014-04-06 13:04:57',1,2,2),(406,NULL,58,'2014-04-06 13:04:58',1,2,2),(407,NULL,58,'2014-04-06 13:07:26',1,2,2),(408,NULL,58,'2014-04-06 13:07:26',1,2,2),(409,NULL,58,'2014-04-06 13:08:35',1,2,2),(410,NULL,58,'2014-04-06 13:08:35',1,2,2),(411,NULL,58,'2014-04-06 13:09:45',1,2,2),(412,NULL,58,'2014-04-06 13:09:46',1,2,2),(413,NULL,58,'2014-04-06 13:11:34',1,2,2),(414,NULL,58,'2014-04-06 13:11:34',1,2,2),(415,NULL,58,'2014-04-06 13:13:17',1,2,2),(416,NULL,58,'2014-04-06 13:13:18',1,2,2),(417,NULL,58,'2014-04-06 13:13:53',1,2,2),(418,NULL,58,'2014-04-06 13:13:53',1,2,2),(419,NULL,58,'2014-04-06 13:14:23',1,2,2),(420,NULL,58,'2014-04-06 13:14:23',1,2,2),(421,NULL,58,'2014-04-06 13:15:32',1,2,2),(422,NULL,58,'2014-04-06 13:15:32',1,2,2),(423,NULL,58,'2014-04-06 13:16:23',1,2,2),(424,NULL,58,'2014-04-06 13:16:24',1,2,2),(425,NULL,58,'2014-04-06 13:17:40',1,2,2),(426,NULL,58,'2014-04-06 13:17:41',1,2,2),(427,NULL,58,'2014-04-06 13:18:41',1,2,2),(428,NULL,58,'2014-04-06 13:18:42',1,2,2),(429,NULL,58,'2014-04-06 13:22:00',1,2,2),(430,NULL,58,'2014-04-06 13:22:01',1,2,2),(431,NULL,58,'2014-04-06 13:32:57',1,2,2),(432,NULL,58,'2014-04-06 13:32:58',1,2,2),(433,NULL,58,'2014-04-06 13:34:33',1,2,2),(434,NULL,58,'2014-04-06 13:34:33',1,2,2),(435,NULL,58,'2014-04-06 13:35:27',1,2,2),(436,NULL,58,'2014-04-06 13:35:27',1,2,2),(437,NULL,58,'2014-04-06 13:36:24',1,2,2),(438,NULL,58,'2014-04-06 13:36:24',1,2,2),(439,NULL,58,'2014-04-06 13:37:18',1,2,2),(440,NULL,58,'2014-04-06 13:37:18',1,2,2),(441,NULL,58,'2014-04-06 13:46:53',1,2,2),(442,NULL,58,'2014-04-06 13:46:53',1,2,2),(443,NULL,58,'2014-04-06 13:47:21',1,2,2),(444,NULL,58,'2014-04-06 13:47:22',1,2,2),(445,NULL,58,'2014-04-06 13:47:52',1,2,2),(446,NULL,58,'2014-04-06 13:47:52',1,2,2),(447,NULL,58,'2014-04-06 13:48:57',1,2,2),(448,NULL,58,'2014-04-06 13:48:57',1,2,2),(449,NULL,58,'2014-04-06 15:00:16',1,2,2),(450,NULL,58,'2014-04-06 15:00:16',1,2,2),(451,NULL,58,'2014-04-06 15:05:14',1,2,2),(452,NULL,58,'2014-04-06 15:05:15',1,2,2),(453,NULL,58,'2014-04-06 15:09:08',1,2,2),(454,NULL,58,'2014-04-06 15:09:09',1,2,2),(455,NULL,58,'2014-04-06 15:09:58',1,2,2),(456,NULL,58,'2014-04-06 15:09:59',1,2,2),(457,NULL,58,'2014-04-06 15:14:49',1,2,2),(458,NULL,58,'2014-04-06 15:14:50',1,2,2),(459,NULL,58,'2014-04-06 15:16:44',1,2,2),(460,NULL,58,'2014-04-06 15:16:45',1,2,2),(461,NULL,58,'2014-04-06 15:20:08',1,2,2),(462,NULL,58,'2014-04-06 15:20:09',1,2,2),(463,NULL,58,'2014-04-06 17:31:00',1,2,2),(464,NULL,58,'2014-04-06 17:31:00',1,2,2),(465,NULL,58,'2014-04-06 17:39:59',1,2,2),(466,NULL,58,'2014-04-06 17:39:59',1,2,2),(467,NULL,58,'2014-04-06 17:45:43',1,2,2),(468,NULL,58,'2014-04-06 17:45:44',1,2,2),(469,NULL,58,'2014-04-06 17:55:03',1,2,2),(470,NULL,58,'2014-04-06 17:55:03',1,2,2),(471,NULL,58,'2014-04-06 18:01:40',1,2,2),(472,NULL,58,'2014-04-06 18:01:40',1,2,2),(473,NULL,58,'2014-04-06 18:02:47',1,2,2),(474,NULL,58,'2014-04-06 18:02:48',1,2,2),(475,NULL,58,'2014-04-06 18:03:28',1,2,2),(476,NULL,58,'2014-04-06 18:03:28',1,2,2),(477,NULL,58,'2014-04-06 18:04:54',1,2,2),(478,NULL,58,'2014-04-06 18:04:54',1,2,2),(479,NULL,58,'2014-04-06 18:07:48',1,2,2),(480,NULL,58,'2014-04-06 18:07:48',1,2,2),(481,NULL,58,'2014-04-06 18:16:29',1,2,2),(482,NULL,58,'2014-04-06 18:16:29',1,2,2),(483,NULL,58,'2014-04-06 18:17:13',1,2,2),(484,NULL,58,'2014-04-06 18:17:14',1,2,2),(485,NULL,58,'2014-04-06 18:20:04',1,2,2),(486,NULL,58,'2014-04-06 18:20:04',1,2,2),(487,NULL,58,'2014-04-06 18:25:46',1,2,2),(488,NULL,58,'2014-04-06 18:25:47',1,2,2),(489,NULL,58,'2014-04-06 18:28:44',1,2,2),(490,NULL,58,'2014-04-06 18:28:44',1,2,2),(491,NULL,58,'2014-04-06 18:29:00',1,2,2),(492,NULL,58,'2014-04-06 18:29:01',1,2,2),(493,NULL,58,'2014-04-06 18:29:42',1,2,2),(494,NULL,58,'2014-04-06 18:29:42',1,2,2),(495,NULL,58,'2014-04-06 18:30:50',1,2,2),(496,NULL,58,'2014-04-06 18:30:51',1,2,2),(497,NULL,58,'2014-04-06 18:32:33',1,2,2),(498,NULL,58,'2014-04-06 18:32:34',1,2,2),(499,NULL,58,'2014-04-06 18:33:16',1,2,2),(500,NULL,58,'2014-04-06 18:33:17',1,2,2),(501,NULL,58,'2014-04-06 18:34:21',1,2,2),(502,NULL,58,'2014-04-06 18:34:21',1,2,2),(503,NULL,58,'2014-04-06 18:34:47',1,2,2),(504,NULL,58,'2014-04-06 18:34:47',1,2,2),(505,NULL,58,'2014-04-06 18:35:08',1,2,2),(506,NULL,58,'2014-04-06 18:35:09',1,2,2),(507,NULL,58,'2014-04-06 18:35:48',1,2,2),(508,NULL,58,'2014-04-06 18:35:48',1,2,2),(509,NULL,58,'2014-04-06 18:36:04',1,2,2),(510,NULL,58,'2014-04-06 18:36:05',1,2,2),(511,NULL,58,'2014-04-06 18:36:38',1,2,2),(512,NULL,58,'2014-04-06 18:36:38',1,2,2),(513,NULL,58,'2014-04-06 18:37:13',1,2,2),(514,NULL,58,'2014-04-06 18:37:14',1,2,2),(515,NULL,58,'2014-04-06 18:38:16',1,2,2),(516,NULL,58,'2014-04-06 18:38:17',1,2,2),(517,NULL,58,'2014-04-06 18:39:53',1,2,2),(518,NULL,58,'2014-04-06 18:39:54',1,2,2),(519,NULL,58,'2014-04-06 18:40:53',1,2,2),(520,NULL,58,'2014-04-06 18:40:54',1,2,2),(521,NULL,58,'2014-04-06 18:43:56',1,2,2),(522,NULL,58,'2014-04-06 18:43:56',1,2,2),(523,NULL,58,'2014-04-06 18:44:27',1,2,2),(524,NULL,58,'2014-04-06 18:44:27',1,2,2),(525,NULL,58,'2014-04-06 18:45:18',1,2,2),(526,NULL,58,'2014-04-06 18:45:18',1,2,2),(527,NULL,58,'2014-04-06 18:45:36',1,2,2),(528,NULL,58,'2014-04-06 18:45:36',1,2,2),(529,NULL,58,'2014-04-06 18:51:41',1,2,2),(530,NULL,58,'2014-04-06 18:51:41',1,2,2),(531,NULL,58,'2014-04-06 18:53:53',1,2,2),(532,NULL,58,'2014-04-06 18:53:54',1,2,2),(533,NULL,58,'2014-04-06 18:56:59',1,2,2),(534,NULL,58,'2014-04-06 18:56:59',1,2,2),(535,NULL,58,'2014-04-06 18:57:58',1,2,2),(536,NULL,58,'2014-04-06 18:57:59',1,2,2),(537,NULL,58,'2014-04-06 18:58:32',1,2,2),(538,NULL,58,'2014-04-06 18:59:15',1,2,2),(539,NULL,58,'2014-04-06 19:00:20',1,2,2),(540,NULL,58,'2014-04-06 19:03:24',1,2,2),(541,NULL,58,'2014-04-06 19:03:24',1,2,2),(542,NULL,58,'2014-04-06 19:04:42',1,2,2),(543,NULL,58,'2014-04-06 19:04:42',1,2,2),(544,NULL,58,'2014-04-06 19:08:15',1,2,2),(545,NULL,58,'2014-04-06 19:08:16',1,2,2),(546,NULL,58,'2014-04-06 19:08:33',1,2,2),(547,NULL,58,'2014-04-06 19:08:46',1,2,2),(548,NULL,58,'2014-04-06 19:08:47',1,2,2),(549,NULL,58,'2014-04-06 19:09:21',1,2,2),(550,NULL,58,'2014-04-06 19:09:24',1,2,2),(551,NULL,58,'2014-04-06 19:09:24',1,2,2),(552,NULL,58,'2014-04-06 19:09:58',1,2,2),(553,NULL,58,'2014-04-06 19:10:13',1,2,2),(554,NULL,58,'2014-04-06 19:10:13',1,2,2),(555,NULL,58,'2014-04-06 19:10:29',1,2,2),(556,NULL,58,'2014-04-06 19:10:35',1,2,2),(557,NULL,58,'2014-04-06 19:10:35',1,2,2),(558,NULL,58,'2014-04-06 19:10:44',1,2,2),(559,NULL,58,'2014-04-06 19:10:45',1,2,2),(560,NULL,58,'2014-04-06 19:19:00',1,2,2),(561,NULL,58,'2014-04-06 19:19:01',1,2,2),(562,NULL,58,'2014-04-06 19:20:17',1,2,2),(563,NULL,58,'2014-04-06 19:22:58',1,2,2),(564,NULL,58,'2014-04-06 19:22:59',1,2,2),(565,NULL,58,'2014-04-06 19:23:27',1,2,2),(566,NULL,58,'2014-04-06 19:23:33',1,2,2),(567,NULL,58,'2014-04-06 19:23:34',1,2,2),(568,NULL,58,'2014-04-06 19:23:47',1,2,2),(569,NULL,58,'2014-04-06 19:23:54',1,2,2),(570,NULL,58,'2014-04-06 19:23:54',1,2,2),(571,NULL,58,'2014-04-06 19:24:10',1,2,2),(572,NULL,58,'2014-04-06 19:24:10',1,2,2),(573,NULL,58,'2014-04-06 19:24:31',1,2,2),(574,NULL,58,'2014-04-06 19:24:39',1,2,2),(575,NULL,58,'2014-04-06 19:24:39',1,2,2),(576,NULL,58,'2014-04-06 19:28:28',1,2,2),(577,NULL,58,'2014-04-06 19:28:29',1,2,2),(578,NULL,58,'2014-04-06 19:28:40',1,2,2),(579,NULL,58,'2014-04-06 19:28:48',1,2,2),(580,NULL,58,'2014-04-06 19:28:48',1,2,2),(581,NULL,58,'2014-04-06 19:29:02',1,2,2),(582,NULL,58,'2014-04-06 19:29:11',1,2,2),(583,NULL,58,'2014-04-06 19:29:11',1,2,2),(584,NULL,58,'2014-04-06 19:31:14',1,2,2),(585,NULL,58,'2014-04-06 19:31:14',1,2,2),(586,NULL,58,'2014-04-06 19:37:35',1,2,2),(587,NULL,58,'2014-04-06 19:37:35',1,2,2),(588,NULL,58,'2014-04-06 19:38:11',1,2,2),(589,NULL,58,'2014-04-06 19:38:18',1,2,2),(590,NULL,58,'2014-04-06 19:38:18',1,2,2),(591,NULL,58,'2014-04-06 19:38:32',1,2,2),(592,NULL,58,'2014-04-06 19:38:35',1,2,2),(593,NULL,58,'2014-04-06 19:38:35',1,2,2),(594,NULL,58,'2014-04-06 19:43:17',1,2,2),(595,NULL,58,'2014-04-06 19:43:26',1,2,2),(596,NULL,58,'2014-04-06 19:43:26',1,2,2),(597,NULL,58,'2014-04-06 19:43:43',1,2,2),(598,NULL,58,'2014-04-06 19:43:48',1,2,2),(599,NULL,58,'2014-04-06 19:43:48',1,2,2),(600,NULL,58,'2014-04-06 19:44:27',1,2,2),(601,NULL,58,'2014-04-06 19:44:31',1,2,2),(602,NULL,58,'2014-04-06 19:44:31',1,2,2),(603,NULL,58,'2014-04-06 19:46:18',1,2,2),(604,NULL,58,'2014-04-06 19:46:18',1,2,2),(605,NULL,58,'2014-04-06 19:46:31',1,2,2),(606,NULL,58,'2014-04-06 19:46:36',1,2,2),(607,NULL,58,'2014-04-06 19:46:36',1,2,2),(608,NULL,58,'2014-04-06 19:57:49',1,2,2),(609,NULL,58,'2014-04-06 19:57:50',1,2,2),(610,NULL,58,'2014-04-06 20:00:03',1,2,2),(611,NULL,58,'2014-04-06 20:00:22',1,2,2),(612,NULL,58,'2014-04-06 20:02:18',1,2,2),(613,NULL,58,'2014-04-06 20:02:18',1,2,2),(614,NULL,58,'2014-04-06 20:05:00',1,2,2),(615,NULL,58,'2014-04-06 20:05:01',1,2,2),(616,NULL,58,'2014-04-06 20:05:14',1,2,2),(617,NULL,58,'2014-04-06 20:07:04',1,2,2),(618,NULL,58,'2014-04-06 20:07:07',1,2,2),(619,NULL,58,'2014-04-06 20:07:08',1,2,2),(620,NULL,58,'2014-04-06 20:09:32',1,2,2),(621,NULL,58,'2014-04-06 20:09:33',1,2,2),(622,NULL,58,'2014-04-06 20:09:44',1,2,2),(623,NULL,58,'2014-04-06 20:10:24',1,2,2),(624,NULL,58,'2014-04-06 20:10:29',1,2,2),(625,NULL,58,'2014-04-06 20:10:29',1,2,2),(626,NULL,58,'2014-04-06 20:11:09',1,2,2),(627,NULL,58,'2014-04-06 20:13:19',1,2,2),(628,NULL,58,'2014-04-06 20:13:19',1,2,2),(629,NULL,58,'2014-04-06 20:13:22',1,2,2),(630,NULL,58,'2014-04-06 20:13:39',1,2,2),(631,NULL,58,'2014-04-06 20:15:01',1,2,2),(632,NULL,58,'2014-04-06 20:15:28',1,2,2),(633,NULL,58,'2014-04-06 20:15:28',1,2,2),(634,NULL,58,'2014-04-06 20:26:17',1,2,2),(635,NULL,58,'2014-04-06 20:26:22',1,2,2),(636,NULL,58,'2014-04-06 20:27:06',1,2,2),(637,NULL,58,'2014-04-06 20:31:20',1,2,2),(638,NULL,58,'2014-04-06 20:31:20',1,2,2),(639,NULL,58,'2014-04-06 20:32:18',1,2,2),(640,NULL,58,'2014-04-06 20:32:18',1,2,2),(641,NULL,58,'2014-04-06 20:32:52',1,2,2),(642,NULL,58,'2014-04-06 20:33:00',1,2,2),(643,NULL,58,'2014-04-06 20:33:00',1,2,2),(644,NULL,58,'2014-04-06 20:33:18',1,2,2),(645,NULL,58,'2014-04-06 20:33:33',1,2,2),(646,NULL,58,'2014-04-06 20:33:33',1,2,2),(647,NULL,58,'2014-04-06 21:08:11',1,2,2),(648,NULL,58,'2014-04-06 21:09:56',1,2,2),(649,NULL,58,'2014-04-06 21:10:19',1,2,2),(650,NULL,58,'2014-04-06 21:11:16',1,2,2),(651,NULL,58,'2014-04-06 21:11:17',1,2,2),(652,NULL,58,'2014-04-06 21:12:49',1,2,2),(653,NULL,58,'2014-04-06 21:12:50',1,2,2),(654,NULL,58,'2014-04-06 21:13:08',1,2,2),(655,NULL,58,'2014-04-06 21:13:12',1,2,2),(656,NULL,58,'2014-04-06 21:13:12',1,2,2),(657,NULL,58,'2014-04-06 21:14:59',1,2,2),(658,NULL,58,'2014-04-06 21:15:00',1,2,2),(659,NULL,58,'2014-04-06 21:15:13',1,2,2),(660,NULL,58,'2014-04-06 21:15:18',1,2,2),(661,NULL,58,'2014-04-06 21:15:19',1,2,2),(662,NULL,58,'2014-04-06 21:15:49',1,2,2),(663,NULL,58,'2014-04-06 21:15:55',1,2,2),(664,NULL,58,'2014-04-06 21:15:56',1,2,2),(665,NULL,58,'2014-04-06 21:16:16',1,2,2),(666,NULL,58,'2014-04-06 21:16:22',1,2,2),(667,NULL,58,'2014-04-06 21:16:22',1,2,2),(668,NULL,58,'2014-04-06 21:17:36',1,2,2),(669,NULL,58,'2014-04-06 21:17:36',1,2,2),(670,NULL,58,'2014-04-06 21:17:49',1,2,2),(671,NULL,58,'2014-04-06 21:17:55',1,2,2),(672,NULL,58,'2014-04-06 21:17:55',1,2,2),(673,NULL,58,'2014-04-06 21:18:09',1,2,2),(674,NULL,58,'2014-04-06 21:18:14',1,2,2),(675,NULL,58,'2014-04-06 21:18:14',1,2,2),(676,NULL,58,'2014-04-06 21:20:42',1,2,2),(677,NULL,58,'2014-04-06 21:20:49',1,2,2),(678,NULL,58,'2014-04-06 21:20:50',1,2,2),(679,NULL,58,'2014-04-06 21:30:30',1,2,2),(680,NULL,58,'2014-04-06 21:30:30',1,2,2),(681,NULL,58,'2014-04-06 21:30:40',1,2,2),(682,NULL,58,'2014-04-06 21:30:47',1,2,2),(683,NULL,58,'2014-04-06 21:30:47',1,2,2),(684,NULL,58,'2014-04-06 22:12:32',1,2,2),(685,NULL,58,'2014-04-06 22:12:32',1,2,2),(686,NULL,58,'2014-04-06 22:14:13',1,2,2),(687,NULL,58,'2014-04-06 22:14:13',1,2,2),(688,NULL,58,'2014-04-06 22:14:25',1,2,2),(689,NULL,58,'2014-04-06 22:16:01',1,2,2),(690,NULL,58,'2014-04-06 22:16:02',1,2,2),(691,NULL,58,'2014-04-06 22:17:40',1,2,2),(692,NULL,58,'2014-04-06 22:17:40',1,2,2),(693,NULL,58,'2014-04-06 22:19:05',1,2,2),(694,NULL,58,'2014-04-06 22:19:06',1,2,2),(695,NULL,58,'2014-04-06 22:19:31',1,2,2),(696,NULL,58,'2014-04-06 22:20:34',1,2,2),(697,NULL,58,'2014-04-06 22:20:38',1,2,2),(698,NULL,58,'2014-04-06 22:20:38',1,2,2),(699,NULL,58,'2014-04-06 22:22:24',1,2,2),(700,NULL,58,'2014-04-06 22:22:27',1,2,2),(701,NULL,58,'2014-04-06 22:22:28',1,2,2),(702,NULL,58,'2014-04-06 22:23:09',1,2,2),(703,NULL,58,'2014-04-06 22:23:10',1,2,2),(704,NULL,58,'2014-04-06 22:24:46',1,2,2),(705,NULL,58,'2014-04-06 22:24:47',1,2,2),(706,NULL,58,'2014-04-06 22:25:42',1,2,2),(707,NULL,58,'2014-04-06 22:25:46',1,2,2),(708,NULL,58,'2014-04-06 22:25:46',1,2,2),(709,NULL,58,'2014-04-06 22:27:05',1,2,2),(710,NULL,58,'2014-04-06 22:27:23',1,2,2),(711,NULL,58,'2014-04-06 22:27:23',1,2,2),(712,NULL,58,'2014-04-06 22:30:36',1,2,2),(713,NULL,58,'2014-04-06 22:30:36',1,2,2),(714,NULL,58,'2014-04-06 22:30:45',1,2,2),(715,NULL,58,'2014-04-06 22:30:50',1,2,2),(716,NULL,58,'2014-04-06 22:30:50',1,2,2),(717,NULL,58,'2014-04-06 22:32:10',1,2,2),(718,NULL,58,'2014-04-06 22:32:10',1,2,2),(719,NULL,58,'2014-04-06 22:34:42',1,2,2),(720,NULL,58,'2014-04-06 22:34:42',1,2,2),(721,NULL,58,'2014-04-06 22:36:01',1,2,2),(722,NULL,58,'2014-04-06 22:36:01',1,2,2),(723,NULL,58,'2014-04-06 22:37:04',1,2,2),(724,NULL,58,'2014-04-06 22:37:05',1,2,2),(725,NULL,58,'2014-04-06 22:38:21',1,2,2),(726,NULL,58,'2014-04-06 22:38:22',1,2,2),(727,NULL,58,'2014-04-06 22:39:10',1,2,2),(728,NULL,58,'2014-04-06 22:39:11',1,2,2),(729,NULL,58,'2014-04-06 22:39:29',1,2,2),(730,NULL,58,'2014-04-06 22:40:40',1,2,2),(731,NULL,58,'2014-04-06 22:41:23',1,2,2),(732,NULL,58,'2014-04-06 22:41:24',1,2,2),(733,NULL,58,'2014-04-06 22:42:06',1,2,2),(734,NULL,58,'2014-04-06 22:42:06',1,2,2),(735,NULL,58,'2014-04-06 22:44:46',1,2,2),(736,NULL,58,'2014-04-06 22:44:46',1,2,2),(737,NULL,58,'2014-04-06 22:45:18',1,2,2),(738,NULL,58,'2014-04-06 22:45:19',1,2,2),(739,NULL,58,'2014-04-06 22:48:21',1,2,2),(740,NULL,58,'2014-04-06 22:48:21',1,2,2),(741,NULL,58,'2014-04-06 22:49:30',1,2,2),(742,NULL,58,'2014-04-06 22:49:31',1,2,2),(743,NULL,58,'2014-04-06 22:50:15',1,2,2),(744,NULL,58,'2014-04-06 22:50:15',1,2,2),(745,NULL,58,'2014-04-06 22:51:51',1,2,2),(746,NULL,58,'2014-04-06 22:51:52',1,2,2),(747,NULL,58,'2014-04-06 22:54:08',1,2,2),(748,NULL,58,'2014-04-06 22:54:09',1,2,2),(749,NULL,58,'2014-04-06 22:55:22',1,2,2),(750,NULL,58,'2014-04-06 22:55:22',1,2,2),(751,NULL,58,'2014-04-06 22:59:19',1,2,2),(752,NULL,58,'2014-04-06 22:59:19',1,2,2),(753,NULL,58,'2014-04-06 23:00:11',1,2,2),(754,NULL,58,'2014-04-06 23:00:12',1,2,2),(755,NULL,58,'2014-04-06 23:00:48',1,2,2),(756,NULL,58,'2014-04-06 23:00:48',1,2,2),(757,NULL,58,'2014-04-06 23:01:16',1,2,2),(758,NULL,58,'2014-04-06 23:01:17',1,2,2),(759,NULL,58,'2014-04-06 23:02:06',1,2,2),(760,NULL,58,'2014-04-06 23:02:07',1,2,2),(761,NULL,58,'2014-04-06 23:02:40',1,2,2),(762,NULL,58,'2014-04-06 23:02:41',1,2,2),(763,NULL,58,'2014-04-06 23:05:36',1,2,2),(764,NULL,58,'2014-04-06 23:05:37',1,2,2),(765,NULL,58,'2014-04-06 23:06:00',1,2,2),(766,NULL,58,'2014-04-06 23:56:16',1,2,2),(767,NULL,58,'2014-04-06 23:56:16',1,2,2),(768,NULL,58,'2014-04-06 23:56:42',1,2,2),(769,NULL,58,'2014-04-06 23:56:43',1,2,2),(770,NULL,58,'2014-04-06 23:57:27',1,2,2),(771,NULL,58,'2014-04-06 23:57:27',1,2,2),(772,NULL,58,'2014-04-07 00:00:24',1,2,2),(773,NULL,58,'2014-04-07 00:02:53',1,2,2),(774,NULL,58,'2014-04-07 00:03:36',1,2,2),(775,NULL,58,'2014-04-07 00:03:41',1,2,2),(776,NULL,58,'2014-04-07 00:03:41',1,2,2),(777,NULL,58,'2014-04-07 00:04:16',1,2,2),(778,NULL,58,'2014-04-07 00:04:33',1,2,2),(779,NULL,58,'2014-04-07 00:04:33',1,2,2),(780,NULL,58,'2014-04-07 00:05:08',1,2,2),(781,NULL,58,'2014-04-07 00:05:52',1,2,2),(782,NULL,58,'2014-04-07 00:05:52',1,2,2),(783,NULL,58,'2014-04-07 00:05:55',1,2,2),(784,NULL,58,'2014-04-07 00:07:14',1,2,2),(785,NULL,58,'2014-04-07 00:07:52',1,2,2),(786,NULL,58,'2014-04-07 00:09:52',1,2,2),(787,NULL,58,'2014-04-07 00:09:52',1,2,2),(788,NULL,58,'2014-04-07 00:10:49',1,2,2),(789,NULL,58,'2014-04-07 00:10:50',1,2,2),(790,NULL,58,'2014-04-07 00:18:09',1,2,2),(791,NULL,58,'2014-04-07 00:18:10',1,2,2),(792,NULL,58,'2014-04-07 00:18:14',1,2,2),(793,NULL,58,'2014-04-07 00:18:30',1,2,2),(794,NULL,58,'2014-04-07 00:18:58',1,2,2),(795,NULL,58,'2014-04-07 00:20:17',1,2,2),(796,NULL,58,'2014-04-07 00:20:17',1,2,2),(797,NULL,58,'2014-04-07 00:20:40',1,2,2),(798,NULL,58,'2014-04-07 00:20:40',1,2,2),(799,NULL,58,'2014-04-07 00:22:11',1,2,2),(800,NULL,58,'2014-04-07 00:22:11',1,2,2),(801,NULL,58,'2014-04-07 00:23:30',1,2,2),(802,NULL,58,'2014-04-07 00:23:30',1,2,2),(803,NULL,58,'2014-04-07 00:24:18',1,2,2),(804,NULL,58,'2014-04-07 00:24:19',1,2,2),(805,NULL,58,'2014-04-07 00:25:26',1,2,2),(806,NULL,58,'2014-04-07 00:25:26',1,2,2),(807,NULL,58,'2014-04-07 00:28:45',1,2,2),(808,NULL,58,'2014-04-07 00:28:45',1,2,2),(809,NULL,58,'2014-04-07 00:30:49',1,2,2),(810,NULL,58,'2014-04-07 00:30:49',1,2,2),(811,NULL,58,'2014-04-07 00:33:17',1,2,2),(812,NULL,58,'2014-04-07 00:33:41',1,2,2),(813,NULL,58,'2014-04-07 00:35:38',1,2,2),(814,NULL,58,'2014-04-07 00:35:38',1,2,2),(815,NULL,58,'2014-04-07 00:38:24',1,2,2),(816,NULL,58,'2014-04-07 00:38:25',1,2,2),(817,NULL,58,'2014-04-07 00:40:54',1,2,2),(818,NULL,58,'2014-04-07 00:40:54',1,2,2),(819,NULL,58,'2014-04-07 00:51:31',1,2,2),(820,NULL,58,'2014-04-07 00:51:32',1,2,2),(821,NULL,58,'2014-04-07 00:55:39',1,2,2),(822,NULL,58,'2014-04-07 00:55:40',1,2,2),(823,NULL,58,'2014-04-07 01:16:06',1,2,2),(824,NULL,58,'2014-04-07 01:16:06',1,2,2),(825,NULL,58,'2014-04-07 01:16:31',1,2,2),(826,NULL,58,'2014-04-07 01:16:51',1,2,2),(827,NULL,58,'2014-04-07 01:24:39',1,2,2),(828,NULL,58,'2014-04-07 01:24:41',1,2,2),(829,NULL,58,'2014-04-07 01:27:54',1,2,2),(830,NULL,58,'2014-04-07 01:27:55',1,2,2),(831,NULL,58,'2014-04-07 01:29:01',1,2,2),(832,NULL,58,'2014-04-07 01:29:01',1,2,2),(833,NULL,58,'2014-04-07 01:29:13',1,2,2),(834,NULL,58,'2014-04-07 01:30:27',1,2,2),(835,NULL,58,'2014-04-07 01:31:33',1,2,2),(836,NULL,58,'2014-04-07 01:31:34',1,2,2),(837,NULL,58,'2014-04-07 01:32:25',1,2,2),(838,NULL,58,'2014-04-07 01:32:34',1,2,2),(839,NULL,58,'2014-04-07 01:32:34',1,2,2),(840,NULL,58,'2014-04-07 01:34:40',1,2,2),(841,NULL,58,'2014-04-07 01:34:40',1,2,2),(842,NULL,58,'2014-04-07 01:35:00',1,2,2),(843,NULL,58,'2014-04-07 01:35:04',1,2,2),(844,NULL,58,'2014-04-07 01:35:04',1,2,2),(845,NULL,58,'2014-04-07 01:39:25',1,2,2),(846,NULL,58,'2014-04-07 01:39:26',1,2,2),(847,NULL,58,'2014-04-07 01:41:37',1,2,2),(848,NULL,58,'2014-04-07 01:41:37',1,2,2),(849,NULL,58,'2014-04-07 01:41:50',1,2,2),(850,NULL,58,'2014-04-07 01:42:09',1,2,2),(851,NULL,58,'2014-04-07 01:42:09',1,2,2),(852,NULL,58,'2014-04-07 01:42:59',1,2,2),(853,NULL,58,'2014-04-07 01:43:00',1,2,2),(854,NULL,58,'2014-04-07 01:43:20',1,2,2),(855,NULL,58,'2014-04-07 01:43:31',1,2,2),(856,NULL,58,'2014-04-07 01:43:31',1,2,2),(857,NULL,58,'2014-04-07 01:45:53',1,2,2),(858,NULL,58,'2014-04-07 01:45:53',1,2,2),(859,NULL,58,'2014-04-07 01:47:57',1,2,2),(860,NULL,58,'2014-04-07 01:47:58',1,2,2),(861,NULL,58,'2014-04-07 01:48:14',1,2,2),(862,NULL,58,'2014-04-07 01:48:18',1,2,2),(863,NULL,58,'2014-04-07 01:48:18',1,2,2),(864,NULL,58,'2014-04-07 01:49:41',1,2,2),(865,NULL,58,'2014-04-07 01:49:41',1,2,2),(866,NULL,58,'2014-04-07 01:50:12',1,2,2),(867,NULL,58,'2014-04-07 01:50:16',1,2,2),(868,NULL,58,'2014-04-07 01:50:17',1,2,2),(869,NULL,58,'2014-04-07 01:51:42',1,2,2),(870,NULL,58,'2014-04-07 01:51:42',1,2,2),(871,NULL,58,'2014-04-07 01:53:18',1,2,2),(872,NULL,58,'2014-04-07 01:53:22',1,2,2),(873,NULL,58,'2014-04-07 01:53:23',1,2,2),(874,NULL,58,'2014-04-07 01:54:28',1,2,2),(875,NULL,58,'2014-04-07 01:54:28',1,2,2),(876,NULL,58,'2014-04-07 01:55:39',1,2,2),(877,NULL,58,'2014-04-07 01:55:43',1,2,2),(878,NULL,58,'2014-04-07 01:55:43',1,2,2),(879,NULL,58,'2014-04-07 01:56:52',1,2,2),(880,NULL,58,'2014-04-07 01:56:52',1,2,2),(881,NULL,58,'2014-04-07 01:57:02',1,2,2),(882,NULL,58,'2014-04-07 01:57:02',1,2,2),(883,NULL,58,'2014-04-07 01:57:06',1,2,2),(884,NULL,58,'2014-04-07 01:57:13',1,2,2),(885,NULL,58,'2014-04-07 01:57:16',1,2,2),(886,NULL,58,'2014-04-07 01:57:16',1,2,2),(887,NULL,58,'2014-04-07 01:57:23',1,2,2),(888,NULL,58,'2014-04-07 01:57:23',1,2,2),(889,NULL,58,'2014-04-07 01:58:02',1,2,2),(890,NULL,58,'2014-04-07 01:58:03',1,2,2),(891,NULL,58,'2014-04-07 01:58:47',1,2,2),(892,NULL,58,'2014-04-07 01:59:28',1,2,2),(893,NULL,58,'2014-04-07 01:59:32',1,2,2),(894,NULL,58,'2014-04-07 01:59:32',1,2,2),(895,NULL,58,'2014-04-07 01:59:49',1,2,2),(896,NULL,58,'2014-04-07 01:59:58',1,2,2),(897,NULL,58,'2014-04-07 02:00:24',1,2,2),(898,NULL,58,'2014-04-07 02:00:25',1,2,2),(899,NULL,58,'2014-04-07 02:02:22',1,2,2),(900,NULL,58,'2014-04-07 02:03:57',1,2,2),(901,NULL,58,'2014-04-07 02:03:58',1,2,2),(902,NULL,58,'2014-04-07 02:10:33',1,2,2),(903,NULL,58,'2014-04-07 02:10:34',1,2,2),(904,NULL,58,'2014-04-07 02:15:00',1,2,2),(905,NULL,58,'2014-04-07 02:15:01',1,2,2),(906,NULL,58,'2014-04-07 02:17:20',1,2,2),(907,NULL,58,'2014-04-07 02:17:21',1,2,2),(908,NULL,58,'2014-04-07 02:17:56',1,2,2),(909,NULL,58,'2014-04-07 02:18:00',1,2,2),(910,NULL,58,'2014-04-07 02:18:01',1,2,2),(911,NULL,58,'2014-04-07 02:21:36',1,2,2),(912,NULL,58,'2014-04-07 02:21:36',1,2,2),(913,NULL,58,'2014-04-07 02:24:23',1,2,2),(914,NULL,58,'2014-04-07 02:24:23',1,2,2),(915,NULL,58,'2014-04-07 02:32:05',1,2,2),(916,NULL,58,'2014-04-07 02:32:05',1,2,2),(917,NULL,58,'2014-04-07 02:34:23',1,2,2),(918,NULL,58,'2014-04-07 02:34:23',1,2,2),(919,NULL,58,'2014-04-07 02:35:35',1,2,2),(920,NULL,58,'2014-04-07 02:35:35',1,2,2),(921,NULL,58,'2014-04-07 02:42:41',1,2,2),(922,NULL,58,'2014-04-07 02:42:41',1,2,2),(923,NULL,58,'2014-04-07 02:43:07',1,2,2),(924,NULL,58,'2014-04-07 02:43:07',1,2,2),(925,NULL,58,'2014-04-07 02:48:02',1,2,2),(926,NULL,58,'2014-04-07 02:48:02',1,2,2),(927,NULL,58,'2014-04-07 02:51:03',1,2,2),(928,NULL,58,'2014-04-07 02:51:04',1,2,2),(929,NULL,58,'2014-04-07 02:51:33',1,2,2),(930,NULL,58,'2014-04-07 02:52:19',1,2,2),(931,NULL,58,'2014-04-07 02:52:19',1,2,2),(932,NULL,58,'2014-04-07 02:52:41',1,2,2),(933,NULL,58,'2014-04-07 02:52:45',1,2,2),(934,NULL,58,'2014-04-07 02:52:46',1,2,2),(935,NULL,58,'2014-04-07 02:53:28',1,2,2),(936,NULL,58,'2014-04-07 02:53:31',1,2,2),(937,NULL,58,'2014-04-07 02:53:31',1,2,2),(938,NULL,58,'2014-04-07 02:59:56',1,2,2),(939,NULL,58,'2014-04-07 03:00:24',1,2,2),(940,NULL,58,'2014-04-07 03:00:25',1,2,2),(941,NULL,58,'2014-04-07 03:01:34',1,2,2),(942,NULL,58,'2014-04-07 03:01:34',1,2,2),(943,NULL,58,'2014-04-07 03:02:40',1,2,2),(944,NULL,58,'2014-04-07 03:02:40',1,2,2),(945,NULL,58,'2014-04-07 03:06:43',1,2,2),(946,NULL,58,'2014-04-07 03:06:44',1,2,2),(947,NULL,58,'2014-04-07 03:09:06',1,2,2),(948,NULL,58,'2014-04-07 03:09:07',1,2,2),(949,NULL,58,'2014-04-07 03:16:44',1,2,2),(950,NULL,58,'2014-04-07 03:16:44',1,2,2),(951,NULL,58,'2014-04-07 03:17:24',1,2,2),(952,NULL,58,'2014-04-07 03:17:25',1,2,2),(953,NULL,58,'2014-04-07 03:20:17',1,2,2),(954,NULL,58,'2014-04-07 03:20:18',1,2,2),(955,NULL,58,'2014-04-07 03:23:17',1,2,2),(956,NULL,58,'2014-04-07 03:23:17',1,2,2),(957,NULL,58,'2014-04-07 03:25:59',1,2,2),(958,NULL,58,'2014-04-07 03:26:00',1,2,2),(959,NULL,58,'2014-04-07 03:28:35',1,2,2),(960,NULL,58,'2014-04-07 03:28:35',1,2,2),(961,NULL,58,'2014-04-07 03:29:19',1,2,2),(962,NULL,58,'2014-04-07 03:29:20',1,2,2),(963,NULL,58,'2014-04-07 03:31:44',1,2,2),(964,NULL,58,'2014-04-07 03:31:45',1,2,2),(965,NULL,58,'2014-04-07 03:33:30',1,2,2),(966,NULL,58,'2014-04-07 03:33:31',1,2,2),(967,NULL,58,'2014-04-07 03:36:25',1,2,2),(968,NULL,58,'2014-04-07 03:36:26',1,2,2),(969,NULL,61,'2014-04-07 03:38:37',1,2,2),(970,NULL,61,'2014-04-07 03:38:37',1,2,2),(971,NULL,58,'2014-04-07 03:43:48',1,2,2),(972,NULL,58,'2014-04-07 03:43:48',1,2,2),(973,NULL,61,'2014-04-07 03:43:58',1,2,2),(974,NULL,61,'2014-04-07 03:43:58',1,2,2),(975,NULL,61,'2014-04-07 03:47:13',1,2,2),(976,NULL,61,'2014-04-07 03:47:14',1,2,2),(977,NULL,61,'2014-04-07 03:47:53',1,2,2),(978,NULL,61,'2014-04-07 03:47:53',1,2,2),(979,NULL,61,'2014-04-07 03:48:58',1,2,2),(980,NULL,61,'2014-04-07 03:48:58',1,2,2),(981,NULL,61,'2014-04-07 03:51:30',1,2,2),(982,NULL,61,'2014-04-07 03:51:30',1,2,2),(983,NULL,61,'2014-04-07 03:51:47',1,2,2),(984,NULL,61,'2014-04-07 03:51:47',1,2,2),(985,NULL,61,'2014-04-07 03:52:30',1,2,2),(986,NULL,61,'2014-04-07 03:54:29',1,2,2),(987,NULL,61,'2014-04-07 03:54:30',1,2,2),(988,NULL,58,'2014-04-07 03:57:01',1,2,2),(989,NULL,58,'2014-04-07 03:57:01',1,2,2),(990,NULL,58,'2014-04-07 03:58:35',1,2,2),(991,NULL,58,'2014-04-07 03:58:36',1,2,2),(992,NULL,61,'2014-04-07 04:01:17',1,2,2),(993,NULL,61,'2014-04-07 04:01:17',1,2,2),(994,NULL,58,'2014-04-07 04:05:20',1,2,2),(995,NULL,58,'2014-04-07 04:05:21',1,2,2),(996,NULL,59,'2014-04-07 04:05:27',1,2,2),(997,NULL,59,'2014-04-07 04:05:27',1,2,2),(998,NULL,59,'2014-04-07 04:10:07',1,2,2),(999,NULL,59,'2014-04-07 04:10:07',1,2,2),(1000,NULL,58,'2014-04-07 04:10:50',1,2,2),(1001,NULL,58,'2014-04-07 04:10:51',1,2,2),(1002,NULL,61,'2014-04-07 08:55:53',1,2,2),(1003,NULL,61,'2014-04-07 08:55:53',1,2,2),(1004,NULL,58,'2014-04-07 08:57:34',1,2,2),(1005,NULL,58,'2014-04-07 08:57:37',1,2,2),(1006,NULL,61,'2014-04-07 08:57:45',1,2,2),(1007,NULL,61,'2014-04-07 08:57:45',1,2,2),(1008,NULL,58,'2014-04-07 08:58:45',1,2,2),(1009,NULL,58,'2014-04-07 08:58:46',1,2,2),(1010,NULL,61,'2014-04-07 08:58:57',1,2,2),(1011,NULL,61,'2014-04-07 08:58:57',1,2,2),(1012,NULL,61,'2014-04-07 09:01:43',1,2,2),(1013,NULL,61,'2014-04-07 09:01:43',1,2,2),(1014,NULL,61,'2014-04-07 09:07:18',1,2,2),(1015,NULL,61,'2014-04-07 09:07:18',1,2,2),(1016,NULL,58,'2014-04-07 09:09:42',1,2,2),(1017,NULL,58,'2014-04-07 09:09:42',1,2,2),(1018,NULL,61,'2014-04-07 09:15:37',1,2,2),(1019,NULL,61,'2014-04-07 09:15:37',1,2,2),(1020,NULL,61,'2014-04-07 09:16:41',1,2,2),(1021,NULL,61,'2014-04-07 09:16:41',1,2,2),(1022,NULL,61,'2014-04-07 09:17:46',1,2,2),(1023,NULL,61,'2014-04-07 09:17:46',1,2,2),(1024,NULL,61,'2014-04-07 09:18:29',1,2,2),(1025,NULL,61,'2014-04-07 09:18:30',1,2,2),(1026,NULL,61,'2014-04-07 09:22:32',1,2,2),(1027,NULL,61,'2014-04-07 09:22:33',1,2,2),(1028,NULL,61,'2014-04-07 09:31:52',1,2,2),(1029,NULL,61,'2014-04-07 09:31:53',1,2,2),(1030,NULL,58,'2014-04-07 09:34:52',1,2,2),(1031,NULL,58,'2014-04-07 09:34:53',1,2,2),(1032,NULL,61,'2014-04-07 09:36:58',1,2,2),(1033,NULL,61,'2014-04-07 09:36:59',1,2,2),(1034,NULL,61,'2014-04-07 09:44:17',1,2,2),(1035,NULL,61,'2014-04-07 09:44:18',1,2,2),(1036,NULL,61,'2014-04-07 09:46:12',1,2,2),(1037,NULL,61,'2014-04-07 09:46:13',1,2,2),(1038,NULL,61,'2014-04-07 09:53:49',1,2,2),(1039,NULL,61,'2014-04-07 09:53:50',1,2,2),(1040,NULL,61,'2014-04-07 10:20:56',1,2,2),(1041,NULL,61,'2014-04-07 10:20:57',1,2,2),(1042,NULL,61,'2014-04-07 10:24:53',1,2,2),(1043,NULL,61,'2014-04-07 10:24:53',1,2,2),(1044,NULL,61,'2014-04-07 10:27:09',1,2,2),(1045,NULL,61,'2014-04-07 10:27:10',1,2,2),(1046,NULL,61,'2014-04-07 10:32:16',1,2,2),(1047,NULL,61,'2014-04-07 10:32:16',1,2,2),(1048,NULL,61,'2014-04-07 10:33:27',1,2,2),(1049,NULL,61,'2014-04-07 10:33:27',1,2,2),(1050,NULL,61,'2014-04-07 10:47:12',1,2,2),(1051,NULL,61,'2014-04-07 10:47:13',1,2,2),(1052,NULL,61,'2014-04-07 10:47:37',1,2,2),(1053,NULL,61,'2014-04-07 10:47:37',1,2,2),(1054,NULL,61,'2014-04-07 10:48:00',1,2,2),(1055,NULL,61,'2014-04-07 10:48:00',1,2,2),(1056,NULL,61,'2014-04-07 10:48:22',1,2,2),(1057,NULL,61,'2014-04-07 10:48:23',1,2,2),(1058,NULL,61,'2014-04-07 10:51:08',1,2,2),(1059,NULL,61,'2014-04-07 10:51:09',1,2,2),(1060,NULL,61,'2014-04-07 10:51:20',1,2,2),(1061,NULL,61,'2014-04-07 10:51:20',1,2,2),(1062,NULL,61,'2014-04-07 10:51:56',1,2,2),(1063,NULL,61,'2014-04-07 10:51:57',1,2,2),(1064,NULL,61,'2014-04-07 11:17:54',1,2,2),(1065,NULL,61,'2014-04-07 11:17:55',1,2,2),(1066,NULL,61,'2014-04-07 11:19:07',1,2,2),(1067,NULL,61,'2014-04-07 11:19:08',1,2,2),(1068,NULL,61,'2014-04-07 11:20:18',1,2,2),(1069,NULL,61,'2014-04-07 11:20:19',1,2,2),(1070,NULL,61,'2014-04-07 11:21:18',1,2,2),(1071,NULL,61,'2014-04-07 11:21:19',1,2,2),(1072,NULL,61,'2014-04-07 11:22:48',1,2,2),(1073,NULL,61,'2014-04-07 11:22:49',1,2,2),(1074,NULL,61,'2014-04-07 11:25:08',1,2,2),(1075,NULL,61,'2014-04-07 11:25:09',1,2,2),(1076,NULL,61,'2014-04-07 11:29:54',1,2,2),(1077,NULL,61,'2014-04-07 11:29:55',1,2,2),(1078,NULL,61,'2014-04-07 11:32:53',1,2,2),(1079,NULL,61,'2014-04-07 11:32:54',1,2,2),(1080,NULL,58,'2014-04-07 11:51:24',1,2,2),(1081,NULL,58,'2014-04-07 11:51:24',1,2,2),(1082,NULL,58,'2014-04-07 11:52:32',1,2,2),(1083,NULL,58,'2014-04-07 11:52:33',1,2,2),(1084,NULL,58,'2014-04-07 11:58:07',1,2,2),(1085,NULL,58,'2014-04-07 11:58:07',1,2,2),(1086,NULL,61,'2014-04-07 11:58:42',1,2,2),(1087,NULL,61,'2014-04-07 11:58:43',1,2,2),(1088,NULL,58,'2014-04-07 12:01:26',1,2,2),(1089,NULL,58,'2014-04-07 12:01:26',1,2,2),(1090,NULL,58,'2014-04-07 12:02:40',1,2,2),(1091,NULL,58,'2014-04-07 12:02:40',1,2,2),(1092,NULL,58,'2014-04-07 12:06:38',1,2,2),(1093,NULL,58,'2014-04-07 12:06:39',1,2,2),(1094,NULL,58,'2014-04-07 12:07:14',1,2,2),(1095,NULL,58,'2014-04-07 12:07:14',1,2,2),(1096,NULL,58,'2014-04-07 12:07:45',1,2,2),(1097,NULL,58,'2014-04-07 12:07:45',1,2,2),(1098,NULL,59,'2014-04-07 12:09:39',1,2,2),(1099,NULL,59,'2014-04-07 12:09:40',1,2,2),(1100,NULL,59,'2014-04-07 12:12:06',1,2,2),(1101,NULL,59,'2014-04-07 12:12:06',1,2,2),(1102,NULL,58,'2014-04-07 12:13:06',1,2,2),(1103,NULL,58,'2014-04-07 12:13:07',1,2,2),(1104,NULL,58,'2014-04-07 12:14:00',1,2,2),(1105,NULL,58,'2014-04-07 12:14:00',1,2,2),(1106,NULL,59,'2014-04-07 12:16:47',1,2,2),(1107,NULL,59,'2014-04-07 12:16:47',1,2,2),(1108,NULL,58,'2014-04-07 12:18:40',1,2,2),(1109,NULL,58,'2014-04-07 12:18:40',1,2,2),(1110,NULL,58,'2014-04-07 12:20:21',1,2,2),(1111,NULL,58,'2014-04-07 12:20:22',1,2,2),(1112,NULL,58,'2014-04-07 12:26:38',1,2,2),(1113,NULL,58,'2014-04-07 12:26:38',1,2,2),(1114,NULL,58,'2014-04-07 12:28:18',1,2,2),(1115,NULL,58,'2014-04-07 12:28:18',1,2,2),(1116,NULL,58,'2014-04-07 12:30:41',1,2,2),(1117,NULL,58,'2014-04-07 12:30:41',1,2,2),(1118,NULL,58,'2014-04-07 12:31:39',1,2,2),(1119,NULL,58,'2014-04-07 12:31:39',1,2,2),(1120,NULL,58,'2014-04-07 12:36:02',1,2,2),(1121,NULL,58,'2014-04-07 12:36:02',1,2,2),(1122,NULL,58,'2014-04-07 12:37:42',1,2,2),(1123,NULL,58,'2014-04-07 12:37:42',1,2,2),(1124,NULL,58,'2014-04-07 12:39:13',1,2,2),(1125,NULL,58,'2014-04-07 12:39:13',1,2,2),(1126,NULL,58,'2014-04-07 12:40:04',1,2,2),(1127,NULL,58,'2014-04-07 12:40:05',1,2,2),(1128,NULL,58,'2014-04-07 12:42:28',1,2,2),(1129,NULL,58,'2014-04-07 12:42:29',1,2,2),(1130,NULL,58,'2014-04-07 12:48:18',1,2,2),(1131,NULL,58,'2014-04-07 12:48:18',1,2,2),(1132,NULL,58,'2014-04-07 12:49:54',1,2,2),(1133,NULL,58,'2014-04-07 12:49:55',1,2,2),(1134,NULL,58,'2014-04-07 13:06:50',1,2,2),(1135,NULL,58,'2014-04-07 13:06:51',1,2,2),(1136,NULL,58,'2014-04-07 13:09:01',1,2,2),(1137,NULL,58,'2014-04-07 13:09:01',1,2,2),(1138,NULL,59,'2014-04-07 13:21:21',1,2,2),(1139,NULL,59,'2014-04-07 13:21:22',1,2,2),(1140,NULL,58,'2014-04-07 13:22:43',1,2,2),(1141,NULL,58,'2014-04-07 13:22:43',1,2,2),(1142,NULL,58,'2014-04-07 13:28:55',1,2,2),(1143,NULL,58,'2014-04-07 13:28:55',1,2,2),(1144,NULL,58,'2014-04-07 13:38:25',1,2,2),(1145,NULL,58,'2014-04-07 13:38:25',1,2,2),(1146,NULL,58,'2014-04-07 13:38:41',1,2,2),(1147,NULL,58,'2014-04-07 13:38:41',1,2,2),(1148,NULL,58,'2014-04-07 13:41:02',1,2,2),(1149,NULL,58,'2014-04-07 13:41:02',1,2,2),(1150,NULL,58,'2014-04-07 13:43:33',1,2,2),(1151,NULL,58,'2014-04-07 13:43:33',1,2,2),(1152,NULL,58,'2014-04-07 13:45:10',1,2,2),(1153,NULL,58,'2014-04-07 13:45:10',1,2,2),(1154,NULL,58,'2014-04-07 13:46:30',1,2,2),(1155,NULL,58,'2014-04-07 13:46:31',1,2,2),(1156,NULL,58,'2014-04-07 13:55:09',1,2,2),(1157,NULL,58,'2014-04-07 13:55:09',1,2,2),(1158,NULL,58,'2014-04-07 14:16:59',1,2,2),(1159,NULL,58,'2014-04-07 14:17:00',1,2,2),(1160,NULL,58,'2014-04-07 15:00:39',1,2,2),(1161,NULL,58,'2014-04-07 15:00:39',1,2,2),(1162,NULL,58,'2014-04-07 15:01:18',1,2,2),(1163,NULL,58,'2014-04-07 15:01:19',1,2,2),(1164,NULL,58,'2014-04-07 15:02:30',1,2,2),(1165,NULL,58,'2014-04-07 15:02:30',1,2,2),(1166,NULL,59,'2014-04-07 16:39:05',1,2,2),(1167,NULL,59,'2014-04-07 16:39:05',1,2,2),(1168,NULL,58,'2014-04-07 16:41:21',1,2,2),(1169,NULL,58,'2014-04-07 16:41:21',1,2,2),(1170,NULL,58,'2014-04-07 16:41:47',1,2,2),(1171,NULL,58,'2014-04-07 16:41:47',1,2,2),(1172,NULL,58,'2014-04-07 16:42:04',1,2,2),(1173,NULL,58,'2014-04-07 16:42:05',1,2,2),(1174,NULL,59,'2014-04-07 16:51:37',1,2,2),(1175,NULL,59,'2014-04-07 16:51:38',1,2,2),(1176,NULL,58,'2014-04-07 16:55:47',1,2,2),(1177,NULL,58,'2014-04-07 16:55:48',1,2,2),(1178,NULL,58,'2014-04-07 17:03:14',1,2,2),(1179,NULL,58,'2014-04-07 17:04:49',1,2,2),(1180,NULL,58,'2014-04-07 17:07:56',1,2,2),(1181,NULL,58,'2014-04-07 17:07:57',1,2,2),(1182,NULL,58,'2014-04-07 17:08:23',1,2,2),(1183,NULL,58,'2014-04-07 17:08:24',1,2,2),(1184,NULL,58,'2014-04-07 17:10:39',1,2,2),(1185,NULL,58,'2014-04-07 17:10:41',1,2,2),(1186,NULL,58,'2014-04-07 17:11:47',1,2,2),(1187,NULL,58,'2014-04-07 17:11:47',1,2,2),(1188,NULL,58,'2014-04-07 17:16:02',1,2,2),(1189,NULL,58,'2014-04-07 17:16:02',1,2,2),(1190,NULL,58,'2014-04-07 17:17:57',1,2,2),(1191,NULL,58,'2014-04-07 17:17:57',1,2,2),(1192,NULL,58,'2014-04-07 17:20:13',1,2,2),(1193,NULL,58,'2014-04-07 17:20:14',1,2,2),(1194,NULL,58,'2014-04-07 17:28:29',1,2,2),(1195,NULL,58,'2014-04-07 17:28:30',1,2,2),(1196,NULL,58,'2014-04-07 17:31:52',1,2,2),(1197,NULL,58,'2014-04-07 17:31:53',1,2,2),(1198,NULL,58,'2014-04-07 17:40:32',1,2,2),(1199,NULL,58,'2014-04-07 17:42:38',1,2,2),(1200,NULL,58,'2014-04-07 17:47:26',1,2,2),(1201,NULL,58,'2014-04-07 17:48:15',1,2,2),(1202,NULL,58,'2014-04-07 17:51:02',1,2,2),(1203,NULL,58,'2014-04-07 17:51:51',1,2,2),(1204,NULL,58,'2014-04-07 17:53:25',1,2,2),(1205,NULL,58,'2014-04-07 18:01:55',1,2,2),(1206,NULL,59,'2014-04-07 18:04:59',1,2,2),(1207,NULL,59,'2014-04-07 18:05:23',1,2,2),(1208,NULL,59,'2014-04-07 18:20:57',1,2,2),(1209,NULL,59,'2014-04-07 18:21:22',1,2,2),(1210,NULL,59,'2014-04-07 18:21:37',1,2,2),(1211,NULL,59,'2014-04-07 18:23:36',1,2,2),(1212,NULL,61,'2014-04-08 11:13:20',1,2,2),(1215,NULL,61,'2014-04-08 11:40:27',1,2,2),(1216,NULL,61,'2014-04-08 11:42:47',1,2,2),(1217,NULL,61,'2014-04-08 11:42:47',1,2,2),(1219,NULL,61,'2014-04-08 11:44:44',1,2,2),(1220,NULL,61,'2014-04-08 11:44:44',1,2,2),(1221,NULL,61,'2014-04-08 11:46:46',1,2,2),(1222,NULL,61,'2014-04-08 11:46:46',1,2,2),(1223,NULL,61,'2014-04-08 11:46:46',1,2,2),(1224,NULL,61,'2014-04-08 11:47:29',1,2,2),(1225,NULL,61,'2014-04-08 11:47:29',1,2,2),(1226,NULL,61,'2014-04-08 11:47:29',1,2,2),(1227,NULL,61,'2014-04-08 20:00:28',1,2,2),(1228,NULL,61,'2014-04-08 20:00:28',1,2,2),(1229,NULL,61,'2014-04-08 20:00:28',1,2,2),(1230,NULL,61,'2014-04-08 21:18:35',1,2,2),(1231,NULL,61,'2014-04-08 21:18:35',1,2,2),(1232,NULL,61,'2014-04-08 21:18:35',1,2,2),(1233,NULL,61,'2014-04-08 21:18:40',1,2,2),(1234,NULL,61,'2014-04-08 21:18:40',1,2,2),(1235,NULL,61,'2014-04-08 21:18:40',1,2,2),(1236,NULL,61,'2014-04-08 21:45:42',1,2,2),(1237,NULL,61,'2014-04-08 21:45:42',1,2,2),(1238,NULL,61,'2014-04-08 21:45:42',1,2,2),(1239,NULL,61,'2014-04-08 21:59:34',1,2,2),(1240,NULL,61,'2014-04-08 21:59:34',1,2,2),(1241,NULL,61,'2014-04-08 21:59:34',1,2,2),(1242,NULL,61,'2014-04-08 22:47:14',1,2,2),(1243,NULL,61,'2014-04-08 22:47:14',1,2,2),(1244,NULL,61,'2014-04-08 22:47:14',1,2,2),(1245,NULL,61,'2014-04-08 22:47:14',1,2,2),(1246,NULL,61,'2014-04-08 22:47:41',1,2,2),(1247,NULL,61,'2014-04-08 22:47:41',1,2,2),(1248,NULL,61,'2014-04-08 22:47:41',1,2,2),(1249,NULL,61,'2014-04-08 22:47:41',1,2,2),(1250,NULL,61,'2014-04-09 09:13:54',1,2,2),(1251,NULL,61,'2014-04-09 09:13:54',1,2,2),(1252,NULL,61,'2014-04-09 09:13:54',1,2,2),(1253,NULL,61,'2014-04-09 09:13:54',1,2,2),(1254,NULL,61,'2014-04-09 09:13:54',1,2,2),(1255,NULL,61,'2014-04-09 09:13:54',1,2,2),(1256,NULL,61,'2014-04-09 09:13:54',1,2,2),(1257,NULL,61,'2014-04-09 09:23:34',1,2,2),(1258,NULL,61,'2014-04-09 09:23:34',1,2,2),(1259,NULL,61,'2014-04-09 09:23:34',1,2,2),(1260,NULL,61,'2014-04-09 09:23:34',1,2,2),(1261,NULL,61,'2014-04-09 09:23:34',1,2,2),(1262,NULL,61,'2014-04-09 09:23:34',1,2,2),(1263,NULL,61,'2014-04-09 09:23:34',1,2,2),(1264,NULL,61,'2014-04-09 09:24:32',1,2,2),(1265,NULL,61,'2014-04-09 09:24:32',1,2,2),(1266,NULL,61,'2014-04-09 09:24:32',1,2,2),(1267,NULL,61,'2014-04-09 09:24:32',1,2,2),(1268,NULL,61,'2014-04-09 09:24:32',1,2,2),(1269,NULL,61,'2014-04-09 09:24:32',1,2,2),(1270,NULL,61,'2014-04-09 09:24:32',1,2,2),(1271,NULL,61,'2014-04-09 09:38:00',1,2,2),(1272,NULL,61,'2014-04-09 09:38:00',1,2,2),(1273,NULL,61,'2014-04-09 09:38:00',1,2,2),(1274,NULL,61,'2014-04-09 09:38:00',1,2,2),(1275,NULL,61,'2014-04-09 09:38:00',1,2,2),(1276,NULL,61,'2014-04-09 09:38:00',1,2,2),(1277,NULL,61,'2014-04-09 09:38:00',1,2,2),(1278,NULL,61,'2014-04-09 09:42:38',1,2,2),(1279,NULL,61,'2014-04-09 09:42:38',1,2,2),(1280,NULL,61,'2014-04-09 09:42:38',1,2,2),(1281,NULL,61,'2014-04-09 09:42:38',1,2,2),(1282,NULL,61,'2014-04-09 09:42:38',1,2,2),(1283,NULL,61,'2014-04-09 09:42:38',1,2,2),(1284,NULL,61,'2014-04-09 09:42:38',1,2,2),(1285,NULL,61,'2014-04-09 10:04:11',1,2,2),(1286,NULL,61,'2014-04-09 10:04:11',1,2,2),(1287,NULL,61,'2014-04-09 10:04:11',1,2,2),(1288,NULL,61,'2014-04-09 10:04:11',1,2,2),(1289,NULL,61,'2014-04-09 10:04:11',1,2,2),(1290,NULL,61,'2014-04-09 10:04:11',1,2,2),(1291,NULL,61,'2014-04-09 10:04:11',1,2,2),(1292,NULL,61,'2014-04-09 10:16:46',1,2,2),(1293,NULL,61,'2014-04-09 10:16:46',1,2,2),(1294,NULL,61,'2014-04-09 10:16:46',1,2,2),(1295,NULL,61,'2014-04-09 10:16:46',1,2,2),(1296,NULL,61,'2014-04-09 10:16:46',1,2,2),(1297,NULL,61,'2014-04-09 10:16:46',1,2,2),(1298,NULL,61,'2014-04-09 10:16:46',1,2,2),(1299,NULL,61,'2014-04-09 10:20:08',1,2,2),(1300,NULL,61,'2014-04-09 10:20:08',1,2,2),(1301,NULL,61,'2014-04-09 10:20:08',1,2,2),(1302,NULL,61,'2014-04-09 10:20:08',1,2,2),(1303,NULL,61,'2014-04-09 10:20:08',1,2,2),(1304,NULL,61,'2014-04-09 10:20:08',1,2,2),(1305,NULL,61,'2014-04-09 10:20:08',1,2,2),(1306,NULL,61,'2014-04-09 10:22:09',1,2,2),(1307,NULL,61,'2014-04-09 10:22:09',1,2,2),(1308,NULL,61,'2014-04-09 10:22:09',1,2,2),(1309,NULL,61,'2014-04-09 10:22:09',1,2,2),(1310,NULL,61,'2014-04-09 10:22:09',1,2,2),(1311,NULL,61,'2014-04-09 10:22:09',1,2,2),(1312,NULL,61,'2014-04-09 10:22:09',1,2,2),(1313,NULL,61,'2014-04-09 10:23:13',1,2,2),(1314,NULL,61,'2014-04-09 10:23:13',1,2,2),(1315,NULL,61,'2014-04-09 10:23:13',1,2,2),(1316,NULL,61,'2014-04-09 10:23:13',1,2,2),(1317,NULL,61,'2014-04-09 10:23:13',1,2,2),(1318,NULL,61,'2014-04-09 10:23:13',1,2,2),(1319,NULL,61,'2014-04-09 10:23:13',1,2,2),(1320,NULL,61,'2014-04-09 10:28:01',1,2,2),(1321,NULL,61,'2014-04-09 10:28:01',1,2,2),(1322,NULL,61,'2014-04-09 10:28:01',1,2,2),(1323,NULL,61,'2014-04-09 10:28:01',1,2,2),(1324,NULL,61,'2014-04-09 10:28:01',1,2,2),(1325,NULL,61,'2014-04-09 10:28:01',1,2,2),(1326,NULL,61,'2014-04-09 10:28:01',1,2,2),(1327,NULL,61,'2014-04-09 10:42:30',1,2,2),(1328,NULL,61,'2014-04-09 10:42:30',1,2,2),(1329,NULL,61,'2014-04-09 10:42:30',1,2,2),(1330,NULL,61,'2014-04-09 10:42:30',1,2,2),(1331,NULL,61,'2014-04-09 10:42:30',1,2,2),(1332,NULL,61,'2014-04-09 10:42:30',1,2,2),(1333,NULL,61,'2014-04-09 10:42:30',1,2,2),(1334,NULL,61,'2014-04-09 10:42:45',1,2,2),(1335,NULL,61,'2014-04-09 10:42:45',1,2,2),(1336,NULL,61,'2014-04-09 10:42:45',1,2,2),(1337,NULL,61,'2014-04-09 10:42:45',1,2,2),(1338,NULL,61,'2014-04-09 10:42:45',1,2,2),(1339,NULL,61,'2014-04-09 10:42:45',1,2,2),(1340,NULL,61,'2014-04-09 10:42:45',1,2,2),(1341,NULL,61,'2014-04-09 10:45:02',1,2,2),(1342,NULL,61,'2014-04-09 10:45:02',1,2,2),(1343,NULL,61,'2014-04-09 10:45:02',1,2,2),(1344,NULL,61,'2014-04-09 10:45:02',1,2,2),(1345,NULL,61,'2014-04-09 10:45:02',1,2,2),(1346,NULL,61,'2014-04-09 10:45:02',1,2,2),(1347,NULL,61,'2014-04-09 10:45:02',1,2,2),(1348,NULL,61,'2014-04-09 10:45:16',1,2,2),(1349,NULL,61,'2014-04-09 10:45:16',1,2,2),(1350,NULL,61,'2014-04-09 10:45:16',1,2,2),(1351,NULL,61,'2014-04-09 10:45:16',1,2,2),(1352,NULL,61,'2014-04-09 10:45:16',1,2,2),(1353,NULL,61,'2014-04-09 10:45:16',1,2,2),(1354,NULL,61,'2014-04-09 10:45:16',1,2,2),(1355,NULL,61,'2014-04-09 10:45:23',1,2,2),(1356,NULL,61,'2014-04-09 10:45:23',1,2,2),(1357,NULL,61,'2014-04-09 10:45:23',1,2,2),(1358,NULL,61,'2014-04-09 10:45:23',1,2,2),(1359,NULL,61,'2014-04-09 10:45:23',1,2,2),(1360,NULL,61,'2014-04-09 10:45:23',1,2,2),(1361,NULL,61,'2014-04-09 10:45:23',1,2,2),(1362,NULL,61,'2014-04-09 10:45:36',1,2,2),(1363,NULL,61,'2014-04-09 10:45:36',1,2,2),(1364,NULL,61,'2014-04-09 10:45:36',1,2,2),(1365,NULL,61,'2014-04-09 10:45:36',1,2,2),(1366,NULL,61,'2014-04-09 10:45:36',1,2,2),(1367,NULL,61,'2014-04-09 10:45:36',1,2,2),(1368,NULL,61,'2014-04-09 10:45:36',1,2,2),(1369,NULL,61,'2014-04-09 10:46:09',1,2,2),(1370,NULL,61,'2014-04-09 10:46:09',1,2,2),(1371,NULL,61,'2014-04-09 10:46:09',1,2,2),(1372,NULL,61,'2014-04-09 10:46:09',1,2,2),(1373,NULL,61,'2014-04-09 10:46:09',1,2,2),(1374,NULL,61,'2014-04-09 10:46:09',1,2,2),(1375,NULL,61,'2014-04-09 10:46:09',1,2,2),(1376,NULL,61,'2014-04-09 10:46:40',1,2,2),(1377,NULL,61,'2014-04-09 10:46:40',1,2,2),(1378,NULL,61,'2014-04-09 10:46:40',1,2,2),(1379,NULL,61,'2014-04-09 10:46:40',1,2,2),(1380,NULL,61,'2014-04-09 10:46:40',1,2,2),(1381,NULL,61,'2014-04-09 10:46:40',1,2,2),(1382,NULL,61,'2014-04-09 10:46:40',1,2,2),(1383,NULL,61,'2014-04-09 10:54:58',1,2,2),(1384,NULL,61,'2014-04-09 10:54:58',1,2,2),(1385,NULL,61,'2014-04-09 10:54:58',1,2,2),(1386,NULL,61,'2014-04-09 10:54:58',1,2,2),(1387,NULL,61,'2014-04-09 10:54:58',1,2,2),(1388,NULL,61,'2014-04-09 10:54:58',1,2,2),(1389,NULL,61,'2014-04-09 10:54:58',1,2,2),(1390,NULL,61,'2014-04-09 10:55:05',1,2,2),(1391,NULL,61,'2014-04-09 10:55:05',1,2,2),(1392,NULL,61,'2014-04-09 10:55:05',1,2,2),(1393,NULL,61,'2014-04-09 10:55:05',1,2,2),(1394,NULL,61,'2014-04-09 10:55:05',1,2,2),(1395,NULL,61,'2014-04-09 10:55:05',1,2,2),(1396,NULL,61,'2014-04-09 10:55:05',1,2,2),(1397,NULL,61,'2014-04-09 10:56:36',1,2,2),(1398,NULL,61,'2014-04-09 10:56:36',1,2,2),(1399,NULL,61,'2014-04-09 10:56:36',1,2,2),(1400,NULL,61,'2014-04-09 10:56:36',1,2,2),(1401,NULL,61,'2014-04-09 10:56:36',1,2,2),(1402,NULL,61,'2014-04-09 10:56:36',1,2,2),(1403,NULL,61,'2014-04-09 10:56:36',1,2,2),(1404,NULL,61,'2014-04-09 10:57:09',1,2,2),(1405,NULL,61,'2014-04-09 10:57:09',1,2,2),(1406,NULL,61,'2014-04-09 10:57:09',1,2,2),(1407,NULL,61,'2014-04-09 10:57:09',1,2,2),(1408,NULL,61,'2014-04-09 10:57:09',1,2,2),(1409,NULL,61,'2014-04-09 10:57:09',1,2,2),(1410,NULL,61,'2014-04-09 10:57:09',1,2,2),(1411,NULL,61,'2014-04-09 10:57:12',1,2,2),(1412,NULL,61,'2014-04-09 10:57:12',1,2,2),(1413,NULL,61,'2014-04-09 10:57:12',1,2,2),(1414,NULL,61,'2014-04-09 10:57:12',1,2,2),(1415,NULL,61,'2014-04-09 10:57:12',1,2,2),(1416,NULL,61,'2014-04-09 10:57:12',1,2,2),(1417,NULL,61,'2014-04-09 10:57:12',1,2,2),(1418,NULL,61,'2014-04-09 10:58:16',1,2,2),(1419,NULL,61,'2014-04-09 10:58:16',1,2,2),(1420,NULL,61,'2014-04-09 10:58:16',1,2,2),(1421,NULL,61,'2014-04-09 10:58:16',1,2,2),(1422,NULL,61,'2014-04-09 10:58:16',1,2,2),(1423,NULL,61,'2014-04-09 10:58:16',1,2,2),(1424,NULL,61,'2014-04-09 10:58:16',1,2,2),(1425,NULL,61,'2014-04-09 11:00:40',1,2,2),(1426,NULL,61,'2014-04-09 11:00:40',1,2,2),(1427,NULL,61,'2014-04-09 11:00:40',1,2,2),(1428,NULL,61,'2014-04-09 11:00:40',1,2,2),(1429,NULL,61,'2014-04-09 11:00:40',1,2,2),(1430,NULL,61,'2014-04-09 11:00:40',1,2,2),(1431,NULL,61,'2014-04-09 11:00:40',1,2,2),(1432,NULL,61,'2014-04-09 11:09:04',1,2,2),(1433,NULL,61,'2014-04-09 11:09:04',1,2,2),(1434,NULL,61,'2014-04-09 11:09:04',1,2,2),(1435,NULL,61,'2014-04-09 11:09:04',1,2,2),(1436,NULL,61,'2014-04-09 11:09:04',1,2,2),(1437,NULL,61,'2014-04-09 11:09:04',1,2,2),(1438,NULL,61,'2014-04-09 11:09:04',1,2,2),(1439,NULL,61,'2014-04-09 11:18:42',1,2,2),(1440,NULL,61,'2014-04-09 11:18:42',1,2,2),(1441,NULL,61,'2014-04-09 11:18:42',1,2,2),(1442,NULL,61,'2014-04-09 11:18:42',1,2,2),(1443,NULL,61,'2014-04-09 11:18:42',1,2,2),(1444,NULL,61,'2014-04-09 11:18:42',1,2,2),(1445,NULL,61,'2014-04-09 11:18:42',1,2,2),(1446,NULL,61,'2014-04-09 11:24:50',1,2,2),(1447,NULL,61,'2014-04-09 11:24:50',1,2,2),(1448,NULL,61,'2014-04-09 11:24:50',1,2,2),(1449,NULL,61,'2014-04-09 11:24:50',1,2,2),(1450,NULL,61,'2014-04-09 11:24:50',1,2,2),(1451,NULL,61,'2014-04-09 11:24:50',1,2,2),(1452,NULL,61,'2014-04-09 11:24:50',1,2,2),(1453,NULL,61,'2014-04-09 12:44:31',1,2,2),(1454,NULL,61,'2014-04-09 12:44:31',1,2,2),(1455,NULL,61,'2014-04-09 12:44:31',1,2,2),(1456,NULL,61,'2014-04-09 12:44:31',1,2,2),(1457,NULL,61,'2014-04-09 12:44:31',1,2,2),(1458,NULL,61,'2014-04-09 12:44:31',1,2,2),(1459,NULL,61,'2014-04-09 12:44:31',1,2,2),(1460,NULL,61,'2014-04-09 12:44:57',1,2,2),(1461,NULL,61,'2014-04-09 12:44:57',1,2,2),(1462,NULL,61,'2014-04-09 12:44:57',1,2,2),(1463,NULL,61,'2014-04-09 12:44:57',1,2,2),(1464,NULL,61,'2014-04-09 12:44:57',1,2,2),(1465,NULL,61,'2014-04-09 12:44:57',1,2,2),(1466,NULL,61,'2014-04-09 12:44:57',1,2,2),(1467,NULL,61,'2014-04-09 12:45:05',1,2,2),(1468,NULL,61,'2014-04-09 12:45:05',1,2,2),(1469,NULL,61,'2014-04-09 12:45:05',1,2,2),(1470,NULL,61,'2014-04-09 12:45:05',1,2,2),(1471,NULL,61,'2014-04-09 12:45:05',1,2,2),(1472,NULL,61,'2014-04-09 12:45:05',1,2,2),(1473,NULL,61,'2014-04-09 12:45:05',1,2,2),(1474,NULL,61,'2014-04-09 12:48:26',1,2,2),(1475,NULL,61,'2014-04-09 12:48:26',1,2,2),(1476,NULL,61,'2014-04-09 12:48:26',1,2,2),(1477,NULL,61,'2014-04-09 12:48:26',1,2,2),(1478,NULL,61,'2014-04-09 12:48:26',1,2,2),(1479,NULL,61,'2014-04-09 12:48:26',1,2,2),(1480,NULL,61,'2014-04-09 12:48:26',1,2,2),(1481,NULL,61,'2014-04-09 12:49:19',1,2,2),(1482,NULL,61,'2014-04-09 12:49:19',1,2,2),(1483,NULL,61,'2014-04-09 12:49:19',1,2,2),(1484,NULL,61,'2014-04-09 12:49:19',1,2,2),(1485,NULL,61,'2014-04-09 12:49:19',1,2,2),(1486,NULL,61,'2014-04-09 12:49:19',1,2,2),(1487,NULL,61,'2014-04-09 12:49:19',1,2,2),(1488,NULL,61,'2014-04-09 12:49:43',1,2,2),(1489,NULL,61,'2014-04-09 12:49:43',1,2,2),(1490,NULL,61,'2014-04-09 12:49:43',1,2,2),(1491,NULL,61,'2014-04-09 12:49:43',1,2,2),(1492,NULL,61,'2014-04-09 12:49:43',1,2,2),(1493,NULL,61,'2014-04-09 12:49:43',1,2,2),(1494,NULL,61,'2014-04-09 12:49:43',1,2,2),(1495,NULL,61,'2014-04-09 12:50:10',1,2,2),(1496,NULL,61,'2014-04-09 12:50:10',1,2,2),(1497,NULL,61,'2014-04-09 12:50:10',1,2,2),(1498,NULL,61,'2014-04-09 12:50:10',1,2,2),(1499,NULL,61,'2014-04-09 12:50:10',1,2,2),(1500,NULL,61,'2014-04-09 12:50:10',1,2,2),(1501,NULL,61,'2014-04-09 12:50:10',1,2,2),(1502,NULL,61,'2014-04-09 12:50:19',1,2,2),(1503,NULL,61,'2014-04-09 12:50:19',1,2,2),(1504,NULL,61,'2014-04-09 12:50:19',1,2,2),(1505,NULL,61,'2014-04-09 12:50:19',1,2,2),(1506,NULL,61,'2014-04-09 12:50:19',1,2,2),(1507,NULL,61,'2014-04-09 12:50:19',1,2,2),(1508,NULL,61,'2014-04-09 12:50:19',1,2,2),(1509,NULL,61,'2014-04-09 12:50:39',1,2,2),(1510,NULL,61,'2014-04-09 12:50:39',1,2,2),(1511,NULL,61,'2014-04-09 12:50:39',1,2,2),(1512,NULL,61,'2014-04-09 12:50:39',1,2,2),(1513,NULL,61,'2014-04-09 12:50:39',1,2,2),(1514,NULL,61,'2014-04-09 12:50:39',1,2,2),(1515,NULL,61,'2014-04-09 12:50:39',1,2,2),(1516,NULL,61,'2014-04-09 12:51:29',1,2,2),(1517,NULL,61,'2014-04-09 12:51:29',1,2,2),(1518,NULL,61,'2014-04-09 12:51:29',1,2,2),(1519,NULL,61,'2014-04-09 12:51:29',1,2,2),(1520,NULL,61,'2014-04-09 12:51:29',1,2,2),(1521,NULL,61,'2014-04-09 12:51:29',1,2,2),(1522,NULL,61,'2014-04-09 12:51:29',1,2,2),(1523,NULL,61,'2014-04-09 12:51:46',1,2,2),(1524,NULL,61,'2014-04-09 12:51:46',1,2,2),(1525,NULL,61,'2014-04-09 12:51:46',1,2,2),(1526,NULL,61,'2014-04-09 12:51:46',1,2,2),(1527,NULL,61,'2014-04-09 12:51:46',1,2,2),(1528,NULL,61,'2014-04-09 12:51:46',1,2,2),(1529,NULL,61,'2014-04-09 12:51:46',1,2,2),(1530,NULL,61,'2014-04-09 12:54:45',1,2,2),(1531,NULL,61,'2014-04-09 12:54:45',1,2,2),(1532,NULL,61,'2014-04-09 12:54:45',1,2,2),(1533,NULL,61,'2014-04-09 12:54:45',1,2,2),(1534,NULL,61,'2014-04-09 12:54:45',1,2,2),(1535,NULL,61,'2014-04-09 12:54:45',1,2,2),(1536,NULL,61,'2014-04-09 12:54:45',1,2,2),(1537,NULL,61,'2014-04-09 12:56:19',1,2,2),(1538,NULL,61,'2014-04-09 12:56:19',1,2,2),(1539,NULL,61,'2014-04-09 12:56:19',1,2,2),(1540,NULL,61,'2014-04-09 12:56:19',1,2,2),(1541,NULL,61,'2014-04-09 12:56:19',1,2,2),(1542,NULL,61,'2014-04-09 12:56:19',1,2,2),(1543,NULL,61,'2014-04-09 12:56:19',1,2,2),(1544,NULL,61,'2014-04-09 12:56:25',1,2,2),(1545,NULL,61,'2014-04-09 12:56:25',1,2,2),(1546,NULL,61,'2014-04-09 12:56:25',1,2,2),(1547,NULL,61,'2014-04-09 12:56:25',1,2,2),(1548,NULL,61,'2014-04-09 12:56:25',1,2,2),(1549,NULL,61,'2014-04-09 12:56:25',1,2,2),(1550,NULL,61,'2014-04-09 12:56:25',1,2,2),(1551,NULL,61,'2014-04-09 12:58:23',1,2,2),(1552,NULL,61,'2014-04-09 12:58:23',1,2,2),(1553,NULL,61,'2014-04-09 12:58:23',1,2,2),(1554,NULL,61,'2014-04-09 12:58:23',1,2,2),(1555,NULL,61,'2014-04-09 12:58:23',1,2,2),(1556,NULL,61,'2014-04-09 12:58:23',1,2,2),(1557,NULL,61,'2014-04-09 12:58:23',1,2,2),(1558,NULL,61,'2014-04-09 12:59:15',1,2,2),(1559,NULL,61,'2014-04-09 12:59:15',1,2,2),(1560,NULL,61,'2014-04-09 12:59:15',1,2,2),(1561,NULL,61,'2014-04-09 12:59:15',1,2,2),(1562,NULL,61,'2014-04-09 12:59:15',1,2,2),(1563,NULL,61,'2014-04-09 12:59:15',1,2,2),(1564,NULL,61,'2014-04-09 12:59:15',1,2,2),(1565,NULL,61,'2014-04-09 12:59:20',1,2,2),(1566,NULL,61,'2014-04-09 12:59:20',1,2,2),(1567,NULL,61,'2014-04-09 12:59:20',1,2,2),(1568,NULL,61,'2014-04-09 12:59:20',1,2,2),(1569,NULL,61,'2014-04-09 12:59:20',1,2,2),(1570,NULL,61,'2014-04-09 12:59:20',1,2,2),(1571,NULL,61,'2014-04-09 12:59:20',1,2,2),(1572,NULL,61,'2014-04-09 13:00:24',1,2,2),(1573,NULL,61,'2014-04-09 13:00:24',1,2,2),(1574,NULL,61,'2014-04-09 13:00:24',1,2,2),(1575,NULL,61,'2014-04-09 13:00:24',1,2,2),(1576,NULL,61,'2014-04-09 13:00:24',1,2,2),(1577,NULL,61,'2014-04-09 13:00:24',1,2,2),(1578,NULL,61,'2014-04-09 13:00:24',1,2,2),(1579,NULL,61,'2014-04-09 13:07:31',1,2,2),(1580,NULL,61,'2014-04-09 13:07:31',1,2,2),(1581,NULL,61,'2014-04-09 13:07:31',1,2,2),(1582,NULL,61,'2014-04-09 13:07:31',1,2,2),(1583,NULL,61,'2014-04-09 13:07:31',1,2,2),(1584,NULL,61,'2014-04-09 13:07:31',1,2,2),(1585,NULL,61,'2014-04-09 13:07:31',1,2,2),(1586,NULL,61,'2014-04-09 13:08:11',1,2,2),(1587,NULL,61,'2014-04-09 13:08:11',1,2,2),(1588,NULL,61,'2014-04-09 13:08:11',1,2,2),(1589,NULL,61,'2014-04-09 13:08:11',1,2,2),(1590,NULL,61,'2014-04-09 13:08:11',1,2,2),(1591,NULL,61,'2014-04-09 13:08:11',1,2,2),(1592,NULL,61,'2014-04-09 13:08:11',1,2,2),(1593,NULL,61,'2014-04-09 13:08:38',1,2,2),(1594,NULL,61,'2014-04-09 13:08:38',1,2,2),(1595,NULL,61,'2014-04-09 13:08:38',1,2,2),(1596,NULL,61,'2014-04-09 13:08:38',1,2,2),(1597,NULL,61,'2014-04-09 13:08:38',1,2,2),(1598,NULL,61,'2014-04-09 13:08:38',1,2,2),(1599,NULL,61,'2014-04-09 13:08:38',1,2,2),(1600,NULL,61,'2014-04-09 13:08:43',1,2,2),(1601,NULL,61,'2014-04-09 13:08:43',1,2,2),(1602,NULL,61,'2014-04-09 13:08:43',1,2,2),(1603,NULL,61,'2014-04-09 13:08:43',1,2,2),(1604,NULL,61,'2014-04-09 13:08:43',1,2,2),(1605,NULL,61,'2014-04-09 13:08:43',1,2,2),(1606,NULL,61,'2014-04-09 13:08:43',1,2,2),(1607,NULL,61,'2014-04-09 13:09:08',1,2,2),(1608,NULL,61,'2014-04-09 13:09:08',1,2,2),(1609,NULL,61,'2014-04-09 13:09:08',1,2,2),(1610,NULL,61,'2014-04-09 13:09:08',1,2,2),(1611,NULL,61,'2014-04-09 13:09:08',1,2,2),(1612,NULL,61,'2014-04-09 13:09:08',1,2,2),(1613,NULL,61,'2014-04-09 13:09:08',1,2,2),(1614,NULL,61,'2014-04-09 13:09:39',1,2,2),(1615,NULL,61,'2014-04-09 13:09:39',1,2,2),(1616,NULL,61,'2014-04-09 13:09:39',1,2,2),(1617,NULL,61,'2014-04-09 13:09:39',1,2,2),(1618,NULL,61,'2014-04-09 13:09:39',1,2,2),(1619,NULL,61,'2014-04-09 13:09:39',1,2,2),(1620,NULL,61,'2014-04-09 13:09:39',1,2,2),(1621,NULL,61,'2014-04-09 13:13:54',1,2,2),(1622,NULL,61,'2014-04-09 13:13:54',1,2,2),(1623,NULL,61,'2014-04-09 13:13:54',1,2,2),(1624,NULL,61,'2014-04-09 13:13:54',1,2,2),(1625,NULL,61,'2014-04-09 13:13:54',1,2,2),(1626,NULL,61,'2014-04-09 13:13:54',1,2,2),(1627,NULL,61,'2014-04-09 13:13:54',1,2,2),(1628,NULL,61,'2014-04-09 13:14:23',1,2,2),(1629,NULL,61,'2014-04-09 13:14:23',1,2,2),(1630,NULL,61,'2014-04-09 13:14:23',1,2,2),(1631,NULL,61,'2014-04-09 13:14:23',1,2,2),(1632,NULL,61,'2014-04-09 13:14:23',1,2,2),(1633,NULL,61,'2014-04-09 13:14:23',1,2,2),(1634,NULL,61,'2014-04-09 13:14:23',1,2,2),(1635,NULL,61,'2014-04-09 13:14:30',1,2,2),(1636,NULL,61,'2014-04-09 13:14:30',1,2,2),(1637,NULL,61,'2014-04-09 13:14:30',1,2,2),(1638,NULL,61,'2014-04-09 13:14:30',1,2,2),(1639,NULL,61,'2014-04-09 13:14:30',1,2,2),(1640,NULL,61,'2014-04-09 13:14:30',1,2,2),(1641,NULL,61,'2014-04-09 13:14:30',1,2,2),(1642,NULL,61,'2014-04-09 13:14:33',1,2,2),(1643,NULL,61,'2014-04-09 13:14:33',1,2,2),(1644,NULL,61,'2014-04-09 13:14:33',1,2,2),(1645,NULL,61,'2014-04-09 13:14:33',1,2,2),(1646,NULL,61,'2014-04-09 13:14:33',1,2,2),(1647,NULL,61,'2014-04-09 13:14:33',1,2,2),(1648,NULL,61,'2014-04-09 13:14:33',1,2,2),(1649,NULL,61,'2014-04-09 13:21:55',1,2,2),(1650,NULL,61,'2014-04-09 13:21:55',1,2,2),(1651,NULL,61,'2014-04-09 13:21:55',1,2,2),(1652,NULL,61,'2014-04-09 13:21:55',1,2,2),(1653,NULL,61,'2014-04-09 13:21:55',1,2,2),(1654,NULL,61,'2014-04-09 13:21:55',1,2,2),(1655,NULL,61,'2014-04-09 13:21:55',1,2,2),(1656,NULL,61,'2014-04-09 13:25:24',1,2,2),(1657,NULL,61,'2014-04-09 13:25:24',1,2,2),(1658,NULL,61,'2014-04-09 13:25:24',1,2,2),(1659,NULL,61,'2014-04-09 13:25:24',1,2,2),(1660,NULL,61,'2014-04-09 13:25:24',1,2,2),(1661,NULL,61,'2014-04-09 13:25:24',1,2,2),(1662,NULL,61,'2014-04-09 13:25:24',1,2,2),(1663,NULL,61,'2014-04-09 13:31:31',1,2,2),(1664,NULL,61,'2014-04-09 13:31:31',1,2,2),(1665,NULL,61,'2014-04-09 13:31:31',1,2,2),(1666,NULL,61,'2014-04-09 13:31:31',1,2,2),(1667,NULL,61,'2014-04-09 13:31:31',1,2,2),(1668,NULL,61,'2014-04-09 13:31:31',1,2,2),(1669,NULL,61,'2014-04-09 13:31:31',1,2,2),(1670,NULL,61,'2014-04-09 13:31:50',1,2,2),(1671,NULL,61,'2014-04-09 13:31:50',1,2,2),(1672,NULL,61,'2014-04-09 13:31:50',1,2,2),(1673,NULL,61,'2014-04-09 13:31:50',1,2,2),(1674,NULL,61,'2014-04-09 13:31:50',1,2,2),(1675,NULL,61,'2014-04-09 13:31:50',1,2,2),(1676,NULL,61,'2014-04-09 13:31:50',1,2,2),(1677,NULL,61,'2014-04-09 13:33:03',1,2,2),(1678,NULL,61,'2014-04-09 13:33:03',1,2,2),(1679,NULL,61,'2014-04-09 13:33:03',1,2,2),(1680,NULL,61,'2014-04-09 13:33:03',1,2,2),(1681,NULL,61,'2014-04-09 13:33:03',1,2,2),(1682,NULL,61,'2014-04-09 13:33:03',1,2,2),(1683,NULL,61,'2014-04-09 13:33:03',1,2,2),(1684,NULL,61,'2014-04-09 13:33:07',1,2,2),(1685,NULL,61,'2014-04-09 13:33:07',1,2,2),(1686,NULL,61,'2014-04-09 13:33:07',1,2,2),(1687,NULL,61,'2014-04-09 13:33:07',1,2,2),(1688,NULL,61,'2014-04-09 13:33:07',1,2,2),(1689,NULL,61,'2014-04-09 13:33:07',1,2,2),(1690,NULL,61,'2014-04-09 13:33:07',1,2,2),(1691,NULL,61,'2014-04-09 13:33:12',1,2,2),(1692,NULL,61,'2014-04-09 13:33:12',1,2,2),(1693,NULL,61,'2014-04-09 13:33:12',1,2,2),(1694,NULL,61,'2014-04-09 13:33:12',1,2,2),(1695,NULL,61,'2014-04-09 13:33:12',1,2,2),(1696,NULL,61,'2014-04-09 13:33:12',1,2,2),(1697,NULL,61,'2014-04-09 13:33:12',1,2,2),(1698,NULL,61,'2014-04-09 13:35:13',1,2,2),(1699,NULL,61,'2014-04-09 13:35:13',1,2,2),(1700,NULL,61,'2014-04-09 13:35:13',1,2,2),(1701,NULL,61,'2014-04-09 13:35:13',1,2,2),(1702,NULL,61,'2014-04-09 13:35:13',1,2,2),(1703,NULL,61,'2014-04-09 13:35:13',1,2,2),(1704,NULL,61,'2014-04-09 13:35:13',1,2,2),(1705,NULL,61,'2014-04-09 13:35:18',1,2,2),(1706,NULL,61,'2014-04-09 13:35:18',1,2,2),(1707,NULL,61,'2014-04-09 13:35:18',1,2,2),(1708,NULL,61,'2014-04-09 13:35:18',1,2,2),(1709,NULL,61,'2014-04-09 13:35:18',1,2,2),(1710,NULL,61,'2014-04-09 13:35:18',1,2,2),(1711,NULL,61,'2014-04-09 13:35:18',1,2,2),(1712,NULL,61,'2014-04-09 13:35:27',1,2,2),(1713,NULL,61,'2014-04-09 13:35:27',1,2,2),(1714,NULL,61,'2014-04-09 13:35:27',1,2,2),(1715,NULL,61,'2014-04-09 13:35:27',1,2,2),(1716,NULL,61,'2014-04-09 13:35:27',1,2,2),(1717,NULL,61,'2014-04-09 13:35:27',1,2,2),(1718,NULL,61,'2014-04-09 13:35:27',1,2,2),(1719,NULL,61,'2014-04-09 13:35:29',1,2,2),(1720,NULL,61,'2014-04-09 13:35:29',1,2,2),(1721,NULL,61,'2014-04-09 13:35:29',1,2,2),(1722,NULL,61,'2014-04-09 13:35:29',1,2,2),(1723,NULL,61,'2014-04-09 13:35:29',1,2,2),(1724,NULL,61,'2014-04-09 13:35:29',1,2,2),(1725,NULL,61,'2014-04-09 13:35:29',1,2,2),(1726,NULL,61,'2014-04-09 13:36:05',1,2,2),(1727,NULL,61,'2014-04-09 13:36:05',1,2,2),(1728,NULL,61,'2014-04-09 13:36:05',1,2,2),(1729,NULL,61,'2014-04-09 13:36:05',1,2,2),(1730,NULL,61,'2014-04-09 13:36:05',1,2,2),(1731,NULL,61,'2014-04-09 13:36:05',1,2,2),(1732,NULL,61,'2014-04-09 13:36:05',1,2,2),(1733,NULL,61,'2014-04-09 13:42:09',1,2,2),(1734,NULL,61,'2014-04-09 13:42:09',1,2,2),(1735,NULL,61,'2014-04-09 13:42:09',1,2,2),(1736,NULL,61,'2014-04-09 13:42:09',1,2,2),(1737,NULL,61,'2014-04-09 13:42:09',1,2,2),(1738,NULL,61,'2014-04-09 13:42:09',1,2,2),(1739,NULL,61,'2014-04-09 13:42:09',1,2,2),(1740,NULL,61,'2014-04-09 14:11:18',1,2,2),(1741,NULL,61,'2014-04-09 14:11:18',1,2,2),(1742,NULL,61,'2014-04-09 14:11:18',1,2,2),(1743,NULL,61,'2014-04-09 14:11:18',1,2,2),(1744,NULL,61,'2014-04-09 14:11:18',1,2,2),(1745,NULL,61,'2014-04-09 14:11:18',1,2,2),(1746,NULL,61,'2014-04-09 14:11:18',1,2,2),(1747,NULL,61,'2014-04-09 14:11:29',1,2,2),(1748,NULL,61,'2014-04-09 14:11:29',1,2,2),(1749,NULL,61,'2014-04-09 14:11:29',1,2,2),(1750,NULL,61,'2014-04-09 14:11:29',1,2,2),(1751,NULL,61,'2014-04-09 14:11:29',1,2,2),(1752,NULL,61,'2014-04-09 14:11:29',1,2,2),(1753,NULL,61,'2014-04-09 14:11:29',1,2,2),(1754,NULL,61,'2014-04-09 14:14:17',1,2,2),(1755,NULL,61,'2014-04-09 14:14:17',1,2,2),(1756,NULL,61,'2014-04-09 14:14:17',1,2,2),(1757,NULL,61,'2014-04-09 14:14:17',1,2,2),(1758,NULL,61,'2014-04-09 14:14:17',1,2,2),(1759,NULL,61,'2014-04-09 14:14:17',1,2,2),(1760,NULL,61,'2014-04-09 14:14:17',1,2,2),(1761,NULL,61,'2014-04-09 14:14:24',1,2,2),(1762,NULL,61,'2014-04-09 14:14:24',1,2,2),(1763,NULL,61,'2014-04-09 14:14:24',1,2,2),(1764,NULL,61,'2014-04-09 14:14:24',1,2,2),(1765,NULL,61,'2014-04-09 14:14:24',1,2,2),(1766,NULL,61,'2014-04-09 14:14:24',1,2,2),(1767,NULL,61,'2014-04-09 14:14:24',1,2,2),(1768,NULL,61,'2014-04-09 14:14:26',1,2,2),(1769,NULL,61,'2014-04-09 14:14:26',1,2,2),(1770,NULL,61,'2014-04-09 14:14:26',1,2,2),(1771,NULL,61,'2014-04-09 14:14:26',1,2,2),(1772,NULL,61,'2014-04-09 14:14:26',1,2,2),(1773,NULL,61,'2014-04-09 14:14:26',1,2,2),(1774,NULL,61,'2014-04-09 14:14:26',1,2,2),(1775,NULL,61,'2014-04-09 14:14:28',1,2,2),(1776,NULL,61,'2014-04-09 14:14:28',1,2,2),(1777,NULL,61,'2014-04-09 14:14:28',1,2,2),(1778,NULL,61,'2014-04-09 14:14:28',1,2,2),(1779,NULL,61,'2014-04-09 14:14:28',1,2,2),(1780,NULL,61,'2014-04-09 14:14:28',1,2,2),(1781,NULL,61,'2014-04-09 14:14:28',1,2,2),(1782,NULL,61,'2014-04-09 14:15:31',1,2,2),(1783,NULL,61,'2014-04-09 14:15:31',1,2,2),(1784,NULL,61,'2014-04-09 14:15:31',1,2,2),(1785,NULL,61,'2014-04-09 14:15:31',1,2,2),(1786,NULL,61,'2014-04-09 14:15:31',1,2,2),(1787,NULL,61,'2014-04-09 14:15:31',1,2,2),(1788,NULL,61,'2014-04-09 14:15:31',1,2,2),(1789,NULL,61,'2014-04-09 14:16:52',1,2,2),(1790,NULL,61,'2014-04-09 14:16:52',1,2,2),(1791,NULL,61,'2014-04-09 14:16:52',1,2,2),(1792,NULL,61,'2014-04-09 14:16:52',1,2,2),(1793,NULL,61,'2014-04-09 14:16:52',1,2,2),(1794,NULL,61,'2014-04-09 14:16:52',1,2,2),(1795,NULL,61,'2014-04-09 14:16:52',1,2,2),(1796,NULL,61,'2014-04-09 14:17:22',1,2,2),(1797,NULL,61,'2014-04-09 14:17:22',1,2,2),(1798,NULL,61,'2014-04-09 14:17:22',1,2,2),(1799,NULL,61,'2014-04-09 14:17:22',1,2,2),(1800,NULL,61,'2014-04-09 14:17:22',1,2,2),(1801,NULL,61,'2014-04-09 14:17:22',1,2,2),(1802,NULL,61,'2014-04-09 14:17:22',1,2,2),(1803,NULL,61,'2014-04-09 14:17:42',1,2,2),(1804,NULL,61,'2014-04-09 14:17:42',1,2,2),(1805,NULL,61,'2014-04-09 14:17:42',1,2,2),(1806,NULL,61,'2014-04-09 14:17:42',1,2,2),(1807,NULL,61,'2014-04-09 14:17:42',1,2,2),(1808,NULL,61,'2014-04-09 14:17:42',1,2,2),(1809,NULL,61,'2014-04-09 14:17:42',1,2,2),(1810,NULL,61,'2014-04-09 14:19:25',1,2,2),(1811,NULL,61,'2014-04-09 14:19:25',1,2,2),(1812,NULL,61,'2014-04-09 14:19:25',1,2,2),(1813,NULL,61,'2014-04-09 14:19:25',1,2,2),(1814,NULL,61,'2014-04-09 14:19:25',1,2,2),(1815,NULL,61,'2014-04-09 14:19:25',1,2,2),(1816,NULL,61,'2014-04-09 14:19:25',1,2,2),(1817,NULL,61,'2014-04-09 14:20:43',1,2,2),(1818,NULL,61,'2014-04-09 14:20:43',1,2,2),(1819,NULL,61,'2014-04-09 14:20:43',1,2,2),(1820,NULL,61,'2014-04-09 14:20:43',1,2,2),(1821,NULL,61,'2014-04-09 14:20:43',1,2,2),(1822,NULL,61,'2014-04-09 14:20:43',1,2,2),(1823,NULL,61,'2014-04-09 14:20:43',1,2,2),(1824,NULL,61,'2014-04-09 14:27:29',1,2,2),(1825,NULL,61,'2014-04-09 14:27:29',1,2,2),(1826,NULL,61,'2014-04-09 14:27:29',1,2,2),(1827,NULL,61,'2014-04-09 14:27:29',1,2,2),(1828,NULL,61,'2014-04-09 14:27:29',1,2,2),(1829,NULL,61,'2014-04-09 14:27:29',1,2,2),(1830,NULL,61,'2014-04-09 14:27:29',1,2,2),(1831,NULL,61,'2014-04-09 14:27:49',1,2,2),(1832,NULL,61,'2014-04-09 14:27:49',1,2,2),(1833,NULL,61,'2014-04-09 14:27:49',1,2,2),(1834,NULL,61,'2014-04-09 14:27:49',1,2,2),(1835,NULL,61,'2014-04-09 14:27:49',1,2,2),(1836,NULL,61,'2014-04-09 14:27:49',1,2,2),(1837,NULL,61,'2014-04-09 14:27:49',1,2,2),(1838,NULL,61,'2014-04-09 14:35:15',1,2,2),(1839,NULL,61,'2014-04-09 14:35:15',1,2,2),(1840,NULL,61,'2014-04-09 14:35:15',1,2,2),(1841,NULL,61,'2014-04-09 14:35:15',1,2,2),(1842,NULL,61,'2014-04-09 14:35:15',1,2,2),(1843,NULL,61,'2014-04-09 14:35:15',1,2,2),(1844,NULL,61,'2014-04-09 14:35:15',1,2,2),(1845,NULL,61,'2014-04-09 14:35:16',1,2,2),(1846,NULL,61,'2014-04-09 14:35:16',1,2,2),(1847,NULL,61,'2014-04-09 14:35:16',1,2,2),(1848,NULL,61,'2014-04-09 14:35:16',1,2,2),(1849,NULL,61,'2014-04-09 14:35:16',1,2,2),(1850,NULL,61,'2014-04-09 14:35:16',1,2,2),(1851,NULL,61,'2014-04-09 14:35:16',1,2,2),(1852,NULL,61,'2014-04-09 14:35:18',1,2,2),(1853,NULL,61,'2014-04-09 14:35:18',1,2,2),(1854,NULL,61,'2014-04-09 14:35:18',1,2,2),(1855,NULL,61,'2014-04-09 14:35:18',1,2,2),(1856,NULL,61,'2014-04-09 14:35:18',1,2,2),(1857,NULL,61,'2014-04-09 14:35:18',1,2,2),(1858,NULL,61,'2014-04-09 14:35:18',1,2,2),(1859,NULL,59,'2014-04-09 15:27:33',1,2,2),(1860,NULL,59,'2014-04-09 15:30:13',1,2,2),(1861,NULL,61,'2014-04-09 15:41:00',1,2,2),(1862,NULL,61,'2014-04-09 15:41:00',1,2,2),(1863,NULL,61,'2014-04-09 15:41:00',1,2,2),(1864,NULL,61,'2014-04-09 15:41:00',1,2,2),(1865,NULL,61,'2014-04-09 15:41:00',1,2,2),(1866,NULL,61,'2014-04-09 15:41:00',1,2,2),(1867,NULL,61,'2014-04-09 15:41:00',1,2,2),(1868,NULL,61,'2014-04-09 15:44:08',1,2,2),(1869,NULL,61,'2014-04-09 15:44:08',1,2,2),(1870,NULL,61,'2014-04-09 15:44:08',1,2,2),(1871,NULL,61,'2014-04-09 15:44:08',1,2,2),(1872,NULL,61,'2014-04-09 15:44:08',1,2,2),(1873,NULL,61,'2014-04-09 15:44:08',1,2,2),(1874,NULL,61,'2014-04-09 15:44:08',1,2,2),(1875,NULL,61,'2014-04-09 15:50:37',1,2,2),(1876,NULL,61,'2014-04-09 15:50:37',1,2,2),(1877,NULL,61,'2014-04-09 15:50:37',1,2,2),(1878,NULL,61,'2014-04-09 15:50:37',1,2,2),(1879,NULL,61,'2014-04-09 15:50:37',1,2,2),(1880,NULL,61,'2014-04-09 15:50:37',1,2,2),(1881,NULL,61,'2014-04-09 15:50:37',1,2,2),(1882,NULL,61,'2014-04-09 15:50:44',1,2,2),(1883,NULL,61,'2014-04-09 15:50:44',1,2,2),(1884,NULL,61,'2014-04-09 15:50:44',1,2,2),(1885,NULL,61,'2014-04-09 15:50:44',1,2,2),(1886,NULL,61,'2014-04-09 15:50:44',1,2,2),(1887,NULL,61,'2014-04-09 15:50:44',1,2,2),(1888,NULL,61,'2014-04-09 15:50:44',1,2,2),(1889,NULL,61,'2014-04-09 15:51:06',1,2,2),(1890,NULL,61,'2014-04-09 15:51:06',1,2,2),(1891,NULL,61,'2014-04-09 15:51:06',1,2,2),(1892,NULL,61,'2014-04-09 15:51:06',1,2,2),(1893,NULL,61,'2014-04-09 15:51:06',1,2,2),(1894,NULL,61,'2014-04-09 15:51:06',1,2,2),(1895,NULL,61,'2014-04-09 15:51:06',1,2,2),(1896,NULL,61,'2014-04-09 16:42:04',1,2,2),(1897,NULL,61,'2014-04-09 16:42:04',1,2,2),(1898,NULL,61,'2014-04-09 16:42:04',1,2,2),(1899,NULL,61,'2014-04-09 16:42:04',1,2,2),(1900,NULL,61,'2014-04-09 16:42:04',1,2,2),(1901,NULL,61,'2014-04-09 16:42:04',1,2,2),(1902,NULL,61,'2014-04-09 16:42:04',1,2,2),(1903,NULL,61,'2014-04-09 16:48:44',1,2,2),(1904,NULL,61,'2014-04-09 16:48:44',1,2,2),(1905,NULL,61,'2014-04-09 16:48:44',1,2,2),(1906,NULL,61,'2014-04-09 16:48:44',1,2,2),(1907,NULL,61,'2014-04-09 16:48:44',1,2,2),(1908,NULL,61,'2014-04-09 16:48:44',1,2,2),(1909,NULL,61,'2014-04-09 16:48:44',1,2,2),(1910,NULL,61,'2014-04-09 16:53:59',1,2,2),(1911,NULL,61,'2014-04-09 16:53:59',1,2,2),(1912,NULL,61,'2014-04-09 16:53:59',1,2,2),(1913,NULL,61,'2014-04-09 16:53:59',1,2,2),(1914,NULL,61,'2014-04-09 16:53:59',1,2,2),(1915,NULL,61,'2014-04-09 16:53:59',1,2,2),(1916,NULL,61,'2014-04-09 16:53:59',1,2,2),(1917,NULL,61,'2014-04-09 17:00:52',1,2,2),(1918,NULL,61,'2014-04-09 17:00:52',1,2,2),(1919,NULL,61,'2014-04-09 17:00:52',1,2,2),(1920,NULL,61,'2014-04-09 17:00:52',1,2,2),(1921,NULL,61,'2014-04-09 17:00:52',1,2,2),(1922,NULL,61,'2014-04-09 17:00:52',1,2,2),(1923,NULL,61,'2014-04-09 17:00:52',1,2,2),(1924,NULL,61,'2014-04-09 17:01:02',1,2,2),(1925,NULL,61,'2014-04-09 17:01:02',1,2,2),(1926,NULL,61,'2014-04-09 17:01:02',1,2,2),(1927,NULL,61,'2014-04-09 17:01:02',1,2,2),(1928,NULL,61,'2014-04-09 17:01:02',1,2,2),(1929,NULL,61,'2014-04-09 17:01:02',1,2,2),(1930,NULL,61,'2014-04-09 17:01:02',1,2,2),(1931,NULL,61,'2014-04-09 17:03:19',1,2,2),(1932,NULL,61,'2014-04-09 17:03:19',1,2,2),(1933,NULL,61,'2014-04-09 17:03:19',1,2,2),(1934,NULL,61,'2014-04-09 17:03:19',1,2,2),(1935,NULL,61,'2014-04-09 17:03:19',1,2,2),(1936,NULL,61,'2014-04-09 17:03:19',1,2,2),(1937,NULL,61,'2014-04-09 17:03:19',1,2,2),(1938,NULL,61,'2014-04-09 17:03:31',1,2,2),(1939,NULL,61,'2014-04-09 17:03:31',1,2,2),(1940,NULL,61,'2014-04-09 17:03:31',1,2,2),(1941,NULL,61,'2014-04-09 17:03:31',1,2,2),(1942,NULL,61,'2014-04-09 17:03:31',1,2,2),(1943,NULL,61,'2014-04-09 17:03:31',1,2,2),(1944,NULL,61,'2014-04-09 17:03:31',1,2,2),(1945,NULL,61,'2014-04-09 18:33:03',1,2,2),(1946,NULL,61,'2014-04-10 10:12:59',1,2,2),(1947,NULL,61,'2014-04-10 10:12:59',1,2,2),(1948,NULL,61,'2014-04-10 10:12:59',1,2,2),(1949,NULL,61,'2014-04-10 10:12:59',1,2,2),(1950,NULL,61,'2014-04-10 10:12:59',1,2,2),(1951,NULL,61,'2014-04-10 10:12:59',1,2,2),(1952,NULL,61,'2014-04-10 10:12:59',1,2,2),(1953,NULL,61,'2014-04-10 10:13:19',1,2,2),(1954,NULL,61,'2014-04-10 10:13:19',1,2,2),(1955,NULL,61,'2014-04-10 10:13:19',1,2,2),(1956,NULL,61,'2014-04-10 10:13:19',1,2,2),(1957,NULL,61,'2014-04-10 10:13:19',1,2,2),(1958,NULL,61,'2014-04-10 10:13:19',1,2,2),(1959,NULL,61,'2014-04-10 10:13:19',1,2,2),(1960,NULL,61,'2014-04-10 10:13:59',1,2,2),(1961,NULL,61,'2014-04-10 10:13:59',1,2,2),(1962,NULL,61,'2014-04-10 10:13:59',1,2,2),(1963,NULL,61,'2014-04-10 10:13:59',1,2,2),(1964,NULL,61,'2014-04-10 10:13:59',1,2,2),(1965,NULL,61,'2014-04-10 10:13:59',1,2,2),(1966,NULL,61,'2014-04-10 10:13:59',1,2,2),(1967,NULL,61,'2014-04-10 10:14:57',1,2,2),(1968,NULL,61,'2014-04-10 10:14:57',1,2,2),(1969,NULL,61,'2014-04-10 10:14:57',1,2,2),(1970,NULL,61,'2014-04-10 10:14:57',1,2,2),(1971,NULL,61,'2014-04-10 10:14:57',1,2,2),(1972,NULL,61,'2014-04-10 10:14:57',1,2,2),(1973,NULL,61,'2014-04-10 10:14:57',1,2,2),(1974,NULL,61,'2014-04-10 10:20:02',1,2,2),(1975,NULL,61,'2014-04-10 10:20:02',1,2,2),(1976,NULL,61,'2014-04-10 10:20:02',1,2,2),(1977,NULL,61,'2014-04-10 10:20:02',1,2,2),(1978,NULL,61,'2014-04-10 10:20:02',1,2,2),(1979,NULL,61,'2014-04-10 10:20:02',1,2,2),(1980,NULL,61,'2014-04-10 10:20:02',1,2,2),(1981,NULL,61,'2014-04-10 10:20:16',1,2,2),(1982,NULL,61,'2014-04-10 10:20:16',1,2,2),(1983,NULL,61,'2014-04-10 10:20:16',1,2,2),(1984,NULL,61,'2014-04-10 10:20:16',1,2,2),(1985,NULL,61,'2014-04-10 10:20:16',1,2,2),(1986,NULL,61,'2014-04-10 10:20:16',1,2,2),(1987,NULL,61,'2014-04-10 10:20:16',1,2,2),(1988,NULL,61,'2014-04-10 10:22:05',1,2,2),(1989,NULL,61,'2014-04-10 10:22:05',1,2,2),(1990,NULL,61,'2014-04-10 10:22:05',1,2,2),(1991,NULL,61,'2014-04-10 10:22:05',1,2,2),(1992,NULL,61,'2014-04-10 10:22:05',1,2,2),(1993,NULL,61,'2014-04-10 10:22:05',1,2,2),(1994,NULL,61,'2014-04-10 10:22:05',1,2,2),(1995,NULL,61,'2014-04-10 10:22:26',1,2,2),(1996,NULL,61,'2014-04-10 10:22:26',1,2,2),(1997,NULL,61,'2014-04-10 10:22:26',1,2,2),(1998,NULL,61,'2014-04-10 10:22:26',1,2,2),(1999,NULL,61,'2014-04-10 10:22:26',1,2,2),(2000,NULL,61,'2014-04-10 10:22:26',1,2,2),(2001,NULL,61,'2014-04-10 10:22:26',1,2,2),(2002,NULL,61,'2014-04-10 10:25:32',1,2,2),(2003,NULL,61,'2014-04-10 10:25:32',1,2,2),(2004,NULL,61,'2014-04-10 10:25:32',1,2,2),(2005,NULL,61,'2014-04-10 10:25:32',1,2,2),(2006,NULL,61,'2014-04-10 10:25:32',1,2,2),(2007,NULL,61,'2014-04-10 10:25:32',1,2,2),(2008,NULL,61,'2014-04-10 10:25:32',1,2,2),(2009,NULL,61,'2014-04-10 10:25:39',1,2,2),(2010,NULL,61,'2014-04-10 10:25:39',1,2,2),(2011,NULL,61,'2014-04-10 10:25:39',1,2,2),(2012,NULL,61,'2014-04-10 10:25:39',1,2,2),(2013,NULL,61,'2014-04-10 10:25:39',1,2,2),(2014,NULL,61,'2014-04-10 10:25:39',1,2,2),(2015,NULL,61,'2014-04-10 10:25:39',1,2,2),(2016,NULL,61,'2014-04-10 10:27:04',1,2,2),(2017,NULL,61,'2014-04-10 10:27:04',1,2,2),(2018,NULL,61,'2014-04-10 10:27:04',1,2,2),(2019,NULL,61,'2014-04-10 10:27:04',1,2,2),(2020,NULL,61,'2014-04-10 10:27:04',1,2,2),(2021,NULL,61,'2014-04-10 10:27:04',1,2,2),(2022,NULL,61,'2014-04-10 10:27:04',1,2,2),(2023,NULL,61,'2014-04-10 10:27:12',1,2,2),(2024,NULL,61,'2014-04-10 10:27:12',1,2,2),(2025,NULL,61,'2014-04-10 10:27:12',1,2,2),(2026,NULL,61,'2014-04-10 10:27:12',1,2,2),(2027,NULL,61,'2014-04-10 10:27:12',1,2,2),(2028,NULL,61,'2014-04-10 10:27:12',1,2,2),(2029,NULL,61,'2014-04-10 10:27:12',1,2,2),(2030,NULL,61,'2014-04-10 10:27:44',1,2,2),(2031,NULL,61,'2014-04-10 10:27:44',1,2,2),(2032,NULL,61,'2014-04-10 10:27:44',1,2,2),(2033,NULL,61,'2014-04-10 10:27:44',1,2,2),(2034,NULL,61,'2014-04-10 10:27:44',1,2,2),(2035,NULL,61,'2014-04-10 10:27:44',1,2,2),(2036,NULL,61,'2014-04-10 10:27:44',1,2,2),(2037,NULL,61,'2014-04-10 10:27:52',1,2,2),(2038,NULL,61,'2014-04-10 10:27:52',1,2,2),(2039,NULL,61,'2014-04-10 10:27:52',1,2,2),(2040,NULL,61,'2014-04-10 10:27:52',1,2,2),(2041,NULL,61,'2014-04-10 10:27:52',1,2,2),(2042,NULL,61,'2014-04-10 10:27:52',1,2,2),(2043,NULL,61,'2014-04-10 10:27:52',1,2,2),(2044,NULL,61,'2014-04-10 10:27:54',1,2,2),(2045,NULL,61,'2014-04-10 10:27:54',1,2,2),(2046,NULL,61,'2014-04-10 10:27:54',1,2,2),(2047,NULL,61,'2014-04-10 10:27:54',1,2,2),(2048,NULL,61,'2014-04-10 10:27:54',1,2,2),(2049,NULL,61,'2014-04-10 10:27:54',1,2,2),(2050,NULL,61,'2014-04-10 10:27:54',1,2,2),(2051,NULL,61,'2014-04-10 10:28:18',1,2,2),(2052,NULL,61,'2014-04-10 10:28:18',1,2,2),(2053,NULL,61,'2014-04-10 10:28:18',1,2,2),(2054,NULL,61,'2014-04-10 10:28:18',1,2,2),(2055,NULL,61,'2014-04-10 10:28:18',1,2,2),(2056,NULL,61,'2014-04-10 10:28:18',1,2,2),(2057,NULL,61,'2014-04-10 10:28:18',1,2,2),(2058,NULL,61,'2014-04-10 10:29:07',1,2,2),(2059,NULL,61,'2014-04-10 10:29:07',1,2,2),(2060,NULL,61,'2014-04-10 10:29:07',1,2,2),(2061,NULL,61,'2014-04-10 10:29:07',1,2,2),(2062,NULL,61,'2014-04-10 10:29:07',1,2,2),(2063,NULL,61,'2014-04-10 10:29:07',1,2,2),(2064,NULL,61,'2014-04-10 10:29:07',1,2,2),(2065,NULL,61,'2014-04-10 10:29:13',1,2,2),(2066,NULL,61,'2014-04-10 10:29:13',1,2,2),(2067,NULL,61,'2014-04-10 10:29:13',1,2,2),(2068,NULL,61,'2014-04-10 10:29:13',1,2,2),(2069,NULL,61,'2014-04-10 10:29:13',1,2,2),(2070,NULL,61,'2014-04-10 10:29:13',1,2,2),(2071,NULL,61,'2014-04-10 10:29:13',1,2,2),(2072,NULL,61,'2014-04-10 10:29:39',1,2,2),(2073,NULL,61,'2014-04-10 10:29:39',1,2,2),(2074,NULL,61,'2014-04-10 10:29:39',1,2,2),(2075,NULL,61,'2014-04-10 10:29:39',1,2,2),(2076,NULL,61,'2014-04-10 10:29:39',1,2,2),(2077,NULL,61,'2014-04-10 10:29:39',1,2,2),(2078,NULL,61,'2014-04-10 10:29:39',1,2,2),(2079,NULL,61,'2014-04-10 10:29:56',1,2,2),(2080,NULL,61,'2014-04-10 10:29:56',1,2,2),(2081,NULL,61,'2014-04-10 10:29:56',1,2,2),(2082,NULL,61,'2014-04-10 10:29:56',1,2,2),(2083,NULL,61,'2014-04-10 10:29:56',1,2,2),(2084,NULL,61,'2014-04-10 10:29:56',1,2,2),(2085,NULL,61,'2014-04-10 10:29:56',1,2,2),(2086,NULL,61,'2014-04-10 10:30:00',1,2,2),(2087,NULL,61,'2014-04-10 10:30:00',1,2,2),(2088,NULL,61,'2014-04-10 10:30:00',1,2,2),(2089,NULL,61,'2014-04-10 10:30:00',1,2,2),(2090,NULL,61,'2014-04-10 10:30:00',1,2,2),(2091,NULL,61,'2014-04-10 10:30:00',1,2,2),(2092,NULL,61,'2014-04-10 10:30:00',1,2,2),(2093,NULL,61,'2014-04-10 10:30:21',1,2,2),(2094,NULL,61,'2014-04-10 10:30:21',1,2,2),(2095,NULL,61,'2014-04-10 10:30:21',1,2,2),(2096,NULL,61,'2014-04-10 10:30:21',1,2,2),(2097,NULL,61,'2014-04-10 10:30:21',1,2,2),(2098,NULL,61,'2014-04-10 10:30:21',1,2,2),(2099,NULL,61,'2014-04-10 10:30:21',1,2,2),(2100,NULL,61,'2014-04-10 10:33:04',1,2,2),(2101,NULL,61,'2014-04-10 10:33:04',1,2,2),(2102,NULL,61,'2014-04-10 10:33:04',1,2,2),(2103,NULL,61,'2014-04-10 10:33:04',1,2,2),(2104,NULL,61,'2014-04-10 10:33:04',1,2,2),(2105,NULL,61,'2014-04-10 10:33:04',1,2,2),(2106,NULL,61,'2014-04-10 10:33:04',1,2,2),(2107,NULL,61,'2014-04-10 10:33:25',1,2,2),(2108,NULL,61,'2014-04-10 10:33:25',1,2,2),(2109,NULL,61,'2014-04-10 10:33:25',1,2,2),(2110,NULL,61,'2014-04-10 10:33:25',1,2,2),(2111,NULL,61,'2014-04-10 10:33:25',1,2,2),(2112,NULL,61,'2014-04-10 10:33:25',1,2,2),(2113,NULL,61,'2014-04-10 10:33:25',1,2,2),(2114,NULL,61,'2014-04-10 10:44:02',1,2,2),(2115,NULL,61,'2014-04-10 10:44:02',1,2,2),(2116,NULL,61,'2014-04-10 10:44:02',1,2,2),(2117,NULL,61,'2014-04-10 10:44:02',1,2,2),(2118,NULL,61,'2014-04-10 10:44:02',1,2,2),(2119,NULL,61,'2014-04-10 10:44:02',1,2,2),(2120,NULL,61,'2014-04-10 10:44:02',1,2,2),(2121,NULL,59,'2014-04-10 11:03:02',1,2,2),(2122,NULL,59,'2014-04-10 11:03:02',1,2,2),(2123,NULL,59,'2014-04-10 11:03:02',1,2,2),(2124,NULL,59,'2014-04-10 11:03:02',1,2,2),(2125,NULL,59,'2014-04-10 11:03:02',1,2,2),(2126,NULL,59,'2014-04-10 11:03:02',1,2,2),(2127,NULL,59,'2014-04-10 11:03:02',1,2,2),(2128,NULL,59,'2014-04-10 11:04:18',1,2,2),(2129,NULL,59,'2014-04-10 11:04:18',1,2,2),(2130,NULL,59,'2014-04-10 11:04:18',1,2,2),(2131,NULL,59,'2014-04-10 11:04:18',1,2,2),(2132,NULL,59,'2014-04-10 11:04:18',1,2,2),(2133,NULL,59,'2014-04-10 11:04:18',1,2,2),(2134,NULL,59,'2014-04-10 11:04:18',1,2,2),(2135,NULL,59,'2014-04-10 11:04:36',1,2,2),(2136,NULL,59,'2014-04-10 11:04:36',1,2,2),(2137,NULL,59,'2014-04-10 11:04:36',1,2,2),(2138,NULL,59,'2014-04-10 11:04:36',1,2,2),(2139,NULL,59,'2014-04-10 11:04:36',1,2,2),(2140,NULL,59,'2014-04-10 11:04:36',1,2,2),(2141,NULL,59,'2014-04-10 11:04:36',1,2,2),(2142,NULL,59,'2014-04-10 11:05:02',1,2,2),(2143,NULL,59,'2014-04-10 11:05:02',1,2,2),(2144,NULL,59,'2014-04-10 11:05:02',1,2,2),(2145,NULL,59,'2014-04-10 11:05:02',1,2,2),(2146,NULL,59,'2014-04-10 11:05:02',1,2,2),(2147,NULL,59,'2014-04-10 11:05:02',1,2,2),(2148,NULL,59,'2014-04-10 11:05:02',1,2,2),(2149,NULL,59,'2014-04-10 11:05:24',1,2,2),(2150,NULL,59,'2014-04-10 11:05:24',1,2,2),(2151,NULL,59,'2014-04-10 11:05:24',1,2,2),(2152,NULL,59,'2014-04-10 11:05:24',1,2,2),(2153,NULL,59,'2014-04-10 11:05:24',1,2,2),(2154,NULL,59,'2014-04-10 11:05:24',1,2,2),(2155,NULL,59,'2014-04-10 11:05:24',1,2,2),(2156,NULL,59,'2014-04-10 11:05:54',1,2,2),(2157,NULL,59,'2014-04-10 11:05:54',1,2,2),(2158,NULL,59,'2014-04-10 11:05:54',1,2,2),(2159,NULL,59,'2014-04-10 11:05:54',1,2,2),(2160,NULL,59,'2014-04-10 11:05:54',1,2,2),(2161,NULL,59,'2014-04-10 11:05:54',1,2,2),(2162,NULL,59,'2014-04-10 11:05:54',1,2,2),(2163,NULL,59,'2014-04-10 11:50:19',1,2,2),(2164,NULL,59,'2014-04-10 11:50:19',1,2,2),(2165,NULL,59,'2014-04-10 11:50:19',1,2,2),(2166,NULL,59,'2014-04-10 11:50:19',1,2,2),(2167,NULL,59,'2014-04-10 11:50:19',1,2,2),(2168,NULL,59,'2014-04-10 11:50:19',1,2,2),(2169,NULL,59,'2014-04-10 11:50:19',1,2,2),(2170,NULL,59,'2014-04-10 11:50:35',1,2,2),(2171,NULL,59,'2014-04-10 11:50:35',1,2,2),(2172,NULL,59,'2014-04-10 11:50:35',1,2,2),(2173,NULL,59,'2014-04-10 11:50:35',1,2,2),(2174,NULL,59,'2014-04-10 11:50:35',1,2,2),(2175,NULL,59,'2014-04-10 11:50:35',1,2,2),(2176,NULL,59,'2014-04-10 11:50:35',1,2,2),(2177,NULL,59,'2014-04-10 11:53:07',1,2,2),(2178,NULL,59,'2014-04-10 11:53:07',1,2,2),(2179,NULL,59,'2014-04-10 11:53:07',1,2,2),(2180,NULL,59,'2014-04-10 11:53:07',1,2,2),(2181,NULL,59,'2014-04-10 11:53:07',1,2,2),(2182,NULL,59,'2014-04-10 11:53:07',1,2,2),(2183,NULL,59,'2014-04-10 11:53:07',1,2,2),(2184,NULL,59,'2014-04-10 11:53:20',1,2,2),(2185,NULL,59,'2014-04-10 11:53:20',1,2,2),(2186,NULL,59,'2014-04-10 11:53:20',1,2,2),(2187,NULL,59,'2014-04-10 11:53:20',1,2,2),(2188,NULL,59,'2014-04-10 11:53:20',1,2,2),(2189,NULL,59,'2014-04-10 11:53:20',1,2,2),(2190,NULL,59,'2014-04-10 11:53:20',1,2,2),(2191,NULL,59,'2014-04-10 11:55:12',1,2,2),(2192,NULL,59,'2014-04-10 11:55:12',1,2,2),(2193,NULL,59,'2014-04-10 11:55:12',1,2,2),(2194,NULL,59,'2014-04-10 11:55:12',1,2,2),(2195,NULL,59,'2014-04-10 11:55:12',1,2,2),(2196,NULL,59,'2014-04-10 11:55:12',1,2,2),(2197,NULL,59,'2014-04-10 11:55:12',1,2,2),(2198,NULL,59,'2014-04-10 11:55:15',1,2,2),(2199,NULL,59,'2014-04-10 11:55:15',1,2,2),(2200,NULL,59,'2014-04-10 11:55:15',1,2,2),(2201,NULL,59,'2014-04-10 11:55:15',1,2,2),(2202,NULL,59,'2014-04-10 11:55:15',1,2,2),(2203,NULL,59,'2014-04-10 11:55:15',1,2,2),(2204,NULL,59,'2014-04-10 11:55:15',1,2,2),(2205,NULL,59,'2014-04-10 11:55:45',1,2,2),(2206,NULL,59,'2014-04-10 11:55:45',1,2,2),(2207,NULL,59,'2014-04-10 11:55:45',1,2,2),(2208,NULL,59,'2014-04-10 11:55:45',1,2,2),(2209,NULL,59,'2014-04-10 11:55:45',1,2,2),(2210,NULL,59,'2014-04-10 11:55:45',1,2,2),(2211,NULL,59,'2014-04-10 11:55:45',1,2,2),(2212,NULL,59,'2014-04-10 11:55:50',1,2,2),(2213,NULL,59,'2014-04-10 11:55:50',1,2,2),(2214,NULL,59,'2014-04-10 11:55:50',1,2,2),(2215,NULL,59,'2014-04-10 11:55:50',1,2,2),(2216,NULL,59,'2014-04-10 11:55:50',1,2,2),(2217,NULL,59,'2014-04-10 11:55:50',1,2,2),(2218,NULL,59,'2014-04-10 11:55:50',1,2,2),(2219,NULL,59,'2014-04-10 11:56:50',1,2,2),(2220,NULL,59,'2014-04-10 11:56:50',1,2,2),(2221,NULL,59,'2014-04-10 11:56:50',1,2,2),(2222,NULL,59,'2014-04-10 11:56:50',1,2,2),(2223,NULL,59,'2014-04-10 11:56:50',1,2,2),(2224,NULL,59,'2014-04-10 11:56:50',1,2,2),(2225,NULL,59,'2014-04-10 11:56:50',1,2,2),(2226,NULL,59,'2014-04-10 11:57:06',1,2,2),(2227,NULL,59,'2014-04-10 11:57:06',1,2,2),(2228,NULL,59,'2014-04-10 11:57:06',1,2,2),(2229,NULL,59,'2014-04-10 11:57:06',1,2,2),(2230,NULL,59,'2014-04-10 11:57:06',1,2,2),(2231,NULL,59,'2014-04-10 11:57:06',1,2,2),(2232,NULL,59,'2014-04-10 11:57:06',1,2,2),(2233,NULL,59,'2014-04-10 11:57:10',1,2,2),(2234,NULL,59,'2014-04-10 11:57:10',1,2,2),(2235,NULL,59,'2014-04-10 11:57:10',1,2,2),(2236,NULL,59,'2014-04-10 11:57:10',1,2,2),(2237,NULL,59,'2014-04-10 11:57:10',1,2,2),(2238,NULL,59,'2014-04-10 11:57:10',1,2,2),(2239,NULL,59,'2014-04-10 11:57:10',1,2,2),(2240,NULL,59,'2014-04-10 12:17:39',1,2,2),(2241,NULL,59,'2014-04-10 12:17:39',1,2,2),(2242,NULL,59,'2014-04-10 12:17:39',1,2,2),(2243,NULL,59,'2014-04-10 12:17:39',1,2,2),(2244,NULL,59,'2014-04-10 12:17:39',1,2,2),(2245,NULL,59,'2014-04-10 12:17:39',1,2,2),(2246,NULL,59,'2014-04-10 12:17:39',1,2,2),(2247,NULL,59,'2014-04-10 12:17:45',1,2,2),(2248,NULL,59,'2014-04-10 12:17:45',1,2,2),(2249,NULL,59,'2014-04-10 12:17:45',1,2,2),(2250,NULL,59,'2014-04-10 12:17:45',1,2,2),(2251,NULL,59,'2014-04-10 12:17:45',1,2,2),(2252,NULL,59,'2014-04-10 12:17:45',1,2,2),(2253,NULL,59,'2014-04-10 12:17:45',1,2,2),(2254,NULL,59,'2014-04-10 12:17:53',1,2,2),(2255,NULL,59,'2014-04-10 12:17:53',1,2,2),(2256,NULL,59,'2014-04-10 12:17:53',1,2,2),(2257,NULL,59,'2014-04-10 12:17:53',1,2,2),(2258,NULL,59,'2014-04-10 12:17:53',1,2,2),(2259,NULL,59,'2014-04-10 12:17:53',1,2,2),(2260,NULL,59,'2014-04-10 12:17:53',1,2,2),(2261,NULL,59,'2014-04-10 12:37:47',1,2,2),(2262,NULL,59,'2014-04-10 12:37:47',1,2,2),(2263,NULL,59,'2014-04-10 12:37:47',1,2,2),(2264,NULL,59,'2014-04-10 12:37:47',1,2,2),(2265,NULL,59,'2014-04-10 12:37:47',1,2,2),(2266,NULL,59,'2014-04-10 12:37:47',1,2,2),(2267,NULL,59,'2014-04-10 12:37:47',1,2,2),(2268,NULL,65,'2014-04-10 13:07:57',1,2,2),(2269,NULL,66,'2014-04-10 13:10:43',1,2,2),(2270,NULL,59,'2014-04-10 13:14:27',1,2,2),(2271,NULL,59,'2014-04-10 13:30:09',1,2,2),(2272,NULL,59,'2014-04-10 13:35:56',1,2,2),(2273,NULL,59,'2014-04-10 13:35:58',1,2,2),(2274,NULL,59,'2014-04-10 13:36:03',1,2,2),(2275,NULL,59,'2014-04-10 13:36:10',1,2,2),(2276,NULL,59,'2014-04-10 13:36:42',1,2,2),(2277,NULL,59,'2014-04-10 13:38:22',1,2,2),(2278,NULL,59,'2014-04-10 13:40:48',1,2,2),(2279,NULL,59,'2014-04-10 13:43:10',1,2,2),(2280,NULL,59,'2014-04-10 13:43:12',1,2,2),(2281,NULL,59,'2014-04-10 13:44:50',1,2,2),(2282,NULL,59,'2014-04-10 13:48:04',1,2,2),(2283,NULL,59,'2014-04-10 13:48:31',1,2,2),(2284,NULL,59,'2014-04-10 13:48:56',1,2,2),(2285,NULL,59,'2014-04-10 13:49:50',1,2,2),(2286,NULL,59,'2014-04-10 13:50:49',1,2,2),(2287,NULL,59,'2014-04-10 13:51:50',1,2,2),(2288,NULL,59,'2014-04-10 13:53:06',1,2,2),(2289,NULL,59,'2014-04-10 13:54:55',1,2,2),(2290,NULL,59,'2014-04-10 13:56:32',1,2,2),(2291,NULL,59,'2014-04-10 13:57:21',1,2,2),(2292,NULL,59,'2014-04-10 13:59:37',1,2,2),(2293,NULL,59,'2014-04-10 14:01:32',1,2,2),(2294,NULL,59,'2014-04-10 14:07:33',1,2,2),(2295,NULL,59,'2014-04-10 14:08:06',1,2,2),(2296,NULL,59,'2014-04-10 14:09:13',1,2,2),(2297,NULL,59,'2014-04-10 14:11:19',1,2,2),(2298,NULL,59,'2014-04-10 14:24:59',1,2,2),(2299,NULL,59,'2014-04-10 14:24:59',1,2,2),(2300,NULL,59,'2014-04-10 14:24:59',1,2,2),(2301,NULL,59,'2014-04-10 14:24:59',1,2,2),(2302,NULL,59,'2014-04-10 14:24:59',1,2,2),(2303,NULL,59,'2014-04-10 14:24:59',1,2,2),(2304,NULL,59,'2014-04-10 14:24:59',1,2,2),(2305,NULL,59,'2014-04-10 14:26:29',1,2,2),(2306,NULL,59,'2014-04-10 14:26:29',1,2,2),(2307,NULL,59,'2014-04-10 14:26:29',1,2,2),(2308,NULL,59,'2014-04-10 14:26:29',1,2,2),(2309,NULL,59,'2014-04-10 14:26:29',1,2,2),(2310,NULL,59,'2014-04-10 14:26:29',1,2,2),(2311,NULL,59,'2014-04-10 14:26:29',1,2,2),(2312,NULL,59,'2014-04-10 14:33:20',1,2,2),(2313,NULL,59,'2014-04-10 14:33:32',1,2,2),(2314,NULL,59,'2014-04-10 14:33:33',1,2,2),(2315,NULL,59,'2014-04-10 14:33:42',1,2,2),(2316,NULL,59,'2014-04-10 14:33:54',1,2,2),(2317,NULL,59,'2014-04-10 14:33:55',1,2,2),(2318,NULL,59,'2014-04-10 14:34:27',1,2,2),(2319,NULL,59,'2014-04-10 14:34:34',1,2,2),(2320,NULL,59,'2014-04-10 14:35:29',1,2,2),(2321,NULL,59,'2014-04-10 14:36:59',1,2,2),(2322,NULL,59,'2014-04-10 14:36:59',1,2,2),(2323,NULL,59,'2014-04-10 14:36:59',1,2,2),(2324,NULL,59,'2014-04-10 14:36:59',1,2,2),(2325,NULL,59,'2014-04-10 14:36:59',1,2,2),(2326,NULL,59,'2014-04-10 14:36:59',1,2,2),(2327,NULL,59,'2014-04-10 14:36:59',1,2,2),(2328,NULL,59,'2014-04-10 14:41:41',1,2,2),(2329,NULL,59,'2014-04-10 14:41:41',1,2,2),(2330,NULL,59,'2014-04-10 14:41:41',1,2,2),(2331,NULL,59,'2014-04-10 14:41:41',1,2,2),(2332,NULL,59,'2014-04-10 14:41:41',1,2,2),(2333,NULL,59,'2014-04-10 14:41:41',1,2,2),(2334,NULL,59,'2014-04-10 14:41:41',1,2,2),(2335,NULL,59,'2014-04-10 14:47:16',1,2,2),(2336,NULL,59,'2014-04-10 14:47:16',1,2,2),(2337,NULL,59,'2014-04-10 14:47:16',1,2,2),(2338,NULL,59,'2014-04-10 14:47:16',1,2,2),(2339,NULL,59,'2014-04-10 14:47:16',1,2,2),(2340,NULL,59,'2014-04-10 14:47:16',1,2,2),(2341,NULL,59,'2014-04-10 14:47:16',1,2,2),(2342,NULL,59,'2014-04-10 14:47:22',1,2,2),(2343,NULL,59,'2014-04-10 14:47:22',1,2,2),(2344,NULL,59,'2014-04-10 14:47:22',1,2,2),(2345,NULL,59,'2014-04-10 14:47:22',1,2,2),(2346,NULL,59,'2014-04-10 14:47:22',1,2,2),(2347,NULL,59,'2014-04-10 14:47:22',1,2,2),(2348,NULL,59,'2014-04-10 14:47:22',1,2,2),(2349,NULL,59,'2014-04-10 14:47:23',1,2,2),(2350,NULL,59,'2014-04-10 14:47:23',1,2,2),(2351,NULL,59,'2014-04-10 14:47:23',1,2,2),(2352,NULL,59,'2014-04-10 14:47:23',1,2,2),(2353,NULL,59,'2014-04-10 14:47:23',1,2,2),(2354,NULL,59,'2014-04-10 14:47:23',1,2,2),(2355,NULL,59,'2014-04-10 14:47:23',1,2,2),(2356,NULL,59,'2014-04-10 14:47:25',1,2,2),(2357,NULL,59,'2014-04-10 14:47:25',1,2,2),(2358,NULL,59,'2014-04-10 14:47:25',1,2,2),(2359,NULL,59,'2014-04-10 14:47:25',1,2,2),(2360,NULL,59,'2014-04-10 14:47:25',1,2,2),(2361,NULL,59,'2014-04-10 14:47:25',1,2,2),(2362,NULL,59,'2014-04-10 14:47:25',1,2,2),(2363,NULL,59,'2014-04-10 14:47:27',1,2,2),(2364,NULL,59,'2014-04-10 14:47:27',1,2,2),(2365,NULL,59,'2014-04-10 14:47:27',1,2,2),(2366,NULL,59,'2014-04-10 14:47:27',1,2,2),(2367,NULL,59,'2014-04-10 14:47:27',1,2,2),(2368,NULL,59,'2014-04-10 14:47:27',1,2,2),(2369,NULL,59,'2014-04-10 14:47:27',1,2,2),(2370,NULL,59,'2014-04-10 14:47:42',1,2,2),(2371,NULL,59,'2014-04-10 14:47:42',1,2,2),(2372,NULL,59,'2014-04-10 14:47:42',1,2,2),(2373,NULL,59,'2014-04-10 14:47:42',1,2,2),(2374,NULL,59,'2014-04-10 14:47:42',1,2,2),(2375,NULL,59,'2014-04-10 14:47:42',1,2,2),(2376,NULL,59,'2014-04-10 14:47:42',1,2,2),(2377,NULL,59,'2014-04-10 14:47:46',1,2,2),(2378,NULL,59,'2014-04-10 14:47:46',1,2,2),(2379,NULL,59,'2014-04-10 14:47:46',1,2,2),(2380,NULL,59,'2014-04-10 14:47:46',1,2,2),(2381,NULL,59,'2014-04-10 14:47:46',1,2,2),(2382,NULL,59,'2014-04-10 14:47:46',1,2,2),(2383,NULL,59,'2014-04-10 14:47:46',1,2,2),(2384,NULL,59,'2014-04-10 15:34:23',1,2,2),(2385,NULL,59,'2014-04-10 15:34:23',1,2,2),(2386,NULL,59,'2014-04-10 15:34:23',1,2,2),(2387,NULL,59,'2014-04-10 15:34:23',1,2,2),(2388,NULL,59,'2014-04-10 15:34:23',1,2,2),(2389,NULL,59,'2014-04-10 15:34:23',1,2,2),(2390,NULL,59,'2014-04-10 15:34:23',1,2,2),(2391,NULL,59,'2014-04-10 15:35:20',1,2,2),(2392,NULL,59,'2014-04-10 15:37:33',1,2,2),(2393,NULL,59,'2014-04-10 15:37:33',1,2,2),(2394,NULL,59,'2014-04-10 15:37:33',1,2,2),(2395,NULL,59,'2014-04-10 15:37:33',1,2,2),(2396,NULL,59,'2014-04-10 15:37:33',1,2,2),(2397,NULL,59,'2014-04-10 15:37:33',1,2,2),(2398,NULL,59,'2014-04-10 15:37:33',1,2,2),(2399,NULL,59,'2014-04-10 15:37:35',1,2,2),(2400,NULL,59,'2014-04-10 15:37:35',1,2,2),(2401,NULL,59,'2014-04-10 15:37:35',1,2,2),(2402,NULL,59,'2014-04-10 15:37:35',1,2,2),(2403,NULL,59,'2014-04-10 15:37:35',1,2,2),(2404,NULL,59,'2014-04-10 15:37:35',1,2,2),(2405,NULL,59,'2014-04-10 15:37:35',1,2,2),(2406,NULL,59,'2014-04-10 15:37:54',1,2,2),(2407,NULL,59,'2014-04-10 15:37:54',1,2,2),(2408,NULL,59,'2014-04-10 15:37:54',1,2,2),(2409,NULL,59,'2014-04-10 15:37:54',1,2,2),(2410,NULL,59,'2014-04-10 15:37:54',1,2,2),(2411,NULL,59,'2014-04-10 15:37:54',1,2,2),(2412,NULL,59,'2014-04-10 15:37:54',1,2,2),(2413,NULL,59,'2014-04-10 15:38:41',1,2,2),(2414,NULL,59,'2014-04-10 15:44:36',1,2,2),(2415,NULL,59,'2014-04-10 15:47:22',1,2,2),(2416,NULL,59,'2014-04-10 15:50:27',1,2,2),(2417,NULL,59,'2014-04-10 15:51:49',1,2,2),(2418,NULL,59,'2014-04-10 15:51:54',1,2,2),(2419,NULL,59,'2014-04-10 16:09:27',1,2,2),(2420,NULL,59,'2014-04-10 16:22:25',1,2,2),(2421,NULL,59,'2014-04-10 16:23:02',1,2,2),(2422,NULL,59,'2014-04-10 16:32:47',1,2,2),(2423,NULL,59,'2014-04-10 16:33:21',1,2,2),(2424,NULL,59,'2014-04-10 16:33:21',1,2,2),(2425,NULL,59,'2014-04-10 16:33:21',1,2,2),(2426,NULL,59,'2014-04-10 16:33:21',1,2,2),(2427,NULL,59,'2014-04-10 16:33:21',1,2,2),(2428,NULL,59,'2014-04-10 16:33:21',1,2,2),(2429,NULL,59,'2014-04-10 16:33:21',1,2,2),(2430,NULL,59,'2014-04-10 16:34:18',1,2,2),(2431,NULL,59,'2014-04-10 16:34:18',1,2,2),(2432,NULL,59,'2014-04-10 16:34:18',1,2,2),(2433,NULL,59,'2014-04-10 16:34:18',1,2,2),(2434,NULL,59,'2014-04-10 16:34:18',1,2,2),(2435,NULL,59,'2014-04-10 16:34:18',1,2,2),(2436,NULL,59,'2014-04-10 16:34:18',1,2,2),(2437,NULL,59,'2014-04-10 16:34:19',1,2,2),(2438,NULL,59,'2014-04-10 16:34:19',1,2,2),(2439,NULL,59,'2014-04-10 16:34:19',1,2,2),(2440,NULL,59,'2014-04-10 16:34:19',1,2,2),(2441,NULL,59,'2014-04-10 16:34:19',1,2,2),(2442,NULL,59,'2014-04-10 16:34:19',1,2,2),(2443,NULL,59,'2014-04-10 16:34:19',1,2,2),(2444,NULL,59,'2014-04-10 16:34:21',1,2,2),(2445,NULL,59,'2014-04-10 16:34:21',1,2,2),(2446,NULL,59,'2014-04-10 16:34:21',1,2,2),(2447,NULL,59,'2014-04-10 16:34:21',1,2,2),(2448,NULL,59,'2014-04-10 16:34:21',1,2,2),(2449,NULL,59,'2014-04-10 16:34:21',1,2,2),(2450,NULL,59,'2014-04-10 16:34:21',1,2,2),(2451,NULL,59,'2014-04-10 16:35:42',1,2,2),(2452,NULL,59,'2014-04-10 16:36:12',1,2,2),(2453,NULL,59,'2014-04-10 16:36:12',1,2,2),(2454,NULL,59,'2014-04-10 16:36:12',1,2,2),(2455,NULL,59,'2014-04-10 16:36:12',1,2,2),(2456,NULL,59,'2014-04-10 16:36:12',1,2,2),(2457,NULL,59,'2014-04-10 16:36:12',1,2,2),(2458,NULL,59,'2014-04-10 16:36:12',1,2,2),(2459,NULL,59,'2014-04-10 16:46:17',1,2,2),(2460,NULL,59,'2014-04-10 16:46:39',1,2,2),(2461,NULL,59,'2014-04-10 16:47:23',1,2,2),(2462,NULL,59,'2014-04-10 16:47:40',1,2,2),(2463,NULL,59,'2014-04-10 16:50:17',1,2,2),(2464,NULL,59,'2014-04-10 16:51:01',1,2,2),(2465,NULL,59,'2014-04-10 16:51:21',1,2,2),(2466,NULL,59,'2014-04-10 17:00:24',1,2,2),(2467,NULL,59,'2014-04-10 17:00:24',1,2,2),(2468,NULL,59,'2014-04-10 17:00:24',1,2,2),(2469,NULL,59,'2014-04-10 17:00:24',1,2,2),(2470,NULL,59,'2014-04-10 17:00:24',1,2,2),(2471,NULL,59,'2014-04-10 17:00:24',1,2,2),(2472,NULL,59,'2014-04-10 17:00:24',1,2,2),(2473,NULL,59,'2014-04-10 17:00:50',1,2,2),(2474,NULL,59,'2014-04-10 17:00:50',1,2,2),(2475,NULL,59,'2014-04-10 17:00:50',1,2,2),(2476,NULL,59,'2014-04-10 17:00:50',1,2,2),(2477,NULL,59,'2014-04-10 17:00:50',1,2,2),(2478,NULL,59,'2014-04-10 17:00:50',1,2,2),(2479,NULL,59,'2014-04-10 17:00:50',1,2,2),(2480,NULL,59,'2014-04-10 17:01:34',1,2,2),(2481,NULL,59,'2014-04-10 17:01:34',1,2,2),(2482,NULL,59,'2014-04-10 17:01:34',1,2,2),(2483,NULL,59,'2014-04-10 17:01:34',1,2,2),(2484,NULL,59,'2014-04-10 17:01:34',1,2,2),(2485,NULL,59,'2014-04-10 17:01:34',1,2,2),(2486,NULL,59,'2014-04-10 17:01:34',1,2,2),(2487,NULL,59,'2014-04-10 17:01:38',1,2,2),(2488,NULL,59,'2014-04-10 17:01:38',1,2,2),(2489,NULL,59,'2014-04-10 17:01:38',1,2,2),(2490,NULL,59,'2014-04-10 17:01:38',1,2,2),(2491,NULL,59,'2014-04-10 17:01:38',1,2,2),(2492,NULL,59,'2014-04-10 17:01:38',1,2,2),(2493,NULL,59,'2014-04-10 17:01:38',1,2,2),(2494,NULL,59,'2014-04-10 17:01:40',1,2,2),(2495,NULL,59,'2014-04-10 17:01:40',1,2,2),(2496,NULL,59,'2014-04-10 17:01:40',1,2,2),(2497,NULL,59,'2014-04-10 17:01:40',1,2,2),(2498,NULL,59,'2014-04-10 17:01:40',1,2,2),(2499,NULL,59,'2014-04-10 17:01:40',1,2,2),(2500,NULL,59,'2014-04-10 17:01:40',1,2,2),(2501,NULL,59,'2014-04-10 17:02:02',1,2,2),(2502,NULL,59,'2014-04-10 17:02:02',1,2,2),(2503,NULL,59,'2014-04-10 17:02:02',1,2,2),(2504,NULL,59,'2014-04-10 17:02:02',1,2,2),(2505,NULL,59,'2014-04-10 17:02:02',1,2,2),(2506,NULL,59,'2014-04-10 17:02:02',1,2,2),(2507,NULL,59,'2014-04-10 17:02:02',1,2,2),(2508,NULL,59,'2014-04-10 17:03:24',1,2,2),(2509,NULL,59,'2014-04-10 17:03:24',1,2,2),(2510,NULL,59,'2014-04-10 17:03:24',1,2,2),(2511,NULL,59,'2014-04-10 17:03:24',1,2,2),(2512,NULL,59,'2014-04-10 17:03:24',1,2,2),(2513,NULL,59,'2014-04-10 17:03:24',1,2,2),(2514,NULL,59,'2014-04-10 17:03:24',1,2,2),(2515,NULL,59,'2014-04-10 17:11:33',1,2,2),(2516,NULL,59,'2014-04-10 17:11:33',1,2,2),(2517,NULL,59,'2014-04-10 17:11:33',1,2,2),(2518,NULL,59,'2014-04-10 17:11:33',1,2,2),(2519,NULL,59,'2014-04-10 17:11:33',1,2,2),(2520,NULL,59,'2014-04-10 17:11:33',1,2,2),(2521,NULL,59,'2014-04-10 17:11:33',1,2,2),(2522,NULL,59,'2014-04-10 17:18:00',1,2,2),(2523,NULL,59,'2014-04-10 17:18:00',1,2,2),(2524,NULL,59,'2014-04-10 17:18:00',1,2,2),(2525,NULL,59,'2014-04-10 17:18:00',1,2,2),(2526,NULL,59,'2014-04-10 17:18:00',1,2,2),(2527,NULL,59,'2014-04-10 17:18:00',1,2,2),(2528,NULL,59,'2014-04-10 17:18:00',1,2,2),(2529,NULL,59,'2014-04-10 17:18:01',1,2,2),(2530,NULL,59,'2014-04-10 17:18:01',1,2,2),(2531,NULL,59,'2014-04-10 17:18:01',1,2,2),(2532,NULL,59,'2014-04-10 17:18:01',1,2,2),(2533,NULL,59,'2014-04-10 17:18:01',1,2,2),(2534,NULL,59,'2014-04-10 17:18:01',1,2,2),(2535,NULL,59,'2014-04-10 17:18:01',1,2,2),(2536,NULL,59,'2014-04-10 17:20:07',1,2,2),(2537,NULL,59,'2014-04-10 17:20:07',1,2,2),(2538,NULL,59,'2014-04-10 17:20:07',1,2,2),(2539,NULL,59,'2014-04-10 17:20:07',1,2,2),(2540,NULL,59,'2014-04-10 17:20:07',1,2,2),(2541,NULL,59,'2014-04-10 17:20:07',1,2,2),(2542,NULL,59,'2014-04-10 17:20:07',1,2,2),(2543,NULL,59,'2014-04-10 17:23:23',1,2,2),(2544,NULL,59,'2014-04-10 17:23:23',1,2,2),(2545,NULL,59,'2014-04-10 17:23:23',1,2,2),(2546,NULL,59,'2014-04-10 17:23:23',1,2,2),(2547,NULL,59,'2014-04-10 17:23:23',1,2,2),(2548,NULL,59,'2014-04-10 17:23:23',1,2,2),(2549,NULL,59,'2014-04-10 17:23:23',1,2,2),(2550,NULL,59,'2014-04-10 17:25:01',1,2,2),(2551,NULL,59,'2014-04-10 17:25:01',1,2,2),(2552,NULL,59,'2014-04-10 17:25:01',1,2,2),(2553,NULL,59,'2014-04-10 17:25:01',1,2,2),(2554,NULL,59,'2014-04-10 17:25:01',1,2,2),(2555,NULL,59,'2014-04-10 17:25:01',1,2,2),(2556,NULL,59,'2014-04-10 17:25:01',1,2,2),(2557,NULL,59,'2014-04-10 17:26:56',1,2,2),(2558,NULL,59,'2014-04-10 17:26:56',1,2,2),(2559,NULL,59,'2014-04-10 17:26:56',1,2,2),(2560,NULL,59,'2014-04-10 17:26:56',1,2,2),(2561,NULL,59,'2014-04-10 17:26:56',1,2,2),(2562,NULL,59,'2014-04-10 17:26:56',1,2,2),(2563,NULL,59,'2014-04-10 17:26:56',1,2,2),(2564,NULL,59,'2014-04-10 17:27:05',1,2,2),(2565,NULL,59,'2014-04-10 17:27:05',1,2,2),(2566,NULL,59,'2014-04-10 17:27:05',1,2,2),(2567,NULL,59,'2014-04-10 17:27:05',1,2,2),(2568,NULL,59,'2014-04-10 17:27:05',1,2,2),(2569,NULL,59,'2014-04-10 17:27:05',1,2,2),(2570,NULL,59,'2014-04-10 17:27:05',1,2,2),(2571,NULL,59,'2014-04-10 17:27:12',1,2,2),(2572,NULL,59,'2014-04-10 17:27:12',1,2,2),(2573,NULL,59,'2014-04-10 17:27:12',1,2,2),(2574,NULL,59,'2014-04-10 17:27:12',1,2,2),(2575,NULL,59,'2014-04-10 17:27:12',1,2,2),(2576,NULL,59,'2014-04-10 17:27:12',1,2,2),(2577,NULL,59,'2014-04-10 17:27:12',1,2,2),(2578,NULL,59,'2014-04-10 17:27:13',1,2,2),(2579,NULL,59,'2014-04-10 17:27:13',1,2,2),(2580,NULL,59,'2014-04-10 17:27:13',1,2,2),(2581,NULL,59,'2014-04-10 17:27:13',1,2,2),(2582,NULL,59,'2014-04-10 17:27:13',1,2,2),(2583,NULL,59,'2014-04-10 17:27:13',1,2,2),(2584,NULL,59,'2014-04-10 17:27:13',1,2,2),(2585,NULL,59,'2014-04-10 17:27:18',1,2,2),(2586,NULL,59,'2014-04-10 17:27:18',1,2,2),(2587,NULL,59,'2014-04-10 17:27:18',1,2,2),(2588,NULL,59,'2014-04-10 17:27:18',1,2,2),(2589,NULL,59,'2014-04-10 17:27:18',1,2,2),(2590,NULL,59,'2014-04-10 17:27:18',1,2,2),(2591,NULL,59,'2014-04-10 17:27:18',1,2,2),(2592,NULL,59,'2014-04-10 17:27:21',1,2,2),(2593,NULL,59,'2014-04-10 17:27:21',1,2,2),(2594,NULL,59,'2014-04-10 17:27:21',1,2,2),(2595,NULL,59,'2014-04-10 17:27:21',1,2,2),(2596,NULL,59,'2014-04-10 17:27:21',1,2,2),(2597,NULL,59,'2014-04-10 17:27:21',1,2,2),(2598,NULL,59,'2014-04-10 17:27:21',1,2,2),(2599,NULL,59,'2014-04-10 17:27:57',1,2,2),(2600,NULL,59,'2014-04-10 17:27:57',1,2,2),(2601,NULL,59,'2014-04-10 17:27:57',1,2,2),(2602,NULL,59,'2014-04-10 17:27:57',1,2,2),(2603,NULL,59,'2014-04-10 17:27:57',1,2,2),(2604,NULL,59,'2014-04-10 17:27:57',1,2,2),(2605,NULL,59,'2014-04-10 17:27:57',1,2,2),(2606,NULL,59,'2014-04-10 17:28:46',1,2,2),(2607,NULL,59,'2014-04-10 17:28:46',1,2,2),(2608,NULL,59,'2014-04-10 17:28:46',1,2,2),(2609,NULL,59,'2014-04-10 17:28:46',1,2,2),(2610,NULL,59,'2014-04-10 17:28:46',1,2,2),(2611,NULL,59,'2014-04-10 17:28:46',1,2,2),(2612,NULL,59,'2014-04-10 17:28:46',1,2,2),(2613,NULL,59,'2014-04-10 17:28:56',1,2,2),(2614,NULL,59,'2014-04-10 17:28:56',1,2,2),(2615,NULL,59,'2014-04-10 17:28:56',1,2,2),(2616,NULL,59,'2014-04-10 17:28:56',1,2,2),(2617,NULL,59,'2014-04-10 17:28:56',1,2,2),(2618,NULL,59,'2014-04-10 17:28:56',1,2,2),(2619,NULL,59,'2014-04-10 17:28:56',1,2,2),(2620,NULL,59,'2014-04-10 17:28:57',1,2,2),(2621,NULL,59,'2014-04-10 17:28:57',1,2,2),(2622,NULL,59,'2014-04-10 17:28:57',1,2,2),(2623,NULL,59,'2014-04-10 17:28:57',1,2,2),(2624,NULL,59,'2014-04-10 17:28:57',1,2,2),(2625,NULL,59,'2014-04-10 17:28:57',1,2,2),(2626,NULL,59,'2014-04-10 17:28:57',1,2,2),(2627,NULL,59,'2014-04-10 17:30:32',1,2,2),(2628,NULL,59,'2014-04-10 17:30:32',1,2,2),(2629,NULL,59,'2014-04-10 17:30:32',1,2,2),(2630,NULL,59,'2014-04-10 17:30:32',1,2,2),(2631,NULL,59,'2014-04-10 17:30:32',1,2,2),(2632,NULL,59,'2014-04-10 17:30:32',1,2,2),(2633,NULL,59,'2014-04-10 17:30:32',1,2,2),(2634,NULL,59,'2014-04-10 17:30:38',1,2,2),(2635,NULL,59,'2014-04-10 17:30:38',1,2,2),(2636,NULL,59,'2014-04-10 17:30:38',1,2,2),(2637,NULL,59,'2014-04-10 17:30:38',1,2,2),(2638,NULL,59,'2014-04-10 17:30:38',1,2,2),(2639,NULL,59,'2014-04-10 17:30:38',1,2,2),(2640,NULL,59,'2014-04-10 17:30:38',1,2,2),(2641,NULL,59,'2014-04-10 17:31:10',1,2,2),(2642,NULL,59,'2014-04-10 17:31:10',1,2,2),(2643,NULL,59,'2014-04-10 17:31:10',1,2,2),(2644,NULL,59,'2014-04-10 17:31:10',1,2,2),(2645,NULL,59,'2014-04-10 17:31:10',1,2,2),(2646,NULL,59,'2014-04-10 17:31:10',1,2,2),(2647,NULL,59,'2014-04-10 17:31:10',1,2,2),(2648,NULL,59,'2014-04-10 17:33:23',1,2,2),(2649,NULL,59,'2014-04-10 17:33:23',1,2,2),(2650,NULL,59,'2014-04-10 17:33:23',1,2,2),(2651,NULL,59,'2014-04-10 17:33:23',1,2,2),(2652,NULL,59,'2014-04-10 17:33:23',1,2,2),(2653,NULL,59,'2014-04-10 17:33:23',1,2,2),(2654,NULL,59,'2014-04-10 17:33:23',1,2,2),(2655,NULL,59,'2014-04-10 17:33:31',1,2,2),(2656,NULL,59,'2014-04-10 17:39:41',1,2,2),(2657,NULL,59,'2014-04-10 17:39:41',1,2,2),(2658,NULL,59,'2014-04-10 17:39:41',1,2,2),(2659,NULL,59,'2014-04-10 17:39:41',1,2,2),(2660,NULL,59,'2014-04-10 17:39:41',1,2,2),(2661,NULL,59,'2014-04-10 17:39:41',1,2,2),(2662,NULL,59,'2014-04-10 17:39:41',1,2,2),(2663,NULL,59,'2014-04-10 17:46:34',1,2,2),(2664,NULL,59,'2014-04-10 17:46:34',1,2,2),(2665,NULL,59,'2014-04-10 17:46:34',1,2,2),(2666,NULL,59,'2014-04-10 17:46:34',1,2,2),(2667,NULL,59,'2014-04-10 17:46:34',1,2,2),(2668,NULL,59,'2014-04-10 17:46:34',1,2,2),(2669,NULL,59,'2014-04-10 17:46:34',1,2,2),(2670,NULL,59,'2014-04-10 18:00:28',1,2,2),(2671,NULL,59,'2014-04-10 18:00:28',1,2,2),(2672,NULL,59,'2014-04-10 18:00:28',1,2,2),(2673,NULL,59,'2014-04-10 18:00:28',1,2,2),(2674,NULL,59,'2014-04-10 18:00:28',1,2,2),(2675,NULL,59,'2014-04-10 18:00:28',1,2,2),(2676,NULL,59,'2014-04-10 18:00:28',1,2,2),(2677,NULL,59,'2014-04-10 18:00:30',1,2,2),(2678,NULL,59,'2014-04-10 18:00:30',1,2,2),(2679,NULL,59,'2014-04-10 18:00:30',1,2,2),(2680,NULL,59,'2014-04-10 18:00:30',1,2,2),(2681,NULL,59,'2014-04-10 18:00:30',1,2,2),(2682,NULL,59,'2014-04-10 18:00:30',1,2,2),(2683,NULL,59,'2014-04-10 18:00:30',1,2,2),(2684,NULL,59,'2014-04-10 18:00:36',1,2,2),(2685,NULL,59,'2014-04-10 18:00:36',1,2,2),(2686,NULL,59,'2014-04-10 18:00:36',1,2,2),(2687,NULL,59,'2014-04-10 18:00:36',1,2,2),(2688,NULL,59,'2014-04-10 18:00:36',1,2,2),(2689,NULL,59,'2014-04-10 18:00:36',1,2,2),(2690,NULL,59,'2014-04-10 18:00:36',1,2,2),(2691,NULL,59,'2014-04-10 18:00:36',1,2,2),(2692,NULL,59,'2014-04-10 18:00:36',1,2,2),(2693,NULL,59,'2014-04-10 18:00:36',1,2,2),(2694,NULL,59,'2014-04-10 18:00:36',1,2,2),(2695,NULL,59,'2014-04-10 18:00:36',1,2,2),(2696,NULL,59,'2014-04-10 18:00:36',1,2,2),(2697,NULL,59,'2014-04-10 18:00:36',1,2,2),(2698,NULL,59,'2014-04-10 18:00:37',1,2,2),(2699,NULL,59,'2014-04-10 18:00:37',1,2,2),(2700,NULL,59,'2014-04-10 18:00:37',1,2,2),(2701,NULL,59,'2014-04-10 18:00:37',1,2,2),(2702,NULL,59,'2014-04-10 18:00:37',1,2,2),(2703,NULL,59,'2014-04-10 18:00:37',1,2,2),(2704,NULL,59,'2014-04-10 18:00:37',1,2,2),(2705,NULL,59,'2014-04-10 18:00:37',1,2,2),(2706,NULL,59,'2014-04-10 18:00:37',1,2,2),(2707,NULL,59,'2014-04-10 18:00:37',1,2,2),(2708,NULL,59,'2014-04-10 18:00:37',1,2,2),(2709,NULL,59,'2014-04-10 18:00:37',1,2,2),(2710,NULL,59,'2014-04-10 18:00:37',1,2,2),(2711,NULL,59,'2014-04-10 18:00:37',1,2,2),(2712,NULL,59,'2014-04-10 18:00:37',1,2,2),(2713,NULL,59,'2014-04-10 18:00:37',1,2,2),(2714,NULL,59,'2014-04-10 18:00:37',1,2,2),(2715,NULL,59,'2014-04-10 18:00:37',1,2,2),(2716,NULL,59,'2014-04-10 18:00:37',1,2,2),(2717,NULL,59,'2014-04-10 18:00:37',1,2,2),(2718,NULL,59,'2014-04-10 18:00:37',1,2,2),(2719,NULL,59,'2014-04-10 18:00:37',1,2,2),(2720,NULL,59,'2014-04-10 18:00:37',1,2,2),(2721,NULL,59,'2014-04-10 18:00:37',1,2,2),(2722,NULL,59,'2014-04-10 18:00:37',1,2,2),(2723,NULL,59,'2014-04-10 18:00:37',1,2,2),(2724,NULL,59,'2014-04-10 18:00:37',1,2,2),(2725,NULL,59,'2014-04-10 18:00:37',1,2,2),(2726,NULL,59,'2014-04-10 18:00:38',1,2,2),(2727,NULL,59,'2014-04-10 18:00:38',1,2,2),(2728,NULL,59,'2014-04-10 18:00:38',1,2,2),(2729,NULL,59,'2014-04-10 18:00:38',1,2,2),(2730,NULL,59,'2014-04-10 18:00:38',1,2,2),(2731,NULL,59,'2014-04-10 18:00:38',1,2,2),(2732,NULL,59,'2014-04-10 18:00:38',1,2,2),(2733,NULL,59,'2014-04-10 18:00:38',1,2,2),(2734,NULL,59,'2014-04-10 18:00:38',1,2,2),(2735,NULL,59,'2014-04-10 18:00:38',1,2,2),(2736,NULL,59,'2014-04-10 18:00:38',1,2,2),(2737,NULL,59,'2014-04-10 18:00:38',1,2,2),(2738,NULL,59,'2014-04-10 18:00:38',1,2,2),(2739,NULL,59,'2014-04-10 18:00:38',1,2,2),(2740,NULL,59,'2014-04-10 18:00:38',1,2,2),(2741,NULL,59,'2014-04-10 18:00:38',1,2,2),(2742,NULL,59,'2014-04-10 18:00:38',1,2,2),(2743,NULL,59,'2014-04-10 18:00:38',1,2,2),(2744,NULL,59,'2014-04-10 18:00:38',1,2,2),(2745,NULL,59,'2014-04-10 18:00:38',1,2,2),(2746,NULL,59,'2014-04-10 18:00:38',1,2,2),(2747,NULL,59,'2014-04-10 18:00:38',1,2,2),(2748,NULL,59,'2014-04-10 18:00:38',1,2,2),(2749,NULL,59,'2014-04-10 18:00:38',1,2,2),(2750,NULL,59,'2014-04-10 18:00:38',1,2,2),(2751,NULL,59,'2014-04-10 18:00:38',1,2,2),(2752,NULL,59,'2014-04-10 18:00:38',1,2,2),(2753,NULL,59,'2014-04-10 18:00:38',1,2,2),(2754,NULL,59,'2014-04-10 18:00:39',1,2,2),(2755,NULL,59,'2014-04-10 18:00:39',1,2,2),(2756,NULL,59,'2014-04-10 18:00:39',1,2,2),(2757,NULL,59,'2014-04-10 18:00:39',1,2,2),(2758,NULL,59,'2014-04-10 18:00:39',1,2,2),(2759,NULL,59,'2014-04-10 18:00:39',1,2,2),(2760,NULL,59,'2014-04-10 18:00:39',1,2,2),(2761,NULL,59,'2014-04-10 18:05:06',1,2,2),(2762,NULL,59,'2014-04-10 18:05:06',1,2,2),(2763,NULL,59,'2014-04-10 18:05:06',1,2,2),(2764,NULL,59,'2014-04-10 18:05:06',1,2,2),(2765,NULL,59,'2014-04-10 18:05:06',1,2,2),(2766,NULL,59,'2014-04-10 18:05:06',1,2,2),(2767,NULL,59,'2014-04-10 18:05:06',1,2,2),(2768,NULL,59,'2014-04-10 18:05:07',1,2,2),(2769,NULL,59,'2014-04-10 18:05:07',1,2,2),(2770,NULL,59,'2014-04-10 18:05:07',1,2,2),(2771,NULL,59,'2014-04-10 18:05:07',1,2,2),(2772,NULL,59,'2014-04-10 18:05:07',1,2,2),(2773,NULL,59,'2014-04-10 18:05:07',1,2,2),(2774,NULL,59,'2014-04-10 18:05:07',1,2,2),(2775,NULL,59,'2014-04-10 18:05:08',1,2,2),(2776,NULL,59,'2014-04-10 18:05:08',1,2,2),(2777,NULL,59,'2014-04-10 18:05:08',1,2,2),(2778,NULL,59,'2014-04-10 18:05:08',1,2,2),(2779,NULL,59,'2014-04-10 18:05:08',1,2,2),(2780,NULL,59,'2014-04-10 18:05:08',1,2,2),(2781,NULL,59,'2014-04-10 18:05:08',1,2,2),(2782,NULL,59,'2014-04-10 18:05:08',1,2,2),(2783,NULL,59,'2014-04-10 18:05:08',1,2,2),(2784,NULL,59,'2014-04-10 18:05:08',1,2,2),(2785,NULL,59,'2014-04-10 18:05:08',1,2,2),(2786,NULL,59,'2014-04-10 18:05:08',1,2,2),(2787,NULL,59,'2014-04-10 18:05:08',1,2,2),(2788,NULL,59,'2014-04-10 18:05:08',1,2,2),(2789,NULL,59,'2014-04-10 18:05:09',1,2,2),(2790,NULL,59,'2014-04-10 18:05:09',1,2,2),(2791,NULL,59,'2014-04-10 18:05:09',1,2,2),(2792,NULL,59,'2014-04-10 18:05:09',1,2,2),(2793,NULL,59,'2014-04-10 18:05:09',1,2,2),(2794,NULL,59,'2014-04-10 18:05:09',1,2,2),(2795,NULL,59,'2014-04-10 18:05:09',1,2,2),(2796,NULL,59,'2014-04-10 18:05:09',1,2,2),(2797,NULL,59,'2014-04-10 18:05:09',1,2,2),(2798,NULL,59,'2014-04-10 18:05:09',1,2,2),(2799,NULL,59,'2014-04-10 18:05:09',1,2,2),(2800,NULL,59,'2014-04-10 18:05:09',1,2,2),(2801,NULL,59,'2014-04-10 18:05:09',1,2,2),(2802,NULL,59,'2014-04-10 18:05:09',1,2,2),(2803,NULL,59,'2014-04-10 18:05:09',1,2,2),(2804,NULL,59,'2014-04-10 18:05:09',1,2,2),(2805,NULL,59,'2014-04-10 18:05:09',1,2,2),(2806,NULL,59,'2014-04-10 18:05:09',1,2,2),(2807,NULL,59,'2014-04-10 18:05:09',1,2,2),(2808,NULL,59,'2014-04-10 18:05:09',1,2,2),(2809,NULL,59,'2014-04-10 18:05:09',1,2,2),(2810,NULL,59,'2014-04-10 18:05:09',1,2,2),(2811,NULL,59,'2014-04-10 18:05:09',1,2,2),(2812,NULL,59,'2014-04-10 18:05:09',1,2,2),(2813,NULL,59,'2014-04-10 18:05:09',1,2,2),(2814,NULL,59,'2014-04-10 18:05:09',1,2,2),(2815,NULL,59,'2014-04-10 18:05:09',1,2,2),(2816,NULL,59,'2014-04-10 18:05:09',1,2,2),(2817,NULL,59,'2014-04-10 18:05:10',1,2,2),(2818,NULL,59,'2014-04-10 18:05:10',1,2,2),(2819,NULL,59,'2014-04-10 18:05:10',1,2,2),(2820,NULL,59,'2014-04-10 18:05:10',1,2,2),(2821,NULL,59,'2014-04-10 18:05:10',1,2,2),(2822,NULL,59,'2014-04-10 18:05:10',1,2,2),(2823,NULL,59,'2014-04-10 18:05:10',1,2,2),(2824,NULL,59,'2014-04-10 18:05:10',1,2,2),(2825,NULL,59,'2014-04-10 18:05:10',1,2,2),(2826,NULL,59,'2014-04-10 18:05:10',1,2,2),(2827,NULL,59,'2014-04-10 18:05:10',1,2,2),(2828,NULL,59,'2014-04-10 18:05:10',1,2,2),(2829,NULL,59,'2014-04-10 18:05:10',1,2,2),(2830,NULL,59,'2014-04-10 18:05:10',1,2,2),(2831,NULL,59,'2014-04-10 18:05:12',1,2,2),(2832,NULL,59,'2014-04-10 18:05:12',1,2,2),(2833,NULL,59,'2014-04-10 18:05:12',1,2,2),(2834,NULL,59,'2014-04-10 18:05:12',1,2,2),(2835,NULL,59,'2014-04-10 18:05:12',1,2,2),(2836,NULL,59,'2014-04-10 18:05:12',1,2,2),(2837,NULL,59,'2014-04-10 18:05:12',1,2,2),(2838,NULL,59,'2014-04-10 18:05:13',1,2,2),(2839,NULL,59,'2014-04-10 18:05:13',1,2,2),(2840,NULL,59,'2014-04-10 18:05:13',1,2,2),(2841,NULL,59,'2014-04-10 18:05:13',1,2,2),(2842,NULL,59,'2014-04-10 18:05:13',1,2,2),(2843,NULL,59,'2014-04-10 18:05:13',1,2,2),(2844,NULL,59,'2014-04-10 18:05:13',1,2,2),(2845,NULL,59,'2014-04-10 18:05:13',1,2,2),(2846,NULL,59,'2014-04-10 18:05:13',1,2,2),(2847,NULL,59,'2014-04-10 18:05:13',1,2,2),(2848,NULL,59,'2014-04-10 18:05:13',1,2,2),(2849,NULL,59,'2014-04-10 18:05:13',1,2,2),(2850,NULL,59,'2014-04-10 18:05:13',1,2,2),(2851,NULL,59,'2014-04-10 18:05:13',1,2,2),(2852,NULL,59,'2014-04-10 18:05:13',1,2,2),(2853,NULL,59,'2014-04-10 18:05:13',1,2,2),(2854,NULL,59,'2014-04-10 18:05:13',1,2,2),(2855,NULL,59,'2014-04-10 18:05:13',1,2,2),(2856,NULL,59,'2014-04-10 18:05:13',1,2,2),(2857,NULL,59,'2014-04-10 18:05:13',1,2,2),(2858,NULL,59,'2014-04-10 18:05:13',1,2,2),(2859,NULL,59,'2014-04-10 18:05:13',1,2,2),(2860,NULL,59,'2014-04-10 18:05:13',1,2,2),(2861,NULL,59,'2014-04-10 18:05:13',1,2,2),(2862,NULL,59,'2014-04-10 18:05:13',1,2,2),(2863,NULL,59,'2014-04-10 18:05:13',1,2,2),(2864,NULL,59,'2014-04-10 18:05:13',1,2,2),(2865,NULL,59,'2014-04-10 18:05:13',1,2,2),(2866,NULL,59,'2014-04-10 18:05:14',1,2,2),(2867,NULL,59,'2014-04-10 18:05:14',1,2,2),(2868,NULL,59,'2014-04-10 18:05:14',1,2,2),(2869,NULL,59,'2014-04-10 18:05:14',1,2,2),(2870,NULL,59,'2014-04-10 18:05:14',1,2,2),(2871,NULL,59,'2014-04-10 18:05:14',1,2,2),(2872,NULL,59,'2014-04-10 18:05:14',1,2,2),(2873,NULL,59,'2014-04-10 18:05:19',1,2,2),(2874,NULL,59,'2014-04-10 18:05:19',1,2,2),(2875,NULL,59,'2014-04-10 18:05:19',1,2,2),(2876,NULL,59,'2014-04-10 18:05:19',1,2,2),(2877,NULL,59,'2014-04-10 18:05:19',1,2,2),(2878,NULL,59,'2014-04-10 18:05:19',1,2,2),(2879,NULL,59,'2014-04-10 18:05:19',1,2,2),(2880,NULL,59,'2014-04-10 18:06:19',1,2,2),(2881,NULL,59,'2014-04-10 18:06:19',1,2,2),(2882,NULL,59,'2014-04-10 18:06:19',1,2,2),(2883,NULL,59,'2014-04-10 18:06:19',1,2,2),(2884,NULL,59,'2014-04-10 18:06:19',1,2,2),(2885,NULL,59,'2014-04-10 18:06:19',1,2,2),(2886,NULL,59,'2014-04-10 18:06:19',1,2,2),(2887,NULL,59,'2014-04-10 18:08:14',1,2,2),(2888,NULL,59,'2014-04-10 18:08:14',1,2,2),(2889,NULL,59,'2014-04-10 18:08:14',1,2,2),(2890,NULL,59,'2014-04-10 18:08:14',1,2,2),(2891,NULL,59,'2014-04-10 18:08:14',1,2,2),(2892,NULL,59,'2014-04-10 18:08:14',1,2,2),(2893,NULL,59,'2014-04-10 18:08:14',1,2,2),(2894,NULL,59,'2014-04-10 18:10:22',1,2,2),(2895,NULL,59,'2014-04-10 18:10:22',1,2,2),(2896,NULL,59,'2014-04-10 18:10:22',1,2,2),(2897,NULL,59,'2014-04-10 18:10:22',1,2,2),(2898,NULL,59,'2014-04-10 18:10:22',1,2,2),(2899,NULL,59,'2014-04-10 18:10:22',1,2,2),(2900,NULL,59,'2014-04-10 18:10:22',1,2,2),(2901,NULL,59,'2014-04-10 18:10:35',1,2,2),(2902,NULL,59,'2014-04-10 18:10:35',1,2,2),(2903,NULL,59,'2014-04-10 18:10:35',1,2,2),(2904,NULL,59,'2014-04-10 18:10:35',1,2,2),(2905,NULL,59,'2014-04-10 18:10:35',1,2,2),(2906,NULL,59,'2014-04-10 18:10:35',1,2,2),(2907,NULL,59,'2014-04-10 18:10:35',1,2,2),(2908,NULL,59,'2014-04-10 18:11:19',1,2,2),(2909,NULL,59,'2014-04-10 18:11:19',1,2,2),(2910,NULL,59,'2014-04-10 18:11:19',1,2,2),(2911,NULL,59,'2014-04-10 18:11:19',1,2,2),(2912,NULL,59,'2014-04-10 18:11:19',1,2,2),(2913,NULL,59,'2014-04-10 18:11:19',1,2,2),(2914,NULL,59,'2014-04-10 18:11:19',1,2,2),(2915,NULL,59,'2014-04-10 18:19:34',1,2,2),(2916,NULL,59,'2014-04-10 18:19:34',1,2,2),(2917,NULL,59,'2014-04-10 18:19:34',1,2,2),(2918,NULL,59,'2014-04-10 18:19:34',1,2,2),(2919,NULL,59,'2014-04-10 18:19:34',1,2,2),(2920,NULL,59,'2014-04-10 18:19:34',1,2,2),(2921,NULL,59,'2014-04-10 18:19:34',1,2,2),(2922,NULL,59,'2014-04-10 18:25:45',1,2,2),(2923,NULL,59,'2014-04-10 18:25:47',1,2,2),(2924,NULL,59,'2014-04-10 18:25:48',1,2,2),(2925,NULL,59,'2014-04-10 18:25:49',1,2,2),(2926,NULL,59,'2014-04-10 18:25:50',1,2,2),(2927,NULL,59,'2014-04-10 18:25:52',1,2,2),(2928,NULL,59,'2014-04-10 18:25:55',1,2,2),(2929,NULL,59,'2014-04-10 18:25:59',1,2,2),(2930,NULL,59,'2014-04-10 18:26:03',1,2,2),(2931,NULL,59,'2014-04-10 18:26:04',1,2,2),(2932,NULL,59,'2014-04-10 18:26:52',1,2,2),(2933,NULL,59,'2014-04-10 18:26:59',1,2,2),(2934,NULL,59,'2014-04-10 18:27:00',1,2,2),(2935,NULL,59,'2014-04-10 18:27:01',1,2,2),(2936,NULL,59,'2014-04-10 18:27:02',1,2,2),(2937,NULL,59,'2014-04-10 18:27:03',1,2,2),(2938,NULL,59,'2014-04-10 18:27:07',1,2,2),(2939,NULL,59,'2014-04-10 18:27:17',1,2,2),(2940,NULL,59,'2014-04-10 18:27:18',1,2,2),(2941,NULL,59,'2014-04-10 18:27:19',1,2,2),(2942,NULL,59,'2014-04-10 18:27:38',1,2,2),(2943,NULL,59,'2014-04-10 18:29:22',1,2,2),(2944,NULL,59,'2014-04-10 18:29:22',1,2,2),(2945,NULL,59,'2014-04-10 18:29:22',1,2,2),(2946,NULL,59,'2014-04-10 18:29:22',1,2,2),(2947,NULL,59,'2014-04-10 18:29:22',1,2,2),(2948,NULL,59,'2014-04-10 18:29:22',1,2,2),(2949,NULL,59,'2014-04-10 18:29:22',1,2,2),(2950,NULL,59,'2014-04-10 18:31:34',1,2,2),(2951,NULL,59,'2014-04-10 18:31:34',1,2,2),(2952,NULL,59,'2014-04-10 18:31:34',1,2,2),(2953,NULL,59,'2014-04-10 18:31:34',1,2,2),(2954,NULL,59,'2014-04-10 18:31:34',1,2,2),(2955,NULL,59,'2014-04-10 18:31:34',1,2,2),(2956,NULL,59,'2014-04-10 18:31:34',1,2,2),(2957,NULL,59,'2014-04-10 18:36:08',1,2,2),(2958,NULL,59,'2014-04-10 18:36:08',1,2,2),(2959,NULL,59,'2014-04-10 18:36:08',1,2,2),(2960,NULL,59,'2014-04-10 18:36:08',1,2,2),(2961,NULL,59,'2014-04-10 18:36:08',1,2,2),(2962,NULL,59,'2014-04-10 18:36:08',1,2,2),(2963,NULL,59,'2014-04-10 18:36:08',1,2,2),(2964,NULL,59,'2014-04-10 18:37:40',1,2,2),(2965,NULL,59,'2014-04-10 18:37:40',1,2,2),(2966,NULL,59,'2014-04-10 18:37:40',1,2,2),(2967,NULL,59,'2014-04-10 18:37:40',1,2,2),(2968,NULL,59,'2014-04-10 18:37:40',1,2,2),(2969,NULL,59,'2014-04-10 18:37:40',1,2,2),(2970,NULL,59,'2014-04-10 18:37:40',1,2,2),(2971,NULL,59,'2014-04-10 18:44:21',1,2,2),(2972,NULL,59,'2014-04-10 18:44:21',1,2,2),(2973,NULL,59,'2014-04-10 18:44:21',1,2,2),(2974,NULL,59,'2014-04-10 18:44:21',1,2,2),(2975,NULL,59,'2014-04-10 18:44:21',1,2,2),(2976,NULL,59,'2014-04-10 18:44:21',1,2,2),(2977,NULL,59,'2014-04-10 18:44:21',1,2,2),(2978,NULL,59,'2014-04-10 18:48:59',1,2,2),(2979,NULL,59,'2014-04-10 18:48:59',1,2,2),(2980,NULL,59,'2014-04-10 18:48:59',1,2,2),(2981,NULL,59,'2014-04-10 18:48:59',1,2,2),(2982,NULL,59,'2014-04-10 18:48:59',1,2,2),(2983,NULL,59,'2014-04-10 18:48:59',1,2,2),(2984,NULL,59,'2014-04-10 18:48:59',1,2,2),(2985,NULL,59,'2014-04-10 18:50:07',1,2,2),(2986,NULL,59,'2014-04-10 18:50:07',1,2,2),(2987,NULL,59,'2014-04-10 18:50:07',1,2,2),(2988,NULL,59,'2014-04-10 18:50:07',1,2,2),(2989,NULL,59,'2014-04-10 18:50:07',1,2,2),(2990,NULL,59,'2014-04-10 18:50:07',1,2,2),(2991,NULL,59,'2014-04-10 18:50:07',1,2,2),(2992,NULL,59,'2014-04-10 18:53:25',1,2,2),(2993,NULL,59,'2014-04-10 18:54:06',1,2,2),(2994,NULL,59,'2014-04-10 18:54:29',1,2,2),(2995,NULL,59,'2014-04-10 18:54:29',1,2,2),(2996,NULL,59,'2014-04-10 18:54:29',1,2,2),(2997,NULL,59,'2014-04-10 18:54:29',1,2,2),(2998,NULL,59,'2014-04-10 18:54:29',1,2,2),(2999,NULL,59,'2014-04-10 18:54:29',1,2,2),(3000,NULL,59,'2014-04-10 18:54:29',1,2,2),(3001,NULL,59,'2014-04-10 18:54:46',1,2,2),(3002,NULL,59,'2014-04-10 18:54:46',1,2,2),(3003,NULL,59,'2014-04-10 18:54:46',1,2,2),(3004,NULL,59,'2014-04-10 18:54:46',1,2,2),(3005,NULL,59,'2014-04-10 18:54:46',1,2,2),(3006,NULL,59,'2014-04-10 18:54:46',1,2,2),(3007,NULL,59,'2014-04-10 18:54:46',1,2,2),(3008,NULL,59,'2014-04-10 18:55:07',1,2,2),(3009,NULL,59,'2014-04-10 19:05:13',1,2,2),(3010,NULL,59,'2014-04-10 19:05:13',1,2,2),(3011,NULL,59,'2014-04-10 19:05:13',1,2,2),(3012,NULL,59,'2014-04-10 19:05:13',1,2,2),(3013,NULL,59,'2014-04-10 19:05:13',1,2,2),(3014,NULL,59,'2014-04-10 19:05:13',1,2,2),(3015,NULL,59,'2014-04-10 19:05:13',1,2,2),(3016,NULL,59,'2014-04-10 19:05:19',1,2,2),(3017,NULL,59,'2014-04-10 19:07:18',1,2,2),(3018,NULL,59,'2014-04-10 19:07:26',1,2,2),(3019,NULL,59,'2014-04-10 19:08:17',1,2,2),(3020,NULL,59,'2014-04-10 19:08:20',1,2,2),(3021,NULL,59,'2014-04-10 19:09:01',1,2,2),(3022,NULL,59,'2014-04-10 19:09:06',1,2,2),(3023,NULL,59,'2014-04-10 19:09:09',1,2,2),(3024,NULL,59,'2014-04-10 19:09:19',1,2,2),(3025,NULL,65,'2014-04-11 14:07:16',1,1,1),(3026,NULL,66,'2014-04-11 14:07:39',1,1,1),(3027,NULL,67,'2014-04-11 14:07:40',1,1,1),(3028,NULL,68,'2014-04-11 14:07:41',1,1,1),(3029,NULL,69,'2014-04-11 14:08:42',1,1,1),(3030,NULL,70,'2014-04-11 14:08:44',1,1,1),(3031,NULL,59,'2014-04-11 14:09:34',1,2,2),(3032,NULL,61,'2014-04-11 14:09:37',1,2,2),(3033,NULL,62,'2014-04-11 14:09:39',1,1,1),(3034,NULL,63,'2014-04-11 14:09:42',1,1,1),(3035,NULL,64,'2014-04-11 14:09:46',1,2,2),(3036,NULL,59,'2014-04-11 17:00:09',1,2,2),(3037,NULL,59,'2014-04-11 17:00:09',1,2,2),(3038,NULL,59,'2014-04-11 17:00:09',1,2,2),(3039,NULL,59,'2014-04-11 17:00:09',1,2,2),(3040,NULL,59,'2014-04-11 17:00:09',1,2,2),(3041,NULL,59,'2014-04-11 17:00:09',1,2,2),(3042,NULL,59,'2014-04-11 17:00:09',1,2,2),(3043,NULL,59,'2014-04-11 17:00:14',1,2,2),(3044,NULL,59,'2014-04-11 17:00:14',1,2,2),(3045,NULL,59,'2014-04-11 17:00:14',1,2,2),(3046,NULL,59,'2014-04-11 17:00:14',1,2,2),(3047,NULL,59,'2014-04-11 17:00:14',1,2,2),(3048,NULL,59,'2014-04-11 17:00:14',1,2,2),(3049,NULL,59,'2014-04-11 17:00:14',1,2,2),(3050,NULL,59,'2014-04-11 17:00:23',1,2,2),(3051,NULL,59,'2014-04-11 17:00:27',1,2,2),(3052,NULL,59,'2014-04-11 19:07:51',1,2,2),(3053,NULL,71,'2014-04-11 19:08:38',1,1,1),(3054,NULL,59,'2014-04-12 10:23:19',1,2,2),(3055,NULL,59,'2014-04-12 10:26:24',1,2,2),(3056,NULL,59,'2014-04-12 11:00:56',1,2,2),(3057,NULL,59,'2014-04-12 11:04:19',1,2,2),(3058,NULL,59,'2014-04-12 11:09:13',1,2,2),(3059,NULL,59,'2014-04-12 11:09:26',1,2,2),(3060,NULL,59,'2014-04-12 11:10:28',1,2,2),(3061,NULL,59,'2014-04-12 11:10:32',1,2,2),(3062,NULL,59,'2014-04-12 11:21:35',1,2,2),(3063,NULL,59,'2014-04-12 11:21:53',1,2,2),(3064,NULL,59,'2014-04-12 11:23:27',1,2,2),(3065,NULL,59,'2014-04-12 11:23:31',1,2,2),(3066,NULL,59,'2014-04-12 11:28:44',1,2,2),(3067,NULL,59,'2014-04-12 11:34:48',1,2,2),(3068,NULL,59,'2014-04-12 14:13:40',1,2,2),(3069,NULL,59,'2014-04-12 14:14:42',1,2,2),(3070,NULL,59,'2014-04-12 14:34:04',1,2,2),(3071,NULL,59,'2014-04-12 14:34:51',1,2,2),(3072,NULL,59,'2014-04-12 14:34:54',1,2,2),(3073,NULL,59,'2014-04-12 14:34:56',1,2,2),(3074,NULL,59,'2014-04-12 14:34:58',1,2,2),(3075,NULL,70,'2014-04-12 14:53:08',1,1,1),(3076,NULL,72,'2014-04-12 14:53:34',1,1,1),(3077,NULL,72,'2014-04-12 14:53:43',1,1,1),(3078,NULL,59,'2014-04-14 11:18:29',1,2,2),(3079,NULL,59,'2014-04-14 11:18:36',1,2,2),(3080,NULL,59,'2014-04-14 11:18:36',1,2,2),(3081,NULL,59,'2014-04-14 11:18:36',1,2,2),(3082,NULL,59,'2014-04-14 11:18:36',1,2,2),(3083,NULL,59,'2014-04-14 11:18:36',1,2,2),(3084,NULL,59,'2014-04-14 11:18:36',1,2,2),(3085,NULL,59,'2014-04-14 11:18:36',1,2,2),(3086,NULL,59,'2014-04-14 11:19:42',1,2,2),(3087,NULL,59,'2014-04-14 11:19:42',1,2,2),(3088,NULL,59,'2014-04-14 11:19:42',1,2,2),(3089,NULL,59,'2014-04-14 11:19:42',1,2,2),(3090,NULL,59,'2014-04-14 11:19:42',1,2,2),(3091,NULL,59,'2014-04-14 11:19:42',1,2,2),(3092,NULL,59,'2014-04-14 11:19:42',1,2,2),(3093,NULL,59,'2014-04-14 11:19:44',1,2,2),(3094,NULL,59,'2014-04-14 11:19:44',1,2,2),(3095,NULL,59,'2014-04-14 11:19:44',1,2,2),(3096,NULL,59,'2014-04-14 11:19:44',1,2,2),(3097,NULL,59,'2014-04-14 11:19:44',1,2,2),(3098,NULL,59,'2014-04-14 11:19:44',1,2,2),(3099,NULL,59,'2014-04-14 11:19:44',1,2,2),(3100,NULL,59,'2014-04-14 11:20:29',1,2,2),(3101,NULL,59,'2014-04-14 11:24:41',1,2,2),(3102,NULL,59,'2014-04-14 11:24:41',1,2,2),(3103,NULL,59,'2014-04-14 11:24:41',1,2,2),(3104,NULL,59,'2014-04-14 11:24:41',1,2,2),(3105,NULL,59,'2014-04-14 11:24:41',1,2,2),(3106,NULL,59,'2014-04-14 11:24:41',1,2,2),(3107,NULL,59,'2014-04-14 11:24:41',1,2,2),(3108,NULL,59,'2014-04-14 11:24:49',1,2,2),(3109,NULL,59,'2014-04-14 11:24:49',1,2,2),(3110,NULL,59,'2014-04-14 11:24:49',1,2,2),(3111,NULL,59,'2014-04-14 11:24:49',1,2,2),(3112,NULL,59,'2014-04-14 11:24:49',1,2,2),(3113,NULL,59,'2014-04-14 11:24:49',1,2,2),(3114,NULL,59,'2014-04-14 11:24:49',1,2,2),(3115,NULL,59,'2014-04-14 11:25:18',1,2,2),(3116,NULL,59,'2014-04-14 11:25:18',1,2,2),(3117,NULL,59,'2014-04-14 11:25:18',1,2,2),(3118,NULL,59,'2014-04-14 11:25:18',1,2,2),(3119,NULL,59,'2014-04-14 11:25:18',1,2,2),(3120,NULL,59,'2014-04-14 11:25:18',1,2,2),(3121,NULL,59,'2014-04-14 11:25:18',1,2,2),(3122,NULL,59,'2014-04-14 11:34:41',1,2,2),(3123,NULL,59,'2014-04-14 11:34:41',1,2,2),(3124,NULL,59,'2014-04-14 11:34:41',1,2,2),(3125,NULL,59,'2014-04-14 11:34:41',1,2,2),(3126,NULL,59,'2014-04-14 11:34:41',1,2,2),(3127,NULL,59,'2014-04-14 11:34:41',1,2,2),(3128,NULL,59,'2014-04-14 11:34:41',1,2,2),(3129,NULL,59,'2014-04-14 11:42:34',1,2,2),(3130,NULL,59,'2014-04-14 11:42:34',1,2,2),(3131,NULL,59,'2014-04-14 11:42:34',1,2,2),(3132,NULL,59,'2014-04-14 11:42:34',1,2,2),(3133,NULL,59,'2014-04-14 11:42:34',1,2,2),(3134,NULL,59,'2014-04-14 11:42:34',1,2,2),(3135,NULL,59,'2014-04-14 11:42:34',1,2,2),(3136,NULL,73,'2014-04-14 18:03:43',1,1,1),(3137,NULL,73,'2014-04-14 18:04:06',1,1,1),(3138,NULL,73,'2014-04-14 18:04:41',1,1,1),(3139,NULL,73,'2014-04-14 18:04:41',1,1,1),(3140,NULL,73,'2014-04-14 18:04:41',1,1,1),(3141,NULL,73,'2014-04-14 18:04:41',1,1,1),(3142,NULL,73,'2014-04-14 18:04:41',1,1,1),(3143,NULL,73,'2014-04-14 18:04:41',1,1,1),(3144,NULL,73,'2014-04-14 18:04:41',1,1,1),(3145,NULL,73,'2014-04-14 18:04:48',1,1,1),(3146,NULL,73,'2014-04-14 18:04:48',1,1,1),(3147,NULL,73,'2014-04-14 18:04:48',1,1,1),(3148,NULL,73,'2014-04-14 18:04:48',1,1,1),(3149,NULL,73,'2014-04-14 18:04:48',1,1,1),(3150,NULL,73,'2014-04-14 18:04:48',1,1,1),(3151,NULL,73,'2014-04-14 18:04:48',1,1,1),(3152,NULL,73,'2014-04-14 18:04:53',1,1,1),(3153,NULL,73,'2014-04-14 18:04:53',1,1,1),(3154,NULL,73,'2014-04-14 18:04:53',1,1,1),(3155,NULL,73,'2014-04-14 18:04:53',1,1,1),(3156,NULL,73,'2014-04-14 18:04:53',1,1,1),(3157,NULL,73,'2014-04-14 18:04:53',1,1,1),(3158,NULL,73,'2014-04-14 18:04:53',1,1,1),(3159,NULL,61,'2014-04-14 21:54:17',1,2,2),(3160,NULL,61,'2014-04-14 21:54:17',1,2,2),(3161,NULL,61,'2014-04-14 21:54:17',1,2,2),(3162,NULL,61,'2014-04-14 21:54:17',1,2,2),(3163,NULL,61,'2014-04-14 21:54:17',1,2,2),(3164,NULL,61,'2014-04-14 21:54:17',1,2,2),(3165,NULL,61,'2014-04-14 21:54:17',1,2,2),(3166,NULL,61,'2014-04-14 21:54:27',1,2,2),(3167,NULL,61,'2014-04-14 21:54:27',1,2,2),(3168,NULL,61,'2014-04-14 21:54:27',1,2,2),(3169,NULL,61,'2014-04-14 21:54:27',1,2,2),(3170,NULL,61,'2014-04-14 21:54:27',1,2,2),(3171,NULL,61,'2014-04-14 21:54:27',1,2,2),(3172,NULL,61,'2014-04-14 21:54:27',1,2,2),(3173,NULL,61,'2014-04-14 21:54:29',1,2,2),(3174,NULL,61,'2014-04-14 21:54:29',1,2,2),(3175,NULL,61,'2014-04-14 21:54:29',1,2,2),(3176,NULL,61,'2014-04-14 21:54:29',1,2,2),(3177,NULL,61,'2014-04-14 21:54:29',1,2,2),(3178,NULL,61,'2014-04-14 21:54:29',1,2,2),(3179,NULL,61,'2014-04-14 21:54:29',1,2,2),(3180,NULL,59,'2014-04-15 12:41:25',1,2,2),(3181,NULL,59,'2014-04-15 12:49:38',1,2,2),(3182,NULL,59,'2014-04-15 12:49:49',1,2,2),(3183,NULL,59,'2014-04-15 12:59:20',1,2,2),(3184,NULL,59,'2014-04-15 12:59:20',1,2,2),(3185,NULL,59,'2014-04-15 12:59:20',1,2,2),(3186,NULL,59,'2014-04-15 12:59:20',1,2,2),(3187,NULL,59,'2014-04-15 12:59:20',1,2,2),(3188,NULL,59,'2014-04-15 12:59:20',1,2,2),(3189,NULL,59,'2014-04-15 12:59:20',1,2,2),(3190,NULL,59,'2014-04-15 12:59:31',1,2,2),(3191,NULL,59,'2014-04-15 12:59:31',1,2,2),(3192,NULL,59,'2014-04-15 12:59:31',1,2,2),(3193,NULL,59,'2014-04-15 12:59:31',1,2,2),(3194,NULL,59,'2014-04-15 12:59:31',1,2,2),(3195,NULL,59,'2014-04-15 12:59:31',1,2,2),(3196,NULL,59,'2014-04-15 12:59:31',1,2,2),(3197,NULL,59,'2014-04-15 12:59:33',1,2,2),(3198,NULL,59,'2014-04-15 12:59:33',1,2,2),(3199,NULL,59,'2014-04-15 12:59:33',1,2,2),(3200,NULL,59,'2014-04-15 12:59:33',1,2,2),(3201,NULL,59,'2014-04-15 12:59:33',1,2,2),(3202,NULL,59,'2014-04-15 12:59:33',1,2,2),(3203,NULL,59,'2014-04-15 12:59:33',1,2,2),(3204,NULL,59,'2014-04-15 12:59:34',1,2,2),(3205,NULL,59,'2014-04-15 12:59:34',1,2,2),(3206,NULL,59,'2014-04-15 12:59:34',1,2,2),(3207,NULL,59,'2014-04-15 12:59:34',1,2,2),(3208,NULL,59,'2014-04-15 12:59:34',1,2,2),(3209,NULL,59,'2014-04-15 12:59:34',1,2,2),(3210,NULL,59,'2014-04-15 12:59:34',1,2,2),(3211,NULL,59,'2014-04-15 12:59:36',1,2,2),(3212,NULL,59,'2014-04-15 12:59:36',1,2,2),(3213,NULL,59,'2014-04-15 12:59:36',1,2,2),(3214,NULL,59,'2014-04-15 12:59:36',1,2,2),(3215,NULL,59,'2014-04-15 12:59:36',1,2,2),(3216,NULL,59,'2014-04-15 12:59:36',1,2,2),(3217,NULL,59,'2014-04-15 12:59:36',1,2,2),(3218,NULL,59,'2014-04-15 12:59:37',1,2,2),(3219,NULL,59,'2014-04-15 12:59:37',1,2,2),(3220,NULL,59,'2014-04-15 12:59:37',1,2,2),(3221,NULL,59,'2014-04-15 12:59:37',1,2,2),(3222,NULL,59,'2014-04-15 12:59:37',1,2,2),(3223,NULL,59,'2014-04-15 12:59:37',1,2,2),(3224,NULL,59,'2014-04-15 12:59:37',1,2,2),(3225,NULL,59,'2014-04-15 12:59:39',1,2,2),(3226,NULL,59,'2014-04-15 12:59:39',1,2,2),(3227,NULL,59,'2014-04-15 12:59:39',1,2,2),(3228,NULL,59,'2014-04-15 12:59:39',1,2,2),(3229,NULL,59,'2014-04-15 12:59:39',1,2,2),(3230,NULL,59,'2014-04-15 12:59:39',1,2,2),(3231,NULL,59,'2014-04-15 12:59:39',1,2,2),(3232,NULL,59,'2014-04-15 12:59:40',1,2,2),(3233,NULL,59,'2014-04-15 12:59:40',1,2,2),(3234,NULL,59,'2014-04-15 12:59:40',1,2,2),(3235,NULL,59,'2014-04-15 12:59:40',1,2,2),(3236,NULL,59,'2014-04-15 12:59:40',1,2,2),(3237,NULL,59,'2014-04-15 12:59:40',1,2,2),(3238,NULL,59,'2014-04-15 12:59:40',1,2,2),(3239,NULL,59,'2014-04-15 12:59:47',1,2,2),(3240,NULL,59,'2014-04-15 12:59:47',1,2,2),(3241,NULL,59,'2014-04-15 12:59:47',1,2,2),(3242,NULL,59,'2014-04-15 12:59:47',1,2,2),(3243,NULL,59,'2014-04-15 12:59:47',1,2,2),(3244,NULL,59,'2014-04-15 12:59:47',1,2,2),(3245,NULL,59,'2014-04-15 12:59:47',1,2,2),(3246,NULL,59,'2014-04-15 12:59:54',1,2,2),(3247,NULL,59,'2014-04-15 12:59:54',1,2,2),(3248,NULL,59,'2014-04-15 12:59:54',1,2,2),(3249,NULL,59,'2014-04-15 12:59:54',1,2,2),(3250,NULL,59,'2014-04-15 12:59:54',1,2,2),(3251,NULL,59,'2014-04-15 12:59:54',1,2,2),(3252,NULL,59,'2014-04-15 12:59:54',1,2,2),(3253,NULL,59,'2014-04-15 13:57:34',1,2,2),(3254,NULL,59,'2014-04-15 13:57:34',1,2,2),(3255,NULL,59,'2014-04-15 13:57:34',1,2,2),(3256,NULL,59,'2014-04-15 13:57:34',1,2,2),(3257,NULL,59,'2014-04-15 13:57:34',1,2,2),(3258,NULL,59,'2014-04-15 13:57:34',1,2,2),(3259,NULL,59,'2014-04-15 13:57:34',1,2,2),(3260,NULL,59,'2014-04-15 13:57:36',1,2,2),(3261,NULL,59,'2014-04-15 13:57:36',1,2,2),(3262,NULL,59,'2014-04-15 13:57:36',1,2,2),(3263,NULL,59,'2014-04-15 13:57:36',1,2,2),(3264,NULL,59,'2014-04-15 13:57:36',1,2,2),(3265,NULL,59,'2014-04-15 13:57:36',1,2,2),(3266,NULL,59,'2014-04-15 13:57:36',1,2,2),(3267,NULL,59,'2014-04-15 13:57:37',1,2,2),(3268,NULL,59,'2014-04-15 13:57:37',1,2,2),(3269,NULL,59,'2014-04-15 13:57:37',1,2,2),(3270,NULL,59,'2014-04-15 13:57:37',1,2,2),(3271,NULL,59,'2014-04-15 13:57:37',1,2,2),(3272,NULL,59,'2014-04-15 13:57:37',1,2,2),(3273,NULL,59,'2014-04-15 13:57:37',1,2,2),(3274,NULL,59,'2014-04-15 13:57:39',1,2,2),(3275,NULL,59,'2014-04-15 13:57:39',1,2,2),(3276,NULL,59,'2014-04-15 13:57:39',1,2,2),(3277,NULL,59,'2014-04-15 13:57:39',1,2,2),(3278,NULL,59,'2014-04-15 13:57:39',1,2,2),(3279,NULL,59,'2014-04-15 13:57:39',1,2,2),(3280,NULL,59,'2014-04-15 13:57:39',1,2,2),(3281,NULL,59,'2014-04-15 13:57:40',1,2,2),(3282,NULL,59,'2014-04-15 13:57:40',1,2,2),(3283,NULL,59,'2014-04-15 13:57:40',1,2,2),(3284,NULL,59,'2014-04-15 13:57:40',1,2,2),(3285,NULL,59,'2014-04-15 13:57:40',1,2,2),(3286,NULL,59,'2014-04-15 13:57:40',1,2,2),(3287,NULL,59,'2014-04-15 13:57:40',1,2,2),(3288,NULL,59,'2014-04-15 14:10:51',1,2,2),(3289,NULL,59,'2014-04-15 14:10:51',1,2,2),(3290,NULL,59,'2014-04-15 14:10:51',1,2,2),(3291,NULL,59,'2014-04-15 14:10:51',1,2,2),(3292,NULL,59,'2014-04-15 14:10:51',1,2,2),(3293,NULL,59,'2014-04-15 14:10:51',1,2,2),(3294,NULL,59,'2014-04-15 14:10:51',1,2,2),(3295,NULL,59,'2014-04-15 14:10:58',1,2,2),(3296,NULL,59,'2014-04-15 14:10:58',1,2,2),(3297,NULL,59,'2014-04-15 14:10:58',1,2,2),(3298,NULL,59,'2014-04-15 14:10:58',1,2,2),(3299,NULL,59,'2014-04-15 14:10:58',1,2,2),(3300,NULL,59,'2014-04-15 14:10:58',1,2,2),(3301,NULL,59,'2014-04-15 14:10:58',1,2,2),(3302,NULL,59,'2014-04-15 14:11:00',1,2,2),(3303,NULL,59,'2014-04-15 14:11:00',1,2,2),(3304,NULL,59,'2014-04-15 14:11:00',1,2,2),(3305,NULL,59,'2014-04-15 14:11:00',1,2,2),(3306,NULL,59,'2014-04-15 14:11:00',1,2,2),(3307,NULL,59,'2014-04-15 14:11:00',1,2,2),(3308,NULL,59,'2014-04-15 14:11:00',1,2,2),(3309,NULL,59,'2014-04-15 14:11:02',1,2,2),(3310,NULL,59,'2014-04-15 14:11:02',1,2,2),(3311,NULL,59,'2014-04-15 14:11:02',1,2,2),(3312,NULL,59,'2014-04-15 14:11:02',1,2,2),(3313,NULL,59,'2014-04-15 14:11:02',1,2,2),(3314,NULL,59,'2014-04-15 14:11:02',1,2,2),(3315,NULL,59,'2014-04-15 14:11:02',1,2,2),(3316,NULL,59,'2014-04-15 14:11:26',1,2,2),(3317,NULL,59,'2014-04-15 14:11:26',1,2,2),(3318,NULL,59,'2014-04-15 14:11:26',1,2,2),(3319,NULL,59,'2014-04-15 14:11:26',1,2,2),(3320,NULL,59,'2014-04-15 14:11:26',1,2,2),(3321,NULL,59,'2014-04-15 14:11:26',1,2,2),(3322,NULL,59,'2014-04-15 14:11:26',1,2,2),(3323,NULL,59,'2014-04-15 14:11:56',1,2,2),(3324,NULL,59,'2014-04-15 14:11:56',1,2,2),(3325,NULL,59,'2014-04-15 14:11:56',1,2,2),(3326,NULL,59,'2014-04-15 14:11:56',1,2,2),(3327,NULL,59,'2014-04-15 14:11:56',1,2,2),(3328,NULL,59,'2014-04-15 14:11:56',1,2,2),(3329,NULL,59,'2014-04-15 14:11:56',1,2,2),(3330,NULL,59,'2014-04-15 14:11:59',1,2,2),(3331,NULL,59,'2014-04-15 14:11:59',1,2,2),(3332,NULL,59,'2014-04-15 14:11:59',1,2,2),(3333,NULL,59,'2014-04-15 14:11:59',1,2,2),(3334,NULL,59,'2014-04-15 14:11:59',1,2,2),(3335,NULL,59,'2014-04-15 14:11:59',1,2,2),(3336,NULL,59,'2014-04-15 14:11:59',1,2,2),(3337,NULL,59,'2014-04-15 14:12:00',1,2,2),(3338,NULL,59,'2014-04-15 14:12:00',1,2,2),(3339,NULL,59,'2014-04-15 14:12:00',1,2,2),(3340,NULL,59,'2014-04-15 14:12:00',1,2,2),(3341,NULL,59,'2014-04-15 14:12:00',1,2,2),(3342,NULL,59,'2014-04-15 14:12:00',1,2,2),(3343,NULL,59,'2014-04-15 14:12:00',1,2,2),(3344,NULL,59,'2014-04-15 14:12:01',1,2,2),(3345,NULL,59,'2014-04-15 14:12:01',1,2,2),(3346,NULL,59,'2014-04-15 14:12:01',1,2,2),(3347,NULL,59,'2014-04-15 14:12:01',1,2,2),(3348,NULL,59,'2014-04-15 14:12:01',1,2,2),(3349,NULL,59,'2014-04-15 14:12:01',1,2,2),(3350,NULL,59,'2014-04-15 14:12:01',1,2,2),(3351,NULL,59,'2014-04-15 14:12:03',1,2,2),(3352,NULL,59,'2014-04-15 14:12:03',1,2,2),(3353,NULL,59,'2014-04-15 14:12:03',1,2,2),(3354,NULL,59,'2014-04-15 14:12:03',1,2,2),(3355,NULL,59,'2014-04-15 14:12:03',1,2,2),(3356,NULL,59,'2014-04-15 14:12:03',1,2,2),(3357,NULL,59,'2014-04-15 14:12:03',1,2,2),(3358,NULL,59,'2014-04-15 14:12:04',1,2,2),(3359,NULL,59,'2014-04-15 14:12:04',1,2,2),(3360,NULL,59,'2014-04-15 14:12:04',1,2,2),(3361,NULL,59,'2014-04-15 14:12:04',1,2,2),(3362,NULL,59,'2014-04-15 14:12:04',1,2,2),(3363,NULL,59,'2014-04-15 14:12:04',1,2,2),(3364,NULL,59,'2014-04-15 14:12:04',1,2,2),(3365,NULL,59,'2014-04-15 14:12:05',1,2,2),(3366,NULL,59,'2014-04-15 14:12:05',1,2,2),(3367,NULL,59,'2014-04-15 14:12:05',1,2,2),(3368,NULL,59,'2014-04-15 14:12:05',1,2,2),(3369,NULL,59,'2014-04-15 14:12:05',1,2,2),(3370,NULL,59,'2014-04-15 14:12:05',1,2,2),(3371,NULL,59,'2014-04-15 14:12:05',1,2,2),(3372,NULL,59,'2014-04-15 14:12:07',1,2,2),(3373,NULL,59,'2014-04-15 14:12:07',1,2,2),(3374,NULL,59,'2014-04-15 14:12:07',1,2,2),(3375,NULL,59,'2014-04-15 14:12:07',1,2,2),(3376,NULL,59,'2014-04-15 14:12:07',1,2,2),(3377,NULL,59,'2014-04-15 14:12:07',1,2,2),(3378,NULL,59,'2014-04-15 14:12:07',1,2,2),(3379,NULL,59,'2014-04-15 14:12:09',1,2,2),(3380,NULL,59,'2014-04-15 14:12:09',1,2,2),(3381,NULL,59,'2014-04-15 14:12:09',1,2,2),(3382,NULL,59,'2014-04-15 14:12:09',1,2,2),(3383,NULL,59,'2014-04-15 14:12:09',1,2,2),(3384,NULL,59,'2014-04-15 14:12:09',1,2,2),(3385,NULL,59,'2014-04-15 14:12:09',1,2,2),(3386,NULL,59,'2014-04-15 14:12:11',1,2,2),(3387,NULL,59,'2014-04-15 14:12:11',1,2,2),(3388,NULL,59,'2014-04-15 14:12:11',1,2,2),(3389,NULL,59,'2014-04-15 14:12:11',1,2,2),(3390,NULL,59,'2014-04-15 14:12:11',1,2,2),(3391,NULL,59,'2014-04-15 14:12:11',1,2,2),(3392,NULL,59,'2014-04-15 14:12:11',1,2,2),(3393,NULL,59,'2014-04-15 14:12:12',1,2,2),(3394,NULL,59,'2014-04-15 14:12:12',1,2,2),(3395,NULL,59,'2014-04-15 14:12:12',1,2,2),(3396,NULL,59,'2014-04-15 14:12:12',1,2,2),(3397,NULL,59,'2014-04-15 14:12:12',1,2,2),(3398,NULL,59,'2014-04-15 14:12:12',1,2,2),(3399,NULL,59,'2014-04-15 14:12:12',1,2,2),(3400,NULL,59,'2014-04-15 14:12:14',1,2,2),(3401,NULL,59,'2014-04-15 14:12:14',1,2,2),(3402,NULL,59,'2014-04-15 14:12:14',1,2,2),(3403,NULL,59,'2014-04-15 14:12:14',1,2,2),(3404,NULL,59,'2014-04-15 14:12:14',1,2,2),(3405,NULL,59,'2014-04-15 14:12:14',1,2,2),(3406,NULL,59,'2014-04-15 14:12:14',1,2,2),(3407,NULL,59,'2014-04-15 14:19:58',1,2,2),(3408,NULL,59,'2014-04-15 14:19:58',1,2,2),(3409,NULL,59,'2014-04-15 14:19:58',1,2,2),(3410,NULL,59,'2014-04-15 14:19:58',1,2,2),(3411,NULL,59,'2014-04-15 14:19:58',1,2,2),(3412,NULL,59,'2014-04-15 14:19:58',1,2,2),(3413,NULL,59,'2014-04-15 14:19:58',1,2,2),(3414,NULL,59,'2014-04-15 14:20:01',1,2,2),(3415,NULL,59,'2014-04-15 14:20:01',1,2,2),(3416,NULL,59,'2014-04-15 14:20:01',1,2,2),(3417,NULL,59,'2014-04-15 14:20:01',1,2,2),(3418,NULL,59,'2014-04-15 14:20:01',1,2,2),(3419,NULL,59,'2014-04-15 14:20:01',1,2,2),(3420,NULL,59,'2014-04-15 14:20:01',1,2,2),(3421,NULL,59,'2014-04-15 14:20:03',1,2,2),(3422,NULL,59,'2014-04-15 14:20:03',1,2,2),(3423,NULL,59,'2014-04-15 14:20:03',1,2,2),(3424,NULL,59,'2014-04-15 14:20:03',1,2,2),(3425,NULL,59,'2014-04-15 14:20:03',1,2,2),(3426,NULL,59,'2014-04-15 14:20:03',1,2,2),(3427,NULL,59,'2014-04-15 14:20:03',1,2,2),(3428,NULL,59,'2014-04-15 14:20:17',1,2,2),(3429,NULL,59,'2014-04-15 14:20:17',1,2,2),(3430,NULL,59,'2014-04-15 14:20:17',1,2,2),(3431,NULL,59,'2014-04-15 14:20:17',1,2,2),(3432,NULL,59,'2014-04-15 14:20:17',1,2,2),(3433,NULL,59,'2014-04-15 14:20:17',1,2,2),(3434,NULL,59,'2014-04-15 14:20:17',1,2,2),(3435,NULL,59,'2014-04-15 14:20:44',1,2,2),(3436,NULL,59,'2014-04-15 14:20:44',1,2,2),(3437,NULL,59,'2014-04-15 14:20:44',1,2,2),(3438,NULL,59,'2014-04-15 14:20:44',1,2,2),(3439,NULL,59,'2014-04-15 14:20:44',1,2,2),(3440,NULL,59,'2014-04-15 14:20:44',1,2,2),(3441,NULL,59,'2014-04-15 14:20:44',1,2,2),(3442,NULL,59,'2014-04-15 14:21:39',1,2,2),(3443,NULL,59,'2014-04-15 14:21:39',1,2,2),(3444,NULL,59,'2014-04-15 14:21:39',1,2,2),(3445,NULL,59,'2014-04-15 14:21:39',1,2,2),(3446,NULL,59,'2014-04-15 14:21:39',1,2,2),(3447,NULL,59,'2014-04-15 14:21:39',1,2,2),(3448,NULL,59,'2014-04-15 14:21:39',1,2,2),(3449,NULL,59,'2014-04-15 14:35:35',1,2,2),(3450,NULL,59,'2014-04-15 14:36:33',1,2,2),(3451,NULL,59,'2014-04-15 14:36:33',1,2,2),(3452,NULL,59,'2014-04-15 14:36:33',1,2,2),(3453,NULL,59,'2014-04-15 14:36:33',1,2,2),(3454,NULL,59,'2014-04-15 14:36:33',1,2,2),(3455,NULL,59,'2014-04-15 14:36:33',1,2,2),(3456,NULL,59,'2014-04-15 14:36:33',1,2,2),(3457,NULL,59,'2014-04-15 14:37:03',1,2,2),(3458,NULL,59,'2014-04-15 14:37:03',1,2,2),(3459,NULL,59,'2014-04-15 14:37:03',1,2,2),(3460,NULL,59,'2014-04-15 14:37:03',1,2,2),(3461,NULL,59,'2014-04-15 14:37:03',1,2,2),(3462,NULL,59,'2014-04-15 14:37:03',1,2,2),(3463,NULL,59,'2014-04-15 14:37:03',1,2,2),(3464,NULL,59,'2014-04-15 14:37:05',1,2,2),(3465,NULL,59,'2014-04-15 14:37:05',1,2,2),(3466,NULL,59,'2014-04-15 14:37:05',1,2,2),(3467,NULL,59,'2014-04-15 14:37:05',1,2,2),(3468,NULL,59,'2014-04-15 14:37:05',1,2,2),(3469,NULL,59,'2014-04-15 14:37:05',1,2,2),(3470,NULL,59,'2014-04-15 14:37:05',1,2,2),(3471,NULL,59,'2014-04-15 14:37:06',1,2,2),(3472,NULL,59,'2014-04-15 14:37:06',1,2,2),(3473,NULL,59,'2014-04-15 14:37:06',1,2,2),(3474,NULL,59,'2014-04-15 14:37:06',1,2,2),(3475,NULL,59,'2014-04-15 14:37:06',1,2,2),(3476,NULL,59,'2014-04-15 14:37:06',1,2,2),(3477,NULL,59,'2014-04-15 14:37:06',1,2,2),(3478,NULL,59,'2014-04-15 14:42:05',1,2,2),(3479,NULL,59,'2014-04-15 14:42:05',1,2,2),(3480,NULL,59,'2014-04-15 14:42:05',1,2,2),(3481,NULL,59,'2014-04-15 14:42:05',1,2,2),(3482,NULL,59,'2014-04-15 14:42:05',1,2,2),(3483,NULL,59,'2014-04-15 14:42:05',1,2,2),(3484,NULL,59,'2014-04-15 14:42:05',1,2,2),(3485,NULL,59,'2014-04-15 15:34:23',1,2,2),(3486,NULL,59,'2014-04-15 15:37:59',1,2,2),(3487,NULL,59,'2014-04-15 15:40:23',1,2,2),(3488,NULL,59,'2014-04-15 15:57:28',1,2,2),(3489,NULL,59,'2014-04-15 15:58:32',1,2,2),(3490,NULL,59,'2014-04-15 16:01:26',1,2,2),(3491,NULL,59,'2014-04-15 16:01:43',1,2,2),(3492,NULL,59,'2014-04-15 16:15:39',1,2,2),(3493,NULL,74,'2014-04-15 17:10:10',1,1,1),(3494,NULL,75,'2014-04-15 17:10:12',1,1,1),(3495,NULL,76,'2014-04-15 17:10:13',1,1,1),(3496,NULL,77,'2014-04-15 17:10:14',1,1,1),(3497,NULL,78,'2014-04-15 17:10:15',1,1,1),(3498,NULL,79,'2014-04-15 17:10:16',1,1,1),(3499,NULL,80,'2014-04-15 17:10:23',1,1,1),(3500,NULL,81,'2014-04-15 17:10:26',1,1,1),(3501,NULL,82,'2014-04-15 17:10:27',1,1,1),(3502,NULL,59,'2014-04-15 19:40:42',1,2,2),(3503,NULL,59,'2014-04-15 19:40:46',1,2,2),(3504,NULL,59,'2014-04-15 19:41:03',1,2,2),(3505,NULL,59,'2014-04-15 19:41:07',1,2,2),(3506,NULL,59,'2014-04-15 19:41:13',1,2,2),(3507,NULL,59,'2014-04-15 19:41:16',1,2,2),(3508,NULL,59,'2014-04-15 19:41:21',1,2,2),(3509,NULL,59,'2014-04-15 19:42:51',1,2,2),(3510,NULL,59,'2014-04-15 19:42:54',1,2,2),(3511,NULL,59,'2014-04-16 09:33:01',1,2,2),(3512,NULL,59,'2014-04-16 09:40:20',1,2,2),(3513,NULL,59,'2014-04-16 09:43:05',1,2,2),(3514,NULL,59,'2014-04-16 09:46:29',1,2,2),(3515,NULL,59,'2014-04-16 09:59:21',1,2,2),(3516,NULL,59,'2014-04-16 09:59:25',1,2,2),(3517,NULL,59,'2014-04-16 11:57:54',1,2,2),(3518,NULL,59,'2014-04-16 11:58:06',1,2,2),(3519,NULL,59,'2014-04-16 11:58:30',1,2,2),(3520,NULL,59,'2014-04-16 11:58:49',1,2,2),(3521,NULL,72,'2014-04-17 10:20:46',1,1,1),(3522,NULL,72,'2014-04-17 10:26:51',1,1,1),(3523,NULL,59,'2014-04-17 10:45:19',NULL,NULL,NULL),(3524,NULL,59,'2014-04-17 10:45:23',NULL,NULL,NULL),(3525,NULL,59,'2014-04-17 10:45:31',NULL,NULL,NULL),(3526,NULL,59,'2014-04-17 10:45:39',NULL,NULL,NULL),(3527,NULL,59,'2014-04-17 10:45:53',NULL,NULL,NULL),(3528,NULL,72,'2014-04-17 10:46:48',NULL,NULL,NULL),(3529,NULL,73,'2014-04-17 10:51:44',1,1,1),(3530,NULL,73,'2014-04-17 10:52:15',1,1,1),(3531,NULL,83,'2014-04-17 11:09:52',1,1,1),(3532,NULL,83,'2014-04-17 11:10:05',1,1,1),(3533,NULL,83,'2014-04-17 11:10:45',1,1,1),(3534,NULL,83,'2014-04-17 11:13:17',1,1,1),(3535,NULL,83,'2014-04-17 11:13:42',1,1,1),(3536,NULL,83,'2014-04-17 11:13:59',1,1,1),(3537,NULL,83,'2014-04-17 11:14:14',1,1,1),(3538,NULL,83,'2014-04-17 11:15:02',1,1,1),(3539,NULL,83,'2014-04-17 11:19:13',1,1,1),(3540,NULL,84,'2014-04-17 11:29:30',1,1,1),(3541,NULL,85,'2014-04-17 11:30:01',1,1,1),(3542,NULL,85,'2014-04-17 11:30:30',1,1,1),(3543,NULL,85,'2014-04-17 11:39:29',1,1,1),(3544,NULL,85,'2014-04-17 11:53:45',1,1,1),(3545,NULL,85,'2014-04-17 12:05:07',1,1,1),(3546,NULL,85,'2014-04-17 12:34:05',1,1,1),(3547,NULL,85,'2014-04-17 12:34:05',1,1,1),(3548,NULL,85,'2014-04-17 12:34:05',1,1,1),(3549,NULL,85,'2014-04-17 12:34:05',1,1,1),(3550,NULL,85,'2014-04-17 12:34:05',1,1,1),(3551,NULL,85,'2014-04-17 12:34:05',1,1,1),(3552,NULL,85,'2014-04-17 12:34:05',1,1,1),(3553,NULL,85,'2014-04-17 12:35:16',1,1,1),(3554,NULL,85,'2014-04-17 12:35:16',1,1,1),(3555,NULL,85,'2014-04-17 12:35:16',1,1,1),(3556,NULL,85,'2014-04-17 12:35:16',1,1,1),(3557,NULL,85,'2014-04-17 12:35:16',1,1,1),(3558,NULL,85,'2014-04-17 12:35:16',1,1,1),(3559,NULL,85,'2014-04-17 12:35:16',1,1,1),(3560,NULL,85,'2014-04-17 12:35:17',1,1,1),(3561,NULL,85,'2014-04-17 12:35:17',1,1,1),(3562,NULL,85,'2014-04-17 12:35:17',1,1,1),(3563,NULL,85,'2014-04-17 12:35:17',1,1,1),(3564,NULL,85,'2014-04-17 12:35:17',1,1,1),(3565,NULL,85,'2014-04-17 12:35:17',1,1,1),(3566,NULL,85,'2014-04-17 12:35:17',1,1,1),(3567,NULL,85,'2014-04-17 12:35:22',1,1,1),(3568,NULL,85,'2014-04-17 12:35:22',1,1,1),(3569,NULL,85,'2014-04-17 12:35:22',1,1,1),(3570,NULL,85,'2014-04-17 12:35:22',1,1,1),(3571,NULL,85,'2014-04-17 12:35:22',1,1,1),(3572,NULL,85,'2014-04-17 12:35:22',1,1,1),(3573,NULL,85,'2014-04-17 12:35:22',1,1,1),(3574,NULL,85,'2014-04-17 12:35:22',1,1,1),(3575,NULL,85,'2014-04-17 12:35:22',1,1,1),(3576,NULL,85,'2014-04-17 12:35:22',1,1,1),(3577,NULL,85,'2014-04-17 12:35:22',1,1,1),(3578,NULL,85,'2014-04-17 12:35:22',1,1,1),(3579,NULL,85,'2014-04-17 12:35:22',1,1,1),(3580,NULL,85,'2014-04-17 12:35:22',1,1,1),(3581,NULL,85,'2014-04-17 12:35:23',1,1,1),(3582,NULL,85,'2014-04-17 12:35:23',1,1,1),(3583,NULL,85,'2014-04-17 12:35:23',1,1,1),(3584,NULL,85,'2014-04-17 12:35:23',1,1,1),(3585,NULL,85,'2014-04-17 12:35:23',1,1,1),(3586,NULL,85,'2014-04-17 12:35:23',1,1,1),(3587,NULL,85,'2014-04-17 12:35:23',1,1,1),(3588,NULL,85,'2014-04-17 12:35:23',1,1,1),(3589,NULL,85,'2014-04-17 12:35:23',1,1,1),(3590,NULL,85,'2014-04-17 12:35:23',1,1,1),(3591,NULL,85,'2014-04-17 12:35:23',1,1,1),(3592,NULL,85,'2014-04-17 12:35:23',1,1,1),(3593,NULL,85,'2014-04-17 12:35:23',1,1,1),(3594,NULL,85,'2014-04-17 12:35:23',1,1,1),(3595,NULL,85,'2014-04-17 12:35:29',1,1,1),(3596,NULL,85,'2014-04-17 12:35:29',1,1,1),(3597,NULL,85,'2014-04-17 12:35:29',1,1,1),(3598,NULL,85,'2014-04-17 12:35:29',1,1,1),(3599,NULL,85,'2014-04-17 12:35:29',1,1,1),(3600,NULL,85,'2014-04-17 12:35:29',1,1,1),(3601,NULL,85,'2014-04-17 12:35:29',1,1,1),(3602,NULL,85,'2014-04-17 12:35:30',1,1,1),(3603,NULL,85,'2014-04-17 12:35:30',1,1,1),(3604,NULL,85,'2014-04-17 12:35:30',1,1,1),(3605,NULL,85,'2014-04-17 12:35:30',1,1,1),(3606,NULL,85,'2014-04-17 12:35:30',1,1,1),(3607,NULL,85,'2014-04-17 12:35:30',1,1,1),(3608,NULL,85,'2014-04-17 12:35:30',1,1,1),(3609,NULL,85,'2014-04-17 12:35:31',1,1,1),(3610,NULL,85,'2014-04-17 12:35:31',1,1,1),(3611,NULL,85,'2014-04-17 12:35:31',1,1,1),(3612,NULL,85,'2014-04-17 12:35:31',1,1,1),(3613,NULL,85,'2014-04-17 12:35:31',1,1,1),(3614,NULL,85,'2014-04-17 12:35:31',1,1,1),(3615,NULL,85,'2014-04-17 12:35:31',1,1,1),(3616,NULL,85,'2014-04-17 12:35:31',1,1,1),(3617,NULL,85,'2014-04-17 12:35:31',1,1,1),(3618,NULL,85,'2014-04-17 12:35:31',1,1,1),(3619,NULL,85,'2014-04-17 12:35:31',1,1,1),(3620,NULL,85,'2014-04-17 12:35:31',1,1,1),(3621,NULL,85,'2014-04-17 12:35:31',1,1,1),(3622,NULL,85,'2014-04-17 12:35:31',1,1,1),(3623,NULL,85,'2014-04-17 12:35:31',1,1,1),(3624,NULL,85,'2014-04-17 12:35:31',1,1,1),(3625,NULL,85,'2014-04-17 12:35:31',1,1,1),(3626,NULL,85,'2014-04-17 12:35:31',1,1,1),(3627,NULL,85,'2014-04-17 12:35:31',1,1,1),(3628,NULL,85,'2014-04-17 12:35:31',1,1,1),(3629,NULL,85,'2014-04-17 12:35:31',1,1,1),(3630,NULL,85,'2014-04-17 12:35:31',1,1,1),(3631,NULL,85,'2014-04-17 12:35:31',1,1,1),(3632,NULL,85,'2014-04-17 12:35:31',1,1,1),(3633,NULL,85,'2014-04-17 12:35:31',1,1,1),(3634,NULL,85,'2014-04-17 12:35:31',1,1,1),(3635,NULL,85,'2014-04-17 12:35:31',1,1,1),(3636,NULL,85,'2014-04-17 12:35:31',1,1,1),(3637,NULL,85,'2014-04-17 12:35:32',1,1,1),(3638,NULL,85,'2014-04-17 12:35:32',1,1,1),(3639,NULL,85,'2014-04-17 12:35:32',1,1,1),(3640,NULL,85,'2014-04-17 12:35:32',1,1,1),(3641,NULL,85,'2014-04-17 12:35:32',1,1,1),(3642,NULL,85,'2014-04-17 12:35:32',1,1,1),(3643,NULL,85,'2014-04-17 12:35:32',1,1,1),(3644,NULL,85,'2014-04-17 12:35:32',1,1,1),(3645,NULL,85,'2014-04-17 12:35:32',1,1,1),(3646,NULL,85,'2014-04-17 12:35:32',1,1,1),(3647,NULL,85,'2014-04-17 12:35:32',1,1,1),(3648,NULL,85,'2014-04-17 12:35:32',1,1,1),(3649,NULL,85,'2014-04-17 12:35:32',1,1,1),(3650,NULL,85,'2014-04-17 12:35:32',1,1,1),(3651,NULL,85,'2014-04-17 12:35:32',1,1,1),(3652,NULL,85,'2014-04-17 12:35:32',1,1,1),(3653,NULL,85,'2014-04-17 12:35:32',1,1,1),(3654,NULL,85,'2014-04-17 12:35:32',1,1,1),(3655,NULL,85,'2014-04-17 12:35:32',1,1,1),(3656,NULL,85,'2014-04-17 12:35:32',1,1,1),(3657,NULL,85,'2014-04-17 12:35:32',1,1,1),(3658,NULL,85,'2014-04-17 12:35:33',1,1,1),(3659,NULL,85,'2014-04-17 12:35:33',1,1,1),(3660,NULL,85,'2014-04-17 12:35:33',1,1,1),(3661,NULL,85,'2014-04-17 12:35:33',1,1,1),(3662,NULL,85,'2014-04-17 12:35:33',1,1,1),(3663,NULL,85,'2014-04-17 12:35:33',1,1,1),(3664,NULL,85,'2014-04-17 12:35:33',1,1,1),(3665,NULL,85,'2014-04-17 12:35:33',1,1,1),(3666,NULL,85,'2014-04-17 12:35:33',1,1,1),(3667,NULL,85,'2014-04-17 12:35:33',1,1,1),(3668,NULL,85,'2014-04-17 12:35:33',1,1,1),(3669,NULL,85,'2014-04-17 12:35:33',1,1,1),(3670,NULL,85,'2014-04-17 12:35:33',1,1,1),(3671,NULL,85,'2014-04-17 12:35:33',1,1,1),(3672,NULL,85,'2014-04-17 12:35:33',1,1,1),(3673,NULL,85,'2014-04-17 12:35:33',1,1,1),(3674,NULL,85,'2014-04-17 12:35:33',1,1,1),(3675,NULL,85,'2014-04-17 12:35:33',1,1,1),(3676,NULL,85,'2014-04-17 12:35:33',1,1,1),(3677,NULL,85,'2014-04-17 12:35:33',1,1,1),(3678,NULL,85,'2014-04-17 12:35:33',1,1,1),(3679,NULL,85,'2014-04-17 12:35:33',1,1,1),(3680,NULL,85,'2014-04-17 12:35:33',1,1,1),(3681,NULL,85,'2014-04-17 12:35:33',1,1,1),(3682,NULL,85,'2014-04-17 12:35:33',1,1,1),(3683,NULL,85,'2014-04-17 12:35:33',1,1,1),(3684,NULL,85,'2014-04-17 12:35:33',1,1,1),(3685,NULL,85,'2014-04-17 12:35:33',1,1,1),(3686,NULL,85,'2014-04-17 12:35:40',1,1,1),(3687,NULL,85,'2014-04-17 12:35:40',1,1,1),(3688,NULL,85,'2014-04-17 12:35:40',1,1,1),(3689,NULL,85,'2014-04-17 12:35:40',1,1,1),(3690,NULL,85,'2014-04-17 12:35:40',1,1,1),(3691,NULL,85,'2014-04-17 12:35:40',1,1,1),(3692,NULL,85,'2014-04-17 12:35:40',1,1,1),(3693,NULL,85,'2014-04-17 12:36:06',1,1,1),(3694,NULL,85,'2014-04-17 12:36:06',1,1,1),(3695,NULL,85,'2014-04-17 12:36:06',1,1,1),(3696,NULL,85,'2014-04-17 12:36:06',1,1,1),(3697,NULL,85,'2014-04-17 12:36:06',1,1,1),(3698,NULL,85,'2014-04-17 12:36:06',1,1,1),(3699,NULL,85,'2014-04-17 12:36:06',1,1,1),(3700,NULL,85,'2014-04-17 12:36:55',1,1,1),(3701,NULL,85,'2014-04-17 12:36:55',1,1,1),(3702,NULL,85,'2014-04-17 12:36:55',1,1,1),(3703,NULL,85,'2014-04-17 12:36:55',1,1,1),(3704,NULL,85,'2014-04-17 12:36:55',1,1,1),(3705,NULL,85,'2014-04-17 12:36:55',1,1,1),(3706,NULL,85,'2014-04-17 12:36:55',1,1,1),(3707,NULL,85,'2014-04-17 12:37:27',1,1,1),(3708,NULL,85,'2014-04-17 12:37:27',1,1,1),(3709,NULL,85,'2014-04-17 12:37:27',1,1,1),(3710,NULL,85,'2014-04-17 12:37:27',1,1,1),(3711,NULL,85,'2014-04-17 12:37:27',1,1,1),(3712,NULL,85,'2014-04-17 12:37:27',1,1,1),(3713,NULL,85,'2014-04-17 12:37:27',1,1,1),(3714,NULL,85,'2014-04-17 12:37:28',1,1,1),(3715,NULL,85,'2014-04-17 12:37:28',1,1,1),(3716,NULL,85,'2014-04-17 12:37:28',1,1,1),(3717,NULL,85,'2014-04-17 12:37:28',1,1,1),(3718,NULL,85,'2014-04-17 12:37:28',1,1,1),(3719,NULL,85,'2014-04-17 12:37:28',1,1,1),(3720,NULL,85,'2014-04-17 12:37:28',1,1,1),(3721,NULL,85,'2014-04-17 12:37:29',1,1,1),(3722,NULL,85,'2014-04-17 12:37:29',1,1,1),(3723,NULL,85,'2014-04-17 12:37:29',1,1,1),(3724,NULL,85,'2014-04-17 12:37:29',1,1,1),(3725,NULL,85,'2014-04-17 12:37:29',1,1,1),(3726,NULL,85,'2014-04-17 12:37:29',1,1,1),(3727,NULL,85,'2014-04-17 12:37:29',1,1,1),(3728,NULL,85,'2014-04-17 12:37:29',1,1,1),(3729,NULL,85,'2014-04-17 12:37:29',1,1,1),(3730,NULL,85,'2014-04-17 12:37:29',1,1,1),(3731,NULL,85,'2014-04-17 12:37:29',1,1,1),(3732,NULL,85,'2014-04-17 12:37:29',1,1,1),(3733,NULL,85,'2014-04-17 12:37:29',1,1,1),(3734,NULL,85,'2014-04-17 12:37:29',1,1,1),(3735,NULL,85,'2014-04-17 12:37:30',1,1,1),(3736,NULL,85,'2014-04-17 12:37:30',1,1,1),(3737,NULL,85,'2014-04-17 12:37:30',1,1,1),(3738,NULL,85,'2014-04-17 12:37:30',1,1,1),(3739,NULL,85,'2014-04-17 12:37:30',1,1,1),(3740,NULL,85,'2014-04-17 12:37:30',1,1,1),(3741,NULL,85,'2014-04-17 12:37:30',1,1,1),(3742,NULL,85,'2014-04-17 12:37:34',1,1,1),(3743,NULL,85,'2014-04-17 12:37:34',1,1,1),(3744,NULL,85,'2014-04-17 12:37:34',1,1,1),(3745,NULL,85,'2014-04-17 12:37:34',1,1,1),(3746,NULL,85,'2014-04-17 12:37:34',1,1,1),(3747,NULL,85,'2014-04-17 12:37:34',1,1,1),(3748,NULL,85,'2014-04-17 12:37:34',1,1,1),(3749,NULL,85,'2014-04-17 12:37:34',1,1,1),(3750,NULL,85,'2014-04-17 12:37:34',1,1,1),(3751,NULL,85,'2014-04-17 12:37:34',1,1,1),(3752,NULL,85,'2014-04-17 12:37:34',1,1,1),(3753,NULL,85,'2014-04-17 12:37:34',1,1,1),(3754,NULL,85,'2014-04-17 12:37:34',1,1,1),(3755,NULL,85,'2014-04-17 12:37:34',1,1,1),(3756,NULL,85,'2014-04-17 12:37:34',1,1,1),(3757,NULL,85,'2014-04-17 12:37:34',1,1,1),(3758,NULL,85,'2014-04-17 12:37:34',1,1,1),(3759,NULL,85,'2014-04-17 12:37:34',1,1,1),(3760,NULL,85,'2014-04-17 12:37:34',1,1,1),(3761,NULL,85,'2014-04-17 12:37:34',1,1,1),(3762,NULL,85,'2014-04-17 12:37:34',1,1,1),(3763,NULL,85,'2014-04-17 12:37:35',1,1,1),(3764,NULL,85,'2014-04-17 12:37:35',1,1,1),(3765,NULL,85,'2014-04-17 12:37:35',1,1,1),(3766,NULL,85,'2014-04-17 12:37:35',1,1,1),(3767,NULL,85,'2014-04-17 12:37:35',1,1,1),(3768,NULL,85,'2014-04-17 12:37:35',1,1,1),(3769,NULL,85,'2014-04-17 12:37:35',1,1,1),(3770,NULL,85,'2014-04-17 12:37:35',1,1,1),(3771,NULL,85,'2014-04-17 12:37:35',1,1,1),(3772,NULL,85,'2014-04-17 12:37:35',1,1,1),(3773,NULL,85,'2014-04-17 12:37:35',1,1,1),(3774,NULL,85,'2014-04-17 12:37:35',1,1,1),(3775,NULL,85,'2014-04-17 12:37:35',1,1,1),(3776,NULL,85,'2014-04-17 12:37:35',1,1,1),(3777,NULL,85,'2014-04-17 12:37:37',1,1,1),(3778,NULL,85,'2014-04-17 12:37:37',1,1,1),(3779,NULL,85,'2014-04-17 12:37:37',1,1,1),(3780,NULL,85,'2014-04-17 12:37:37',1,1,1),(3781,NULL,85,'2014-04-17 12:37:37',1,1,1),(3782,NULL,85,'2014-04-17 12:37:37',1,1,1),(3783,NULL,85,'2014-04-17 12:37:37',1,1,1),(3784,NULL,85,'2014-04-17 12:37:38',1,1,1),(3785,NULL,85,'2014-04-17 12:37:38',1,1,1),(3786,NULL,85,'2014-04-17 12:37:38',1,1,1),(3787,NULL,85,'2014-04-17 12:37:38',1,1,1),(3788,NULL,85,'2014-04-17 12:37:38',1,1,1),(3789,NULL,85,'2014-04-17 12:37:38',1,1,1),(3790,NULL,85,'2014-04-17 12:37:38',1,1,1),(3791,NULL,85,'2014-04-17 12:37:41',1,1,1),(3792,NULL,85,'2014-04-17 12:37:41',1,1,1),(3793,NULL,85,'2014-04-17 12:37:41',1,1,1),(3794,NULL,85,'2014-04-17 12:37:41',1,1,1),(3795,NULL,85,'2014-04-17 12:37:41',1,1,1),(3796,NULL,85,'2014-04-17 12:37:41',1,1,1),(3797,NULL,85,'2014-04-17 12:37:41',1,1,1),(3798,NULL,85,'2014-04-17 12:37:42',1,1,1),(3799,NULL,85,'2014-04-17 12:37:42',1,1,1),(3800,NULL,85,'2014-04-17 12:37:42',1,1,1),(3801,NULL,85,'2014-04-17 12:37:42',1,1,1),(3802,NULL,85,'2014-04-17 12:37:42',1,1,1),(3803,NULL,85,'2014-04-17 12:37:42',1,1,1),(3804,NULL,85,'2014-04-17 12:37:42',1,1,1),(3805,NULL,85,'2014-04-17 12:37:42',1,1,1),(3806,NULL,85,'2014-04-17 12:37:42',1,1,1),(3807,NULL,85,'2014-04-17 12:37:42',1,1,1),(3808,NULL,85,'2014-04-17 12:37:42',1,1,1),(3809,NULL,85,'2014-04-17 12:37:42',1,1,1),(3810,NULL,85,'2014-04-17 12:37:42',1,1,1),(3811,NULL,85,'2014-04-17 12:37:42',1,1,1),(3812,NULL,85,'2014-04-17 12:37:42',1,1,1),(3813,NULL,85,'2014-04-17 12:37:42',1,1,1),(3814,NULL,85,'2014-04-17 12:37:42',1,1,1),(3815,NULL,85,'2014-04-17 12:37:42',1,1,1),(3816,NULL,85,'2014-04-17 12:37:42',1,1,1),(3817,NULL,85,'2014-04-17 12:37:42',1,1,1),(3818,NULL,85,'2014-04-17 12:37:42',1,1,1),(3819,NULL,85,'2014-04-17 12:37:42',1,1,1),(3820,NULL,85,'2014-04-17 12:37:42',1,1,1),(3821,NULL,85,'2014-04-17 12:37:42',1,1,1),(3822,NULL,85,'2014-04-17 12:37:42',1,1,1),(3823,NULL,85,'2014-04-17 12:37:42',1,1,1),(3824,NULL,85,'2014-04-17 12:37:42',1,1,1),(3825,NULL,85,'2014-04-17 12:37:42',1,1,1),(3826,NULL,85,'2014-04-17 12:37:43',1,1,1),(3827,NULL,85,'2014-04-17 12:37:43',1,1,1),(3828,NULL,85,'2014-04-17 12:37:43',1,1,1),(3829,NULL,85,'2014-04-17 12:37:43',1,1,1),(3830,NULL,85,'2014-04-17 12:37:43',1,1,1),(3831,NULL,85,'2014-04-17 12:37:43',1,1,1),(3832,NULL,85,'2014-04-17 12:37:43',1,1,1),(3833,NULL,85,'2014-04-17 12:37:43',1,1,1),(3834,NULL,85,'2014-04-17 12:37:43',1,1,1),(3835,NULL,85,'2014-04-17 12:37:43',1,1,1),(3836,NULL,85,'2014-04-17 12:37:43',1,1,1),(3837,NULL,85,'2014-04-17 12:37:43',1,1,1),(3838,NULL,85,'2014-04-17 12:37:43',1,1,1),(3839,NULL,85,'2014-04-17 12:37:43',1,1,1),(3840,NULL,85,'2014-04-17 12:37:43',1,1,1),(3841,NULL,85,'2014-04-17 12:37:43',1,1,1),(3842,NULL,85,'2014-04-17 12:37:43',1,1,1),(3843,NULL,85,'2014-04-17 12:37:43',1,1,1),(3844,NULL,85,'2014-04-17 12:37:43',1,1,1),(3845,NULL,85,'2014-04-17 12:37:43',1,1,1),(3846,NULL,85,'2014-04-17 12:37:43',1,1,1),(3847,NULL,85,'2014-04-17 12:37:43',1,1,1),(3848,NULL,85,'2014-04-17 12:37:43',1,1,1),(3849,NULL,85,'2014-04-17 12:37:43',1,1,1),(3850,NULL,85,'2014-04-17 12:37:43',1,1,1),(3851,NULL,85,'2014-04-17 12:37:43',1,1,1),(3852,NULL,85,'2014-04-17 12:37:43',1,1,1),(3853,NULL,85,'2014-04-17 12:37:43',1,1,1),(3854,NULL,85,'2014-04-17 12:37:44',1,1,1),(3855,NULL,85,'2014-04-17 12:37:44',1,1,1),(3856,NULL,85,'2014-04-17 12:37:44',1,1,1),(3857,NULL,85,'2014-04-17 12:37:44',1,1,1),(3858,NULL,85,'2014-04-17 12:37:44',1,1,1),(3859,NULL,85,'2014-04-17 12:37:44',1,1,1),(3860,NULL,85,'2014-04-17 12:37:44',1,1,1),(3861,NULL,85,'2014-04-17 12:37:45',1,1,1),(3862,NULL,85,'2014-04-17 12:37:45',1,1,1),(3863,NULL,85,'2014-04-17 12:37:45',1,1,1),(3864,NULL,85,'2014-04-17 12:37:45',1,1,1),(3865,NULL,85,'2014-04-17 12:37:45',1,1,1),(3866,NULL,85,'2014-04-17 12:37:45',1,1,1),(3867,NULL,85,'2014-04-17 12:37:45',1,1,1),(3868,NULL,85,'2014-04-17 12:42:00',1,1,1),(3869,NULL,85,'2014-04-17 12:42:00',1,1,1),(3870,NULL,85,'2014-04-17 12:42:00',1,1,1),(3871,NULL,85,'2014-04-17 12:42:00',1,1,1),(3872,NULL,85,'2014-04-17 12:42:00',1,1,1),(3873,NULL,85,'2014-04-17 12:42:00',1,1,1),(3874,NULL,85,'2014-04-17 12:42:00',1,1,1),(3875,NULL,85,'2014-04-17 12:43:08',1,1,1),(3876,NULL,85,'2014-04-17 12:43:08',1,1,1),(3877,NULL,85,'2014-04-17 12:43:08',1,1,1),(3878,NULL,85,'2014-04-17 12:43:08',1,1,1),(3879,NULL,85,'2014-04-17 12:43:08',1,1,1),(3880,NULL,85,'2014-04-17 12:43:08',1,1,1),(3881,NULL,85,'2014-04-17 12:43:08',1,1,1),(3882,NULL,85,'2014-04-17 12:43:26',1,1,1),(3883,NULL,85,'2014-04-17 12:43:26',1,1,1),(3884,NULL,85,'2014-04-17 12:43:26',1,1,1),(3885,NULL,85,'2014-04-17 12:43:26',1,1,1),(3886,NULL,85,'2014-04-17 12:43:26',1,1,1),(3887,NULL,85,'2014-04-17 12:43:26',1,1,1),(3888,NULL,85,'2014-04-17 12:43:26',1,1,1),(3889,NULL,85,'2014-04-17 12:44:41',1,1,1),(3890,NULL,85,'2014-04-17 12:44:41',1,1,1),(3891,NULL,85,'2014-04-17 12:44:41',1,1,1),(3892,NULL,85,'2014-04-17 12:44:41',1,1,1),(3893,NULL,85,'2014-04-17 12:44:41',1,1,1),(3894,NULL,85,'2014-04-17 12:44:41',1,1,1),(3895,NULL,85,'2014-04-17 12:44:41',1,1,1),(3896,NULL,85,'2014-04-17 12:45:44',1,1,1),(3897,NULL,85,'2014-04-17 12:45:56',1,1,1),(3898,NULL,85,'2014-04-17 12:45:56',1,1,1),(3899,NULL,85,'2014-04-17 12:45:56',1,1,1),(3900,NULL,85,'2014-04-17 12:45:56',1,1,1),(3901,NULL,85,'2014-04-17 12:45:56',1,1,1),(3902,NULL,85,'2014-04-17 12:45:56',1,1,1),(3903,NULL,85,'2014-04-17 12:45:56',1,1,1),(3904,NULL,85,'2014-04-17 12:46:28',1,1,1),(3905,NULL,85,'2014-04-17 12:46:28',1,1,1),(3906,NULL,85,'2014-04-17 12:46:28',1,1,1),(3907,NULL,85,'2014-04-17 12:46:28',1,1,1),(3908,NULL,85,'2014-04-17 12:46:28',1,1,1),(3909,NULL,85,'2014-04-17 12:46:28',1,1,1),(3910,NULL,85,'2014-04-17 12:46:28',1,1,1),(3911,NULL,85,'2014-04-17 13:11:31',1,1,1),(3912,NULL,85,'2014-04-17 13:12:10',1,1,1),(3913,NULL,85,'2014-04-17 13:22:04',1,1,1),(3914,NULL,85,'2014-04-17 13:31:32',1,1,1),(3915,NULL,85,'2014-04-17 13:33:43',1,1,1),(3916,NULL,85,'2014-04-17 13:39:52',1,1,1),(3917,NULL,85,'2014-04-17 13:39:52',1,1,1),(3918,NULL,85,'2014-04-17 13:39:52',1,1,1),(3919,NULL,85,'2014-04-17 13:39:52',1,1,1),(3920,NULL,85,'2014-04-17 13:39:52',1,1,1),(3921,NULL,85,'2014-04-17 13:39:52',1,1,1),(3922,NULL,85,'2014-04-17 13:39:52',1,1,1),(3923,NULL,85,'2014-04-17 13:41:56',1,1,1),(3924,NULL,85,'2014-04-17 13:57:15',1,1,1),(3925,NULL,85,'2014-04-17 13:57:39',1,1,1),(3926,NULL,85,'2014-04-17 13:58:19',1,1,1),(3927,NULL,85,'2014-04-17 14:03:25',1,1,1),(3928,NULL,85,'2014-04-17 14:05:49',1,1,1),(3929,NULL,85,'2014-04-17 14:11:04',1,1,1),(3930,NULL,85,'2014-04-17 14:12:02',1,1,1),(3931,NULL,85,'2014-04-17 14:14:13',1,1,1),(3932,NULL,85,'2014-04-17 14:14:38',1,1,1),(3933,NULL,85,'2014-04-17 14:16:01',1,1,1),(3934,NULL,85,'2014-04-17 14:17:49',1,1,1),(3935,NULL,85,'2014-04-17 14:30:11',1,1,1),(3936,NULL,85,'2014-04-17 14:30:44',1,1,1),(3937,NULL,85,'2014-04-17 14:36:03',1,1,1),(3938,NULL,85,'2014-04-17 14:36:05',1,1,1),(3939,NULL,85,'2014-04-17 14:51:33',1,1,1),(3940,NULL,85,'2014-04-17 14:52:05',1,1,1),(3941,NULL,85,'2014-04-17 14:52:07',1,1,1),(3942,NULL,85,'2014-04-17 14:52:09',1,1,1),(3943,NULL,85,'2014-04-17 14:52:13',1,1,1),(3944,NULL,85,'2014-04-17 14:52:22',1,1,1),(3945,NULL,85,'2014-04-17 14:52:30',1,1,1),(3946,NULL,85,'2014-04-17 14:53:21',1,1,1),(3947,NULL,85,'2014-04-17 14:55:14',1,1,1),(3948,NULL,85,'2014-04-17 15:06:13',1,1,1),(3949,NULL,85,'2014-04-17 16:00:31',1,1,1),(3950,NULL,85,'2014-04-17 16:00:46',1,1,1),(3951,NULL,85,'2014-04-17 16:02:36',1,1,1),(3952,NULL,85,'2014-04-17 16:02:42',1,1,1),(3953,NULL,85,'2014-04-17 16:10:34',1,1,1),(3954,NULL,85,'2014-04-17 16:12:21',1,1,1),(3955,NULL,85,'2014-04-17 16:12:28',1,1,1),(3956,NULL,85,'2014-04-17 16:12:32',1,1,1),(3957,NULL,85,'2014-04-17 16:27:57',1,1,1),(3958,NULL,85,'2014-04-17 16:30:26',1,2,2),(3959,NULL,85,'2014-04-17 19:04:55',1,2,2),(3960,NULL,85,'2014-04-18 10:24:49',1,2,2),(3961,NULL,85,'2014-04-18 13:31:17',1,2,2),(3962,NULL,86,'2014-04-19 11:22:49',1,1,1),(3963,NULL,87,'2014-04-19 21:47:44',1,1,1),(3964,NULL,86,'2014-04-19 21:50:18',1,1,1),(3965,NULL,86,'2014-04-19 21:56:11',1,1,1),(3966,NULL,88,'2014-04-22 13:44:19',1,1,1),(3967,NULL,88,'2014-04-22 13:45:03',1,1,1),(3968,NULL,88,'2014-04-22 13:45:03',1,1,1),(3969,NULL,88,'2014-04-22 13:45:03',1,1,1),(3970,NULL,88,'2014-04-22 13:45:03',1,1,1),(3971,NULL,88,'2014-04-22 13:45:03',1,1,1),(3972,NULL,88,'2014-04-22 13:45:03',1,1,1),(3973,NULL,88,'2014-04-22 13:45:03',1,1,1),(3974,NULL,88,'2014-04-22 13:45:24',1,1,1),(3975,NULL,88,'2014-04-22 13:45:24',1,1,1),(3976,NULL,88,'2014-04-22 13:45:24',1,1,1),(3977,NULL,88,'2014-04-22 13:45:24',1,1,1),(3978,NULL,88,'2014-04-22 13:45:24',1,1,1),(3979,NULL,88,'2014-04-22 13:45:24',1,1,1),(3980,NULL,88,'2014-04-22 13:45:24',1,1,1),(3981,NULL,88,'2014-04-22 13:46:21',1,1,1),(3982,NULL,85,'2014-04-26 11:45:41',1,2,2),(3983,NULL,85,'2014-04-28 11:41:22',1,2,2),(3984,NULL,85,'2014-04-28 12:06:59',1,2,2),(3985,NULL,85,'2014-04-28 12:06:59',1,2,2),(3986,NULL,85,'2014-04-28 12:06:59',1,2,2),(3987,NULL,85,'2014-04-28 12:06:59',1,2,2),(3988,NULL,85,'2014-04-28 12:06:59',1,2,2),(3989,NULL,85,'2014-04-28 12:06:59',1,2,2),(3990,NULL,85,'2014-04-28 12:06:59',1,2,2),(3991,NULL,85,'2014-04-28 12:07:35',1,2,2),(3992,NULL,85,'2014-04-28 12:07:35',1,2,2),(3993,NULL,85,'2014-04-28 12:07:35',1,2,2),(3994,NULL,85,'2014-04-28 12:07:35',1,2,2),(3995,NULL,85,'2014-04-28 12:07:35',1,2,2),(3996,NULL,85,'2014-04-28 12:07:35',1,2,2),(3997,NULL,85,'2014-04-28 12:07:35',1,2,2),(3998,NULL,85,'2014-04-28 12:07:47',1,2,2),(3999,NULL,85,'2014-04-28 12:07:47',1,2,2),(4000,NULL,85,'2014-04-28 12:07:47',1,2,2),(4001,NULL,85,'2014-04-28 12:07:47',1,2,2),(4002,NULL,85,'2014-04-28 12:07:47',1,2,2),(4003,NULL,85,'2014-04-28 12:07:47',1,2,2),(4004,NULL,85,'2014-04-28 12:07:47',1,2,2),(4005,NULL,85,'2014-04-28 12:07:59',1,2,2),(4006,NULL,85,'2014-04-28 12:07:59',1,2,2),(4007,NULL,85,'2014-04-28 12:07:59',1,2,2),(4008,NULL,85,'2014-04-28 12:07:59',1,2,2),(4009,NULL,85,'2014-04-28 12:07:59',1,2,2),(4010,NULL,85,'2014-04-28 12:07:59',1,2,2),(4011,NULL,85,'2014-04-28 12:07:59',1,2,2),(4012,NULL,85,'2014-04-28 12:12:22',1,2,2),(4013,NULL,85,'2014-04-28 12:12:22',1,2,2),(4014,NULL,85,'2014-04-28 12:12:22',1,2,2),(4015,NULL,85,'2014-04-28 12:12:22',1,2,2),(4016,NULL,85,'2014-04-28 12:12:22',1,2,2),(4017,NULL,85,'2014-04-28 12:12:22',1,2,2),(4018,NULL,85,'2014-04-28 12:12:22',1,2,2),(4019,NULL,85,'2014-04-29 18:07:50',1,2,2),(4020,NULL,85,'2014-04-29 18:08:16',1,2,2),(4021,NULL,85,'2014-04-29 18:08:28',1,2,2),(4022,NULL,85,'2014-05-06 10:20:15',NULL,4,4),(4023,NULL,85,'2014-05-06 10:22:52',NULL,5,5),(4024,NULL,85,'2014-05-06 10:24:00',NULL,5,5),(4025,NULL,85,'2014-05-06 10:24:50',NULL,5,5),(4026,NULL,85,'2014-05-06 10:31:25',NULL,5,5),(4027,NULL,86,'2014-05-06 10:37:15',1,1,1),(4028,NULL,85,'2014-05-06 10:39:32',1,2,1),(4029,NULL,85,'2014-05-06 10:39:55',1,3,1),(4030,NULL,85,'2014-05-06 10:40:18',1,4,1),(4031,NULL,86,'2014-05-06 10:40:56',1,4,1),(4032,NULL,85,'2014-05-06 10:48:55',1,2,1),(4033,NULL,86,'2014-05-06 10:49:00',1,2,1),(4034,NULL,85,'2014-05-06 10:49:12',NULL,4,4),(4035,NULL,85,'2014-05-06 10:49:24',NULL,4,4),(4036,NULL,86,'2014-05-06 10:49:27',NULL,2,1),(4037,NULL,85,'2014-05-06 10:49:51',1,4,4),(4038,NULL,86,'2014-05-06 10:50:00',1,2,1),(4039,NULL,85,'2014-05-06 10:50:11',1,2,4),(4040,NULL,85,'2014-05-06 10:50:29',NULL,5,5),(4041,NULL,85,'2014-05-06 10:50:57',1,2,5),(4042,NULL,85,'2014-05-06 10:51:16',NULL,4,4),(4043,NULL,85,'2014-05-06 10:55:16',NULL,2,4),(4044,NULL,85,'2014-05-06 10:55:24',2,5,5),(4045,NULL,86,'2014-05-06 11:18:38',NULL,5,5),(4046,NULL,86,'2014-05-06 11:18:54',NULL,5,5),(4047,NULL,85,'2014-05-06 11:21:44',2,2,5),(4048,NULL,86,'2014-05-06 11:21:52',1,2,5),(4049,NULL,85,'2014-05-06 11:21:57',1,2,5),(4050,NULL,85,'2014-05-06 11:22:12',NULL,5,5),(4051,NULL,86,'2014-05-06 11:25:58',NULL,5,5),(4052,NULL,85,'2014-05-06 11:26:55',NULL,2,5),(4053,NULL,85,'2014-05-06 11:26:59',2,2,5),(4054,NULL,86,'2014-05-06 11:27:08',1,5,5),(4055,NULL,85,'2014-05-06 11:27:15',1,2,5),(4056,NULL,86,'2014-05-06 11:27:33',1,2,5),(4057,NULL,85,'2014-05-06 11:27:50',NULL,5,5),(4058,NULL,86,'2014-05-06 11:30:26',NULL,5,5),(4059,NULL,85,'2014-05-06 11:34:39',1,5,5),(4060,NULL,86,'2014-05-06 11:34:40',1,5,5),(4061,NULL,85,'2014-05-06 11:34:44',1,2,5),(4062,NULL,86,'2014-05-06 11:34:49',1,2,5),(4063,NULL,85,'2014-05-06 11:35:14',NULL,5,5),(4064,NULL,85,'2014-05-06 11:38:31',2,5,5),(4065,NULL,85,'2014-05-06 11:38:47',1,2,5),(4066,NULL,85,'2014-05-06 11:39:00',2,5,5),(4067,1,86,'2014-05-06 12:19:44',2,4,4),(4068,1,85,'2014-05-06 12:25:17',2,4,5),(4069,1,59,'2014-05-06 12:25:18',NULL,NULL,NULL),(4070,1,72,'2014-05-06 12:25:19',NULL,NULL,NULL),(4071,1,87,'2014-05-06 12:25:20',1,1,1),(4072,1,88,'2014-05-06 12:25:27',1,1,1),(4073,1,87,'2014-05-06 14:25:43',1,2,1),(4074,1,88,'2014-05-06 14:25:47',1,2,1),(4075,1,88,'2014-05-06 14:33:18',1,1,1),(4076,1,85,'2014-05-07 16:30:33',3,6,6),(4077,1,86,'2014-05-07 16:38:04',3,6,6),(4078,1,86,'2014-05-07 16:39:01',2,6,6),(4079,1,85,'2014-05-07 16:39:15',2,4,6),(4080,1,86,'2014-05-07 16:39:18',2,4,6),(4081,1,85,'2014-05-07 16:39:55',3,6,6),(4082,1,85,'2014-05-07 16:42:45',2,4,6),(4083,1,85,'2014-05-07 16:42:56',3,6,6),(4084,1,86,'2014-05-07 17:05:33',3,6,6),(4085,1,85,'2014-05-07 17:06:59',2,6,6),(4086,1,86,'2014-05-07 17:07:01',2,6,6),(4087,1,85,'2014-05-07 17:07:04',2,4,6),(4088,1,86,'2014-05-07 17:07:07',2,4,6),(4089,1,85,'2014-05-07 17:07:34',3,6,6),(4090,1,86,'2014-05-07 18:35:15',3,6,6),(4091,1,85,'2014-05-07 19:06:05',2,6,6),(4092,1,86,'2014-05-07 19:06:07',2,6,6),(4093,1,85,'2014-05-07 19:06:09',2,4,6),(4094,1,86,'2014-05-07 19:06:14',2,4,6),(4095,1,85,'2014-05-07 19:06:21',3,6,6),(4096,1,86,'2014-05-07 19:09:18',3,6,6),(4097,1,85,'2014-05-07 19:12:40',2,4,6),(4098,1,86,'2014-05-07 19:12:46',2,4,6),(4099,1,85,'2014-05-07 19:13:17',3,6,6),(4100,1,86,'2014-05-07 19:16:49',3,6,6),(4101,1,86,'2014-05-07 19:16:52',2,4,4),(4102,1,85,'2014-05-08 10:48:29',2,4,6),(4103,1,85,'2014-05-08 10:50:10',3,6,6),(4104,1,85,'2014-05-08 12:05:45',2,4,4),(4105,1,85,'2014-05-08 12:05:57',3,6,6),(4106,1,85,'2014-05-08 12:06:01',2,4,4),(4107,1,86,'2014-05-08 12:06:13',3,6,6),(4108,1,86,'2014-05-08 12:06:18',2,4,4),(4109,1,85,'2014-05-08 12:06:24',3,6,6),(4110,1,85,'2014-05-08 12:06:30',2,4,4),(4111,1,85,'2014-05-08 12:06:36',3,6,6),(4112,1,87,'2014-05-08 12:09:03',2,4,4),(4113,1,87,'2014-05-08 12:09:06',2,4,4),(4114,1,86,'2014-05-08 22:46:54',3,6,6),(4115,1,86,'2014-05-08 22:46:58',2,4,4),(4116,1,87,'2014-05-08 22:47:02',3,6,6),(4117,1,87,'2014-05-08 22:47:06',2,4,4),(4118,1,85,'2014-05-08 23:02:54',2,4,6),(4119,1,85,'2014-05-08 23:03:17',3,6,6),(4120,1,85,'2014-05-08 23:03:20',2,4,4),(4121,1,86,'2014-05-08 23:03:26',3,6,6),(4122,1,85,'2014-05-08 23:03:28',3,6,6),(4123,1,86,'2014-05-08 23:03:32',2,4,4),(4124,1,85,'2014-05-08 23:03:34',2,4,4),(4125,1,85,'2014-05-08 23:13:49',3,6,6),(4126,1,85,'2014-05-09 11:36:12',2,4,6),(4127,1,85,'2014-05-09 11:36:39',3,6,6),(4128,1,85,'2014-05-09 11:42:27',2,4,4),(4129,1,85,'2014-05-09 12:00:29',3,6,6),(4130,1,85,'2014-05-09 16:42:10',2,4,4),(4131,1,85,'2014-05-09 16:46:12',3,6,6),(4132,1,86,'2014-05-09 16:57:57',3,6,6),(4133,1,85,'2014-05-09 17:02:51',2,4,4),(4134,1,85,'2014-05-09 17:04:01',3,6,6),(4135,1,86,'2014-05-09 17:12:23',2,4,4),(4136,1,85,'2014-05-09 17:13:07',2,4,4),(4137,1,85,'2014-05-09 17:14:28',3,6,6),(4138,1,86,'2014-05-09 17:14:29',3,6,6),(4139,1,85,'2014-05-09 17:14:42',2,4,4),(4140,1,86,'2014-05-09 17:31:24',2,4,4),(4141,1,85,'2014-05-09 17:31:34',3,6,6),(4142,1,86,'2014-05-09 17:31:35',3,6,6),(4143,1,87,'2014-05-09 17:31:42',3,6,6),(4144,1,86,'2014-05-09 17:31:48',2,4,4),(4145,1,86,'2014-05-09 18:20:14',3,6,6),(4146,1,85,'2014-05-09 18:20:20',2,4,4),(4147,1,87,'2014-05-09 18:39:26',2,4,4),(4148,1,87,'2014-05-09 18:49:04',3,6,6),(4149,1,86,'2014-05-12 09:45:59',3,7,7),(4150,1,87,'2014-05-12 09:45:59',3,7,7),(4151,1,86,'2014-05-12 09:46:09',3,7,7),(4152,1,87,'2014-05-12 09:46:09',3,7,7),(4153,1,86,'2014-05-12 09:46:57',2,4,4),(4154,1,87,'2014-05-12 09:46:58',2,4,4),(4155,1,85,'2014-05-12 09:49:35',3,6,6),(4156,1,86,'2014-05-12 09:49:38',3,6,6),(4157,1,85,'2014-05-12 09:49:42',3,7,7),(4158,1,86,'2014-05-12 09:49:42',3,7,7),(4159,1,85,'2014-05-12 09:50:52',3,7,7),(4160,1,86,'2014-05-12 09:50:52',3,7,7),(4161,1,85,'2014-05-12 09:53:14',2,4,7),(4162,1,86,'2014-05-12 09:53:23',2,2,7),(4163,1,86,'2014-05-12 09:53:29',2,4,7),(4164,1,85,'2014-05-12 09:56:20',3,6,6),(4165,1,86,'2014-05-12 09:56:28',3,6,6),(4166,1,85,'2014-05-12 09:56:33',3,7,7),(4167,1,86,'2014-05-12 09:56:33',3,7,7),(4168,1,85,'2014-05-12 09:59:16',3,7,7),(4169,1,86,'2014-05-12 09:59:16',3,7,7),(4170,1,85,'2014-05-12 11:55:14',3,7,7),(4171,1,86,'2014-05-12 11:55:14',3,7,7),(4172,1,87,'2014-05-12 12:49:28',3,6,6),(4173,1,87,'2014-05-12 12:49:39',2,4,4),(4174,1,87,'2014-05-12 15:03:53',3,6,6),(4175,1,87,'2014-05-12 15:04:00',2,4,4),(4176,1,87,'2014-05-12 15:19:44',3,6,6),(4177,1,87,'2014-05-12 15:47:13',2,4,4),(4178,1,87,'2014-05-12 17:23:34',3,6,6),(4179,1,87,'2014-05-12 18:22:23',2,4,4),(4180,1,87,'2014-05-15 10:41:30',3,6,6),(4181,1,87,'2014-05-15 11:11:28',2,4,4),(4182,1,87,'2014-05-15 11:40:32',3,6,6),(4183,1,87,'2014-05-15 14:27:53',2,4,4),(4184,1,87,'2014-05-15 15:20:36',3,6,6),(4185,1,87,'2014-05-16 14:13:15',2,4,4),(4186,1,85,'2014-06-06 16:59:30',3,7,7),(4187,1,85,'2014-06-06 16:59:30',3,7,7),(4188,1,85,'2014-06-06 16:59:30',3,7,7),(4189,1,85,'2014-06-06 16:59:30',3,7,7),(4190,1,85,'2014-06-06 16:59:30',3,7,7),(4191,1,85,'2014-06-06 16:59:30',3,7,7),(4192,1,85,'2014-06-06 16:59:30',3,7,7),(4193,1,85,'2014-06-06 16:59:35',3,7,7),(4194,1,85,'2014-06-06 16:59:35',3,7,7),(4195,1,85,'2014-06-06 16:59:35',3,7,7),(4196,1,85,'2014-06-06 16:59:35',3,7,7),(4197,1,85,'2014-06-06 16:59:35',3,7,7),(4198,1,85,'2014-06-06 16:59:35',3,7,7),(4199,1,85,'2014-06-06 16:59:35',3,7,7),(4200,1,85,'2014-06-06 16:59:36',3,7,7),(4201,1,85,'2014-06-06 16:59:36',3,7,7),(4202,1,85,'2014-06-06 16:59:36',3,7,7),(4203,1,85,'2014-06-06 16:59:36',3,7,7),(4204,1,85,'2014-06-06 16:59:36',3,7,7),(4205,1,85,'2014-06-06 16:59:36',3,7,7),(4206,1,85,'2014-06-06 16:59:36',3,7,7),(4207,1,85,'2014-06-06 16:59:38',3,7,7),(4208,1,85,'2014-06-06 16:59:38',3,7,7),(4209,1,85,'2014-06-06 16:59:38',3,7,7),(4210,1,85,'2014-06-06 16:59:38',3,7,7),(4211,1,85,'2014-06-06 16:59:38',3,7,7),(4212,1,85,'2014-06-06 16:59:38',3,7,7),(4213,1,85,'2014-06-06 16:59:38',3,7,7),(4214,1,85,'2014-06-06 16:59:39',3,7,7),(4215,1,85,'2014-06-06 16:59:39',3,7,7),(4216,1,85,'2014-06-06 16:59:39',3,7,7),(4217,1,85,'2014-06-06 16:59:39',3,7,7),(4218,1,85,'2014-06-06 16:59:39',3,7,7),(4219,1,85,'2014-06-06 16:59:39',3,7,7),(4220,1,85,'2014-06-06 16:59:39',3,7,7),(4221,1,85,'2014-06-06 16:59:40',3,7,7),(4222,1,85,'2014-06-06 16:59:40',3,7,7),(4223,1,85,'2014-06-06 16:59:40',3,7,7),(4224,1,85,'2014-06-06 16:59:40',3,7,7),(4225,1,85,'2014-06-06 16:59:40',3,7,7),(4226,1,85,'2014-06-06 16:59:40',3,7,7),(4227,1,85,'2014-06-06 16:59:40',3,7,7),(4228,1,85,'2014-06-06 16:59:45',3,7,7),(4229,1,85,'2014-06-06 16:59:45',3,7,7),(4230,1,85,'2014-06-06 16:59:45',3,7,7),(4231,1,85,'2014-06-06 16:59:45',3,7,7),(4232,1,85,'2014-06-06 16:59:45',3,7,7),(4233,1,85,'2014-06-06 16:59:45',3,7,7),(4234,1,85,'2014-06-06 16:59:45',3,7,7),(4235,1,85,'2014-06-06 16:59:46',3,7,7),(4236,1,85,'2014-06-06 16:59:46',3,7,7),(4237,1,85,'2014-06-06 16:59:46',3,7,7),(4238,1,85,'2014-06-06 16:59:46',3,7,7),(4239,1,85,'2014-06-06 16:59:46',3,7,7),(4240,1,85,'2014-06-06 16:59:46',3,7,7),(4241,1,85,'2014-06-06 16:59:46',3,7,7),(4242,1,85,'2014-06-06 16:59:52',3,7,7),(4243,1,85,'2014-06-06 16:59:52',3,7,7),(4244,1,85,'2014-06-06 16:59:52',3,7,7),(4245,1,85,'2014-06-06 16:59:52',3,7,7),(4246,1,85,'2014-06-06 16:59:52',3,7,7),(4247,1,85,'2014-06-06 16:59:52',3,7,7),(4248,1,85,'2014-06-06 16:59:52',3,7,7),(4249,1,85,'2014-06-06 17:00:33',3,7,7),(4250,1,85,'2014-06-06 17:00:33',3,7,7),(4251,1,85,'2014-06-06 17:00:33',3,7,7),(4252,1,85,'2014-06-06 17:00:33',3,7,7),(4253,1,85,'2014-06-06 17:00:33',3,7,7),(4254,1,85,'2014-06-06 17:00:33',3,7,7),(4255,1,85,'2014-06-06 17:00:33',3,7,7),(4256,1,85,'2014-06-06 17:01:11',3,7,7),(4257,1,85,'2014-06-06 17:01:11',3,7,7),(4258,1,85,'2014-06-06 17:01:11',3,7,7),(4259,1,85,'2014-06-06 17:01:11',3,7,7),(4260,1,85,'2014-06-06 17:01:11',3,7,7),(4261,1,85,'2014-06-06 17:01:11',3,7,7),(4262,1,85,'2014-06-06 17:01:11',3,7,7),(4263,1,85,'2014-06-06 17:01:46',3,7,7),(4264,1,85,'2014-06-06 17:01:46',3,7,7),(4265,1,85,'2014-06-06 17:01:46',3,7,7),(4266,1,85,'2014-06-06 17:01:46',3,7,7),(4267,1,85,'2014-06-06 17:01:46',3,7,7),(4268,1,85,'2014-06-06 17:01:46',3,7,7),(4269,1,85,'2014-06-06 17:01:46',3,7,7),(4270,1,85,'2014-06-06 17:02:15',3,7,7),(4271,1,85,'2014-06-06 17:02:15',3,7,7),(4272,1,85,'2014-06-06 17:02:15',3,7,7),(4273,1,85,'2014-06-06 17:02:15',3,7,7),(4274,1,85,'2014-06-06 17:02:15',3,7,7),(4275,1,85,'2014-06-06 17:02:15',3,7,7),(4276,1,85,'2014-06-06 17:02:15',3,7,7),(4277,1,85,'2014-06-06 17:02:22',3,7,7),(4278,1,85,'2014-06-06 17:02:22',3,7,7),(4279,1,85,'2014-06-06 17:02:22',3,7,7),(4280,1,85,'2014-06-06 17:02:22',3,7,7),(4281,1,85,'2014-06-06 17:02:22',3,7,7),(4282,1,85,'2014-06-06 17:02:22',3,7,7),(4283,1,85,'2014-06-06 17:02:22',3,7,7),(4284,1,85,'2014-06-06 17:02:38',3,7,7),(4285,1,85,'2014-06-06 17:02:38',3,7,7),(4286,1,85,'2014-06-06 17:02:38',3,7,7),(4287,1,85,'2014-06-06 17:02:38',3,7,7),(4288,1,85,'2014-06-06 17:02:38',3,7,7),(4289,1,85,'2014-06-06 17:02:38',3,7,7),(4290,1,85,'2014-06-06 17:02:38',3,7,7),(4291,1,85,'2014-06-06 17:02:49',3,7,7),(4292,1,85,'2014-06-06 17:02:49',3,7,7),(4293,1,85,'2014-06-06 17:02:49',3,7,7),(4294,1,85,'2014-06-06 17:02:49',3,7,7),(4295,1,85,'2014-06-06 17:02:49',3,7,7),(4296,1,85,'2014-06-06 17:02:49',3,7,7),(4297,1,85,'2014-06-06 17:02:49',3,7,7),(4298,NULL,89,'2014-06-09 14:55:57',1,1,1),(4299,NULL,90,'2014-06-09 18:30:01',1,1,1),(4300,1,87,'2014-06-20 10:44:25',3,6,6),(4301,1,87,'2014-06-20 10:50:25',2,4,4),(4302,1,87,'2014-06-20 12:01:46',3,7,7),(4303,1,85,'2014-06-20 12:05:14',3,6,7),(4304,1,86,'2014-06-20 12:05:17',3,6,7),(4305,1,87,'2014-06-20 12:05:24',3,6,7),(4306,1,85,'2014-06-20 12:06:33',3,4,7),(4307,1,86,'2014-06-20 12:06:36',3,4,7),(4308,1,87,'2014-06-20 12:06:40',3,4,7),(4309,1,85,'2014-06-20 12:07:08',3,6,6),(4310,1,86,'2014-06-20 12:07:20',3,6,6),(4311,1,86,'2014-06-20 12:07:43',2,4,4),(4312,1,86,'2014-06-20 12:08:02',3,6,6),(4313,1,85,'2014-06-20 12:09:38',3,7,7),(4314,1,86,'2014-06-20 12:09:38',3,7,7),(4315,1,85,'2014-06-20 17:34:32',3,9,9),(4316,1,86,'2014-06-20 17:34:34',3,8,8),(4317,1,85,'2014-06-20 17:44:19',3,9,9),(4318,1,86,'2014-06-20 17:44:19',3,8,8),(4319,1,85,'2014-06-20 17:46:55',3,9,9),(4320,1,86,'2014-06-20 17:46:55',3,8,8),(4321,1,85,'2014-06-26 14:07:50',3,9,9),(4322,1,86,'2014-06-26 14:07:58',3,8,8),(4323,1,87,'2014-06-26 14:08:02',3,4,7),(4324,1,88,'2014-06-26 14:08:07',1,1,1),(4325,NULL,89,'2014-06-26 14:08:12',1,1,1),(4326,NULL,90,'2014-06-26 14:08:20',1,1,1),(4327,1,85,'2014-06-27 15:21:41',3,8,8),(4328,1,87,'2014-06-27 18:31:14',3,6,6),(4329,1,87,'2014-06-27 18:31:29',2,4,4),(4330,1,87,'2014-06-27 18:31:54',3,6,6),(4331,1,87,'2014-06-27 18:34:42',2,4,4),(4332,1,87,'2014-06-27 18:34:53',3,6,6),(4333,1,85,'2014-06-27 19:03:10',3,6,6),(4334,1,87,'2014-06-29 07:25:49',2,4,4),(4335,1,87,'2014-06-29 11:01:59',3,6,6),(4336,1,86,'2014-06-29 11:22:16',3,6,6),(4337,1,86,'2014-06-29 11:31:09',2,4,4),(4338,1,85,'2014-06-29 11:31:12',2,4,4),(4339,1,85,'2014-06-29 13:59:52',2,8,4),(4340,1,86,'2014-06-29 13:59:56',2,8,4),(4341,1,85,'2014-06-29 14:00:31',2,8,8),(4342,1,86,'2014-06-29 14:00:59',2,8,8),(4343,1,85,'2014-06-29 14:01:10',3,6,6),(4344,1,85,'2014-06-29 14:12:07',3,8,8),(4345,1,87,'2014-06-29 14:12:11',3,8,8),(4346,1,85,'2014-06-29 14:13:10',3,6,6),(4347,1,86,'2014-06-29 14:13:17',3,6,6),(4348,1,86,'2014-06-29 14:18:35',3,8,8),(4349,1,85,'2014-06-29 14:18:36',3,8,8),(4350,1,85,'2014-06-29 14:18:38',3,8,8),(4351,1,85,'2014-06-29 14:19:13',3,6,6),(4352,1,86,'2014-06-29 14:20:22',3,6,6),(4353,1,85,'2014-06-29 14:43:06',3,8,8),(4354,1,86,'2014-06-29 14:43:15',3,8,8),(4355,1,85,'2014-06-29 14:55:22',4,10,10),(4356,1,86,'2014-06-29 14:55:41',4,10,10),(4357,1,85,'2014-06-29 14:56:58',3,8,8),(4358,1,86,'2014-06-29 14:57:01',3,8,8),(4359,1,85,'2014-06-29 14:57:08',4,10,10),(4360,1,87,'2014-06-29 14:57:09',4,10,10),(4361,1,86,'2014-06-29 14:57:10',4,10,10),(4362,1,85,'2014-06-29 14:57:14',3,8,8),(4363,1,87,'2014-06-29 14:57:16',3,8,8),(4364,1,85,'2014-06-29 14:59:12',4,10,10),(4365,1,85,'2014-06-29 16:50:51',3,8,8),(4366,1,85,'2014-06-29 16:50:54',3,8,8),(4367,1,86,'2014-06-29 16:50:57',3,8,8),(4368,1,86,'2014-06-29 16:54:01',3,8,8),(4369,1,85,'2014-06-29 16:54:02',3,8,8),(4370,1,85,'2014-06-29 16:54:09',4,10,10),(4371,1,85,'2014-06-29 16:55:20',3,8,8),(4372,1,85,'2014-06-29 16:55:45',4,10,10),(4373,1,86,'2014-06-29 16:56:45',4,10,10),(4374,1,86,'2014-06-29 16:57:10',3,8,8),(4375,1,85,'2014-06-29 16:57:12',3,8,8),(4376,1,85,'2014-06-29 16:57:51',4,10,10),(4377,1,86,'2014-06-29 17:02:14',4,10,10),(4378,1,86,'2014-06-29 17:02:17',3,8,8),(4379,1,85,'2014-06-29 17:02:57',3,8,8),(4380,1,85,'2014-06-29 21:35:27',4,10,10),(4381,1,85,'2014-06-29 21:40:24',3,8,8),(4382,1,85,'2014-06-29 21:40:51',4,10,10),(4383,1,86,'2014-06-29 21:50:54',4,10,10),(4384,1,85,'2014-06-30 09:33:22',3,7,7),(4385,1,86,'2014-06-30 09:33:23',3,7,7),(4386,1,85,'2014-06-30 11:24:47',4,11,11),(4387,1,86,'2014-06-30 11:24:47',4,11,11),(4388,1,85,'2014-06-30 11:24:57',4,11,11),(4389,1,86,'2014-06-30 11:24:57',4,11,11),(4390,1,85,'2014-06-30 11:26:33',4,11,11),(4391,1,86,'2014-06-30 11:26:33',4,11,11),(4392,1,85,'2014-06-30 11:41:57',4,11,11),(4393,1,86,'2014-06-30 11:41:57',4,11,11),(4394,1,85,'2014-06-30 11:44:58',4,11,11),(4395,1,86,'2014-06-30 11:44:59',4,11,11),(4396,1,87,'2014-06-30 20:11:30',4,10,10),(4397,1,87,'2014-06-30 22:03:49',4,8,8),(4398,1,87,'2014-06-30 22:03:59',4,10,10),(4399,1,87,'2014-06-30 22:06:56',3,8,8),(4400,1,87,'2014-06-30 22:07:17',4,10,10),(4401,1,87,'2014-06-30 22:19:31',4,10,10),(4402,1,87,'2014-06-30 22:21:36',4,10,10),(4403,1,87,'2014-06-30 22:22:03',4,10,10),(4404,1,87,'2014-06-30 22:27:45',4,10,10),(4405,1,87,'2014-06-30 22:27:51',4,10,10),(4406,1,87,'2014-06-30 22:28:20',3,8,8),(4407,1,87,'2014-06-30 22:28:24',4,10,10),(4408,1,87,'2014-06-30 22:29:12',3,8,8),(4409,1,87,'2014-06-30 22:31:17',4,10,10),(4410,1,87,'2014-06-30 22:36:02',4,10,10),(4411,1,87,'2014-06-30 22:38:08',3,8,8),(4412,1,87,'2014-06-30 22:38:16',4,10,10),(4413,1,87,'2014-06-30 22:40:02',4,10,10),(4414,1,87,'2014-06-30 22:40:05',3,8,8),(4415,1,87,'2014-06-30 22:40:08',4,10,10),(4416,1,87,'2014-06-30 22:41:41',3,8,8),(4417,1,85,'2014-06-30 22:43:28',4,11,11),(4418,1,85,'2014-06-30 22:44:15',4,11,11),(4419,1,86,'2014-06-30 22:45:14',4,11,11),(4420,1,86,'2014-06-30 22:45:34',4,11,11),(4421,1,85,'2014-06-30 22:45:35',4,11,11),(4422,1,87,'2014-06-30 22:48:33',4,10,10),(4423,1,87,'2014-06-30 22:48:35',4,10,10),(4424,1,87,'2014-06-30 22:48:48',3,8,8),(4425,1,87,'2014-06-30 22:48:51',3,8,8),(4426,1,87,'2014-06-30 23:05:59',4,10,10),(4427,1,87,'2014-06-30 23:06:07',3,8,8),(4428,1,87,'2014-06-30 23:06:30',4,10,10),(4429,1,87,'2014-06-30 23:15:42',3,8,8),(4430,1,87,'2014-06-30 23:16:10',4,10,10),(4431,1,87,'2014-06-30 23:16:20',3,8,8),(4432,1,87,'2014-06-30 23:18:23',4,10,10),(4433,1,87,'2014-06-30 23:18:30',3,8,8),(4434,1,87,'2014-06-30 23:18:42',4,10,10),(4435,1,87,'2014-06-30 23:19:08',3,8,8),(4436,1,87,'2014-06-30 23:19:13',4,10,10),(4437,1,87,'2014-07-01 08:55:39',3,8,8),(4438,1,87,'2014-07-01 08:55:44',4,10,10),(4439,NULL,91,'2014-07-01 09:49:02',1,1,1),(4440,NULL,92,'2014-07-01 10:03:55',1,1,1),(4441,NULL,91,'2014-07-01 10:06:18',1,1,1),(4442,NULL,92,'2014-07-01 10:06:24',1,1,1),(4443,NULL,93,'2014-07-01 10:08:08',1,1,1),(4444,NULL,94,'2014-07-01 10:13:51',1,1,1),(4445,NULL,95,'2014-07-01 10:14:36',1,1,1),(4446,NULL,95,'2014-07-01 10:36:22',1,1,1),(4447,NULL,95,'2014-07-01 10:36:22',1,1,1),(4448,NULL,95,'2014-07-01 10:36:22',1,1,1),(4449,NULL,95,'2014-07-01 10:36:22',1,1,1),(4450,NULL,95,'2014-07-01 10:36:22',1,1,1),(4451,NULL,95,'2014-07-01 10:36:22',1,1,1),(4452,NULL,95,'2014-07-01 10:36:22',1,1,1),(4453,NULL,95,'2014-07-01 10:38:50',1,1,1),(4454,NULL,96,'2014-07-01 10:59:02',1,1,1),(4455,NULL,97,'2014-07-01 11:32:37',1,1,1),(4456,NULL,98,'2014-07-01 11:37:30',1,1,1),(4457,NULL,99,'2014-07-01 12:05:31',1,1,1),(4458,NULL,100,'2014-07-01 12:07:59',1,1,1),(4459,NULL,101,'2014-07-01 12:45:27',1,1,1),(4460,NULL,101,'2014-07-01 12:53:31',1,1,1),(4461,NULL,101,'2014-07-01 12:53:31',1,1,1),(4462,NULL,101,'2014-07-01 12:53:31',1,1,1),(4463,NULL,101,'2014-07-01 12:53:31',1,1,1),(4464,NULL,101,'2014-07-01 12:53:31',1,1,1),(4465,NULL,101,'2014-07-01 12:53:31',1,1,1),(4466,NULL,101,'2014-07-01 12:53:31',1,1,1),(4467,NULL,101,'2014-07-01 12:54:02',1,1,1),(4468,NULL,101,'2014-07-01 12:54:40',1,1,1),(4469,NULL,101,'2014-07-01 12:54:40',1,1,1),(4470,NULL,101,'2014-07-01 12:54:40',1,1,1),(4471,NULL,101,'2014-07-01 12:54:40',1,1,1),(4472,NULL,101,'2014-07-01 12:54:40',1,1,1),(4473,NULL,101,'2014-07-01 12:54:40',1,1,1),(4474,NULL,101,'2014-07-01 12:54:40',1,1,1),(4475,NULL,101,'2014-07-01 13:14:27',1,1,1),(4476,NULL,101,'2014-07-01 15:20:56',1,1,1),(4477,NULL,101,'2014-07-01 15:41:00',1,1,1),(4478,NULL,101,'2014-07-01 16:45:08',1,1,1),(4479,NULL,101,'2014-07-01 17:09:56',1,1,1),(4480,NULL,102,'2014-07-02 12:02:50',1,1,1),(4481,NULL,101,'2014-07-03 16:04:03',1,1,1),(4482,NULL,101,'2014-07-03 16:04:17',1,1,1),(4483,NULL,101,'2014-07-03 16:04:20',1,1,1),(4484,NULL,101,'2014-07-03 16:04:34',1,1,1),(4485,NULL,101,'2014-07-03 16:21:54',1,1,1),(4486,NULL,101,'2014-07-03 16:22:01',1,1,1),(4487,NULL,101,'2014-07-03 16:22:40',1,1,1),(4488,NULL,101,'2014-07-03 18:38:59',1,1,1),(4489,NULL,101,'2014-07-03 18:39:04',1,1,1),(4490,NULL,101,'2014-07-03 18:39:12',1,1,1),(4491,NULL,101,'2014-07-03 18:39:29',1,1,1),(4492,NULL,101,'2014-07-03 18:39:39',1,1,1),(4493,NULL,101,'2014-07-03 18:45:00',1,1,1),(4494,NULL,101,'2014-07-03 18:45:45',1,1,1),(4495,NULL,101,'2014-07-03 18:48:49',1,1,1),(4496,NULL,101,'2014-07-03 18:50:49',1,1,1),(4497,NULL,101,'2014-07-03 20:14:56',1,1,1),(4498,NULL,101,'2014-07-03 20:18:34',1,1,1),(4499,NULL,101,'2014-07-03 20:24:54',1,1,1),(4500,NULL,101,'2014-07-03 20:30:33',1,1,1),(4501,NULL,101,'2014-07-03 20:34:50',1,1,1),(4502,NULL,101,'2014-07-04 08:32:14',1,1,1),(4503,NULL,101,'2014-07-04 08:33:55',1,1,1),(4504,NULL,101,'2014-07-04 08:36:13',1,1,1),(4505,NULL,101,'2014-07-04 08:38:40',1,1,1),(4506,NULL,101,'2014-07-04 08:39:43',1,1,1),(4507,NULL,101,'2014-07-04 08:41:11',1,1,1),(4508,NULL,101,'2014-07-04 09:15:44',1,1,1),(4509,NULL,101,'2014-07-04 09:15:44',1,1,1),(4510,NULL,101,'2014-07-04 09:15:44',1,1,1),(4511,NULL,101,'2014-07-04 09:15:44',1,1,1),(4512,NULL,101,'2014-07-04 09:15:44',1,1,1),(4513,NULL,101,'2014-07-04 09:15:44',1,1,1),(4514,NULL,101,'2014-07-04 09:15:44',1,1,1),(4515,NULL,101,'2014-07-04 09:31:54',1,1,1),(4516,NULL,101,'2014-07-04 10:17:27',1,1,1),(4517,NULL,101,'2014-07-04 10:18:32',1,1,1),(4518,NULL,101,'2014-07-04 10:38:46',1,1,1),(4519,NULL,101,'2014-07-04 10:47:28',1,1,1),(4520,NULL,101,'2014-07-04 10:47:28',1,1,1),(4521,NULL,101,'2014-07-04 10:47:28',1,1,1),(4522,NULL,101,'2014-07-04 10:47:28',1,1,1),(4523,NULL,101,'2014-07-04 10:47:28',1,1,1),(4524,NULL,101,'2014-07-04 10:47:28',1,1,1),(4525,NULL,101,'2014-07-04 10:47:28',1,1,1),(4526,NULL,101,'2014-07-04 10:50:24',1,1,1),(4527,NULL,101,'2014-07-04 10:50:24',1,1,1),(4528,NULL,101,'2014-07-04 10:50:24',1,1,1),(4529,NULL,101,'2014-07-04 10:50:24',1,1,1),(4530,NULL,101,'2014-07-04 10:50:24',1,1,1),(4531,NULL,101,'2014-07-04 10:50:24',1,1,1),(4532,NULL,101,'2014-07-04 10:50:24',1,1,1),(4533,NULL,101,'2014-07-04 10:50:52',1,1,1),(4534,NULL,101,'2014-07-04 10:50:52',1,1,1),(4535,NULL,101,'2014-07-04 10:50:52',1,1,1),(4536,NULL,101,'2014-07-04 10:50:52',1,1,1),(4537,NULL,101,'2014-07-04 10:50:52',1,1,1),(4538,NULL,101,'2014-07-04 10:50:52',1,1,1),(4539,NULL,101,'2014-07-04 10:50:52',1,1,1),(4540,NULL,101,'2014-07-04 11:52:39',1,1,1),(4541,NULL,101,'2014-07-04 11:52:39',1,1,1),(4542,NULL,101,'2014-07-04 11:52:39',1,1,1),(4543,NULL,101,'2014-07-04 11:52:39',1,1,1),(4544,NULL,101,'2014-07-04 11:52:39',1,1,1),(4545,NULL,101,'2014-07-04 11:52:39',1,1,1),(4546,NULL,101,'2014-07-04 11:52:39',1,1,1),(4547,NULL,101,'2014-07-04 11:53:29',1,1,1),(4548,NULL,101,'2014-07-04 11:53:29',1,1,1),(4549,NULL,101,'2014-07-04 11:53:29',1,1,1),(4550,NULL,101,'2014-07-04 11:53:29',1,1,1),(4551,NULL,101,'2014-07-04 11:53:29',1,1,1),(4552,NULL,101,'2014-07-04 11:53:29',1,1,1),(4553,NULL,101,'2014-07-04 11:53:29',1,1,1),(4554,NULL,101,'2014-07-04 11:56:21',1,1,1),(4555,NULL,101,'2014-07-04 11:56:21',1,1,1),(4556,NULL,101,'2014-07-04 11:56:21',1,1,1),(4557,NULL,101,'2014-07-04 11:56:21',1,1,1),(4558,NULL,101,'2014-07-04 11:56:21',1,1,1),(4559,NULL,101,'2014-07-04 11:56:21',1,1,1),(4560,NULL,101,'2014-07-04 11:56:21',1,1,1),(4561,NULL,101,'2014-07-04 11:57:17',1,1,1),(4562,NULL,101,'2014-07-04 11:57:17',1,1,1),(4563,NULL,101,'2014-07-04 11:57:17',1,1,1),(4564,NULL,101,'2014-07-04 11:57:17',1,1,1),(4565,NULL,101,'2014-07-04 11:57:17',1,1,1),(4566,NULL,101,'2014-07-04 11:57:17',1,1,1),(4567,NULL,101,'2014-07-04 11:57:17',1,1,1),(4568,NULL,101,'2014-07-04 12:00:01',1,1,1),(4569,NULL,101,'2014-07-04 12:00:01',1,1,1),(4570,NULL,101,'2014-07-04 12:00:01',1,1,1),(4571,NULL,101,'2014-07-04 12:00:01',1,1,1),(4572,NULL,101,'2014-07-04 12:00:01',1,1,1),(4573,NULL,101,'2014-07-04 12:00:01',1,1,1),(4574,NULL,101,'2014-07-04 12:00:01',1,1,1),(4575,NULL,101,'2014-07-04 12:20:50',1,1,1),(4576,NULL,101,'2014-07-04 12:24:35',1,1,1),(4577,NULL,101,'2014-07-04 12:24:35',1,1,1),(4578,NULL,101,'2014-07-04 12:24:35',1,1,1),(4579,NULL,101,'2014-07-04 12:24:35',1,1,1),(4580,NULL,101,'2014-07-04 12:24:35',1,1,1),(4581,NULL,101,'2014-07-04 12:24:35',1,1,1),(4582,NULL,101,'2014-07-04 12:24:35',1,1,1),(4583,NULL,101,'2014-07-04 12:52:03',1,1,1),(4584,NULL,101,'2014-07-04 12:52:03',1,1,1),(4585,NULL,101,'2014-07-04 12:52:03',1,1,1),(4586,NULL,101,'2014-07-04 12:52:03',1,1,1),(4587,NULL,101,'2014-07-04 12:52:03',1,1,1),(4588,NULL,101,'2014-07-04 12:52:03',1,1,1),(4589,NULL,101,'2014-07-04 12:52:03',1,1,1),(4590,NULL,101,'2014-07-04 12:52:19',1,1,1),(4591,NULL,101,'2014-07-04 12:52:19',1,1,1),(4592,NULL,101,'2014-07-04 12:52:19',1,1,1),(4593,NULL,101,'2014-07-04 12:52:19',1,1,1),(4594,NULL,101,'2014-07-04 12:52:19',1,1,1),(4595,NULL,101,'2014-07-04 12:52:19',1,1,1),(4596,NULL,101,'2014-07-04 12:52:19',1,1,1),(4597,NULL,101,'2014-07-04 13:30:04',1,1,1),(4598,NULL,101,'2014-07-04 13:30:04',1,1,1),(4599,NULL,101,'2014-07-04 13:30:04',1,1,1),(4600,NULL,101,'2014-07-04 13:30:04',1,1,1),(4601,NULL,101,'2014-07-04 13:30:04',1,1,1),(4602,NULL,101,'2014-07-04 13:30:04',1,1,1),(4603,NULL,101,'2014-07-04 13:30:04',1,1,1),(4604,NULL,101,'2014-07-04 14:22:22',1,1,1),(4605,NULL,101,'2014-07-04 14:23:25',1,1,1),(4606,NULL,101,'2014-07-04 14:34:54',1,1,1),(4607,NULL,103,'2014-07-04 14:36:05',1,1,1),(4608,NULL,103,'2014-07-04 14:40:04',1,1,1),(4609,NULL,101,'2014-07-04 14:40:34',1,1,1),(4610,NULL,101,'2014-07-04 14:52:23',1,1,1),(4611,NULL,102,'2014-07-04 15:18:29',1,1,1),(4612,NULL,102,'2014-07-04 15:49:19',1,1,1),(4613,NULL,102,'2014-07-04 15:51:43',1,1,1),(4614,NULL,102,'2014-07-04 15:51:43',1,1,1),(4615,NULL,102,'2014-07-04 15:51:43',1,1,1),(4616,NULL,102,'2014-07-04 15:51:43',1,1,1),(4617,NULL,102,'2014-07-04 15:51:43',1,1,1),(4618,NULL,102,'2014-07-04 15:51:43',1,1,1),(4619,NULL,102,'2014-07-04 15:51:43',1,1,1),(4620,NULL,102,'2014-07-04 19:53:14',1,1,1),(4621,NULL,102,'2014-07-04 19:53:14',1,1,1),(4622,NULL,102,'2014-07-04 19:53:14',1,1,1),(4623,NULL,102,'2014-07-04 19:53:14',1,1,1),(4624,NULL,102,'2014-07-04 19:53:14',1,1,1),(4625,NULL,102,'2014-07-04 19:53:14',1,1,1),(4626,NULL,102,'2014-07-04 19:53:14',1,1,1),(4627,1,85,'2014-07-04 20:01:57',4,8,11),(4628,1,86,'2014-07-04 20:01:59',4,8,11),(4629,1,87,'2014-07-04 20:02:01',4,8,10),(4630,1,85,'2014-07-04 20:02:03',4,8,8),(4631,1,86,'2014-07-04 20:02:05',4,8,8),(4632,1,87,'2014-07-04 20:02:16',4,8,8),(4633,1,85,'2014-07-04 20:04:03',4,10,10),(4634,1,86,'2014-07-04 20:04:05',4,10,10),(4635,1,87,'2014-07-04 20:07:22',4,11,11),(4636,1,85,'2014-07-04 20:08:23',4,11,11),(4637,1,86,'2014-07-04 20:08:23',4,11,11),(4638,1,85,'2014-07-04 21:21:37',4,11,11),(4639,1,86,'2014-07-04 21:21:39',4,11,11),(4640,1,87,'2014-07-04 21:21:42',4,11,11),(4641,1,85,'2014-07-04 21:21:46',4,11,11),(4642,1,86,'2014-07-04 21:21:47',4,11,11),(4643,1,87,'2014-07-04 21:21:49',4,11,11),(4644,1,85,'2014-07-04 21:21:54',4,11,11),(4645,1,86,'2014-07-04 21:21:56',4,11,11),(4646,1,87,'2014-07-04 21:21:58',4,11,11),(4647,1,85,'2014-07-04 21:22:04',4,11,11),(4648,1,86,'2014-07-04 21:22:06',4,11,11),(4649,1,87,'2014-07-04 21:22:09',4,11,11),(4650,1,87,'2014-07-04 21:22:15',4,11,11),(4651,1,86,'2014-07-04 21:22:17',4,11,11),(4652,1,85,'2014-07-04 21:22:19',4,11,11),(4653,NULL,102,'2014-07-04 21:22:23',1,1,1),(4654,NULL,103,'2014-07-04 21:22:26',1,1,1),(4655,1,86,'2014-07-04 21:22:35',4,11,11),(4656,1,87,'2014-07-04 21:22:38',4,11,11),(4657,1,85,'2014-07-04 21:23:36',4,8,8),(4658,1,86,'2014-07-04 21:23:47',4,8,8),(4659,1,85,'2014-07-04 21:24:02',4,10,10),(4660,1,86,'2014-07-04 21:24:04',4,10,10),(4661,1,85,'2014-07-04 21:25:49',4,11,11),(4662,1,86,'2014-07-04 21:25:49',4,11,11),(4663,1,85,'2014-07-04 21:28:42',4,11,11),(4664,1,86,'2014-07-04 21:28:42',4,11,11),(4665,1,85,'2014-07-05 14:52:27',4,11,11),(4666,NULL,103,'2014-07-07 13:55:42',1,1,1),(4667,NULL,104,'2014-07-07 14:20:20',1,1,1),(4668,NULL,104,'2014-07-07 15:05:07',1,1,1),(4669,NULL,104,'2014-07-07 15:05:07',1,1,1),(4670,NULL,104,'2014-07-07 15:05:07',1,1,1),(4671,NULL,104,'2014-07-07 15:05:07',1,1,1),(4672,NULL,104,'2014-07-07 15:05:07',1,1,1),(4673,NULL,104,'2014-07-07 15:05:07',1,1,1),(4674,NULL,104,'2014-07-07 15:05:07',1,1,1),(4675,NULL,104,'2014-07-07 15:06:48',1,1,1),(4676,NULL,104,'2014-07-07 15:06:48',1,1,1),(4677,NULL,104,'2014-07-07 15:06:48',1,1,1),(4678,NULL,104,'2014-07-07 15:06:48',1,1,1),(4679,NULL,104,'2014-07-07 15:06:48',1,1,1),(4680,NULL,104,'2014-07-07 15:06:48',1,1,1),(4681,NULL,104,'2014-07-07 15:06:48',1,1,1),(4682,NULL,104,'2014-07-07 15:07:22',1,1,1),(4683,NULL,104,'2014-07-07 15:07:42',1,1,1),(4684,NULL,104,'2014-07-07 15:23:29',1,2,2),(4685,NULL,103,'2014-07-07 15:27:12',1,1,1),(4686,NULL,103,'2014-07-07 15:27:12',1,1,1),(4687,NULL,103,'2014-07-07 15:27:12',1,1,1),(4688,NULL,103,'2014-07-07 15:27:12',1,1,1),(4689,NULL,103,'2014-07-07 15:27:12',1,1,1),(4690,NULL,103,'2014-07-07 15:27:12',1,1,1),(4691,NULL,103,'2014-07-07 15:27:12',1,1,1),(4692,1,103,'2014-07-07 15:41:14',1,2,2),(4693,NULL,103,'2014-07-07 15:41:14',1,1,1),(4694,1,103,'2014-07-07 15:41:16',1,2,2),(4695,NULL,103,'2014-07-07 15:41:16',1,1,1),(4696,1,103,'2014-07-07 15:41:26',1,2,2),(4697,NULL,103,'2014-07-07 15:41:26',1,1,1),(4698,1,103,'2014-07-07 15:43:23',1,2,2),(4699,1,103,'2014-07-07 15:43:27',1,2,2),(4700,1,103,'2014-07-07 15:44:23',2,4,4),(4701,1,103,'2014-07-07 15:44:29',2,4,4),(4702,NULL,105,'2014-07-07 15:50:50',1,1,1),(4703,1,105,'2014-07-07 15:50:54',1,2,2),(4704,NULL,106,'2014-07-07 15:51:40',1,1,1),(4705,1,106,'2014-07-07 15:51:43',1,2,2),(4706,1,106,'2014-07-07 15:52:22',1,2,2),(4707,NULL,107,'2014-07-07 15:53:39',1,1,1),(4708,NULL,108,'2014-07-07 15:53:42',1,1,1),(4709,NULL,109,'2014-07-07 15:58:21',1,1,1),(4710,NULL,109,'2014-07-07 15:58:45',1,1,1),(4711,NULL,109,'2014-07-07 16:15:43',1,1,1),(4712,NULL,109,'2014-07-07 16:16:34',1,1,1),(4713,NULL,109,'2014-07-07 16:16:34',1,1,1),(4714,NULL,109,'2014-07-07 16:16:34',1,1,1),(4715,NULL,109,'2014-07-07 16:16:34',1,1,1),(4716,NULL,109,'2014-07-07 16:16:34',1,1,1),(4717,NULL,109,'2014-07-07 16:16:34',1,1,1),(4718,NULL,109,'2014-07-07 16:16:34',1,1,1),(4719,NULL,110,'2014-07-07 16:51:39',1,1,1),(4720,NULL,110,'2014-07-07 16:51:58',1,1,1),(4721,NULL,110,'2014-07-07 16:53:19',1,1,1),(4722,NULL,110,'2014-07-07 16:54:19',1,1,1),(4723,NULL,110,'2014-07-07 16:54:19',1,1,1),(4724,NULL,110,'2014-07-07 16:54:19',1,1,1),(4725,NULL,110,'2014-07-07 16:54:19',1,1,1),(4726,NULL,110,'2014-07-07 16:54:19',1,1,1),(4727,NULL,110,'2014-07-07 16:54:19',1,1,1),(4728,NULL,110,'2014-07-07 16:54:19',1,1,1),(4729,NULL,110,'2014-07-07 16:54:25',1,1,1),(4730,NULL,110,'2014-07-07 16:54:25',1,1,1),(4731,NULL,110,'2014-07-07 16:54:25',1,1,1),(4732,NULL,110,'2014-07-07 16:54:25',1,1,1),(4733,NULL,110,'2014-07-07 16:54:25',1,1,1),(4734,NULL,110,'2014-07-07 16:54:25',1,1,1),(4735,NULL,110,'2014-07-07 16:54:25',1,1,1),(4736,NULL,110,'2014-07-07 16:55:23',1,1,1),(4737,1,104,'2014-07-07 16:57:34',2,4,4),(4738,1,104,'2014-07-07 16:57:37',2,4,4),(4739,1,103,'2014-07-07 16:58:00',3,6,6),(4740,1,104,'2014-07-07 16:58:02',3,6,6),(4741,1,103,'2014-07-07 16:59:19',3,7,7),(4742,1,104,'2014-07-07 16:59:19',3,7,7),(4743,1,85,'2014-07-07 17:02:34',3,9,9),(4744,1,86,'2014-07-07 17:02:35',3,8,8),(4745,1,86,'2014-07-07 17:03:14',4,10,10),(4746,1,110,'2014-07-07 17:29:05',1,2,2),(4747,1,109,'2014-07-07 17:29:23',1,2,2),(4748,NULL,111,'2014-07-08 10:04:43',NULL,NULL,NULL),(4749,1,111,'2014-07-08 10:04:43',1,1,1),(4750,NULL,112,'2014-07-08 10:14:28',NULL,NULL,NULL),(4751,1,112,'2014-07-08 10:14:28',1,1,1),(4752,NULL,113,'2014-07-08 10:17:06',NULL,NULL,NULL),(4753,1,113,'2014-07-08 10:17:06',1,1,1),(4754,1,113,'2014-07-08 11:01:49',1,2,2),(4755,NULL,114,'2014-07-08 11:05:03',NULL,NULL,NULL),(4756,1,114,'2014-07-08 11:05:03',1,1,1),(4757,1,114,'2014-07-08 11:05:09',1,2,2),(4758,NULL,115,'2014-07-08 11:11:52',NULL,NULL,NULL),(4759,1,115,'2014-07-08 11:11:52',1,1,1),(4760,NULL,116,'2014-07-08 11:11:54',NULL,NULL,NULL),(4761,1,116,'2014-07-08 11:11:54',1,1,1),(4762,1,86,'2014-07-10 17:01:48',4,11,11),(4763,1,109,'2014-08-20 15:42:37',2,4,4),(4764,1,109,'2014-08-20 15:42:42',2,4,4),(4765,1,109,'2014-08-20 15:42:53',3,6,6),(4766,1,115,'2014-08-25 10:08:06',1,1,1),(4767,1,115,'2014-08-25 10:08:06',1,1,1),(4768,1,115,'2014-08-25 10:08:06',1,1,1),(4769,1,115,'2014-08-25 10:08:06',1,1,1),(4770,1,115,'2014-08-25 10:08:06',1,1,1),(4771,1,115,'2014-08-25 10:08:06',1,1,1),(4772,1,115,'2014-08-25 10:08:06',1,1,1),(4773,1,115,'2014-08-25 10:09:01',1,1,1),(4774,1,115,'2014-08-25 10:09:01',1,1,1),(4775,1,115,'2014-08-25 10:09:01',1,1,1),(4776,1,115,'2014-08-25 10:09:01',1,1,1),(4777,1,115,'2014-08-25 10:09:01',1,1,1),(4778,1,115,'2014-08-25 10:09:01',1,1,1),(4779,1,115,'2014-08-25 10:09:01',1,1,1),(4780,1,115,'2014-08-25 10:09:26',1,1,1),(4781,1,115,'2014-08-25 10:09:43',1,1,1),(4782,1,115,'2014-08-25 10:13:45',1,2,2),(4783,1,115,'2014-08-25 10:14:18',2,4,4),(4784,1,115,'2014-08-25 10:14:22',2,4,4),(4785,1,115,'2014-08-25 10:14:29',3,6,6),(4786,1,115,'2014-08-25 10:15:09',3,7,7),(4787,1,109,'2014-08-25 10:23:32',3,8,8),(4788,1,85,'2014-08-25 10:23:39',3,9,9),(4789,1,86,'2014-08-25 10:23:39',3,8,8),(4790,1,103,'2014-08-25 10:23:46',3,9,9),(4791,1,104,'2014-08-25 10:23:46',3,8,8),(4792,1,87,'2014-08-25 10:23:51',3,8,8),(4793,1,86,'2014-08-25 10:24:30',4,10,10),(4794,1,104,'2014-08-25 10:24:31',4,10,10),(4795,1,86,'2014-08-25 11:05:55',4,11,11),(4796,1,104,'2014-08-25 11:05:55',4,11,11),(4797,NULL,117,'2014-08-29 17:44:30',NULL,NULL,NULL),(4798,1,117,'2014-08-29 17:44:30',1,1,1),(4799,NULL,118,'2014-08-29 18:22:35',NULL,NULL,NULL),(4800,1,118,'2014-08-29 18:22:35',1,1,1),(4801,NULL,119,'2014-08-29 18:50:07',NULL,NULL,NULL),(4802,1,119,'2014-08-29 18:50:07',1,1,1),(4803,1,116,'2014-09-01 21:36:49',1,1,1),(4804,1,87,'2014-09-02 14:50:50',4,10,10),(4805,1,109,'2014-09-02 15:25:31',4,10,10),(4806,1,116,'2014-09-11 14:54:28',1,1,1),(4807,1,116,'2014-09-11 14:55:20',1,1,1),(4808,1,116,'2014-09-11 14:55:20',1,1,1),(4809,1,116,'2014-09-11 14:55:20',1,1,1),(4810,1,116,'2014-09-11 14:55:20',1,1,1),(4811,1,116,'2014-09-11 14:55:20',1,1,1),(4812,1,116,'2014-09-11 14:55:20',1,1,1),(4813,1,116,'2014-09-11 14:55:20',1,1,1),(4814,1,116,'2014-09-11 14:56:02',1,1,1),(4815,1,116,'2014-09-11 14:56:02',1,1,1),(4816,1,116,'2014-09-11 14:56:02',1,1,1),(4817,1,116,'2014-09-11 14:56:02',1,1,1),(4818,1,116,'2014-09-11 14:56:02',1,1,1),(4819,1,116,'2014-09-11 14:56:02',1,1,1),(4820,1,116,'2014-09-11 14:56:02',1,1,1),(4821,1,116,'2014-09-11 14:56:11',1,1,1),(4822,1,116,'2014-09-11 14:56:43',1,2,2),(4823,1,117,'2014-09-11 14:59:57',1,1,1),(4824,1,86,'2014-09-16 14:46:14',4,11,11),(4825,1,85,'2014-09-16 15:59:14',4,11,11),(4826,1,86,'2014-09-16 15:59:14',4,11,11),(4827,1,109,'2014-09-16 16:23:36',3,8,8),(4828,1,103,'2014-09-16 16:23:45',3,9,9),(4829,1,104,'2014-09-16 16:23:45',3,8,8),(4830,1,103,'2014-09-16 16:24:01',3,9,9),(4831,1,104,'2014-09-16 16:24:01',3,8,8),(4832,1,87,'2014-09-16 16:24:10',3,8,8),(4833,1,87,'2014-09-16 16:24:24',4,10,10),(4834,1,104,'2014-09-16 16:24:26',4,10,10),(4835,1,109,'2014-09-16 16:25:36',4,10,10),(4836,1,87,'2014-09-17 12:07:39',4,11,11),(4837,1,87,'2014-09-17 12:07:39',4,11,11),(4838,1,104,'2014-09-17 12:07:39',4,11,11),(4839,1,109,'2014-09-17 12:07:39',4,11,11),(4840,1,85,'2014-09-17 13:10:03',4,11,11),(4841,1,86,'2014-09-17 13:10:03',4,11,11),(4842,1,109,'2014-09-18 09:22:55',3,8,8),(4843,1,103,'2014-09-18 09:22:59',3,9,9),(4844,1,104,'2014-09-18 09:22:59',3,8,8),(4845,1,85,'2014-09-18 09:42:49',4,11,11),(4846,1,86,'2014-09-18 09:42:49',4,11,11),(4847,1,104,'2014-09-18 10:29:05',4,10,10),(4848,1,109,'2014-09-18 10:29:49',4,10,10),(4849,1,85,'2014-09-19 08:49:45',4,11,11),(4850,1,86,'2014-09-19 08:50:22',4,11,11),(4851,1,87,'2014-09-19 08:52:05',4,11,11),(4852,1,103,'2014-09-19 08:52:07',3,9,9),(4853,1,104,'2014-09-19 08:52:08',4,10,10),(4854,1,109,'2014-09-19 08:52:09',4,10,10),(4855,1,110,'2014-09-19 08:52:10',1,2,2),(4856,1,113,'2014-09-19 08:52:11',1,2,2),(4857,1,114,'2014-09-19 08:52:12',1,2,2),(4858,1,115,'2014-09-19 08:52:13',3,7,7),(4859,1,116,'2014-09-19 08:52:14',1,2,2),(4860,1,117,'2014-09-19 08:52:15',1,1,1),(4861,1,118,'2014-09-19 08:52:16',1,1,1),(4862,1,119,'2014-09-19 08:52:18',1,1,1),(4863,1,85,'2014-09-19 08:52:59',4,11,11),(4864,1,86,'2014-09-19 08:53:04',4,11,11),(4865,1,85,'2014-09-19 08:53:10',4,11,11),(4866,1,86,'2014-09-19 08:53:13',4,11,11),(4867,1,87,'2014-09-19 08:53:15',4,11,11),(4868,1,103,'2014-09-19 08:53:17',3,9,9),(4869,1,104,'2014-09-19 08:53:20',4,10,10),(4870,1,109,'2014-09-19 08:53:22',4,10,10),(4871,1,110,'2014-09-19 08:53:24',1,2,2),(4872,1,113,'2014-09-19 08:53:26',1,2,2),(4873,1,114,'2014-09-19 08:53:28',1,2,2),(4874,1,115,'2014-09-19 08:53:30',3,7,7),(4875,1,116,'2014-09-19 08:53:33',1,2,2),(4876,1,117,'2014-09-19 08:53:35',1,1,1),(4877,1,118,'2014-09-19 08:53:37',1,1,1),(4878,1,119,'2014-09-19 08:53:46',1,1,1),(4879,1,85,'2014-09-19 08:53:51',4,11,11),(4880,1,86,'2014-09-19 08:53:57',4,11,11),(4881,1,87,'2014-09-19 08:53:59',4,11,11),(4882,1,103,'2014-09-19 08:54:00',3,9,9),(4883,1,104,'2014-09-19 08:54:02',4,10,10),(4884,1,109,'2014-09-19 08:54:03',4,10,10),(4885,1,110,'2014-09-19 08:54:05',1,2,2),(4886,1,113,'2014-09-19 08:54:06',1,2,2),(4887,1,114,'2014-09-19 08:54:08',1,2,2),(4888,1,115,'2014-09-19 08:54:09',3,7,7),(4889,1,116,'2014-09-19 08:54:10',1,2,2),(4890,1,117,'2014-09-19 08:54:12',1,1,1),(4891,1,118,'2014-09-19 08:54:13',1,1,1),(4892,1,119,'2014-09-19 08:54:15',1,1,1),(4893,1,85,'2014-09-19 08:54:48',4,11,11),(4894,1,86,'2014-09-19 08:54:51',4,11,11),(4895,1,87,'2014-09-19 08:54:54',4,11,11),(4896,1,103,'2014-09-19 08:54:56',3,9,9),(4897,1,104,'2014-09-19 08:54:58',4,10,10),(4898,1,109,'2014-09-19 08:55:00',4,10,10),(4899,1,110,'2014-09-19 08:55:02',1,2,2),(4900,1,113,'2014-09-19 08:55:04',1,2,2),(4901,1,114,'2014-09-19 08:55:05',1,2,2),(4902,1,114,'2014-09-19 08:55:09',1,2,2),(4903,1,115,'2014-09-19 08:55:12',3,7,7),(4904,1,116,'2014-09-19 08:55:15',1,2,2),(4905,1,117,'2014-09-19 08:55:16',1,1,1),(4906,1,118,'2014-09-19 08:55:18',1,1,1),(4907,1,119,'2014-09-19 08:55:22',1,1,1),(4908,1,85,'2014-09-19 08:55:45',4,11,11),(4909,1,86,'2014-09-19 08:55:52',4,11,11),(4910,1,87,'2014-09-19 08:55:58',4,11,11),(4911,1,103,'2014-09-19 08:56:01',3,9,9),(4912,1,104,'2014-09-19 08:56:06',4,10,10),(4913,1,109,'2014-09-19 08:56:10',4,10,10),(4914,1,110,'2014-09-19 08:56:13',1,2,2),(4915,1,113,'2014-09-19 08:56:16',1,2,2),(4916,1,114,'2014-09-19 08:56:19',1,2,2),(4917,1,115,'2014-09-19 08:56:23',3,7,7),(4918,1,116,'2014-09-19 08:56:29',1,2,2),(4919,1,117,'2014-09-19 08:56:31',1,1,1),(4920,1,118,'2014-09-19 08:56:32',1,1,1),(4921,1,119,'2014-09-19 08:57:25',1,1,1),(4922,1,85,'2014-09-19 08:57:39',4,11,11),(4923,NULL,120,'2014-09-19 09:05:17',NULL,NULL,NULL),(4924,1,120,'2014-09-19 09:05:17',1,1,1),(4925,NULL,121,'2014-09-19 09:06:21',NULL,NULL,NULL),(4926,1,121,'2014-09-19 09:06:21',1,1,1),(4927,NULL,122,'2014-09-19 09:06:25',NULL,NULL,NULL),(4928,1,122,'2014-09-19 09:06:25',1,1,1),(4929,NULL,123,'2014-09-19 09:07:54',NULL,NULL,NULL),(4930,1,123,'2014-09-19 09:07:54',1,1,1),(4931,NULL,124,'2014-09-19 09:08:00',NULL,NULL,NULL),(4932,1,124,'2014-09-19 09:08:01',1,1,1),(4933,NULL,125,'2014-09-19 09:51:03',NULL,NULL,NULL),(4934,1,125,'2014-09-19 09:51:04',1,1,1),(4935,NULL,126,'2014-09-19 09:52:39',NULL,NULL,NULL),(4936,1,126,'2014-09-19 09:52:39',1,1,1),(4937,1,85,'2014-09-19 09:57:30',4,11,11),(4938,1,86,'2014-09-19 09:57:32',4,11,11),(4939,1,87,'2014-09-19 09:57:34',4,11,11),(4940,1,103,'2014-09-19 09:57:36',3,9,9),(4941,1,104,'2014-09-19 09:57:38',4,10,10),(4942,1,109,'2014-09-19 09:57:40',4,10,10),(4943,1,110,'2014-09-19 09:57:42',1,2,2),(4944,1,113,'2014-09-19 09:57:44',1,2,2),(4945,1,114,'2014-09-19 09:57:46',1,2,2),(4946,1,115,'2014-09-19 09:57:48',3,7,7),(4947,1,116,'2014-09-19 09:57:50',1,2,2),(4948,1,117,'2014-09-19 09:57:52',1,1,1),(4949,NULL,127,'2014-09-19 10:20:36',NULL,NULL,NULL),(4950,1,127,'2014-09-19 10:20:36',1,1,1),(4951,NULL,128,'2014-09-19 10:26:27',NULL,NULL,NULL),(4952,1,128,'2014-09-19 10:26:27',1,1,1),(4953,NULL,129,'2014-09-19 10:27:27',NULL,NULL,NULL),(4954,1,129,'2014-09-19 10:27:27',1,1,1),(4955,NULL,130,'2014-09-19 10:28:43',NULL,NULL,NULL),(4956,1,130,'2014-09-19 10:28:43',1,1,1),(4957,NULL,131,'2014-09-19 10:28:47',NULL,NULL,NULL),(4958,1,131,'2014-09-19 10:28:47',1,1,1),(4959,NULL,132,'2014-09-19 10:28:51',NULL,NULL,NULL),(4960,1,132,'2014-09-19 10:28:51',1,1,1),(4961,NULL,133,'2014-09-19 10:44:41',NULL,NULL,NULL),(4962,1,133,'2014-09-19 10:44:41',1,1,1),(4963,NULL,134,'2014-09-19 10:44:49',NULL,NULL,NULL),(4964,1,134,'2014-09-19 10:44:49',1,1,1),(4965,NULL,135,'2014-09-19 12:04:49',NULL,NULL,NULL),(4966,1,135,'2014-09-19 12:04:49',1,1,1),(4967,NULL,136,'2014-09-19 12:04:50',NULL,NULL,NULL),(4968,1,136,'2014-09-19 12:04:50',1,1,1),(4969,NULL,137,'2014-09-19 13:18:57',NULL,NULL,NULL),(4970,1,137,'2014-09-19 13:18:57',1,1,1),(4971,NULL,138,'2014-09-19 13:53:58',NULL,NULL,NULL),(4972,1,138,'2014-09-19 13:53:58',1,1,1),(4973,NULL,139,'2014-09-19 13:56:17',NULL,NULL,NULL),(4974,1,139,'2014-09-19 13:56:17',1,1,1),(4975,NULL,140,'2014-09-19 13:59:09',NULL,NULL,NULL),(4976,1,140,'2014-09-19 13:59:09',1,1,1),(4977,NULL,141,'2014-09-19 13:59:17',NULL,NULL,NULL),(4978,1,141,'2014-09-19 13:59:17',1,1,1),(4979,NULL,142,'2014-09-19 14:00:55',NULL,NULL,NULL),(4980,1,142,'2014-09-19 14:00:55',1,1,1),(4981,NULL,143,'2014-09-19 14:00:57',NULL,NULL,NULL),(4982,1,143,'2014-09-19 14:00:57',1,1,1),(4983,NULL,144,'2014-09-19 14:01:06',NULL,NULL,NULL),(4984,1,144,'2014-09-19 14:01:07',1,1,1),(4985,NULL,145,'2014-09-19 14:18:58',NULL,NULL,NULL),(4986,1,145,'2014-09-19 14:18:58',1,1,1),(4987,NULL,146,'2014-09-19 14:41:13',NULL,NULL,NULL),(4988,1,146,'2014-09-19 14:41:13',1,1,1),(4989,NULL,147,'2014-09-19 14:43:33',NULL,NULL,NULL),(4990,1,147,'2014-09-19 14:43:33',1,1,1),(4991,NULL,148,'2014-09-19 14:43:35',NULL,NULL,NULL),(4992,1,148,'2014-09-19 14:43:35',1,1,1),(4993,NULL,149,'2014-09-19 14:55:47',NULL,NULL,NULL),(4994,1,149,'2014-09-19 14:55:47',1,1,1),(4995,NULL,150,'2014-09-19 14:57:00',NULL,NULL,NULL),(4996,1,150,'2014-09-19 14:57:00',1,1,1),(4997,NULL,151,'2014-09-19 14:57:02',NULL,NULL,NULL),(4998,1,151,'2014-09-19 14:57:02',1,1,1),(4999,NULL,152,'2014-09-19 14:57:07',NULL,NULL,NULL),(5000,1,152,'2014-09-19 14:57:07',1,1,1),(5001,NULL,153,'2014-09-19 15:06:21',NULL,NULL,NULL),(5002,1,153,'2014-09-19 15:06:21',1,1,1),(5003,NULL,154,'2014-09-19 15:06:26',NULL,NULL,NULL),(5004,1,154,'2014-09-19 15:06:26',1,1,1),(5005,NULL,155,'2014-09-19 15:06:43',NULL,NULL,NULL),(5006,1,155,'2014-09-19 15:06:44',1,1,1),(5007,NULL,156,'2014-09-19 15:08:16',NULL,NULL,NULL),(5008,1,156,'2014-09-19 15:08:16',1,1,1),(5009,1,117,'2014-09-19 16:42:06',1,1,1),(5010,1,117,'2014-09-19 16:42:58',1,1,1),(5011,1,117,'2014-09-19 16:42:58',1,1,1),(5012,1,117,'2014-09-19 16:42:58',1,1,1),(5013,1,117,'2014-09-19 16:42:58',1,1,1),(5014,1,117,'2014-09-19 16:42:58',1,1,1),(5015,1,117,'2014-09-19 16:42:58',1,1,1),(5016,1,117,'2014-09-19 16:42:58',1,1,1),(5017,1,117,'2014-09-19 16:43:43',1,1,1),(5018,1,117,'2014-09-19 16:43:43',1,1,1),(5019,1,117,'2014-09-19 16:43:43',1,1,1),(5020,1,117,'2014-09-19 16:43:43',1,1,1),(5021,1,117,'2014-09-19 16:43:43',1,1,1),(5022,1,117,'2014-09-19 16:43:43',1,1,1),(5023,1,117,'2014-09-19 16:43:43',1,1,1),(5024,1,117,'2014-09-19 16:43:54',1,1,1),(5025,1,117,'2014-09-19 16:43:54',1,1,1),(5026,1,117,'2014-09-19 16:43:54',1,1,1),(5027,1,117,'2014-09-19 16:43:54',1,1,1),(5028,1,117,'2014-09-19 16:43:54',1,1,1),(5029,1,117,'2014-09-19 16:43:54',1,1,1),(5030,1,117,'2014-09-19 16:43:54',1,1,1),(5031,1,110,'2014-09-19 18:09:36',1,2,2),(5032,1,113,'2014-09-19 18:09:41',1,2,2),(5033,1,110,'2014-09-19 18:09:50',1,2,2),(5034,1,113,'2014-09-19 18:09:57',1,2,2),(5035,1,114,'2014-09-19 18:21:39',1,2,2),(5036,1,114,'2014-09-19 18:21:46',1,2,2),(5037,1,110,'2014-09-19 18:48:51',2,4,4),(5038,1,113,'2014-09-19 18:49:02',2,4,4),(5039,1,110,'2014-09-19 19:08:13',3,6,6),(5040,1,113,'2014-09-19 19:08:14',3,6,6),(5041,1,110,'2014-09-19 19:10:06',3,7,7),(5042,1,113,'2014-09-19 19:10:06',3,7,7),(5043,1,110,'2014-09-19 19:10:16',3,8,8),(5044,1,113,'2014-09-19 19:10:17',3,8,8),(5045,1,85,'2014-09-19 20:06:43',4,15,16),(5046,1,86,'2014-09-19 20:06:43',4,15,16),(5047,NULL,157,'2014-09-22 08:35:53',NULL,NULL,NULL),(5048,1,157,'2014-09-22 08:35:54',1,1,1),(5049,1,85,'2014-09-22 11:22:50',4,15,16),(5050,1,85,'2014-09-22 12:01:39',4,15,16),(5051,1,85,'2014-09-22 12:01:39',4,15,16),(5052,1,85,'2014-09-22 12:01:39',4,15,16),(5053,1,85,'2014-09-22 12:01:39',4,15,16),(5054,1,85,'2014-09-22 12:01:39',4,15,16),(5055,1,85,'2014-09-22 12:01:39',4,15,16),(5056,1,85,'2014-09-22 12:01:39',4,15,16),(5057,1,85,'2014-09-22 12:02:24',4,15,16),(5058,1,85,'2014-09-22 12:02:24',4,15,16),(5059,1,85,'2014-09-22 12:02:24',4,15,16),(5060,1,85,'2014-09-22 12:02:24',4,15,16),(5061,1,85,'2014-09-22 12:02:24',4,15,16),(5062,1,85,'2014-09-22 12:02:24',4,15,16),(5063,1,85,'2014-09-22 12:02:24',4,15,16),(5064,1,85,'2014-09-22 12:02:28',4,15,16),(5065,1,85,'2014-09-22 12:02:28',4,15,16),(5066,1,85,'2014-09-22 12:02:28',4,15,16),(5067,1,85,'2014-09-22 12:02:28',4,15,16),(5068,1,85,'2014-09-22 12:02:28',4,15,16),(5069,1,85,'2014-09-22 12:02:28',4,15,16),(5070,1,85,'2014-09-22 12:02:28',4,15,16),(5071,1,85,'2014-09-22 12:02:32',4,15,16),(5072,1,85,'2014-09-22 12:02:32',4,15,16),(5073,1,85,'2014-09-22 12:02:32',4,15,16),(5074,1,85,'2014-09-22 12:02:32',4,15,16),(5075,1,85,'2014-09-22 12:02:32',4,15,16),(5076,1,85,'2014-09-22 12:02:32',4,15,16),(5077,1,85,'2014-09-22 12:02:32',4,15,16),(5078,1,85,'2014-09-22 12:02:35',4,15,16),(5079,1,85,'2014-09-22 12:02:35',4,15,16),(5080,1,85,'2014-09-22 12:02:35',4,15,16),(5081,1,85,'2014-09-22 12:02:35',4,15,16),(5082,1,85,'2014-09-22 12:02:35',4,15,16),(5083,1,85,'2014-09-22 12:02:35',4,15,16),(5084,1,85,'2014-09-22 12:02:35',4,15,16),(5085,1,85,'2014-09-22 12:02:42',4,15,16),(5086,1,85,'2014-09-22 12:02:42',4,15,16),(5087,1,85,'2014-09-22 12:02:42',4,15,16),(5088,1,85,'2014-09-22 12:02:42',4,15,16),(5089,1,85,'2014-09-22 12:02:42',4,15,16),(5090,1,85,'2014-09-22 12:02:42',4,15,16),(5091,1,85,'2014-09-22 12:02:42',4,15,16),(5092,1,85,'2014-09-22 12:02:44',4,15,16),(5093,1,85,'2014-09-22 12:02:44',4,15,16),(5094,1,85,'2014-09-22 12:02:44',4,15,16),(5095,1,85,'2014-09-22 12:02:44',4,15,16),(5096,1,85,'2014-09-22 12:02:44',4,15,16),(5097,1,85,'2014-09-22 12:02:44',4,15,16),(5098,1,85,'2014-09-22 12:02:44',4,15,16),(5099,1,85,'2014-09-22 12:02:51',4,15,16),(5100,1,85,'2014-09-22 12:02:51',4,15,16),(5101,1,85,'2014-09-22 12:02:51',4,15,16),(5102,1,85,'2014-09-22 12:02:51',4,15,16),(5103,1,85,'2014-09-22 12:02:51',4,15,16),(5104,1,85,'2014-09-22 12:02:51',4,15,16),(5105,1,85,'2014-09-22 12:02:51',4,15,16),(5106,1,85,'2014-09-22 12:02:56',4,15,16),(5107,1,85,'2014-09-22 12:02:56',4,15,16),(5108,1,85,'2014-09-22 12:02:56',4,15,16),(5109,1,85,'2014-09-22 12:02:56',4,15,16),(5110,1,85,'2014-09-22 12:02:56',4,15,16),(5111,1,85,'2014-09-22 12:02:56',4,15,16),(5112,1,85,'2014-09-22 12:02:56',4,15,16),(5113,1,85,'2014-09-22 12:03:06',4,15,16),(5114,1,85,'2014-09-22 12:03:06',4,15,16),(5115,1,85,'2014-09-22 12:03:06',4,15,16),(5116,1,85,'2014-09-22 12:03:06',4,15,16),(5117,1,85,'2014-09-22 12:03:06',4,15,16),(5118,1,85,'2014-09-22 12:03:06',4,15,16),(5119,1,85,'2014-09-22 12:03:06',4,15,16),(5120,1,85,'2014-09-22 12:03:20',4,15,16),(5121,1,85,'2014-09-22 12:03:20',4,15,16),(5122,1,85,'2014-09-22 12:03:20',4,15,16),(5123,1,85,'2014-09-22 12:03:20',4,15,16),(5124,1,85,'2014-09-22 12:03:20',4,15,16),(5125,1,85,'2014-09-22 12:03:20',4,15,16),(5126,1,85,'2014-09-22 12:03:20',4,15,16),(5127,1,110,'2014-09-22 17:18:55',3,8,8),(5128,1,110,'2014-09-22 17:18:55',3,8,8),(5129,1,110,'2014-09-22 17:18:55',3,8,8),(5130,1,110,'2014-09-22 17:18:55',3,8,8),(5131,1,110,'2014-09-22 17:18:55',3,8,8),(5132,1,110,'2014-09-22 17:18:55',3,8,8),(5133,1,110,'2014-09-22 17:18:55',3,8,8),(5134,NULL,158,'2014-09-23 20:46:51',NULL,NULL,NULL),(5135,1,158,'2014-09-23 20:46:51',1,1,1),(5136,NULL,159,'2014-09-23 20:47:05',NULL,NULL,NULL),(5137,1,159,'2014-09-23 20:47:05',1,1,1),(5138,NULL,160,'2014-09-23 20:47:11',NULL,NULL,NULL),(5139,1,160,'2014-09-23 20:47:11',1,1,1),(5140,NULL,161,'2014-09-23 20:47:12',NULL,NULL,NULL),(5141,1,161,'2014-09-23 20:47:13',1,1,1),(5142,NULL,162,'2014-09-23 20:47:24',NULL,NULL,NULL),(5143,1,162,'2014-09-23 20:47:24',1,1,1),(5144,NULL,163,'2014-09-23 20:47:25',NULL,NULL,NULL),(5145,1,163,'2014-09-23 20:47:25',1,1,1),(5146,NULL,164,'2014-09-23 20:47:30',NULL,NULL,NULL),(5147,1,164,'2014-09-23 20:47:30',1,1,1),(5148,NULL,165,'2014-09-23 20:47:31',NULL,NULL,NULL),(5149,1,165,'2014-09-23 20:47:32',1,1,1),(5150,NULL,166,'2014-09-23 20:47:35',NULL,NULL,NULL),(5151,1,166,'2014-09-23 20:47:35',1,1,1),(5152,NULL,167,'2014-09-23 20:47:37',NULL,NULL,NULL),(5153,1,167,'2014-09-23 20:47:37',1,1,1),(5154,NULL,168,'2014-09-26 16:46:49',NULL,NULL,NULL),(5155,1,168,'2014-09-26 16:46:50',1,1,1),(5156,NULL,169,'2014-09-26 16:47:01',NULL,NULL,NULL),(5157,1,169,'2014-09-26 16:47:01',1,1,1),(5158,1,169,'2014-09-26 16:47:42',1,1,1),(5159,1,169,'2014-09-26 16:48:43',1,1,1),(5160,1,169,'2014-09-26 16:48:43',1,1,1),(5161,1,169,'2014-09-26 16:48:43',1,1,1),(5162,1,169,'2014-09-26 16:48:43',1,1,1),(5163,1,169,'2014-09-26 16:48:43',1,1,1),(5164,1,169,'2014-09-26 16:48:43',1,1,1),(5165,1,169,'2014-09-26 16:48:43',1,1,1),(5166,1,169,'2014-09-26 16:49:13',1,1,1),(5167,1,169,'2014-09-26 16:49:13',1,1,1),(5168,1,169,'2014-09-26 16:49:13',1,1,1),(5169,1,169,'2014-09-26 16:49:13',1,1,1),(5170,1,169,'2014-09-26 16:49:13',1,1,1),(5171,1,169,'2014-09-26 16:49:13',1,1,1),(5172,1,169,'2014-09-26 16:49:13',1,1,1),(5173,NULL,170,'2014-09-26 16:50:12',NULL,NULL,NULL),(5174,1,170,'2014-09-26 16:50:13',1,1,1),(5175,NULL,171,'2014-09-26 16:50:20',NULL,NULL,NULL),(5176,1,171,'2014-09-26 16:50:21',1,1,1),(5177,1,85,'2014-10-08 11:36:04',5,17,18),(5178,1,85,'2014-10-08 14:08:57',4,15,18),(5179,1,85,'2014-10-08 14:20:10',5,17,18),(5180,1,85,'2014-10-08 15:11:27',5,19,20),(5181,1,85,'2014-10-08 15:32:52',5,18,20),(5182,1,85,'2014-10-09 10:28:49',5,15,16),(5183,1,85,'2014-10-09 10:30:54',5,17,18),(5184,1,85,'2014-10-09 10:31:02',5,19,20),(5185,1,85,'2014-10-09 10:33:44',5,17,20),(5186,1,85,'2014-10-09 10:34:02',5,19,20),(5187,1,85,'2014-10-09 10:39:12',5,17,20),(5188,1,85,'2014-10-09 10:39:24',5,18,19),(5189,1,85,'2014-10-09 10:42:16',5,17,19),(5190,1,85,'2014-10-09 10:43:12',5,18,19),(5191,1,85,'2014-10-09 10:43:42',5,17,19),(5192,1,85,'2014-10-09 10:43:55',5,18,19),(5193,NULL,0,'2014-10-10 18:00:47',NULL,NULL,NULL),(5194,NULL,0,'2014-10-10 18:01:22',NULL,NULL,NULL),(5195,1,85,'2014-10-14 14:33:42',5,20,21),(5196,1,85,'2014-10-16 15:16:40',5,21,22),(5197,1,85,'2014-10-16 15:47:52',5,22,23),(5198,1,114,'2014-10-16 18:53:19',1,1,2),(5199,1,114,'2014-10-16 19:06:04',1,2,2),(5200,NULL,0,'2014-10-27 17:06:44',NULL,NULL,NULL),(5201,NULL,0,'2014-10-29 22:13:12',NULL,NULL,NULL),(5202,NULL,0,'2014-10-29 22:13:16',NULL,NULL,NULL),(5203,NULL,0,'2014-10-29 22:13:29',NULL,NULL,NULL),(5204,NULL,0,'2014-10-29 22:13:29',NULL,NULL,NULL),(5205,NULL,0,'2014-10-29 22:13:30',NULL,NULL,NULL),(5206,NULL,0,'2014-10-29 22:32:01',NULL,NULL,NULL),(5207,NULL,0,'2014-10-29 22:32:48',NULL,NULL,NULL),(5208,NULL,0,'2014-10-29 22:33:44',NULL,NULL,NULL),(5209,NULL,0,'2014-10-29 22:33:46',NULL,NULL,NULL),(5210,NULL,0,'2014-10-29 22:41:17',NULL,NULL,NULL),(5211,NULL,0,'2014-10-29 22:47:52',NULL,NULL,NULL),(5212,NULL,0,'2014-10-29 22:48:50',NULL,NULL,NULL),(5213,NULL,0,'2014-10-29 22:48:50',NULL,NULL,NULL),(5214,1,110,'2014-10-29 23:00:02',4,10,10),(5215,NULL,0,'2014-10-30 14:10:21',NULL,NULL,NULL),(5216,NULL,0,'2014-10-30 23:59:34',NULL,NULL,NULL),(5217,NULL,0,'2014-10-31 00:16:42',NULL,NULL,NULL),(5218,NULL,0,'2015-09-10 10:25:56',NULL,NULL,NULL),(5219,NULL,0,'2015-09-10 10:54:57',NULL,NULL,NULL),(5220,NULL,0,'2015-09-10 10:55:18',NULL,NULL,NULL),(5221,1,191,'2015-09-10 11:07:13',1,2,2),(5222,1,191,'2015-09-10 11:09:34',2,4,4),(5223,1,191,'2015-09-10 11:11:11',3,6,6),(5224,1,110,'2015-09-10 11:26:29',3,9,9),(5225,1,109,'2015-09-10 11:26:47',3,8,8),(5226,1,104,'2015-09-10 12:46:08',3,8,8),(5227,1,104,'2015-09-10 13:13:04',4,10,10),(5228,1,109,'2015-09-10 13:22:37',4,10,10),(5229,1,113,'2015-09-10 13:22:39',4,10,10),(5230,1,85,'2015-09-10 13:45:58',3,9,9),(5231,1,86,'2015-09-10 13:45:58',3,8,8),(5232,1,86,'2015-09-10 13:46:36',4,10,10),(5233,1,86,'2015-09-10 13:47:25',4,11,11),(5234,NULL,0,'2015-09-10 13:49:18',NULL,NULL,NULL),(5235,NULL,0,'2015-09-10 13:49:23',NULL,NULL,NULL),(5236,1,193,'2015-09-10 13:54:42',1,2,2),(5237,1,193,'2015-09-10 13:55:18',2,4,4),(5238,1,104,'2015-09-10 13:58:19',4,11,11),(5239,1,109,'2015-09-10 13:58:19',4,11,11),(5240,1,113,'2015-09-10 13:58:19',4,11,11),(5241,1,114,'2015-09-10 14:32:58',2,4,4),(5242,1,114,'2015-09-10 14:34:31',3,6,6),(5243,1,193,'2015-09-10 14:34:33',3,6,6),(5244,1,191,'2015-09-10 14:34:41',3,7,7),(5245,1,114,'2015-09-10 14:34:41',3,7,7),(5246,1,193,'2015-09-10 14:34:41',3,7,7),(5247,1,191,'2015-09-10 14:36:05',3,9,9),(5248,1,114,'2015-09-10 14:36:05',3,8,8),(5249,1,193,'2015-09-10 14:36:05',3,8,8),(5250,1,193,'2015-09-10 14:36:54',4,10,10),(5251,1,114,'2015-09-10 14:36:57',4,10,10),(5252,1,110,'2015-09-10 14:41:53',4,11,11),(5253,1,86,'2015-09-10 14:53:41',3,8,8),(5254,1,109,'2015-09-10 14:57:53',2,4,4),(5255,NULL,0,'2015-09-10 14:58:07',NULL,NULL,NULL),(5256,1,194,'2015-09-10 15:01:07',1,2,2),(5257,1,194,'2015-09-10 15:01:31',2,4,4),(5258,1,109,'2015-09-10 15:02:07',3,6,6),(5259,1,194,'2015-09-10 15:02:08',3,6,6),(5260,1,109,'2015-09-10 15:02:23',2,4,4),(5261,1,116,'2015-09-10 15:02:53',2,4,4),(5262,1,194,'2015-09-10 15:03:17',3,7,7),(5263,1,87,'2015-09-10 15:03:59',3,7,7),(5264,1,114,'2015-09-10 15:04:31',3,8,8),(5265,1,193,'2015-09-10 15:04:31',3,8,8),(5266,1,114,'2015-09-10 15:39:15',5,17,18),(5267,NULL,0,'2015-09-10 15:47:57',NULL,NULL,NULL),(5268,1,195,'2015-09-10 15:51:03',1,2,2),(5269,1,195,'2015-09-10 15:51:24',2,4,4),(5270,1,195,'2015-09-10 15:52:04',3,6,6),(5271,1,195,'2015-09-10 15:53:37',3,7,7),(5272,1,87,'2015-09-10 15:57:40',3,8,8),(5273,1,194,'2015-09-10 15:57:48',3,8,8),(5274,1,114,'2015-09-10 15:57:52',3,8,8),(5275,1,110,'2015-09-10 15:58:52',3,8,8),(5276,1,194,'2015-09-10 15:59:04',4,10,10),(5277,NULL,0,'2015-09-10 16:02:48',NULL,NULL,NULL),(5278,1,196,'2015-09-10 16:05:15',1,2,2),(5279,1,196,'2015-09-10 16:05:31',2,4,4),(5280,1,196,'2015-09-10 16:05:51',3,6,6),(5281,1,196,'2015-09-10 16:06:54',3,7,7),(5282,NULL,0,'2015-09-10 16:07:56',NULL,NULL,NULL),(5283,1,197,'2015-09-10 16:10:10',1,2,2),(5284,1,197,'2015-09-10 16:10:27',2,4,4),(5285,1,197,'2015-09-10 16:11:10',3,6,6),(5286,1,197,'2015-09-10 16:12:11',3,7,7),(5287,1,110,'2015-09-10 16:23:42',5,17,18),(5288,NULL,0,'2015-11-01 16:50:00',NULL,NULL,NULL),(5289,1,198,'2015-09-10 16:55:52',1,2,2),(5290,1,198,'2015-09-10 16:56:11',2,4,4),(5291,1,198,'2015-09-10 16:57:14',3,6,6),(5292,1,198,'2015-09-10 16:58:18',3,7,7),(5293,1,198,'2015-09-11 17:01:03',3,9,9),(5294,1,198,'2015-09-11 17:05:58',1,2,2),(5295,1,198,'2015-09-11 17:06:27',2,4,4),(5296,1,198,'2015-09-11 17:06:59',3,6,6),(5297,1,198,'2015-09-11 17:07:36',2,4,4),(5298,NULL,0,'2015-09-11 17:08:11',NULL,NULL,NULL),(5299,1,199,'2015-09-11 17:11:58',1,2,2),(5300,1,199,'2015-09-11 17:12:17',2,4,4),(5301,NULL,0,'2015-09-11 17:13:03',NULL,NULL,NULL),(5302,1,200,'2015-09-11 17:16:11',1,2,2),(5303,1,200,'2015-09-11 17:16:37',2,4,4),(5304,1,200,'2015-09-11 17:16:48',3,6,6),(5305,NULL,0,'2015-09-11 17:17:18',NULL,NULL,NULL),(5306,1,201,'2015-09-11 17:21:52',1,2,2),(5307,1,201,'2015-09-11 17:22:11',2,4,4),(5308,1,201,'2015-09-11 17:22:24',3,6,6),(5309,1,200,'2015-09-11 17:22:40',2,4,4),(5310,NULL,0,'2015-09-11 17:24:56',NULL,NULL,NULL),(5311,NULL,0,'2015-12-08 22:03:47',NULL,NULL,NULL),(5312,NULL,0,'2015-12-08 22:03:48',NULL,NULL,NULL),(5313,NULL,0,'2015-12-08 22:03:59',NULL,NULL,NULL),(5314,NULL,0,'2015-12-08 22:04:13',NULL,NULL,NULL),(5315,NULL,0,'2015-12-08 22:04:14',NULL,NULL,NULL),(5316,NULL,0,'2015-12-08 22:04:22',NULL,NULL,NULL),(5317,NULL,0,'2015-12-08 22:04:23',NULL,NULL,NULL),(5318,NULL,0,'2015-12-08 22:40:14',NULL,NULL,NULL),(5319,NULL,0,'2015-12-08 22:40:18',NULL,NULL,NULL),(5320,NULL,0,'2015-12-08 23:05:27',NULL,NULL,NULL),(5321,NULL,0,'2015-12-08 23:05:29',NULL,NULL,NULL),(5322,1,110,'2015-12-08 23:06:30',3,9,9),(5323,1,113,'2015-12-08 23:06:30',3,8,8);

/*Table structure for table `statusdef` */

DROP TABLE IF EXISTS `statusdef`;

CREATE TABLE `statusdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusCode` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusDesc` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `statusdef` */

insert  into `statusdef`(`id`,`statusCode`,`statusDesc`) values (1,'010101','等待填报'),(2,'010102','等待审核'),(3,'010201','正在审核'),(4,'010202','审核通过'),(5,'010203','审核未通过'),(6,'010301','等待公示'),(7,'010302','正在公示'),(8,'010303','公示通过'),(9,'010304','公示未通过'),(10,'010401','等待发布招标公告'),(11,'010402','招标公告已发布'),(12,'010403','报名已截止'),(13,'010404','投标已截止'),(14,'010405','开标已结束'),(15,'010406','竞标结果已公示'),(16,'010501','等待填报合同'),(17,'010502','等待合同审核'),(18,'010503','合同审核通过'),(19,'010504','合同审核未通过'),(20,'010505','等待合同备案填报'),(21,'010506','等待合同命案审核'),(22,'010507','合同备案审核通过'),(23,'010508','合同备案审核未通过');

/*Table structure for table `stepdef` */

DROP TABLE IF EXISTS `stepdef`;

CREATE TABLE `stepdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flowDefId` int(11) DEFAULT NULL,
  `stepCode` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stepName` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stepDesc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flowId` (`flowDefId`) USING BTREE,
  CONSTRAINT `stepdef_ibfk_1` FOREIGN KEY (`flowDefId`) REFERENCES `flowdef` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `stepdef` */

insert  into `stepdef`(`id`,`flowDefId`,`stepCode`,`stepName`,`stepDesc`) values (1,1,'0101','申请填报','申请表提交'),(2,1,'0102','申请审核','申请表审核'),(3,1,'0103','申请公示','申请表公示'),(4,1,'0104','电子交易','电子交易'),(5,1,'0105','网签合同','网签合同'),(6,1,'0106','合同备案','合同备案');

/*Table structure for table `transferee_company` */

DROP TABLE IF EXISTS `transferee_company`;

CREATE TABLE `transferee_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfereeIDCode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfereeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfereeTel` decimal(11,0) DEFAULT NULL,
  `transfereeAddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transferee_company` */

/*Table structure for table `transferee_person` */

DROP TABLE IF EXISTS `transferee_person`;

CREATE TABLE `transferee_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfereeIDCode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfereeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfereeTel` decimal(11,0) DEFAULT NULL,
  `transfereeAddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfereeEmail` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tranfereeEducation` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tranfereeEconomicbkground` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transferee_person` */

insert  into `transferee_person`(`id`,`transfereeIDCode`,`transfereeName`,`transfereeTel`,`transfereeAddress`,`transfereeEmail`,`tranfereeEducation`,`tranfereeEconomicbkground`) values (2,'512223197311146671','杨建明','13910656911','										北京大							\r\n									\r\n									\r\n						',NULL,NULL,NULL),(3,'512223197311146679','丁广勇','12345678901','										\r\n									',NULL,NULL,NULL),(4,'512223197111146679','丁广勇','12345678901','北京天安门广场',NULL,NULL,NULL),(5,'512223197344455134','杨建明','12345678901','苦苦苦基本地',NULL,NULL,NULL),(8,'123456789012345678','姜超','12345678901','测试依据苦',NULL,NULL,NULL),(9,'123456789012345678','丁广勇','12345678901','1234567890123456789012345690',NULL,NULL,NULL),(10,'123456789012345678','杨建明','12345678901','12345678901234567890123456789\r\n',NULL,NULL,NULL),(11,'123456789012345678','丁广勇','12345901789','塔顶 地夺期刊地村村模压苦劳而无功奔',NULL,NULL,NULL),(12,'123456789012345678','杨建明','12345678901','1234567890枯干',NULL,NULL,NULL),(13,'123456789012345678','丁广勇','12345678901','2345678地',NULL,NULL,NULL),(14,'123456789012345678','杨建明','12345678901','重庆长寿县双龙镇',NULL,NULL,NULL),(15,NULL,'杨建明',NULL,NULL,NULL,NULL,NULL),(16,NULL,'姜超',NULL,NULL,NULL,NULL,NULL),(17,NULL,'姜超',NULL,NULL,NULL,NULL,NULL),(18,'987824354123456789','丁广勇','12345678901','重庆市测试地址',NULL,NULL,NULL),(19,'512223197511118667','丁广勇','13902313243','重庆长寿区',NULL,NULL,NULL),(20,'512223197811197783','丁广勇','13924567899','重庆市长寿区双龙镇',NULL,NULL,NULL),(21,'512223197811146679','李四四','13910674132','重庆市北碚区西南大学1',NULL,NULL,NULL),(22,'512223197511158899','杨建明','18602312323','重庆市北碚区',NULL,NULL,NULL),(23,'512223198611146672','姜超','18602367676','重庆市长寿区',NULL,NULL,NULL),(24,'512223197311146678','廖明义','15802345678','重庆市长寿区',NULL,NULL,NULL),(25,'512223197511146673','杨建明','13910235678','重庆市长寿区',NULL,NULL,NULL),(26,'512223198711146678','杨建明','2365428879','重庆市长寿区双龙镇长安村',NULL,NULL,NULL),(27,'410182198609290878','廖明义','18910505453','地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地枯地',NULL,NULL,NULL),(28,'234234234234343434','丁广勇','23423423423','2342342342',NULL,NULL,NULL),(29,'123123123123232322','姜超','23123123112','231231231',NULL,NULL,NULL),(30,'123123123123123121','廖明义','31231231231','12312312312',NULL,NULL,NULL),(31,'222222222222222222','丁广勇','22222222222','22222222222222222222222',NULL,NULL,NULL),(32,'211111111111111111','杨建明','11111111111','111111111111111',NULL,NULL,NULL),(33,'222222222222222222','姜超','22222222222','222222',NULL,NULL,NULL),(34,'222222222222222222','丁广勇','22222222222','2222222',NULL,NULL,NULL),(35,'111111111111111111','廖明义','11111111111','1111111111',NULL,NULL,NULL);

/*Table structure for table `user_person` */

DROP TABLE IF EXISTS `user_person`;

CREATE TABLE `user_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '66886688' COMMENT '密码',
  `userCategory` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userCategoryName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userType` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userTypeName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userIdtype` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userIdtypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userIdcode` varchar(18) COLLATE utf8_unicode_ci NOT NULL COMMENT '身份证号码',
  `mobilephone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `education` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电子邮件',
  `province` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省(直辖市、自治区)',
  `city` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '市',
  `county` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '县(区)',
  `town` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '乡镇(街道)',
  `village` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行政村(居委会)',
  `team` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系地址',
  `photoFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '照片文件名',
  `IDCard1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证扫描件文件名',
  `IDCard2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picIdcode` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picTel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_person` */

insert  into `user_person`(`id`,`userName`,`password`,`userCategory`,`userCategoryName`,`userType`,`userTypeName`,`userIdtype`,`userIdtypeName`,`userIdcode`,`mobilephone`,`education`,`email`,`province`,`city`,`county`,`town`,`village`,`team`,`address`,`contactAddress`,`photoFilename`,`IDCard1`,`IDCard2`,`picName`,`picIdcode`,`picTel`,`picAddress`,`picEmail`,`status`) values (9,'刘纯波','99889988','01','转出方','01','个人','01','居民身份证','512223197311146672','13910656911',NULL,'liucb@irsa.ac.cn','重庆市','','长寿县','双龙镇','红旗村','1组','双龙镇红旗村1组双龙镇红旗村','重庆市北碚区天生街道11号','upload/photo/20150912093335471.jpg','upload/IDCard/20150912093616020.jpg','upload/IDCard/20150912093408541.jpg','刘三','512223197311146674','13910656922','重庆市长寿区双龙镇政府','998876@qq.com','200'),(12,'赵一','99889988','01','转出方','01','个人','01','居民身份证','512223197111146671',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(13,'测试公司','99889988','02','转入方','02','企业法人','02','组织机构代码证','12345678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(14,'测试公司2','99889988','02','转入方','02','企业法人','02','组织机构代码证','87654321',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(15,'重庆建军现代农业公司','99889988','02','转入方','02','企业法人','02','组织机构代码证','12345672',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(16,'刘三波','99889988','01','转出方','01','个人','01','居民身份证','512223197311146679',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(17,'测试农业公司','99889988','01','转出方','02','企业法人','02','组织机构代码证','89897634',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(18,'刘大大','99889988','01','转出方','01','个人','01','居民身份证','512223197311146678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(19,'刘测试','99889988','01','转出方','01','个人','01','居民身份证','512223197511146679',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(20,'测试农业公司','99889988','01','转出方','02','企业法人','02','组织机构代码证','98999899',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(21,'刘三金','99889988','01','转出方','01','个人','01','居民身份证','512223197811146679',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100'),(22,'王胜利','12345678','01','转出方','01','个人','01','居民身份证','410182198609290718',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `userRoleId` int(11) DEFAULT NULL,
  `userRoleName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `userRoleId` (`userRoleId`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user_person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`userRoleId`) REFERENCES `role_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`userId`,`userRoleId`,`userRoleName`) values (1,9,NULL,NULL);

/* Trigger structure for table `apply` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `addflowstatus_add` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `addflowstatus_add` BEFORE INSERT ON `apply` FOR EACH ROW insert into status (flowDefId,flowInstanceId,finishedDatetime,currentStepId,currentStatusId,currentMsgId) values(new.flowDefID,new.id,now(),new.currentStepId,new.currentStatusId,new.currentMsgId)
; */$$


DELIMITER ;

/* Trigger structure for table `apply` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `addflowstutus_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `addflowstutus_update` BEFORE UPDATE ON `apply` FOR EACH ROW begin
declare landProvinceName varchar(256);
if(new.currentStatusId!=old.currentStatusId) then
insert into status (flowDefId,flowInstanceId,finishedDatetime,currentStepId,currentStatusId,currentMsgId) values(new.flowDefID,new.id,now(),new.currentStepId,new.currentStatusId,new.currentMsgId);
end if;
set new.landProvinceName=(select code_province.name from code_province where code_province.code=new.landProvince);
set new.landCityName=(select code_city.name from code_city where code_city.code=new.landCity);
set new.landCountyName=(select code_county.name from code_county where code_county.code=new.landCounty);
set new.landTownName=(select code_town.name from code_town where code_town.code=new.landTown);
set new.landVillageName=(select code_village.name from code_village where code_village.code=new.landVillage);
end */$$


DELIMITER ;

/* Trigger structure for table `bidpost` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update` BEFORE UPDATE ON `bidpost` FOR EACH ROW update bidenroll set bidenroll.applyEndDate=new.applyEndDate, bidenroll.bidDate=new.bidDate  where bidenroll.bidpostId=new.id
; */$$


DELIMITER ;

/* Trigger structure for table `bidpost_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `updateAreaAferInsert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `updateAreaAferInsert` AFTER INSERT ON `bidpost_detail` FOR EACH ROW BEGIN
update bidpost set bidpost.landRgArea=(SELECT
Sum(bidpost_detail.landRgArea)FROM
bidpost_detail
WHERE
bidpost_detail.bidpostId=new.bidpostId )  where bidpost.id=new.bidpostId;

update bidpost set bidpost.drylandRgArea=(SELECT
Sum(bidpost_detail.drylandRgArea)FROM
bidpost_detail
WHERE
bidpost_detail.bidpostId=new.bidpostId )  where bidpost.id=new.bidpostId;

update bidpost set bidpost.paddyfieldRgArea=(SELECT
Sum(bidpost_detail.paddyfieldRgArea)FROM
bidpost_detail
WHERE
bidpost_detail.bidpostId=new.bidpostId )  where bidpost.id=new.bidpostId;
END */$$


DELIMITER ;

/* Trigger structure for table `bidpost_detail` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `updateAreaBeforeDelete` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `updateAreaBeforeDelete` AFTER DELETE ON `bidpost_detail` FOR EACH ROW BEGIN
update bidpost set bidpost.landRgArea=(SELECT
Sum(bidpost_detail.landRgArea)FROM
bidpost_detail
WHERE
bidpost_detail.bidpostId=old.bidpostId )  where bidpost.id=old.bidpostId;

update bidpost set bidpost.drylandRgArea=(SELECT
Sum(bidpost_detail.drylandRgArea)FROM
bidpost_detail
WHERE
bidpost_detail.bidpostId=old.bidpostId )  where bidpost.id=old.bidpostId;

update bidpost set bidpost.paddyfieldRgArea=(SELECT
Sum(bidpost_detail.paddyfieldRgArea)FROM
bidpost_detail
WHERE
bidpost_detail.bidpostId=old.bidpostId )  where bidpost.id=old.bidpostId;
END */$$


DELIMITER ;

/* Trigger structure for table `circulation_demand` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `setCodeName_new` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `setCodeName_new` BEFORE UPDATE ON `circulation_demand` FOR EACH ROW begin
declare landProvinceCode varchar(2);
declare landProvinceName varchar(256);
declare landCityCode varchar(4) ;
declare landCityName varchar(256);
declare landCountyCode varchar(6); 
declare landCountyName varchar(256);
declare landTownCode varchar(9);
declare landTownName varchar(256);
declare landVillageCode varchar(12);
declare landVillageName varchar(256);
declare landAddressCode varchar(12);
declare landAddressName varchar(256);

select code_province.name into landProvinceName from code_province where code_province.code=new.landProvince;
if(landProvinceName is null) then
set landProvinceName="";
end if;
set new.landProvinceName=landProvinceName;

select code_city.name into landCityName from code_city where code_city.code=new.landCity;
if(landCityName is null) then
set landCityName="";
end if;
set new.landCityName=landCityName;

select code_county.name into landCountyName from code_county where code_county.code=new.landCounty;
if(landCountyName is null) then
set landCountyName="";
end if;
set new.landCountyName=landCountyName;

select code_town.name into landTownName from code_town where code_town.code=new.landTown;
if(landTownName is null) then
set landTownName="";
end if;
set new.landTownName=landTownName;

select code_village.name into landVillageName from code_village where code_village.code=new.landVillage;
if(landVillageName is null) then
set landVillageName="";
end if;
set new.landVillageName=landVillageName;

set new.landAddress=concat(landProvinceName,LandCityName,landCountyName,landTownName,landVillageName);

if(new.circulationType != old.circulationType||old.circulationType is null) then
case new.circulationType
when "01" then set new.circulationTypeName="出租";
when "02" then set new.circulationTypeName="入股";
when "03" then set new.circulationTypeName="转让";
when "04" then set new.circulationTypeName="转包";
when "05" then set new.circulationTypeName="互换";
end case;
end if;

if(new.landType != old.landType || old.landType is null) then
case new.landType
when "01" then set new.landTypeName="水田";
when "02" then set new.landTypeName="旱地";
when "03" then set new.landTypeName="水田旱地均可";
end case;
end if;

end */$$


DELIMITER ;

/* Trigger structure for table `conpensation_record` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `payedPercentNew` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `payedPercentNew` BEFORE INSERT ON `conpensation_record` FOR EACH ROW begin
declare landAddressName varchar(255);
declare landArea double;
declare transferName varchar(20);
declare transferIdcode varchar(18);
select contractfilling.landAddressName,contractfilling.landArea,contractfilling.transferName,contractfilling.transferIdcode from contractfilling where contractfilling.contractNo=new.contractNo into landAddressName,landArea,transferName,transferIdcode;
set new.landAddressName=landAddressName;
set new.landArea =landArea;
set new.transferName=transferName;
set new.transferIdcode=transferIdcode; 
if (new.amountPayable!=0) then
set new.payedPercent=ROUND(100*new.actualPayments/new.amountPayable,2);
end if ;
end */$$


DELIMITER ;

/* Trigger structure for table `conpensation_record` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `paymentPercentUpdate` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `paymentPercentUpdate` BEFORE UPDATE ON `conpensation_record` FOR EACH ROW begin
if (new.amountPayable!=0) then
set new.payedPercent=ROUND(100*new.actualPayments/new.amountPayable,2);
end if ;
end */$$


DELIMITER ;

/* Trigger structure for table `contract_base` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `computeDuration_new` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `computeDuration_new` BEFORE INSERT ON `contract_base` FOR EACH ROW begin
declare landProvinceCode varchar(2);
declare landProvinceName varchar(256);
declare landCityCode varchar(4) ;
declare landCityName varchar(256);
declare landCountyCode varchar(6); 
declare landCountyName varchar(256);
declare landTownCode varchar(9);
declare landTownName varchar(256);
declare landVillageCode varchar(12);
declare landVillageName varchar(256);
declare landAddressCode varchar(12);
declare landAddressName varchar(256);

set new.duration=(TO_DAYS(new.toDate)-TO_DAYS(new.fromDate))/365;

select apply.landProvince,apply.landProvinceName,apply.landCity,apply.landCityName,apply.landCounty,apply.landCountyName,apply.landTown,apply.landTownName,apply.landVillage,apply.landVillageName,apply.landRegionCode,apply.landAddress into landProvinceCode,landProvinceName,landCityCode,landCityName,landCountyCode,landCountyName,landTownCode,landTownName,landVillageCode,landVillageName,landAddressCode,landAddressName from apply where apply.id=new.applyId; 
set new.landProvinceCode=landProvinceCode;
set new.landProvinceName=landProvinceName;
set new.landCityCode=landCityCode;
set new.landCityName=landCityName;
set new.landCountyCode=landCountyCode;
set new.landCountyName=landCountyName;
set new.landTownCode=landTownCode;
set new.landTownName=landTownName;
set new.landVillageCode=landVillageCode;
set new.landVillageName=landVillageName;
set new.landAddressCode=landAddressCode;
set new.landAddressName=landAddressName;
end */$$


DELIMITER ;

/* Trigger structure for table `contract_base` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `newContractdetail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `newContractdetail` AFTER INSERT ON `contract_base` FOR EACH ROW begin
case new.circulationType
when "01" then insert into contract_rent (contract_rent.contractBaseId,contract_rent.contractNo) values (new.id,new.contractNo);
when "02" then insert into contract_share (contract_share.contractBaseId,contract_share.contractNo) values (new.id,new.contractNo);
when "03" then insert into contract_assignment (contract_assignment.contractBaseId,contract_assignment.contractNo) values (new.id,new.contractNo);
when "04" then insert into contract_subcontract (contract_subcontract.contractBaseId,contract_subcontract.contractNo) values (new.id,new.contractNo);
when "05" then insert into contract_exchange (contract_exchange.contractBaseId,contract_exchange.contractNo) values (new.id,new.contractNo);
end case;
end */$$


DELIMITER ;

/* Trigger structure for table `contract_base` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `computeDuration_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `computeDuration_update` BEFORE UPDATE ON `contract_base` FOR EACH ROW begin
if (new.fromDate!=old.fromDate)or(new.toDate!=old.toDate) or (old.duration is null)then
set new.duration=(TO_DAYS(new.toDate)-TO_DAYS(new.fromDate))/365;
end if;
if(new.contractNo!=old.contractNo) then
case new.circulationType
when "01" then update contract_rent set contract_rent.contractNo=new.contractNo where contract_rent.contractBaseId=new.id;
when "02" then update contract_share set contract_share.contractNo=new.contractNo where contract_share.contractBaseId=new.id;
when "03" then update contract_assignment set contract_assignment.contractNo=new.contractNo where contract_assignment.contractBaseId=new.id;
when "04" then update contract_subcontract set contract_subcontract.contractNo=new.contractNo where contract_subcontract.contractBaseId=new.id;
when "05" then update contract_exchange set contract_exchange.contractNo=new.contractNo where contract_exchange.contractBaseId=new.id;
end case;
end if;
end */$$


DELIMITER ;

/* Trigger structure for table `contract_rent` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `computePay` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `computePay` BEFORE INSERT ON `contract_rent` FOR EACH ROW begin
declare drylandArea double;
declare paddyfieldArea double;
declare landArea double;
case new.areaType
when 1 then select  contract_base.landRgArea,contract_base.drylandRgArea,contract_base.paddyfieldRgArea into drylandArea,paddyfieldArea,landArea from contract_base where contract_base.id=new.contractBaseId;
when 2 then select  contract_base.landRealArea,contract_base.drylandRealArea, contract_base.paddyfieldRealArea into drylandArea,paddyfieldArea,landArea  from contract_base where contract_base.id=new.contractBaseId;
end case;

set new.landArea=landArea;
set new.drylandArea=drylandArea;
set new.paddyfieldArea=paddyfieldArea;

if(new.payType=1) then
set new.payType13=new.payType11*new.paddyfieldArea+new.payType12*new.drylandArea;
end if;
if(new.payType=2) then
set new.payType23=new.payType21*new.paddyfieldArea;
set new.payType26=new.payType24*new.drylandArea;
end if;

case new.payType22
when 1 then set new.payType22Name="黄谷";
when 2 then set new.payType22Name="玉米";
when 3 then set new.payType22Name="小麦";
end case;

case new.payType25
when 1 then set new.payType25Name="黄谷";
when 2 then set new.payType25Name="玉米";
when 3 then set new.payType25Name="小麦";
end case;
end */$$


DELIMITER ;

/* Trigger structure for table `contract_rent` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `updatePay` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `updatePay` BEFORE UPDATE ON `contract_rent` FOR EACH ROW begin
declare drylandArea double;
declare paddyfieldArea double;
declare landArea double;
if(new.areaType!=old.areaType) then
case new.areaType
when 1 then select  contract_base.landRgArea,contract_base.drylandRgArea,contract_base.paddyfieldRgArea into drylandArea,paddyfieldArea,landArea from contract_base where contract_base.id=new.contractBaseId;
when 2 then select  contract_base.landRealArea,contract_base.drylandRealArea, contract_base.paddyfieldRealArea into drylandArea,paddyfieldArea,landArea  from contract_base where contract_base.id=new.contractBaseId;
end case;
set new.landArea=landArea;
set new.drylandArea=drylandArea;
set new.paddyfieldArea=paddyfieldArea;
end if;
if(new.payType=1)and ((new.payType!=old.payType) or (new.payType11!=old.payType11 ) or (new.payType12!=old.payType12 ) or  (new.areaType!=old.areaType)) then
set new.payType13=new.payType11*new.paddyfieldArea+new.payType12*new.drylandArea;
end if;
if(new.payType=2)and ((new.payType!=old.payType) or (new.payType21!=old.payType21 ) or (new.payType24!=old.payType24 ) or  (new.areaType!=old.areaType)) then
set new.payType23=new.payType21*new.paddyfieldArea;
set new.payType26=new.payType24*new.drylandArea;
end if;
if (new.payType22!=old.payType22) then
case new.payType22
when 1 then set new.payType22Name="黄谷";
when 2 then set new.payType22Name="玉米";
when 3 then set new.payType22Name="小麦";
end case;
end if;
if (new.payType25!=old.payType25) then
case new.payType25
when 1 then set new.payType25Name="黄谷";
when 2 then set new.payType25Name="玉米";
when 3 then set new.payType25Name="小麦";
end case;
end if;
end */$$


DELIMITER ;

/* Trigger structure for table `parcel` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `areasum_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `areasum_update` AFTER UPDATE ON `parcel` FOR EACH ROW BEGIN
update apply set apply.landRgArea=(SELECT
Sum(parcel.rgArea)FROM
parcel
WHERE
parcel.applicationId=new.applicationId )  where apply.id=new.applicationId;

update apply set apply.paddyfieldRgArea=(SELECT
Sum(parcel.rgArea)FROM
parcel
WHERE
parcel.applicationId=new.applicationId and parcel.type=1)  where apply.id=new.applicationId;

update apply set apply.drylandRgArea=(SELECT
Sum(parcel.rgArea)FROM
parcel
WHERE
parcel.applicationId=new.applicationId and parcel.type=2)  where apply.id=new.applicationId;

update apply set apply.landRealArea=(SELECT
Sum(parcel.realArea)FROM
parcel
WHERE
parcel.applicationId=new.applicationId )  where apply.id=new.applicationId;

update apply set apply.paddyfieldRealArea=(SELECT
Sum(parcel.realArea)FROM
parcel
WHERE
parcel.applicationId=new.applicationId and parcel.type=1)  where apply.id=new.applicationId;

update apply set apply.drylandRealArea=(SELECT
Sum(parcel.realArea)FROM
parcel
WHERE
parcel.applicationId=new.applicationId and parcel.type=2)  where apply.id=new.applicationId;

update apply set apply.landNumber=(SELECT
Count(*)FROM
parcel
WHERE
parcel.applicationId=new.applicationId )  where apply.id=new.applicationId;


END */$$


DELIMITER ;

/* Trigger structure for table `parcel` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `areasum_delete` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `areasum_delete` AFTER DELETE ON `parcel` FOR EACH ROW BEGIN
update apply set apply.landRgArea=(SELECT
Sum(parcel.rgArea)FROM
parcel
WHERE
parcel.applicationId=old.applicationId)  where apply.id=old.applicationId;

update apply set apply.paddyfieldRgArea=(SELECT
Sum(parcel.rgArea)FROM
parcel
WHERE
parcel.applicationId=old.applicationId and parcel.type=1)  where apply.id=old.applicationId;

update apply set apply.drylandRgArea=(SELECT
Sum(parcel.rgArea)FROM
parcel
WHERE
parcel.applicationId=old.applicationId and parcel.type=2)  where apply.id=old.applicationId;

update apply set apply.landRealArea=(SELECT
Sum(parcel.realArea)FROM
parcel
WHERE
parcel.applicationId=old.applicationId)  where apply.id=old.applicationId;

update apply set apply.paddyfieldRealArea=(SELECT
Sum(parcel.realArea)FROM
parcel
WHERE
parcel.applicationId=old.applicationId and parcel.type=1)  where apply.id=old.applicationId;

update apply set apply.drylandRealArea=(SELECT
Sum(parcel.realArea)FROM
parcel
WHERE
parcel.applicationId=old.applicationId and parcel.type=2)  where apply.id=old.applicationId;

update apply set apply.landNumber=(SELECT
Count(*)FROM
parcel
WHERE
parcel.applicationId=old.applicationId)  where apply.id=old.applicationId;

END */$$


DELIMITER ;

/* Trigger structure for table `user_person` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `codeName_new` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `codeName_new` BEFORE INSERT ON `user_person` FOR EACH ROW begin
case new.userCategory
when "01" then 
set new.userCategoryName="转出方";
when "02" then 
set new.userCategoryName="转入方";
when "03" then
set new.userCategoryName="中介机构";
when "04" then
set new.userCategoryName="中介机构";
when "05" then 
set new.userCategoryName="用户管理员";
when "06" then 
set new.userCategoryName="系统管理员";
end case;

case new.userType
when "01" then
set new.userTypeName="个人";
when "02" then
set new.userTypeName="企业法人";
when "03" then
set new.userTypeName="非企业法人";
when "03" then
set new.userTypeName="其它";
end case;

case new.userIdtype 
when "01" then
set new.userIdtypeName="居民身份证";
when "02" then
set new.userIdtypeName="组织机构代码证";
when "03" then 
set new.userIdtypeName="其它";
end case;
end */$$


DELIMITER ;

/* Trigger structure for table `user_person` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `codeName_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `codeName_update` BEFORE UPDATE ON `user_person` FOR EACH ROW begin
case new.userCategory
when "01" then 
set new.userCategoryName="转出方";
when "02" then 
set new.userCategoryName="转入方";
when "03" then
set new.userCategoryName="中介机构";
when "04" then
set new.userCategoryName="中介机构";
when "05" then 
set new.userCategoryName="用户管理员";
when "06" then 
set new.userCategoryName="系统管理员";
end case;

case new.userType
when "01" then
set new.userTypeName="个人";
when "02" then
set new.userTypeName="企业法人";
when "03" then
set new.userTypeName="非企业法人";
when "03" then
set new.userTypeName="其它";
end case;

if(new.userIdtype!=old.userIdtype) or (old.userIdtype is null) then
case new.userIdtype 
when "01" then
set new.userIdtypeName="居民身份证";
when "02" then
set new.userIdtypeName="组织机构代码证";
when "03" then 
set new.userIdtypeName="其它";
end case;
end if;
end */$$


DELIMITER ;

/*Table structure for table `applystatus` */

DROP TABLE IF EXISTS `applystatus`;

/*!50001 DROP VIEW IF EXISTS `applystatus` */;
/*!50001 DROP TABLE IF EXISTS `applystatus` */;

/*!50001 CREATE TABLE  `applystatus`(
 `id` int(11) ,
 `applierId` int(11) ,
 `applierIDCode` varchar(255) ,
 `applyDate` date ,
 `stepName` varchar(8) ,
 `msgText` varchar(50) ,
 `statusDesc` varchar(10) ,
 `applierUserName` varchar(20) ,
 `statusCode` varchar(6) ,
 `transferType` varchar(1) ,
 `transferTypeName` varchar(20) ,
 `circulationTypeName` varchar(20) ,
 `circulationType` varchar(2) 
)*/;

/*View structure for view applystatus */

/*!50001 DROP TABLE IF EXISTS `applystatus` */;
/*!50001 DROP VIEW IF EXISTS `applystatus` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `applystatus` AS select `apply`.`id` AS `id`,`apply`.`applierId` AS `applierId`,`apply`.`applierIDCode` AS `applierIDCode`,`apply`.`applyDate` AS `applyDate`,`stepdef`.`stepName` AS `stepName`,`rtnmsgdef`.`msgText` AS `msgText`,`statusdef`.`statusDesc` AS `statusDesc`,`apply`.`applierUserName` AS `applierUserName`,`statusdef`.`statusCode` AS `statusCode`,`apply`.`transferType` AS `transferType`,`apply`.`transferTypeName` AS `transferTypeName`,`apply`.`circulationTypeName` AS `circulationTypeName`,`apply`.`circulationType` AS `circulationType` from (((`apply` join `statusdef` on((`apply`.`currentStatusId` = `statusdef`.`id`))) join `stepdef` on((`apply`.`currentStepId` = `stepdef`.`id`))) join `rtnmsgdef` on((`apply`.`currentMsgId` = `rtnmsgdef`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
