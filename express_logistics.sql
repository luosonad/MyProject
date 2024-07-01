/*
 Navicat Premium Dump SQL

 Source Server         : zhuxingning
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : express_logistics

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 19/06/2024 11:31:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `ID` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员编号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员账号登录密码',
  `telephone_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员电话号码',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('001', '123456', '13255914685');
INSERT INTO `administrator` VALUES ('002', '123456', '13255914685');
INSERT INTO `administrator` VALUES ('003', '123456', '48498484977');
INSERT INTO `administrator` VALUES ('004', '123456', '13255914685');
INSERT INTO `administrator` VALUES ('006', '123456', '15646468488');

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express`  (
  `number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '快递单号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '快递物品名称',
  `pieces` int NOT NULL COMMENT '快递物品件数',
  `SenderName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '寄件人姓名',
  `senderTele` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '寄件人电话',
  `ReciAcc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人账号',
  `ReciName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人姓名',
  `ReciTele` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人号码',
  `ReciArea` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件地址',
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `ReciAcc`(`ReciAcc` ASC) USING BTREE,
  CONSTRAINT `ReciAcc` FOREIGN KEY (`ReciAcc`) REFERENCES `user` (`userAccount`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of express
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `userAccount` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户登录账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `ID_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户身份证号',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户姓名',
  `telephoneNumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户号码',
  PRIMARY KEY (`userAccount`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('小名号', '111111', '111111', '11', '11', '11');
INSERT INTO `user` VALUES ('受到', '222222', '222222', '22', '22', '22');

SET FOREIGN_KEY_CHECKS = 1;
