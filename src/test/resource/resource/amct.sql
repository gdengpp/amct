/*
Navicat MySQL Data Transfer

Source Server         : amct192.168.202.144
Source Server Version : 50728
Source Host           : 192.168.202.144:3306
Source Database       : amct

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-12-31 16:22:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for amct_icon_img
-- ----------------------------
DROP TABLE IF EXISTS `amct_icon_img`;
CREATE TABLE `amct_icon_img` (
  `id` varchar(64) NOT NULL,
  `icon_class` varchar(64) DEFAULT NULL COMMENT '图标路径',
  `icon_name` varchar(32) DEFAULT NULL,
  `icon_code` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '图标说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图标表，用来存放展示的图标提供给用户选择';

-- ----------------------------
-- Records of amct_icon_img
-- ----------------------------
INSERT INTO `amct_icon_img` VALUES ('013f2f53-0fc3-48d1-9b3a-507111335092', 'layui-icon layui-icon-praise', '赞', '&#xe6c6;', 'layui-icon-praise');
INSERT INTO `amct_icon_img` VALUES ('03ed8548-0d66-4b37-92c9-5e6924d04136', 'layui-icon layui-icon-template-1', '模板', '&#xe656;', 'layui-icon-template-1');
INSERT INTO `amct_icon_img` VALUES ('04f74fe5-7075-46a1-b0aa-8ff13550c169', 'layui-icon layui-icon-login-wechat', '微信', '&#xe677;', 'layui-icon-login-wechat');
INSERT INTO `amct_icon_img` VALUES ('06291d76-1f62-4270-b60b-525f61f53e55', 'layui-icon layui-icon-face-smile-b', '表情-笑-粗', '&#xe650;', 'layui-icon-face-smile-b');
INSERT INTO `amct_icon_img` VALUES ('084164ec-5cc9-4bfb-8349-975528f76c91', 'layui-icon layui-icon-login-weibo', '微博', '&#xe675;', 'layui-icon-login-weibo');
INSERT INTO `amct_icon_img` VALUES ('08d59d54-8264-4177-8c5e-9e9496d36492', 'layui-icon layui-icon-login-qq', 'QQ', '&#xe676;', 'layui-icon-login-qq');
INSERT INTO `amct_icon_img` VALUES ('09101d93-a682-47a3-b2d3-910b5f65d858', 'layui-icon layui-icon-senior', '高级', '&#xe674;', 'layui-icon-senior');
INSERT INTO `amct_icon_img` VALUES ('095ef9f7-3c22-4b34-b4f4-f90610cbb465', 'layui-icon layui-icon-align-left', '左对齐', '&#xe649;', 'layui-icon-align-left');
INSERT INTO `amct_icon_img` VALUES ('0d54c704-c7b6-4847-ae93-832d787b09ae', 'layui-icon layui-icon-download-circle', '下载-圆圈', '&#xe601;', 'layui-icon-download-circle');
INSERT INTO `amct_icon_img` VALUES ('0ff37332-db37-4205-8b53-fd1e0b572282', 'layui-icon layui-icon-play', '播放', '&#xe652;', 'layui-icon-play');
INSERT INTO `amct_icon_img` VALUES ('10d016a5-23a5-4891-9466-373511edf9fb', 'layui-icon layui-icon-circle-dot', '圆点', '&#xe617;', 'layui-icon-circle-dot');
INSERT INTO `amct_icon_img` VALUES ('11ff8ece-bc60-4b6f-8ec1-d65956fe93d9', 'layui-icon layui-icon-cart-simple', '购物车', '&#xe698;', 'layui-icon-cart-simple');
INSERT INTO `amct_icon_img` VALUES ('13c5a1ae-a846-4a50-aa89-6d1eb819016b', 'layui-icon layui-icon-note', '便签', '&#xe66e;', 'layui-icon-note');
INSERT INTO `amct_icon_img` VALUES ('166c13cb-dfc4-4ce4-bd99-b8c25b7c87c3', 'layui-icon layui-icon-templeate-1', '选择模板', '&#xe630;', 'layui-icon-templeate-1');
INSERT INTO `amct_icon_img` VALUES ('166ce803-fd31-4ef3-9454-6c95a54834ab', 'layui-icon layui-icon-diamond', '钻石-等级', '&#xe735;', 'layui-icon-diamond');
INSERT INTO `amct_icon_img` VALUES ('175d839d-eae4-4608-89a0-033b2026447a', 'layui-icon layui-icon-voice', '语音-声音', '&#xe688;', 'layui-icon-voice');
INSERT INTO `amct_icon_img` VALUES ('1dd4a6a6-6d59-4f6a-beb6-015c1eb280fb', 'layui-icon layui-icon-cellphone', '手机', ' &#xe678;', 'layui-icon-cellphone');
INSERT INTO `amct_icon_img` VALUES ('205a6f9f-33d6-4dc2-a9db-bb82d961223c', 'layui-icon layui-icon-help', '帮助', '&#xe607;', 'layui-icon-help');
INSERT INTO `amct_icon_img` VALUES ('22b1ce90-dd5f-4ed1-bd20-06e25fdeefbf', 'layui-icon layui-icon-fonts-clear', '文字格式化', '&#xe639;', 'layui-icon-fonts-clear');
INSERT INTO `amct_icon_img` VALUES ('26be0fa6-abb1-4c36-9972-d951f9941c4e', 'layui-icon layui-icon-tree', '树', '&#xe62e;', 'layui-icon-tree');
INSERT INTO `amct_icon_img` VALUES ('2bc51c79-e71e-4661-a47f-c23ae295c4a4', 'layui-icon layui-icon-home', '主页', '&#xe68e;', 'layui-icon-home');
INSERT INTO `amct_icon_img` VALUES ('2c05708b-c0b4-4bdd-b881-ed6c2410163b', 'layui-icon layui-icon-upload', '上传-实心', '&#xe67c;', 'layui-icon-upload');
INSERT INTO `amct_icon_img` VALUES ('303f31ab-3133-41a5-92c8-1cae3a2aa4ff', 'layui-icon layui-icon-headset', '音频-耳机', '&#xe6fc;', 'layui-icon-headset');
INSERT INTO `amct_icon_img` VALUES ('33b9a98f-7bae-4a02-8e56-630a4e6ae780', 'layui-icon layui-icon-tips', '提示说明', '&#xe702;', 'layui-icon-tips');
INSERT INTO `amct_icon_img` VALUES ('38747dbd-a2d5-4c40-bfb0-a867908dcbdb', 'layui-icon layui-icon-close', '关闭-空心', '&#x1006;', 'layui-icon-close');
INSERT INTO `amct_icon_img` VALUES ('3b5b23e2-c67f-446c-917e-7f3394beeef7', 'layui-icon layui-icon-layouts', '布局', '&#xe632;', 'layui-icon-layouts');
INSERT INTO `amct_icon_img` VALUES ('3e4040b1-b5a3-40a4-8db1-d30567129b6c', 'layui-icon layui-icon-survey', '调查', '&#xe6b2;', 'layui-icon-survey');
INSERT INTO `amct_icon_img` VALUES ('419d0986-45e8-46ad-af3c-21c3a982f214', 'layui-icon layui-icon-up', '箭头 向上', '&#xe619;', 'layui-icon-up');
INSERT INTO `amct_icon_img` VALUES ('43f607f5-9fc2-4970-b9cf-c14885b0c7f6', 'layui-icon layui-icon-close-fill', '关闭-实心', '&#x1007;', 'layui-icon-close-fill');
INSERT INTO `amct_icon_img` VALUES ('44101e6e-6bf2-4145-8df5-f289b8dd2344', 'layui-icon layui-icon-rate-solid', '星星-实心', '&#xe67a;', 'layui-icon-rate-solid');
INSERT INTO `amct_icon_img` VALUES ('4522f13e-e081-4bd0-8696-f28f50305902', 'layui-icon layui-icon-shrink-right', '右向左伸缩菜单', '&#xe668;', 'layui-icon-shrink-right');
INSERT INTO `amct_icon_img` VALUES ('46e436da-1774-4260-b2f4-160a6d662f3e', 'layui-icon layui-icon-set-fill', '设置-实心', '&#xe614;', 'layui-icon-set-fill');
INSERT INTO `amct_icon_img` VALUES ('490b79b5-7536-4e39-9011-d488168fda81', 'layui-icon layui-icon-align-right', '右对齐', '&#xe648;', 'layui-icon-align-right');
INSERT INTO `amct_icon_img` VALUES ('49969ddf-e6f8-4246-8262-6912f5f86777', 'layui-icon layui-icon-notice', '消息-通知', '&#xe667;', 'layui-icon-notice');
INSERT INTO `amct_icon_img` VALUES ('4aaad4be-52e7-4c7f-bde4-6895f00880dc', 'layui-icon layui-icon-location', '位置-地图', '&#xe715;', 'layui-icon-location');
INSERT INTO `amct_icon_img` VALUES ('4ad409ac-57c9-4b1f-b227-b9158064f6db', 'layui-icon layui-icon-search', '搜索', '&#xe615;', 'layui-icon-search');
INSERT INTO `amct_icon_img` VALUES ('4e5b7cee-c562-4949-97a7-0425484781fe', 'layui-icon layui-icon-rate', '星星-空心', '&#xe67b;', 'layui-icon-rate');
INSERT INTO `amct_icon_img` VALUES ('4e91a2a1-b5c4-462b-904c-9c1cdafd9a19', 'layui-icon layui-icon-set', '设置-空心', '&#xe716;', 'layui-icon-set');
INSERT INTO `amct_icon_img` VALUES ('4e9d65c0-7056-41b7-a881-6dc85ceeeb8f', 'layui-icon layui-icon-file', '文件', '&#xe621;', 'layui-icon-file');
INSERT INTO `amct_icon_img` VALUES ('507f832b-1dd8-4fe3-a849-37785336dd92', 'layui-icon layui-icon-left', '箭头 向左', '&#xe603;', 'layui-icon-left');
INSERT INTO `amct_icon_img` VALUES ('59707f8d-ef2d-4b31-b256-cc6bf2ba6fa2', 'layui-icon layui-icon-website', '网站', '&#xe7ae;', 'layui-icon-website');
INSERT INTO `amct_icon_img` VALUES ('597f7809-a845-46d7-950b-e1304e94e139', 'layui-icon layui-icon-return', '返回', '&#xe65c;', 'layui-icon-return');
INSERT INTO `amct_icon_img` VALUES ('59d647af-4303-4bd8-902b-c618fce73448', 'layui-icon layui-icon-form', '表单', '&#xe63c;', 'layui-icon-form');
INSERT INTO `amct_icon_img` VALUES ('5a5275a6-c600-4261-abef-f4bc4c191b25', 'layui-icon layui-icon-auz', '授权', '&#xe672;', 'layui-icon-auz');
INSERT INTO `amct_icon_img` VALUES ('5ab2dff3-df67-4749-9aaa-918b66875ea3', 'layui-icon layui-icon-female', '女', '&#xe661;', 'layui-icon-female');
INSERT INTO `amct_icon_img` VALUES ('5adb820c-f1af-46a6-a584-a302bda51584', 'layui-icon layui-icon-fonts-code', '代码', '&#xe64e;', 'layui-icon-fonts-code');
INSERT INTO `amct_icon_img` VALUES ('5bd0c261-1885-41fa-9ce8-fa157a6a8fd1', 'layui-icon layui-icon-edit', '编辑', '&#xe642;', 'layui-icon-edit');
INSERT INTO `amct_icon_img` VALUES ('5e2d4ee0-a790-4d3c-9aa6-69cba6b03a74', 'layui-icon layui-icon-link', '链接', '&#xe64c;', 'layui-icon-link');
INSERT INTO `amct_icon_img` VALUES ('5f699e59-55cd-46fb-86ef-42978bf1161d', 'layui-icon layui-icon-camera-fill', '相机-实心', '&#xe65d;', 'layui-icon-camera-fill');
INSERT INTO `amct_icon_img` VALUES ('604563b5-e847-4b6d-bc6d-a7bcd1cf0a8e', 'layui-icon layui-icon-triangle-r', '右三角', '&#xe623;', 'layui-icon-triangle-r');
INSERT INTO `amct_icon_img` VALUES ('613feeff-6f99-444e-88e4-5fdf1e2f57b6', 'layui-icon layui-icon-refresh-3', '刷新-粗', '&#xe9aa;', 'layui-icon-refresh-3');
INSERT INTO `amct_icon_img` VALUES ('62a29451-bc8b-4e8c-b8de-9b70a185ba2b', 'layui-icon layui-icon-right', '箭头 向右', '&#xe602;', 'layui-icon-right');
INSERT INTO `amct_icon_img` VALUES ('65f3ead8-e0d2-42ce-803f-bd8db70d368e', 'layui-icon layui-icon-friends', '好友', '&#xe612;', 'layui-icon-friends');
INSERT INTO `amct_icon_img` VALUES ('6679d8df-a14c-47b0-a83c-dc703bbb32c8', 'layui-icon layui-icon-down', '箭头 向下', '&#xe61a;', 'layui-icon-down');
INSERT INTO `amct_icon_img` VALUES ('66ef5b3e-3009-4e2e-9940-7532b48b6a76', 'layui-icon layui-icon-face-cry', '表情-哭泣', '&#xe69c;', 'layui-icon-face-cry');
INSERT INTO `amct_icon_img` VALUES ('67f70833-ea75-43fb-b531-eb7ae3642948', 'layui-icon layui-icon-fonts-strong', '字体加粗', '&#xe62b;', 'layui-icon-fonts-strong');
INSERT INTO `amct_icon_img` VALUES ('6b9f4bfb-67be-42a9-8824-bbefa62b2edb', 'layui-icon layui-icon-radio', '单选框-选中', '&#xe643;', 'layui-icon-radio');
INSERT INTO `amct_icon_img` VALUES ('6c69f6c5-acd6-44dd-9675-62946e191f0f', 'layui-icon layui-icon-water', '水 下雨', '&#xe636;', 'layui-icon-water');
INSERT INTO `amct_icon_img` VALUES ('6de14b63-0795-4dbf-8a15-413d47ff862c', 'layui-icon layui-icon-component', '组件', '&#xe857;', 'layui-icon-component');
INSERT INTO `amct_icon_img` VALUES ('6fe75d1c-dd1d-4660-aea2-a4a22ed449c4', 'layui-icon layui-icon-loading-1', 'loading', '&#xe63e;', 'layui-icon-loading-1');
INSERT INTO `amct_icon_img` VALUES ('7023ae70-eaa4-4cdc-9ecf-e608a2722479', 'layui-icon layui-icon-face-smile-fine', '表情-笑-细体', '&#xe60c;', 'layui-icon-face-smile-fine');
INSERT INTO `amct_icon_img` VALUES ('75b45f4a-2d77-4064-8556-6f25a1f9f419', 'layui-icon layui-icon-group', '群组', '&#xe613;', 'layui-icon-group');
INSERT INTO `amct_icon_img` VALUES ('75f05ed7-09f4-4f6a-b574-b653c8002261', 'layui-icon layui-icon-theme', '主题', '&#xe66a;', 'layui-icon-theme');
INSERT INTO `amct_icon_img` VALUES ('766fe839-7a64-4bd3-b6d3-9f88bddde12b', 'layui-icon layui-icon-camera', '相机-空心', '&#xe660;', 'layui-icon-camera');
INSERT INTO `amct_icon_img` VALUES ('7682823b-0040-4f50-888e-c5cfeae1ea7e', 'layui-icon layui-icon-fire', '火', '&#xe756;', 'layui-icon-fire');
INSERT INTO `amct_icon_img` VALUES ('771a153c-32e5-4486-afc5-508855981976', 'layui-icon layui-icon-pause', '暂停', '&#xe651;', 'layui-icon-pause');
INSERT INTO `amct_icon_img` VALUES ('7c4a4aea-3898-4a77-81a7-a317b7a12425', 'layui-icon layui-icon-circle', '单选框-候选', '&#xe63f;', 'layui-icon-circle');
INSERT INTO `amct_icon_img` VALUES ('7e045436-4556-4f77-8069-595b8e9dc04d', 'layui-icon layui-icon-upload-circle', '上传-圆圈', '&#xe62f;', 'layui-icon-upload-circle');
INSERT INTO `amct_icon_img` VALUES ('7f0cfbd5-cf24-41bf-93c2-bfde70ba4a06', 'layui-icon layui-icon-chart-screen', '图标 报表 屏幕', '&#xe629;', 'layui-icon-chart-screen');
INSERT INTO `amct_icon_img` VALUES ('850a2eaf-5873-42c6-b131-8addfcc9cfdd', 'layui-icon layui-icon-fonts-del', '删除线', '&#xe64f;', 'layui-icon-fonts-del');
INSERT INTO `amct_icon_img` VALUES ('88186bcf-9f77-4ff9-8133-82901340b14b', 'layui-icon layui-icon-male', '男', '&#xe662;', 'layui-icon-male');
INSERT INTO `amct_icon_img` VALUES ('8a9bc945-cb98-4a4c-8bce-809e65bfc8d8', 'layui-icon layui-icon-unlink', '删除链接', '&#xe64d;', 'layui-icon-unlink');
INSERT INTO `amct_icon_img` VALUES ('8b8b3e88-9c28-427e-8c91-6772faa199ad', 'layui-icon layui-icon-chat', '客服', '&#xe606;', 'layui-icon-chat');
INSERT INTO `amct_icon_img` VALUES ('8ffe876a-780f-4dd2-9835-52c109a69405', 'layui-icon layui-icon-prev-circle', '翻页', '&#xe633;', 'layui-icon-prev-circle');
INSERT INTO `amct_icon_img` VALUES ('911be484-f748-4997-801f-9c004d82c025', 'layui-icon layui-icon-release', '发布 纸飞机', '&#xe609;', 'layui-icon-release');
INSERT INTO `amct_icon_img` VALUES ('9605efe4-e1a9-4059-afc4-34737772be8f', 'layui-icon layui-icon-add-circle-fine  ', '添加-圆圈-细体', '&#xe608;', 'layui-icon-add-circle-fine  ');
INSERT INTO `amct_icon_img` VALUES ('961e6122-e94a-45ae-b482-0ee442fb065f', 'layui-icon layui-icon-code-circle', '代码-圆圈', '&#xe635;', 'layui-icon-code-circle');
INSERT INTO `amct_icon_img` VALUES ('9a1f692d-00fb-4f69-a28c-124a982ae0d0', 'layui-icon layui-icon-template', '模板', '&#xe663;', 'layui-icon-template');
INSERT INTO `amct_icon_img` VALUES ('9a2f3d07-bb7a-4e2a-882c-715f980853d6', 'layui-icon layui-icon-more', '菜单-水平', '&#xe65f;', 'layui-icon-more');
INSERT INTO `amct_icon_img` VALUES ('9b9bebd1-27c2-47e1-84fe-d6b608c45e93', 'layui-icon layui-icon-tabs', 'Tabs 选项卡', '&#xe62a;', 'layui-icon-tabs');
INSERT INTO `amct_icon_img` VALUES ('9bb58a99-8d3b-4319-b7e7-93b37fc0eeeb', 'layui-icon layui-icon-about', '关于', '&#xe60b;', 'layui-icon-about');
INSERT INTO `amct_icon_img` VALUES ('9c2a470c-297a-49cc-893d-d94b40a12b40', 'layui-icon layui-icon-refresh-1', '刷新', '&#xe666;', 'layui-icon-refresh-1');
INSERT INTO `amct_icon_img` VALUES ('9c5587d4-7e0e-4017-9cca-6d028cf722b1', 'layui-icon layui-icon-align-center', '居中对齐', '&#xe647;', 'layui-icon-align-center');
INSERT INTO `amct_icon_img` VALUES ('9d4f493f-30d5-4aa0-a3da-faf65cb95ec7', 'layui-icon layui-icon-refresh', '刷新', '&#xe669;', 'layui-icon-refresh');
INSERT INTO `amct_icon_img` VALUES ('9e7a27bf-a08d-4f29-8cf1-bdc963a123d9', 'layui-icon layui-icon-layer', '窗口', '&#xe638;', 'layui-icon-layer');
INSERT INTO `amct_icon_img` VALUES ('a0d986f7-b282-47a8-9fd2-8e64e617ccb0', 'layui-icon layui-icon-404', '404', '&#xe61c;', 'layui-icon-404');
INSERT INTO `amct_icon_img` VALUES ('a3a5daac-0549-47e8-902a-7d62af91cfd4', 'layui-icon layui-icon-date', '日期', '&#xe637;', 'layui-icon-date');
INSERT INTO `amct_icon_img` VALUES ('a444da2c-6d82-4262-a3e4-afe716b467c0', 'layui-icon layui-icon-loading', 'loading', '&#xe63d;', 'layui-icon-loading');
INSERT INTO `amct_icon_img` VALUES ('a4fb7e65-8109-4370-90cc-873751484b1b', 'layui-icon layui-icon-carousel', '轮播组图', '&#xe634;', 'layui-icon-carousel');
INSERT INTO `amct_icon_img` VALUES ('a6e0bf55-34d1-4c1c-8ee2-3df3e778f48f', 'layui-icon layui-icon-read', '办公-阅读', '&#xe705;', 'layui-icon-read');
INSERT INTO `amct_icon_img` VALUES ('a6f1978f-03a0-4035-9373-a6d210b8652f', 'layui-icon layui-icon-upload-drag', '上传-空心-拖拽', '&#xe681;', 'layui-icon-upload-drag');
INSERT INTO `amct_icon_img` VALUES ('a817f66d-9fd7-4970-8901-1b43cae66307', 'layui-icon layui-icon-video', '视频', '&#xe6ed;', 'layui-icon-video');
INSERT INTO `amct_icon_img` VALUES ('a835318e-e99f-4aca-b6cf-cb380d47bc27', 'layui-icon layui-icon-menu-fill', '菜单 隐身 实心', '&#xe60f;', 'layui-icon-menu-fill');
INSERT INTO `amct_icon_img` VALUES ('a8c66606-83b4-4ecb-984a-0a613d8fdc84', 'layui-icon layui-icon-triangle-d', '下三角', '&#xe625;', 'layui-icon-triangle-d');
INSERT INTO `amct_icon_img` VALUES ('ab280c69-9c6d-4f48-adaa-3f201bbe84d2', 'layui-icon layui-icon-set-sm', '设置-小型', '&#xe620;', 'layui-icon-set-sm');
INSERT INTO `amct_icon_img` VALUES ('aca7649b-8ffc-49eb-8e24-1453d51c9512', 'layui-icon layui-icon-dollar', '金额-美元', '&#xe659;', 'layui-icon-dollar');
INSERT INTO `amct_icon_img` VALUES ('aeec26ac-d7d5-4142-a235-30427bff9cfc', 'layui-icon layui-icon-engine', '引擎', '&#xe628;', 'layui-icon-engine');
INSERT INTO `amct_icon_img` VALUES ('af33e5fa-b27a-4276-8c4a-f6bb49e4dc0b', 'layui-icon layui-icon-add-1', '添加', '&#xe654;', 'layui-icon-add-1');
INSERT INTO `amct_icon_img` VALUES ('b0128b12-8df1-40b5-907d-8ae19a97fbe9', 'layui-icon layui-icon-table', '表格', '&#xe62d;', 'layui-icon-table');
INSERT INTO `amct_icon_img` VALUES ('b4f11180-e76c-4bbe-b7a5-7cbf898851d1', 'layui-icon layui-icon-log', '记录', '&#xe60e;', 'layui-icon-log');
INSERT INTO `amct_icon_img` VALUES ('b5494651-5e87-461b-9fe9-a92fe6f95d90', 'layui-icon layui-icon-find-fill', '发现-实心', '&#xe670;', 'layui-icon-find-fill');
INSERT INTO `amct_icon_img` VALUES ('b80c9029-3451-4b9e-8a42-a58efca8633a', 'layui-icon layui-icon-ok-circle', '正确', '&#x1005;', 'layui-icon-ok-circle');
INSERT INTO `amct_icon_img` VALUES ('b82c4270-6331-4623-8f50-d8cc5ad5c025', 'layui-icon layui-icon-delete', '删除', '&#xe640;', 'layui-icon-delete');
INSERT INTO `amct_icon_img` VALUES ('bbc240d7-3d3a-4f19-952d-7ffa33f77a32', 'layui-icon layui-icon-password', '密码', '&#xe673;', 'layui-icon-password');
INSERT INTO `amct_icon_img` VALUES ('bd49f217-28f2-46cd-ae4b-49a0eba8dc92', 'layui-icon layui-icon-add-circle', '添加-圆圈', '&#xe61f;', 'layui-icon-add-circle');
INSERT INTO `amct_icon_img` VALUES ('bdb55ef8-4bb5-42a8-94b5-b5682ece6b8d', 'layui-icon layui-icon-more-vertical', '菜单-垂直', '&#xe671;', 'layui-icon-more-vertical');
INSERT INTO `amct_icon_img` VALUES ('bf5cff21-a121-4f72-9156-1bbfd6be093f', 'layui-icon layui-icon-top', 'top 置顶', '&#xe604;', 'layui-icon-top');
INSERT INTO `amct_icon_img` VALUES ('c0ec12f5-13e9-47f3-8f4c-d2315e0b745d', 'layui-icon layui-icon-star-fill', '收藏-实心', '&#xe658;', 'layui-icon-star-fill');
INSERT INTO `amct_icon_img` VALUES ('c3c1dba2-5cd5-472e-921b-326b31530030', 'layui-icon layui-icon-fonts-u', '字体-下划线', '&#xe646;', 'layui-icon-fonts-u');
INSERT INTO `amct_icon_img` VALUES ('c620e72f-56d2-4997-be7e-0e13b795883f', 'layui-icon layui-icon-console', '控制台', '&#xe665;', 'layui-icon-console');
INSERT INTO `amct_icon_img` VALUES ('c6e615a6-3176-46db-9879-71295d42b795', 'layui-icon layui-icon-spread-left', '左向右伸缩菜单', '&#xe66b;', 'layui-icon-spread-left');
INSERT INTO `amct_icon_img` VALUES ('c9ae28cc-3be3-49fe-bd88-bf73c4cb1b4c', 'layui-icon layui-icon-reply-fill', '回复 评论 实心', '&#xe611;', 'layui-icon-reply-fill');
INSERT INTO `amct_icon_img` VALUES ('cba33ea8-1a34-47a9-8ced-14a161b1b99f', 'layui-icon layui-icon-next', '下一页', '&#xe65b;', 'layui-icon-next');
INSERT INTO `amct_icon_img` VALUES ('ce831a54-eb41-4445-ba2d-25287d3a9c40', 'layui-icon layui-icon-star', '收藏-空心', '&#xe600;', 'layui-icon-star');
INSERT INTO `amct_icon_img` VALUES ('d19b7bd5-41c9-469e-ba59-9c5c78a2b648', 'layui-icon layui-icon-prev', '上一页', '&#xe65a;', 'layui-icon-prev');
INSERT INTO `amct_icon_img` VALUES ('d2095e47-45ad-43a8-a7d7-951ce77c4442', 'layui-icon layui-icon-chart', '图表', '&#xe62c;', 'layui-icon-chart');
INSERT INTO `amct_icon_img` VALUES ('d2324037-3db2-4845-a1f7-09b637861477', 'layui-icon layui-icon-util', '工具', '&#xe631;', 'layui-icon-util');
INSERT INTO `amct_icon_img` VALUES ('d25ad79c-19a1-401b-8887-a973288ac135', 'layui-icon layui-icon-tread', '踩', '&#xe6c5;', 'layui-icon-tread');
INSERT INTO `amct_icon_img` VALUES ('d2c4623c-1d2d-4a6f-a087-6e75a9679576', 'layui-icon layui-icon-face-smile', '表情-微笑', '&#xe6af;', 'layui-icon-face-smile');
INSERT INTO `amct_icon_img` VALUES ('d595bae6-2519-45ee-8358-a2f8fbb029d3', 'layui-icon layui-icon-vercode  ', '验证码', '&#xe679;', 'layui-icon-vercode');
INSERT INTO `amct_icon_img` VALUES ('d76715ff-1351-4009-b9c9-0167cb9d629c', 'layui-icon layui-icon-cart', '购物车', '&#xe657;', 'layui-icon-cart');
INSERT INTO `amct_icon_img` VALUES ('da31e536-31c4-44d2-8ec3-6b954a76698f', 'layui-icon layui-icon-picture-fine', '图片-细体', '&#xe60d;', 'layui-icon-picture-fine');
INSERT INTO `amct_icon_img` VALUES ('dba9bb86-563c-4a09-8d70-ab6626e8ca5c', 'layui-icon layui-icon-rate-half', '半星', '&#xe6c9;', 'layui-icon-rate-half');
INSERT INTO `amct_icon_img` VALUES ('dbc2cf36-93b1-4aa8-9685-88df04794f02', 'layui-icon layui-icon-rmb', '金额-人民币', '&#xe65e;', 'layui-icon-rmb');
INSERT INTO `amct_icon_img` VALUES ('ddf4a581-a64f-47dd-a439-60c8ad8679aa', 'layui-icon layui-icon-list', '列表', '&#xe60a;', 'layui-icon-list');
INSERT INTO `amct_icon_img` VALUES ('de6f2f71-b165-49d9-93fd-fe12afb13db2', 'layui-icon layui-icon-flag', '旗帜', '&#xe66c;', 'layui-icon-flag');
INSERT INTO `amct_icon_img` VALUES ('e452b2a3-a428-4eb7-beb2-5dc0992d1ac0', 'layui-icon layui-icon-user', '用户', '&#xe770;', 'layui-icon-user');
INSERT INTO `amct_icon_img` VALUES ('e474755e-093b-452c-8362-aaed394023ae', 'layui-icon layui-icon-username', '用户名', '&#xe66f;', 'layui-icon-username');
INSERT INTO `amct_icon_img` VALUES ('e73abca2-6ee1-491a-bf19-7d520e0da1eb', 'layui-icon layui-icon-ok', '对 OK', '&#xe605;', 'layui-icon-ok');
INSERT INTO `amct_icon_img` VALUES ('e874b622-17b5-4ed4-a57d-cbcb7dc54a01', 'layui-icon layui-icon-cellphone-fine', '手机-细体', '&#xe63b;', 'layui-icon-cellphone-fine');
INSERT INTO `amct_icon_img` VALUES ('e9911731-6900-44a2-800b-1413ab8368ff', 'layui-icon layui-icon-snowflake', '雪花', '&#xe6b1;', 'layui-icon-snowflake');
INSERT INTO `amct_icon_img` VALUES ('ea85ca68-cd6b-4adc-b2e0-30ff03557e69', 'layui-icon layui-icon-fonts-html', 'HTML', '&#xe64b;', 'layui-icon-fonts-html');
INSERT INTO `amct_icon_img` VALUES ('ebf95b4e-6b49-43bd-ac71-b3e99ae8e023', 'layui-icon layui-icon-share', '分享', '&#xe641;', 'layui-icon-share');
INSERT INTO `amct_icon_img` VALUES ('ec099ca8-6fdb-4510-9f99-07e3d756675f', 'layui-icon layui-icon-dialogue', '聊天 对话 沟通', '&#xe63a;', 'layui-icon-dialogue');
INSERT INTO `amct_icon_img` VALUES ('ed97ca04-9aff-42be-bc3a-9adfebe1e575', 'layui-icon layui-icon-speaker', '消息-通知-喇叭', '&#xe645;', 'layui-icon-speaker');
INSERT INTO `amct_icon_img` VALUES ('f4713f64-5371-4ddd-a461-2f0682482442', 'layui-icon layui-icon-face-surprised', '表情-惊讶', '&#xe664;', 'layui-icon-face-surprised');
INSERT INTO `amct_icon_img` VALUES ('f5dbc7bf-2a5b-49c1-b205-b9d8658f4f76', 'layui-icon layui-icon-app', '应用', '&#xe653;', 'layui-icon-app');
INSERT INTO `amct_icon_img` VALUES ('f78331ac-99cf-4ef8-93fa-9757f2600a71', 'layui-icon layui-icon-fonts-i', '字体-斜体', '&#xe644;', 'layui-icon-fonts-i');
INSERT INTO `amct_icon_img` VALUES ('f950b758-0760-461e-ab92-2c4e811bb689', 'layui-icon layui-icon-picture', '图片', '&#xe64a;', 'layui-icon-picture');
INSERT INTO `amct_icon_img` VALUES ('fd95edf5-f416-4586-a9b8-a1868ed3576b', 'layui-icon layui-icon-file-b', '文件-粗', '&#xe655;', 'layui-icon-file-b');

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
INSERT INTO `amct_left_menu` VALUES ('11', '菜单管理', 'menu', 'content/menu.jsp', '&#xe653;', '1', null, '1');
INSERT INTO `amct_left_menu` VALUES ('22', '日志管理', 'logs', 'content/logs.jsp', '&#xe60a;', '1', null, '1');
INSERT INTO `amct_left_menu` VALUES ('33', '图标管理', 'con', 'content/icon.jsp', '&#xe630;', '1', null, '1');
INSERT INTO `amct_left_menu` VALUES ('44', '用户管理', 'user', 'content/user.jsp', '&#xe613;', '1', null, '1');
INSERT INTO `amct_left_menu` VALUES ('55', '角色管理', 'role', 'content/role.jsp', '&#xe612;', '1', null, '1');

-- ----------------------------
-- Table structure for amct_left_menu_child
-- ----------------------------
DROP TABLE IF EXISTS `amct_left_menu_child`;
CREATE TABLE `amct_left_menu_child` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `ename` varchar(64) DEFAULT NULL COMMENT '页面文件;数据库表名',
  `url` varchar(64) DEFAULT NULL,
  `is_display` tinyint(2) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `parentid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_left_menu_child
-- ----------------------------

-- ----------------------------
-- Table structure for amct_log
-- ----------------------------
DROP TABLE IF EXISTS `amct_log`;
CREATE TABLE `amct_log` (
  `id` varchar(64) NOT NULL,
  `user_name` varchar(64) DEFAULT NULL COMMENT '操作人',
  `log_date` datetime DEFAULT NULL COMMENT '操作时间',
  `menu_code` varchar(64) DEFAULT NULL COMMENT '菜单编码',
  `opt` text COMMENT '日志内容',
  `status` varchar(32) DEFAULT NULL COMMENT '日志状态（debug/info/error）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_log
-- ----------------------------

-- ----------------------------
-- Table structure for amct_menu
-- ----------------------------
DROP TABLE IF EXISTS `amct_menu`;
CREATE TABLE `amct_menu` (
  `id` varchar(64) NOT NULL,
  `code` int(8) DEFAULT NULL,
  `father_menu` varchar(16) DEFAULT NULL,
  `menu_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_menu
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
INSERT INTO `amct_menu_monitor` VALUES ('0839e3628bf04f429fb08548b166491d', 'fcd54c9b99214e248f63c5b0242c7008', 'asd', 'sad1', 'String', '12', '0');
INSERT INTO `amct_menu_monitor` VALUES ('13040d1d44974d13a026a2be3a9d0392', 'ad8450060892441cb93e51931c5a7089', 'sad', 'sad', 'String', '12', '1');
INSERT INTO `amct_menu_monitor` VALUES ('2b6fc89ecdc0419f8f1a59315ee109cc', 'ad8450060892441cb93e51931c5a7089', 'ad', 'sd', 'String', '21', '0');
INSERT INTO `amct_menu_monitor` VALUES ('49d34639eb7744159c425b518fcaed3b', 'fcd54c9b99214e248f63c5b0242c7008', 'asd', 'sad', 'String', '12', '1');
INSERT INTO `amct_menu_monitor` VALUES ('4f7790e23bbb4db2ae8266cb74db7a2c', '06a78f3cfe8c41f9aee8135a108b893b', 'asd', 'asd', 'String', '123', '0');
INSERT INTO `amct_menu_monitor` VALUES ('71308f16924a48b6a3236ffafcc2adf8', '06a78f3cfe8c41f9aee8135a108b893b', 'ewq', 'weq', 'String', '12', '0');

-- ----------------------------
-- Table structure for amct_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `amct_menu_role`;
CREATE TABLE `amct_menu_role` (
  `id` varchar(64) NOT NULL,
  `menu_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_menu_role
-- ----------------------------
INSERT INTO `amct_menu_role` VALUES ('04ad0d73-4356-400c-a950-09876b2de990', '44', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('06e7d41e-8a50-4425-a9fd-27b73af5e26f', '33', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('0cd2cf56-1a1a-4be2-aa6f-179295a080ea', '44', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('0f630dbc-9248-4d0a-b391-74935d62a81f', '55', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('1', '11', '1');
INSERT INTO `amct_menu_role` VALUES ('2', '22', '1');
INSERT INTO `amct_menu_role` VALUES ('5', '33', '1');
INSERT INTO `amct_menu_role` VALUES ('5e8ba9ed-5da6-4480-b586-cae75a35f546', '1', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('6', '44', '1');
INSERT INTO `amct_menu_role` VALUES ('60cd8f81-eb70-4919-9c06-6a9de84c0cad', '11', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('7', '55', '1');
INSERT INTO `amct_menu_role` VALUES ('7594e9aa-a0b9-4ebb-bd59-b261e515ef11', '1', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('9', '1', '1');
INSERT INTO `amct_menu_role` VALUES ('a239ae4f-457c-4a6c-b864-7220a7ca7bfd', '11', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('f943fdfb-dffc-47fe-9d1f-673d38260a4e', '1', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
INSERT INTO `amct_menu_role` VALUES ('ff653db2-5ac5-42e8-ac3e-90693c4235bf', '11', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');

-- ----------------------------
-- Table structure for amct_role
-- ----------------------------
DROP TABLE IF EXISTS `amct_role`;
CREATE TABLE `amct_role` (
  `id` varchar(64) NOT NULL,
  `role_name` varchar(16) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(32) DEFAULT NULL COMMENT '角色编码',
  `role_status` tinyint(2) DEFAULT NULL COMMENT '角色状态；0：正常；1：异常',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_role
-- ----------------------------
INSERT INTO `amct_role` VALUES ('1', '超级管理员', 'admin', '0', '超级管理员');
INSERT INTO `amct_role` VALUES ('b51eb5c0-4e9b-460c-91a0-f1904a1b02c9', '开发测试', 'devel', '0', '开发测试人员');

-- ----------------------------
-- Table structure for amct_sys_logo
-- ----------------------------
DROP TABLE IF EXISTS `amct_sys_logo`;
CREATE TABLE `amct_sys_logo` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '系统名称',
  `url` varchar(64) DEFAULT NULL COMMENT 'logo地址',
  `is_display` tinyint(2) DEFAULT NULL COMMENT '是否显示0：不显示；1显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_sys_logo
-- ----------------------------
INSERT INTO `amct_sys_logo` VALUES ('1', '自动', 'static/image/woman.jpg', '1');

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
  `sex` tinyint(2) DEFAULT NULL COMMENT '0：男；1：女',
  `age` int(8) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL COMMENT '头像路径',
  `phone` varchar(32) DEFAULT NULL COMMENT '用户电话号码',
  `email` varchar(64) DEFAULT NULL COMMENT '用户邮箱',
  `status` tinyint(2) DEFAULT NULL COMMENT '用户状态；0：启用；1：禁用',
  `remark` varchar(255) DEFAULT NULL COMMENT '用户说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of amct_user_info
-- ----------------------------
INSERT INTO `amct_user_info` VALUES ('1', '超级', 'admin', '1f3ZJKTOBa76ed585a7e2087cd2b7618ffe998', '0', '27', 'static/image/b3fa21467216427c8a64a895a4307ee4.jpg', '18798477113', '1047267211@qq.com', '0', '');
INSERT INTO `amct_user_info` VALUES ('9c299b84-e18f-4f59-81c8-89b3346c0815', 'dengpp', 'dengpp', '472S826XM1d70fe9d03af711e42991ee293cd4', '0', '22', 'static/image/man.jpg', '15692719375', '', '0', '');

-- ----------------------------
-- Table structure for amct_user_role
-- ----------------------------
DROP TABLE IF EXISTS `amct_user_role`;
CREATE TABLE `amct_user_role` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of amct_user_role
-- ----------------------------
INSERT INTO `amct_user_role` VALUES ('5df2c29d-be02-4e31-b902-dc089ccf82c8', '1', '1');
INSERT INTO `amct_user_role` VALUES ('bfb547f3-c09d-469e-b0d0-30d443a8a6e5', '9c299b84-e18f-4f59-81c8-89b3346c0815', 'b51eb5c0-4e9b-460c-91a0-f1904a1b02c9');
