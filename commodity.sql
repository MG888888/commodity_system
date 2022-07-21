/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : commodity

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 19/07/2022 13:17:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assement
-- ----------------------------
DROP TABLE IF EXISTS `assement`;
CREATE TABLE `assement`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `finishtime` datetime(0) DEFAULT NULL,
  `finish_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assement
-- ----------------------------
INSERT INTO `assement` VALUES (7, '任务2', '2022-06-14 22:36:05', '李四');
INSERT INTO `assement` VALUES (6, '任务1', '2022-06-14 22:36:05', '张三');
INSERT INTO `assement` VALUES (8, '任务3', '2022-06-14 22:36:05', '王五');
INSERT INTO `assement` VALUES (9, '任务4', '2022-06-14 22:36:37', '赵六');
INSERT INTO `assement` VALUES (10, 'www', '2022-06-04 08:00:00', 'www');

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre` int(10) DEFAULT NULL,
  `cost` int(10) DEFAULT NULL,
  `progress` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES (1, '商品1', 15000, 12200, 1);
INSERT INTO `cost` VALUES (2, '商品2', 1300, 100, 0);

-- ----------------------------
-- Table structure for customer_infomation
-- ----------------------------
DROP TABLE IF EXISTS `customer_infomation`;
CREATE TABLE `customer_infomation`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkman` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `linkman`(`linkman`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1505787908 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_infomation
-- ----------------------------
INSERT INTO `customer_infomation` VALUES (2, '瑞幸', '李云龙', '17877663322', '53486661');
INSERT INTO `customer_infomation` VALUES (3, '小米', '赵子龙', '1752149516', '1571554');
INSERT INTO `customer_infomation` VALUES (4, '联想', '李白', '1234598', '1235489');
INSERT INTO `customer_infomation` VALUES (5, '123', '131', '13165', '131');
INSERT INTO `customer_infomation` VALUES (7, '123', '131', '13165', '13100');
INSERT INTO `customer_infomation` VALUES (1505787907, '联想', '李白', '1234598', '1235489');

-- ----------------------------
-- Table structure for customer_requirement
-- ----------------------------
DROP TABLE IF EXISTS `customer_requirement`;
CREATE TABLE `customer_requirement`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `needs` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkman` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `linkman`(`linkman`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 830480386 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_requirement
-- ----------------------------
INSERT INTO `customer_requirement` VALUES (2, '意大利炮', '李云龙', 122300);
INSERT INTO `customer_requirement` VALUES (5, '122', '12', 0);
INSERT INTO `customer_requirement` VALUES (830480385, '青钢剑', '赵云', 15999);

-- ----------------------------
-- Table structure for progress
-- ----------------------------
DROP TABLE IF EXISTS `progress`;
CREATE TABLE `progress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `progres` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `now` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of progress
-- ----------------------------
INSERT INTO `progress` VALUES (1, '项目1', '2022-02-10', '2022-06-23', '70%', '2022-06-09');
INSERT INTO `progress` VALUES (2, '项目2', '2022-06-05', '2022-06-29', '60%', NULL);
INSERT INTO `progress` VALUES (3, '项目3', '2022-06-07', '2022-06-15', '20%', NULL);
INSERT INTO `progress` VALUES (4, '项目3', '2022-06-07', '2022-06-15', '20%', NULL);
INSERT INTO `progress` VALUES (5, '项目3', '2022-06-07', '2022-06-15', '20%', NULL);
INSERT INTO `progress` VALUES (6, '项目3', '2022-06-07', '2022-06-15', '20%', NULL);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `isfinish` int(255) DEFAULT NULL,
  `updatetime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `charge` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '青钢剑', '2022-05-22 20:57:18', 10, '2022-05-27 07:10:44', '张三', '无');
INSERT INTO `project` VALUES (3, '意大利炮', '2022-05-24 12:57:24', 1, '2022-05-24 12:57:24', '李四', '无');
INSERT INTO `project` VALUES (4, '商品5', '2022-05-24 04:57:45', 1, '2022-05-24 04:57:45', '张三', '很好');
INSERT INTO `project` VALUES (5, '商品6', '2022-05-24 12:57:49', 11, '2022-05-24 12:57:49', '王五', '大项目');
INSERT INTO `project` VALUES (6, '商品7', '2022-05-24 12:57:52', 1, '2022-05-24 12:57:52', '李四', '最后做');
INSERT INTO `project` VALUES (7, '篮球鞋', '2022-05-24 13:02:04', 1, '2022-05-24 13:02:04', '罗翔', '无');

-- ----------------------------
-- Table structure for stuff_group
-- ----------------------------
DROP TABLE IF EXISTS `stuff_group`;
CREATE TABLE `stuff_group`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `charge` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `crew` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `task` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stuff_group
-- ----------------------------
INSERT INTO `stuff_group` VALUES (1, '张三', '小白，小红', '项目2');
INSERT INTO `stuff_group` VALUES (2, '李四', '小黄，小吕，老白', '项目11');
INSERT INTO `stuff_group` VALUES (3, '王五', '小灰，小喜，老刘', '项目5');
INSERT INTO `stuff_group` VALUES (4, '赵六', '老赵，小陈，小王', '项目7');
INSERT INTO `stuff_group` VALUES (5, '刘七', '老李，老陈，小紫', '项目9');
INSERT INTO `stuff_group` VALUES (6, '刘能', '小黑，老章，小绿', '项目11');

-- ----------------------------
-- Table structure for stuff_information
-- ----------------------------
DROP TABLE IF EXISTS `stuff_information`;
CREATE TABLE `stuff_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stuff_information
-- ----------------------------
INSERT INTO `stuff_information` VALUES (1, '张三', '男', '178588455', '4812522', '翻斗花园二号');
INSERT INTO `stuff_information` VALUES (3, '李四', '女', '1235498', '51315156', '翻斗花园3号');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自动加一',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8, 2) DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `desrip` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `creatr_time` timestamp(0) DEFAULT NULL,
  `modify_time` timestamp(0) DEFAULT NULL,
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `del` tinyint(1) DEFAULT NULL,
  `shelves` tinyint(1) DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accoun` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `authority` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '张三', '1');
INSERT INTO `user` VALUES (2, 'admin123', '123456', '李四', '2');

SET FOREIGN_KEY_CHECKS = 1;
