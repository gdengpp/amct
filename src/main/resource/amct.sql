/*
Navicat MySQL Data Transfer

Source Server         : amct192.168.202.144
Source Server Version : 50728
Source Host           : 192.168.202.144:3306
Source Database       : amct

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-12-01 08:14:26
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
  `tab_field` text COMMENT '表字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面左侧菜单表，用以加载左侧菜单';

-- ----------------------------
-- Records of amct_left_menu
-- ----------------------------
INSERT INTO `amct_left_menu` VALUES ('1', '菜单管理', 'menu', 'content/menu.jsp', '&#xe653;', '1', null, '1', null);

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
  `tab_field` text COMMENT '表字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_left_menu_child
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
-- Table structure for amct_test
-- ----------------------------
DROP TABLE IF EXISTS `amct_test`;
CREATE TABLE `amct_test` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `age` varchar(64) DEFAULT NULL,
  `sex` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_test
-- ----------------------------

-- ----------------------------
-- Table structure for amct_top_memu_child
-- ----------------------------
DROP TABLE IF EXISTS `amct_top_memu_child`;
CREATE TABLE `amct_top_memu_child` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `parentid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='头部子菜单20191122暂时废弃使用';

-- ----------------------------
-- Records of amct_top_memu_child
-- ----------------------------

-- ----------------------------
-- Table structure for amct_top_menu
-- ----------------------------
DROP TABLE IF EXISTS `amct_top_menu`;
CREATE TABLE `amct_top_menu` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '菜单名',
  `ename` varchar(64) DEFAULT NULL COMMENT '页面文件;数据库表名',
  `tab_field` text COMMENT '表字段',
  `url` varchar(64) DEFAULT NULL COMMENT '菜单URL',
  `is_display` tinyint(2) DEFAULT NULL COMMENT '是否显示；0：不显示，1:显示',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面头部菜单表，用来加载头部菜单使用';

-- ----------------------------
-- Records of amct_top_menu
-- ----------------------------
INSERT INTO `amct_top_menu` VALUES ('1', '管理控制台', 'management', null, 'content/management.jsp', '1', null);
INSERT INTO `amct_top_menu` VALUES ('1bf1d6e47b0641c591c4d0822cd09e12', '测试', 'test', 'name,age,sex', 'menu\\test.jsp', '1', '');

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
