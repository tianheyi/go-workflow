/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : goworkflow

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 25/09/2023 00:50:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for execution
-- ----------------------------
DROP TABLE IF EXISTS `execution`;
CREATE TABLE `execution`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rev` int(0) NULL DEFAULT NULL,
  `proc_inst_id` int(0) NULL DEFAULT NULL,
  `proc_def_id` int(0) NULL DEFAULT NULL,
  `proc_def_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `node_infos` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(0) NULL DEFAULT NULL,
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `execution_proc_inst_id_proc_inst_id_foreign`(`proc_inst_id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE,
  CONSTRAINT `execution_proc_inst_id_proc_inst_id_foreign` FOREIGN KEY (`proc_inst_id`) REFERENCES `proc_inst` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of execution
-- ----------------------------

-- ----------------------------
-- Table structure for execution_history
-- ----------------------------
DROP TABLE IF EXISTS `execution_history`;
CREATE TABLE `execution_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rev` int(0) NULL DEFAULT NULL,
  `proc_inst_id` int(0) NULL DEFAULT NULL,
  `proc_def_id` int(0) NULL DEFAULT NULL,
  `proc_def_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `node_infos` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(0) NULL DEFAULT NULL,
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `execution_history_proc_inst_id_proc_inst_history_id_foreign`(`proc_inst_id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE,
  CONSTRAINT `execution_history_proc_inst_id_proc_inst_history_id_foreign` FOREIGN KEY (`proc_inst_id`) REFERENCES `proc_inst_history` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of execution_history
-- ----------------------------

-- ----------------------------
-- Table structure for identitylink
-- ----------------------------
DROP TABLE IF EXISTS `identitylink`;
CREATE TABLE `identitylink`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_id` int(0) NULL DEFAULT NULL,
  `step` int(0) NULL DEFAULT NULL,
  `proc_inst_id` int(0) NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `identitylink_proc_inst_id_proc_inst_id_foreign`(`proc_inst_id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE,
  CONSTRAINT `identitylink_proc_inst_id_proc_inst_id_foreign` FOREIGN KEY (`proc_inst_id`) REFERENCES `proc_inst` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for identitylink_history
-- ----------------------------
DROP TABLE IF EXISTS `identitylink_history`;
CREATE TABLE `identitylink_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_id` int(0) NULL DEFAULT NULL,
  `step` int(0) NULL DEFAULT NULL,
  `proc_inst_id` int(0) NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `identitylink_history_proc_inst_id_proc_inst_history_id_foreign`(`proc_inst_id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE,
  CONSTRAINT `identitylink_history_proc_inst_id_proc_inst_history_id_foreign` FOREIGN KEY (`proc_inst_id`) REFERENCES `proc_inst_history` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of identitylink_history
-- ----------------------------

-- ----------------------------
-- Table structure for proc_inst
-- ----------------------------
DROP TABLE IF EXISTS `proc_inst`;
CREATE TABLE `proc_inst`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `proc_def_id` int(0) NULL DEFAULT NULL COMMENT '流程定义表的主键ID',
  `proc_def_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `node_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前节点id',
  `candidate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `task_id` int(0) NULL DEFAULT NULL COMMENT '当前任务id',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前任务开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前任务结束时间',
  `duration` bigint(0) NULL DEFAULT NULL COMMENT '时长',
  `start_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始的用户id',
  `start_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始的用户名',
  `is_finished` tinyint(1) NULL DEFAULT 0 COMMENT '流程是否结束',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程实例表（即流程每个步骤节点审批记录）' ROW_FORMAT = Dynamic STATS_AUTO_RECALC = 1;

-- ----------------------------
-- Records of proc_inst
-- ----------------------------

-- ----------------------------
-- Table structure for proc_inst_history
-- ----------------------------
DROP TABLE IF EXISTS `proc_inst_history`;
CREATE TABLE `proc_inst_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `proc_def_id` int(0) NULL DEFAULT NULL,
  `proc_def_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `node_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `candidate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_id` int(0) NULL DEFAULT NULL,
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration` bigint(0) NULL DEFAULT NULL,
  `start_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_finished` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proc_inst_history
-- ----------------------------

-- ----------------------------
-- Table structure for procdef
-- ----------------------------
DROP TABLE IF EXISTS `procdef`;
CREATE TABLE `procdef`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `version` int(0) NULL DEFAULT NULL COMMENT '流程版本',
  `resource` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程定义json字符串',
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者用户名称',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者所在公司',
  `deploy_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者定义流程的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of procdef
-- ----------------------------

-- ----------------------------
-- Table structure for procdef_history
-- ----------------------------
DROP TABLE IF EXISTS `procdef_history`;
CREATE TABLE `procdef_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT NULL,
  `resource` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deploy_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of procdef_history
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `node_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `step` int(0) NULL DEFAULT NULL,
  `proc_inst_id` int(0) NULL DEFAULT NULL,
  `assignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `claim_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_count` tinyint(0) NULL DEFAULT 1,
  `un_complete_num` tinyint(0) NULL DEFAULT 1,
  `agree_num` tinyint(0) NULL DEFAULT NULL,
  `act_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'or',
  `is_finished` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_proc_inst_id_proc_inst_id_foreign`(`proc_inst_id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE,
  CONSTRAINT `task_proc_inst_id_proc_inst_id_foreign` FOREIGN KEY (`proc_inst_id`) REFERENCES `proc_inst` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for task_history
-- ----------------------------
DROP TABLE IF EXISTS `task_history`;
CREATE TABLE `task_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `node_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `step` int(0) NULL DEFAULT NULL,
  `proc_inst_id` int(0) NULL DEFAULT NULL,
  `assignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `claim_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_count` tinyint(0) NULL DEFAULT 1,
  `un_complete_num` tinyint(0) NULL DEFAULT 1,
  `agree_num` tinyint(0) NULL DEFAULT NULL,
  `act_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'or',
  `is_finished` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_history
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
