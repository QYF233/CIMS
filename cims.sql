/*
 Navicat Premium Data Transfer

 Source Server         : Mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : cims

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 03/10/2020 19:19:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for msg_answer
-- ----------------------------
DROP TABLE IF EXISTS `msg_answer`;
CREATE TABLE `msg_answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复消息ID',
  `msg_id` int(11) NOT NULL COMMENT '消息ID',
  `msg_receive_user_id` int(11) NOT NULL COMMENT '消息接收用户Id',
  `msg_state` int(11) NULL DEFAULT NULL COMMENT '0：未处理；1：已处理',
  `msg_answer_time` timestamp(0) NULL DEFAULT NULL COMMENT '消息回复时间',
  `msg_answer_content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息回复内容',
  `msg_vote` int(11) NULL DEFAULT NULL COMMENT '1：同意；2.不同意',
  `msg_vote_reason` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投票理由',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `msg_id`(`msg_id`) USING BTREE,
  INDEX `msg_receive_user_id`(`msg_receive_user_id`) USING BTREE,
  CONSTRAINT `msg_answer_ibfk_1` FOREIGN KEY (`msg_id`) REFERENCES `msg_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `msg_answer_ibfk_2` FOREIGN KEY (`msg_receive_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_info
-- ----------------------------
DROP TABLE IF EXISTS `msg_info`;
CREATE TABLE `msg_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `msg_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `msd_content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `msg_type` int(11) NOT NULL COMMENT '1：消息; 2：通知；3：投票',
  `msg_send_user_id` int(11) NOT NULL COMMENT '发送方ID',
  `msg_send_time` timestamp(0) NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `msg_send_user_id`(`msg_send_user_id`) USING BTREE,
  CONSTRAINT `msg_info_ibfk_1` FOREIGN KEY (`msg_send_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地域编号',
  `area_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地域名称',
  `area_type` int(11) NULL DEFAULT NULL COMMENT '地域类型（1：省；2：市；3：院校）',
  `area_parent_id` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `area_sort_num` int(11) NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `area_parent_id`(`area_parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES (1, '浙江省', 1, NULL, 1);
INSERT INTO `sys_area` VALUES (2, '江苏省', 1, NULL, 2);
INSERT INTO `sys_area` VALUES (3, '安徽省', 1, NULL, 3);
INSERT INTO `sys_area` VALUES (4, '杭州市', 2, 1, 1);
INSERT INTO `sys_area` VALUES (5, '宁波市', 2, 1, 2);
INSERT INTO `sys_area` VALUES (6, '温州市', 2, 1, 3);
INSERT INTO `sys_area` VALUES (7, '杭州职业技术学院', 3, 4, 1);
INSERT INTO `sys_area` VALUES (8, '浙江大学', 3, 4, 2);
INSERT INTO `sys_area` VALUES (9, '中国计量大学', 3, 4, 3);
INSERT INTO `sys_area` VALUES (10, '宁波大学', 3, 5, 1);
INSERT INTO `sys_area` VALUES (11, '宁波职业技术学院', 3, 5, 2);
INSERT INTO `sys_area` VALUES (12, '温州职业技术学院', 3, 6, 3);
INSERT INTO `sys_area` VALUES (13, '南京市', 2, 2, 1);
INSERT INTO `sys_area` VALUES (14, '苏州市', 2, 2, 2);
INSERT INTO `sys_area` VALUES (15, '南京大学', 3, 13, 1);
INSERT INTO `sys_area` VALUES (16, '苏州大学', 3, 14, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_operator_id` int(11) NOT NULL COMMENT '操作人',
  `user_operator_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `user_type` int(11) NULL DEFAULT NULL COMMENT '用户类型（1：平台管理员；2：院校管理员；3.院校人员）',
  `user_area_id` int(11) NULL DEFAULT NULL COMMENT '所属地域ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_area_id`(`user_area_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`user_area_id`) REFERENCES `sys_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (2, 'sysadmin', '123456', 1, '2020-09-26 19:50:42', 1, NULL);
INSERT INTO `sys_user` VALUES (3, 'hzvtc', '123456', 1, '2020-09-26 19:50:42', 2, 7);
INSERT INTO `sys_user` VALUES (4, 'zhangsan', '123456', 1, '2020-09-26 19:50:42', 3, 7);

-- ----------------------------
-- Table structure for sys_user_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_unit`;
CREATE TABLE `sys_user_unit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `unit_id` int(11) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE,
  CONSTRAINT `sys_user_unit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_unit_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_info
-- ----------------------------
DROP TABLE IF EXISTS `unit_info`;
CREATE TABLE `unit_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组件',
  `unit_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 单位名称',
  `unit_type_id` int(11) NULL DEFAULT NULL COMMENT '单位类别ID',
  `unit_sort_num` int(11) NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unit_type_id`(`unit_type_id`) USING BTREE,
  CONSTRAINT `unit_info_ibfk_1` FOREIGN KEY (`unit_type_id`) REFERENCES `unit_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_type
-- ----------------------------
DROP TABLE IF EXISTS `unit_type`;
CREATE TABLE `unit_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `unit_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `unit_type_sort_num` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `unit_type_area_id` int(11) NULL DEFAULT NULL COMMENT '所属地域ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unit_type_area_id`(`unit_type_area_id`) USING BTREE,
  CONSTRAINT `unit_type_ibfk_1` FOREIGN KEY (`unit_type_area_id`) REFERENCES `sys_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
