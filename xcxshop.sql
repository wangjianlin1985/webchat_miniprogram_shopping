/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : xcxshop

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-04-15 21:19:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pvkclq3v68c3acqo6ivqh2f92` (`goodsId`),
  KEY `FK_ep0mtwg2w4rju18rk2wm153wg` (`userId`),
  CONSTRAINT `FK_ep0mtwg2w4rju18rk2wm153wg` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_pvkclq3v68c3acqo6ivqh2f92` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for dd
-- ----------------------------
DROP TABLE IF EXISTS `dd`;
CREATE TABLE `dd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_548toqb33aavwqnpti6to5fwv` (`goodsId`),
  KEY `FK_ictbe1fmckey0v1blmqidtbbh` (`userId`),
  CONSTRAINT `FK_548toqb33aavwqnpti6to5fwv` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_ictbe1fmckey0v1blmqidtbbh` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd
-- ----------------------------
INSERT INTO `dd` VALUES ('7', '7', '6', '17041521090001', '2017-04-15 21:09:02', null, ' 1测试', '12');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDelete` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url1` varchar(255) DEFAULT NULL,
  `url2` varchar(255) DEFAULT NULL,
  `url3` varchar(255) DEFAULT NULL,
  `url4` varchar(255) DEFAULT NULL,
  `ppId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m8jpxcm9wffl7vgvxeydquemp` (`ppId`),
  CONSTRAINT `FK_m8jpxcm9wffl7vgvxeydquemp` FOREIGN KEY (`ppId`) REFERENCES `pp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '0', '50', '测试商品', '\\upload\\93d99e1021b111e72275e501f0e6605a057341446N80a621e6.jpg', '\\upload\\93da887021b111e72275e501f0e6605a156a0a994Nf1b662dc.png', '\\upload\\93daaf8021b111e72275e501f0e6605a258bcbe0dN47e52f7f.jpg', '\\upload\\93dbe80021b111e72275e501f0e6605a358bcbe5fN8f02d840.jpg', '7');
INSERT INTO `goods` VALUES ('2', '1', '22', '22', null, null, null, null, '8');
INSERT INTO `goods` VALUES ('5', '0', '22', 'OM 2017春夏装新款T恤女短袖韩版百搭', '\\upload\\8d996da021b111e72275e501f0e6605a057340281N59b64143.jpg', '\\upload\\8d9a7f1021b111e72275e501f0e6605a156a89b8fNfbaade9a.jpg', '\\upload\\8d9b1b5021b111e72275e501f0e6605a257340236N8e6356ce.jpg', '\\upload\\8d9c05b021b111e72275e501f0e6605a357340236N8e6356ce.jpg', '8');
INSERT INTO `goods` VALUES ('7', '0', '52', 'VeroModa春夏聚惠89元 V领短袖纯棉T', '\\upload\\8642760021b111e72275e501f0e6605a0573413a5N24ebaea6.jpg', '\\upload\\864eab0021b111e72275e501f0e6605a158f036b1N20e9ba30.jpg', '\\upload\\865031a021b111e72275e501f0e6605a257340251Nd368a6b7.jpg', '\\upload\\86522d7021b111e72275e501f0e6605a357341410Ndd5bab15.jpg', '10');
INSERT INTO `goods` VALUES ('8', '0', '200', 'ST恤女短袖春夏新款韩版时尚', '\\upload\\7f28605021b111e72275e501f0e6605a057ada8a7N3b5526a5.jpg', '\\upload\\7f2a351021b111e72275e501f0e6605a157ff4643N03875a31.jpg', '\\upload\\7f2ad15021b111e72275e501f0e6605a258f0334aNfbcfc29d.jpg', '\\upload\\7f2c09d021b111e72275e501f0e6605a3573413a5N24ebaea6.jpg', '8');
INSERT INTO `goods` VALUES ('9', '0', '522', '芳妮诗中长款宽松短', '\\upload\\72e55130219e11e7c8880e0c962cb3ab058f02bb0N0c8282c7.jpg', '\\upload\\72e63b90219e11e7c8880e0c962cb3ab158f05c08N0178ecad.jpg', '\\upload\\72e6fee0219e11e7c8880e0c962cb3ab258f035d0Nf6927b7a.jpg', '\\upload\\72e7e940219e11e7c8880e0c962cb3ab358f023ddNfd9fc358.jpg', '8');

-- ----------------------------
-- Table structure for lb
-- ----------------------------
DROP TABLE IF EXISTS `lb`;
CREATE TABLE `lb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lb
-- ----------------------------
INSERT INTO `lb` VALUES ('1', '0', '宝宝奶粉');
INSERT INTO `lb` VALUES ('2', '0', '纸尿裤');
INSERT INTO `lb` VALUES ('3', '0', '辅食营养');
INSERT INTO `lb` VALUES ('4', '0', '母婴专区');
INSERT INTO `lb` VALUES ('5', '0', '护肤美体');
INSERT INTO `lb` VALUES ('6', '0', '营养保健');
INSERT INTO `lb` VALUES ('7', '0', '居家日用');
INSERT INTO `lb` VALUES ('8', '0', '进口美食');
INSERT INTO `lb` VALUES ('9', '0', '青奢女装');
INSERT INTO `lb` VALUES ('10', '0', '时尚包厢2');
INSERT INTO `lb` VALUES ('11', '1', '11');

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES ('1', 'admin', '111111', '管理员', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `createTime` datetime DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '122233', null, null, '测试公告');

-- ----------------------------
-- Table structure for pp
-- ----------------------------
DROP TABLE IF EXISTS `pp`;
CREATE TABLE `pp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpUrl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lbId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f1x00nmm3d4xdha0vvpccg1g7` (`lbId`),
  CONSTRAINT `FK_f1x00nmm3d4xdha0vvpccg1g7` FOREIGN KEY (`lbId`) REFERENCES `lb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pp
-- ----------------------------
INSERT INTO `pp` VALUES ('1', '\\upload\\08a20c3021be11e769ccb71b6fa6c9cc57ada8a7N3b5526a5.jpg', '迈克·科尔斯', '10');
INSERT INTO `pp` VALUES ('2', '\\upload\\02c6df2021be11e769ccb71b6fa6c9cc58bcbe89Ncc78a49d.jpg', '芙拉', '10');
INSERT INTO `pp` VALUES ('3', '\\upload\\46e19df0219e11e7c8880e0c962cb3ab57ff4643N03875a31.jpg', '时尚箱包', '10');
INSERT INTO `pp` VALUES ('6', '\\upload\\224b6a0021be11e769ccb71b6fa6c9cc58c7ad63N8304bde7.jpg', '花王', '9');
INSERT INTO `pp` VALUES ('7', '\\upload\\1e242e8021be11e769ccb71b6fa6c9cc57340281N59b64143.jpg', '大王', '9');
INSERT INTO `pp` VALUES ('8', '\\upload\\103856c021be11e769ccb71b6fa6c9cc58c7ad63N8304bde7.jpg', '轻奢女装', '9');
INSERT INTO `pp` VALUES ('9', '\\upload\\a334e6c0212111e7f85a59eb8affc48915.jpg', '宝宝营养', '3');
INSERT INTO `pp` VALUES ('10', '\\upload\\b1318760212111e7f85a59eb8affc48916.jpg', '铁元', '3');
INSERT INTO `pp` VALUES ('11', '\\upload\\ca8b65a0212111e7f85a59eb8affc48916.jpg', '喂养用具', '4');
INSERT INTO `pp` VALUES ('12', '\\upload\\e99a9970212111e7f85a59eb8affc48917.jpg', '瘦身美体', '5');
INSERT INTO `pp` VALUES ('13', '\\upload\\fd15a120212111e7f85a59eb8affc48917.jpg', '女性保养', '6');
INSERT INTO `pp` VALUES ('14', '\\upload\\139647b0212211e7f85a59eb8affc48922.jpg', '健安喜', '6');
INSERT INTO `pp` VALUES ('15', '\\upload\\2786cd80212211e7f85a59eb8affc48922.jpg', '护发沐浴', '7');
INSERT INTO `pp` VALUES ('16', '\\upload\\333cb270212211e7f85a59eb8affc48922.jpg', '摩洛哥油', '7');
INSERT INTO `pp` VALUES ('17', '\\upload\\3fbb8cb0212211e7f85a59eb8affc48922.jpg', '箭牌', '7');
INSERT INTO `pp` VALUES ('18', '\\upload\\295c7f0021be11e769ccb71b6fa6c9cc57ada8a7N3b5526a5.jpg', '进口零食', '8');
INSERT INTO `pp` VALUES ('20', '\\upload\\53b0d800212311e7db467e39113fcd762.jpg', '牛奶粉', '1');
INSERT INTO `pp` VALUES ('21', '\\upload\\6180c350212311e7db467e39113fcd763.jpg', 'a2 PLATINUM', '1');
INSERT INTO `pp` VALUES ('22', '\\upload\\75d86f60212311e7db467e39113fcd7612.jpg', '花王', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2017-04-14 22:02:23', '0', '111111', '111', '章撒', 'zs');
INSERT INTO `user` VALUES ('2', '2017-04-14 22:02:39', '0', '111111', '222', '例子', 'ls');
INSERT INTO `user` VALUES ('3', null, '1', '00', '00', '00', '00');
INSERT INTO `user` VALUES ('4', '2017-04-15 14:35:02', null, '2', null, null, '2');
INSERT INTO `user` VALUES ('5', '2017-04-15 14:35:12', null, '3', null, null, '3');
INSERT INTO `user` VALUES ('6', '2017-04-15 14:37:06', '0', '111111', '123456789', '潜孔', 'ceshi');
INSERT INTO `user` VALUES ('7', '2017-04-15 14:48:21', '0', 'vv', 'vv', 'vv', 'vv');
