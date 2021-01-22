/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : cleab

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2020-03-28 21:12:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', '21232F297A57101101431014A0E4A1001F101', '1');

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `citycode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '鼓楼区', '5011', '501');
INSERT INTO `area` VALUES ('2', '建邺区', '5012', '501');
INSERT INTO `area` VALUES ('3', '玄武区', '5013', '501');
INSERT INTO `area` VALUES ('4', '浦口区', '5014', '501');
INSERT INTO `area` VALUES ('5', '秦淮区', '5015', '501');
INSERT INTO `area` VALUES ('6', '雨花台区', '5016', '501');
INSERT INTO `area` VALUES ('7', '栖霞区', '5017', '501');
INSERT INTO `area` VALUES ('8', '江宁区', '5018', '501');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `provincecode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '东城区', '101', '1');
INSERT INTO `city` VALUES ('2', '海淀区', '102', '1');
INSERT INTO `city` VALUES ('3', '西城区', '103', '1');
INSERT INTO `city` VALUES ('4', '通州区', '104', '1');
INSERT INTO `city` VALUES ('5', '南京市', '501', '5');
INSERT INTO `city` VALUES ('6', '无锡市', '502', '5');
INSERT INTO `city` VALUES ('7', '徐州市', '503', '5');

-- ----------------------------
-- Table structure for `clothes`
-- ----------------------------
DROP TABLE IF EXISTS `clothes`;
CREATE TABLE `clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clothes
-- ----------------------------
INSERT INTO `clothes` VALUES ('1', '衬衫', '6', '2020-03-28 15:51:47', '-1');
INSERT INTO `clothes` VALUES ('2', '裤子', '6', '2020-03-28 15:52:02', '-1');
INSERT INTO `clothes` VALUES ('3', '袜子', '2', '2020-03-28 15:52:18', '-1');
INSERT INTO `clothes` VALUES ('4', '外套', '12', '2020-03-28 15:52:35', '-1');
INSERT INTO `clothes` VALUES ('5', 'T恤', '6', '2020-03-28 15:54:35', '-1');
INSERT INTO `clothes` VALUES ('6', '裙子', '15', '2019-03-02 15:54:50', '-1');
INSERT INTO `clothes` VALUES ('7', '大衣', '20', '2019-03-02 15:55:00', '-1');
INSERT INTO `clothes` VALUES ('8', '丝绸服饰', '30', '2019-03-02 16:10:08', '-1');
INSERT INTO `clothes` VALUES ('9', '内衣', '10', '2019-03-02 16:58:33', '-1');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `active_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '0', null, 'hikitty', '2019-03-02 15:38:01', '123456@qq.com', '13812341234', '123456', '1', 'eea73d9e-b917-4516-878e-320d6c54be1c');
INSERT INTO `customer` VALUES ('2', '0', null, 'aodamao', '2019-03-02 16:56:03', '111111@qq.com', '13812345678', '123456', '1', '86a07fea-fa18-4315-ace7-50744bdad618');

-- ----------------------------
-- Table structure for `customer_addr`
-- ----------------------------
DROP TABLE IF EXISTS `customer_addr`;
CREATE TABLE `customer_addr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `city_code` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `area_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `default_addr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_addr
-- ----------------------------
INSERT INTO `customer_addr` VALUES ('1', '1', '13512511211', '江苏省', '5', '南京市', '501', '鼓楼区', '5011', '北京东路10号', '李丽', '0');
INSERT INTO `customer_addr` VALUES ('2', '2', '13812345678', '江苏省', '5', '南京市', '501', '鼓楼区', '5011', '汉口路22号', '嗷大猫', '0');

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `clothes_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1', '1', '1', '1');
INSERT INTO `order_detail` VALUES ('2', '1', '2', '1');
INSERT INTO `order_detail` VALUES ('3', '2', '3', '2');
INSERT INTO `order_detail` VALUES ('4', '2', '5', '2');
INSERT INTO `order_detail` VALUES ('5', '3', '6', '1');
INSERT INTO `order_detail` VALUES ('6', '3', '7', '1');
INSERT INTO `order_detail` VALUES ('7', '4', '1', '1');
INSERT INTO `order_detail` VALUES ('8', '4', '2', '1');
INSERT INTO `order_detail` VALUES ('9', '5', '1', '2');
INSERT INTO `order_detail` VALUES ('10', '5', '2', '1');
INSERT INTO `order_detail` VALUES ('11', '5', '3', '6');
INSERT INTO `order_detail` VALUES ('12', '6', '1', '1');
INSERT INTO `order_detail` VALUES ('13', '6', '4', '1');

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京市', '1');
INSERT INTO `province` VALUES ('2', '上海市', '2');
INSERT INTO `province` VALUES ('3', '天津市', '3');
INSERT INTO `province` VALUES ('4', '重庆市', '4');
INSERT INTO `province` VALUES ('5', '江苏省', '5');
INSERT INTO `province` VALUES ('6', '浙江省', '6');
INSERT INTO `province` VALUES ('7', '山东省', '7');
INSERT INTO `province` VALUES ('8', '安徽省', '8');
INSERT INTO `province` VALUES ('9', '河南省', '9');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memo` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `outerid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', 'Not paied', '尽快，等着穿。', '1', '江苏省南京市鼓楼区北京东路10号', 'E1471852435468', '李丽', '13512511211', '1', '12', '2020-03-28 15:53:55');
INSERT INTO `t_order` VALUES ('2', '', '速度', '0', '江苏省南京市鼓楼区北京东路10号', 'E1471855340875', '李丽', '13512511211', '1', '22', '2019-03-02 16:42:20');
INSERT INTO `t_order` VALUES ('3', '', 'ok', '0', '江苏省南京市鼓楼区北京东路10号', 'E1471858063703', '李丽', '13512511211', '1', '30', '2019-03-02 17:27:43');
INSERT INTO `t_order` VALUES ('4', '', '', '1', '江苏省南京市鼓楼区北京东路10号', 'E1471858432500', '李丽', '13512511211', '1', '12', '2019-03-02 17:33:52');
INSERT INTO `t_order` VALUES ('5', '', '速度洗好。', '1', '江苏省南京市鼓楼区汉口路22号', 'E1472029048239', '嗷大猫', '13812345678', '2', '30', '2019-03-02 16:57:28');
INSERT INTO `t_order` VALUES ('6', '', '', '0', '江苏省南京市鼓楼区北京东路10号', 'E1519822833995', '李丽', '13512511211', '1', '30', '2020-03-28 21:00:33');

-- ----------------------------
-- Table structure for `vip_type`
-- ----------------------------
DROP TABLE IF EXISTS `vip_type`;
CREATE TABLE `vip_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip_type
-- ----------------------------
INSERT INTO `vip_type` VALUES ('1', '金牌会员', '1', '8');
INSERT INTO `vip_type` VALUES ('2', '银牌会员', '2', '9');
INSERT INTO `vip_type` VALUES ('3', '铜牌会员', '3', '10');
