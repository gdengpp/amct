/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : amct

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2019-12-14 20:05:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for amct_icon_img
-- ----------------------------
DROP TABLE IF EXISTS `amct_icon_img`;
CREATE TABLE `amct_icon_img` (
  `id` varchar(64) NOT NULL,
  `url` varchar(64) DEFAULT NULL COMMENT '图标路径',
  `remark` varchar(255) DEFAULT NULL COMMENT '图标说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图标表，用来存放展示的图标提供给用户选择';

-- ----------------------------
-- Records of amct_icon_img
-- ----------------------------

-- ----------------------------
-- Table structure for amct_left_menu
-- ----------------------------
DROP TABLE IF EXISTS `amct_left_menu`;
CREATE TABLE `amct_left_menu` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '菜单名',
  `ename` varchar(64) DEFAULT NULL COMMENT '页面文件;数据库表名',
  `url` varchar(64) DEFAULT NULL COMMENT '菜单URL',
  `icon` varchar(64) DEFAULT NULL COMMENT '菜单前面的图标',
  `is_display` tinyint(2) DEFAULT NULL COMMENT '是否显示;0:不显示，1：显示',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明',
  `top_menu_id` varchar(64) DEFAULT NULL COMMENT '头部菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面左侧菜单表，用以加载左侧菜单';

-- ----------------------------
-- Records of amct_left_menu
-- ----------------------------
INSERT INTO `amct_left_menu` VALUES ('1', '菜单管理', 'menu', 'content/menu.jsp', '&#xe653;', '1', null, '1');
INSERT INTO `amct_left_menu` VALUES ('2', '日志管理', 'logs', 'content/logs.jsp', '&#xe60a;', '1', null, '1');

-- ----------------------------
-- Table structure for amct_left_menu_child
-- ----------------------------
DROP TABLE IF EXISTS `amct_left_menu_child`;
CREATE TABLE `amct_left_menu_child` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `ename` varchar(64) DEFAULT NULL COMMENT '页面文件;数据库表名',
  `url` varchar(64) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `parentid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_left_menu_child
-- ----------------------------

-- ----------------------------
-- Table structure for amct_menu_monitor
-- ----------------------------
DROP TABLE IF EXISTS `amct_menu_monitor`;
CREATE TABLE `amct_menu_monitor` (
  `id` varchar(64) NOT NULL,
  `menu_id` varchar(64) DEFAULT NULL COMMENT '菜单ID',
  `menu_name` varchar(64) DEFAULT NULL COMMENT '字段中文名',
  `menu_ename` varchar(64) DEFAULT NULL COMMENT '字段英文名',
  `type` varchar(16) DEFAULT NULL,
  `len` varchar(16) DEFAULT NULL,
  `is_query` varchar(8) DEFAULT NULL COMMENT '是否查询',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_menu_monitor
-- ----------------------------

-- ----------------------------
-- Table structure for amct_sys_logo
-- ----------------------------
DROP TABLE IF EXISTS `amct_sys_logo`;
CREATE TABLE `amct_sys_logo` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '系统名称',
  `url` varchar(64) DEFAULT NULL COMMENT 'logo地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_sys_logo
-- ----------------------------
INSERT INTO `amct_sys_logo` VALUES ('1', 'amct', 'static/image/woman.jpg');

-- ----------------------------
-- Table structure for amct_top_menu
-- ----------------------------
DROP TABLE IF EXISTS `amct_top_menu`;
CREATE TABLE `amct_top_menu` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '菜单名',
  `ename` varchar(64) DEFAULT NULL COMMENT '页面文件;数据库表名',
  `url` varchar(64) DEFAULT NULL COMMENT '菜单URL',
  `is_display` tinyint(2) DEFAULT NULL COMMENT '是否显示；0：不显示，1:显示',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面头部菜单表，用来加载头部菜单使用';

-- ----------------------------
-- Records of amct_top_menu
-- ----------------------------
INSERT INTO `amct_top_menu` VALUES ('1', '管理控制台', 'management', 'content/management.jsp', '1', null);

-- ----------------------------
-- Table structure for amct_user_info
-- ----------------------------
DROP TABLE IF EXISTS `amct_user_info`;
CREATE TABLE `amct_user_info` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `username` varchar(64) DEFAULT NULL COMMENT '用户账号',
  `password` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `sex` varchar(8) DEFAULT NULL,
  `age` int(8) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL COMMENT '头像路径',
  `phone` varchar(32) DEFAULT NULL COMMENT '用户电话号码',
  `email` varchar(64) DEFAULT NULL COMMENT '用户邮箱',
  `remark` varchar(255) DEFAULT NULL COMMENT '用户说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of amct_user_info
-- ----------------------------
INSERT INTO `amct_user_info` VALUES ('1', '邓朋朋', 'dengpp', '123', '男', '27', 'static/image/man.jpg', '18798477113', '1047267211@qq.com', 'title在html中属于特殊的节点');

-- ----------------------------
-- Table structure for amt_log
-- ----------------------------
DROP TABLE IF EXISTS `amt_log`;
CREATE TABLE `amt_log` (
  `id` varchar(64) NOT NULL,
  `user_name` varchar(64) DEFAULT NULL COMMENT '操作人',
  `log_date` datetime DEFAULT NULL COMMENT '操作时间',
  `opt` text COMMENT '日志内容',
  `status` varchar(32) DEFAULT NULL COMMENT '日志状态（debug/info/error）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amt_log
-- ----------------------------
