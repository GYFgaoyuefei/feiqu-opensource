/*
 Navicat Premium Data Transfer

 Source Server         : 虚拟机
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 192.168.1.63:3306
 Source Schema         : cwd_boring

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 17/12/2019 17:25:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for FQ_BLACK_LIST
-- ----------------------------
DROP TABLE IF EXISTS `FQ_BLACK_LIST`;
CREATE TABLE `FQ_BLACK_LIST`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '被拉黑的ip',
  `GMT_CREATE` datetime NOT NULL,
  `OPERATOR` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '黑名单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for FQ_USER_ACTIVE_NUM
-- ----------------------------
DROP TABLE IF EXISTS `FQ_USER_ACTIVE_NUM`;
CREATE TABLE `FQ_USER_ACTIVE_NUM`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVE_NUM` int(11) NOT NULL DEFAULT 0 COMMENT '活跃度',
  `GMT_CREATE` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `MARK` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '标识',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户活跃度' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for FQ_USER_PAY_WAY
-- ----------------------------
DROP TABLE IF EXISTS `FQ_USER_PAY_WAY`;
CREATE TABLE `FQ_USER_PAY_WAY`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PAY_WAY` int(11) NOT NULL DEFAULT 1 COMMENT '1 支付宝 2 微信 ',
  `PAY_IMG_URL` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '支付的二维码照片',
  `GMT_CREATE` datetime NOT NULL COMMENT '创建时间',
  `USER_ID` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `DEL_FLAG` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '支付方式' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for api_doc_project
-- ----------------------------
DROP TABLE IF EXISTS `api_doc_project`;
CREATE TABLE `api_doc_project`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT 0 COMMENT '创建人的id',
  `PROJECT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '项目名称',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `STATUS` tinyint(4) NOT NULL DEFAULT 1,
  `REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `TYPE` tinyint(4) NOT NULL DEFAULT 1,
  `PASSWORD` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `COVER` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'api文档项目' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for api_doc_project_user
-- ----------------------------
DROP TABLE IF EXISTS `api_doc_project_user`;
CREATE TABLE `api_doc_project_user`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` bigint(20) NOT NULL DEFAULT 0,
  `USER_ID` int(11) NOT NULL DEFAULT 0,
  `CREATE_TIME` datetime DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT 0,
  `sponsor` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '项目与用户的关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `article_content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `del_flag` int(255) DEFAULT 0,
  `like_count` int(11) DEFAULT 0,
  `comment_count` int(11) DEFAULT 0,
  `browse_count` int(11) DEFAULT 0,
  `label` int(11) DEFAULT NULL,
  `anonymous_switch` int(11) NOT NULL DEFAULT 0,
  `is_recommend` int(11) DEFAULT 0,
  `content_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for c_message
-- ----------------------------
DROP TABLE IF EXISTS `c_message`;
CREATE TABLE `c_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `post_user_id` int(11) DEFAULT NULL,
  `received_user_id` int(11) DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `type` int(11) DEFAULT NULL,
  `is_read` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of c_message
-- ----------------------------
INSERT INTO `c_message` VALUES (1, '系统消息通知：欢迎你来到飞趣社区，希望你在这体验愉快！另外，你可以加入官方qq交流群：632118669,一起讨论。 2019-12-17 16:30:50', '2019-12-17 16:30:50', -1, 1, 0, 1, 0);
INSERT INTO `c_message` VALUES (2, '系统消息通知：欢迎你来到飞趣社区，希望你在这体验愉快！另外，你可以加入官方qq交流群：632118669,一起讨论。 2019-12-17 16:32:26', '2019-12-17 16:32:26', -1, 2, 0, 1, 0);
INSERT INTO `c_message` VALUES (3, '系统消息通知：欢迎你来到飞趣社区，希望你在这体验愉快！另外，你可以加入官方qq交流群：632118669,一起讨论。 2019-12-17 16:40:52', '2019-12-17 16:40:52', -1, 3, 0, 1, 1);

-- ----------------------------
-- Table structure for fq_area
-- ----------------------------
DROP TABLE IF EXISTS `fq_area`;
CREATE TABLE `fq_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `card_num` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fq_area
-- ----------------------------
INSERT INTO `fq_area` VALUES (33, '四川', 0);
INSERT INTO `fq_area` VALUES (34, '北京', 0);
INSERT INTO `fq_area` VALUES (35, '河北', 0);
INSERT INTO `fq_area` VALUES (36, '广东', 0);
INSERT INTO `fq_area` VALUES (37, '湖北', 0);
INSERT INTO `fq_area` VALUES (38, '上海', 0);
INSERT INTO `fq_area` VALUES (39, '山东', 0);
INSERT INTO `fq_area` VALUES (40, '江苏', 0);
INSERT INTO `fq_area` VALUES (41, '陕西', 0);
INSERT INTO `fq_area` VALUES (42, '辽宁', 0);
INSERT INTO `fq_area` VALUES (43, '河南', 0);
INSERT INTO `fq_area` VALUES (44, '广西', 0);
INSERT INTO `fq_area` VALUES (45, '重庆', 0);
INSERT INTO `fq_area` VALUES (46, '江西', 0);
INSERT INTO `fq_area` VALUES (47, '浙江', 0);
INSERT INTO `fq_area` VALUES (48, '湖南', 0);
INSERT INTO `fq_area` VALUES (49, '安徽', 0);
INSERT INTO `fq_area` VALUES (50, '天津', 0);
INSERT INTO `fq_area` VALUES (51, '云南', 0);
INSERT INTO `fq_area` VALUES (52, '贵州', 0);
INSERT INTO `fq_area` VALUES (53, '福建', 0);
INSERT INTO `fq_area` VALUES (54, '黑龙江', 0);
INSERT INTO `fq_area` VALUES (55, '港澳台', 0);
INSERT INTO `fq_area` VALUES (56, '西藏', 0);
INSERT INTO `fq_area` VALUES (57, '宁夏', 0);
INSERT INTO `fq_area` VALUES (58, '新疆', 0);
INSERT INTO `fq_area` VALUES (59, '内蒙', 0);
INSERT INTO `fq_area` VALUES (60, '海南', 0);
INSERT INTO `fq_area` VALUES (61, '青海', 0);
INSERT INTO `fq_area` VALUES (62, '甘肃', 0);
INSERT INTO `fq_area` VALUES (63, '山西', 0);
INSERT INTO `fq_area` VALUES (64, '吉林', 0);

-- ----------------------------
-- Table structure for fq_background_img
-- ----------------------------
DROP TABLE IF EXISTS `fq_background_img`;
CREATE TABLE `fq_background_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `history_urls` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_collect
-- ----------------------------
DROP TABLE IF EXISTS `fq_collect`;
CREATE TABLE `fq_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_type` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `fq_friend_link`;
CREATE TABLE `fq_friend_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_label
-- ----------------------------
DROP TABLE IF EXISTS `fq_label`;
CREATE TABLE `fq_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fq_label
-- ----------------------------
INSERT INTO `fq_label` VALUES (43, '技术', 0, 2);
INSERT INTO `fq_label` VALUES (44, '情感', 0, 2);
INSERT INTO `fq_label` VALUES (45, '杂文', 0, 2);
INSERT INTO `fq_label` VALUES (46, '问答', 0, 2);
INSERT INTO `fq_label` VALUES (47, '资讯', 0, 2);
INSERT INTO `fq_label` VALUES (48, '其他', 0, 2);
INSERT INTO `fq_label` VALUES (49, '同城聚会', 0, 6);
INSERT INTO `fq_label` VALUES (50, '诚征女友', 0, 6);
INSERT INTO `fq_label` VALUES (51, '诚征男友', 0, 6);
INSERT INTO `fq_label` VALUES (52, '情感经历', 0, 6);
INSERT INTO `fq_label` VALUES (53, '为人处世', 0, 6);
INSERT INTO `fq_label` VALUES (54, '人在旅途', 0, 6);
INSERT INTO `fq_label` VALUES (55, '话题讨论', 0, 6);
INSERT INTO `fq_label` VALUES (56, '高校联盟', 0, 6);
INSERT INTO `fq_label` VALUES (57, '其他', 0, 6);
INSERT INTO `fq_label` VALUES (58, '新闻', 0, 2);
INSERT INTO `fq_label` VALUES (59, '分享', 0, 2);
INSERT INTO `fq_label` VALUES (60, '讨论', 0, 2);
INSERT INTO `fq_label` VALUES (61, '云计算', 0, 10);
INSERT INTO `fq_label` VALUES (62, 'PHP', 0, 10);
INSERT INTO `fq_label` VALUES (63, 'Java', 0, 10);
INSERT INTO `fq_label` VALUES (64, 'Android', 0, 10);
INSERT INTO `fq_label` VALUES (65, 'C/C++/Obj-C', 0, 10);
INSERT INTO `fq_label` VALUES (66, 'MySQL', 0, 10);
INSERT INTO `fq_label` VALUES (67, 'iDev', 0, 10);
INSERT INTO `fq_label` VALUES (68, 'Node.js', 0, 10);
INSERT INTO `fq_label` VALUES (69, 'Ubuntu', 0, 10);
INSERT INTO `fq_label` VALUES (70, 'DNS', 0, 10);
INSERT INTO `fq_label` VALUES (71, '数据库', 0, 10);
INSERT INTO `fq_label` VALUES (72, 'Go', 0, 10);
INSERT INTO `fq_label` VALUES (73, 'git', 0, 10);
INSERT INTO `fq_label` VALUES (74, 'JavaScript', 0, 10);
INSERT INTO `fq_label` VALUES (75, '职场话题', 0, 10);
INSERT INTO `fq_label` VALUES (76, '问与答', 0, 10);
INSERT INTO `fq_label` VALUES (77, 'Flask', 0, 10);
INSERT INTO `fq_label` VALUES (78, '游戏开发', 0, 10);
INSERT INTO `fq_label` VALUES (79, 'Tornado', 0, 10);
INSERT INTO `fq_label` VALUES (80, 'Django', 0, 10);
INSERT INTO `fq_label` VALUES (81, '程序员', 0, 10);
INSERT INTO `fq_label` VALUES (82, 'Linux', 0, 10);
INSERT INTO `fq_label` VALUES (83, 'Python', 0, 10);
INSERT INTO `fq_label` VALUES (84, '全球工单系统', 0, 10);

-- ----------------------------
-- Table structure for fq_music
-- ----------------------------
DROP TABLE IF EXISTS `fq_music`;
CREATE TABLE `fq_music`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `music_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `play_count` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `lyric` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `singer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_news
-- ----------------------------
DROP TABLE IF EXISTS `fq_news`;
CREATE TABLE `fq_news`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '标题',
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_bin,
  `SOURCE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `COMMENT_COUNT` int(11) NOT NULL DEFAULT 0,
  `IMG_SRC` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `P_TIME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `GMT_CREATE` datetime NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '新闻' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_notice
-- ----------------------------
DROP TABLE IF EXISTS `fq_notice`;
CREATE TABLE `fq_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fq_order` int(11) DEFAULT NULL,
  `is_show` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_short_video
-- ----------------------------
DROP TABLE IF EXISTS `fq_short_video`;
CREATE TABLE `fq_short_video`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL,
  `del_flag` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_sign
-- ----------------------------
DROP TABLE IF EXISTS `fq_sign`;
CREATE TABLE `fq_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sign_time` datetime DEFAULT NULL,
  `sign_days` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '一个月签到哪些天 逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '签到' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_theme
-- ----------------------------
DROP TABLE IF EXISTS `fq_theme`;
CREATE TABLE `fq_theme`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `comment_count` int(11) DEFAULT 0,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `last_pub_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_pub_time` datetime DEFAULT NULL,
  `see_count` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_third_party
-- ----------------------------
DROP TABLE IF EXISTS `fq_third_party`;
CREATE TABLE `fq_third_party`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '第三方' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_topic
-- ----------------------------
DROP TABLE IF EXISTS `fq_topic`;
CREATE TABLE `fq_topic`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '标题',
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_bin,
  `SOURCE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `AUTHOR` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '作者',
  `AUTHOR_ICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '作者头像',
  `COMMENT_COUNT` int(11) NOT NULL DEFAULT 0,
  `GMT_CREATE` datetime NOT NULL,
  `TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '话题' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_topic_reply
-- ----------------------------
DROP TABLE IF EXISTS `fq_topic_reply`;
CREATE TABLE `fq_topic_reply`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `TOPIC_ID` bigint(20) NOT NULL DEFAULT 0,
  `GMT_CREATE` datetime NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_user
-- ----------------------------
DROP TABLE IF EXISTS `fq_user`;
CREATE TABLE `fq_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_mail_bind` int(11) DEFAULT NULL,
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qudou_num` int(11) DEFAULT NULL,
  `birth` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `education` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `school` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `role` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 1,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fq_user
-- ----------------------------
INSERT INTO `fq_user` VALUES (3, '749846844@qq.com', '1022a961ed1a6cdf0d43ffd7397795d7', '2019-12-17 16:40:52', '阿飞', 'http://q.qlogo.cn/qqapp/101407714/9AE90454762E8DD09EB09EC8244AA2EC/100', '0:0:0:0:0:0:0:1', '0内网IP', NULL, NULL, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, 1, 0);

-- ----------------------------
-- Table structure for fq_visit_record
-- ----------------------------
DROP TABLE IF EXISTS `fq_visit_record`;
CREATE TABLE `fq_visit_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_user_id` int(11) DEFAULT NULL,
  `visited_user_id` int(11) DEFAULT NULL,
  `visit_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fq_website_dir
-- ----------------------------
DROP TABLE IF EXISTS `fq_website_dir`;
CREATE TABLE `fq_website_dir`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `del_flag` int(11) DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `click_count` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fq_website_dir
-- ----------------------------
INSERT INTO `fq_website_dir` VALUES (1, 'https://www.google.com/', '??', 0, 'Google', 1, 22, '2018-12-28 21:19:35', 'http://images.frontendjs.com/google.png');
INSERT INTO `fq_website_dir` VALUES (2, 'https://www.baidu.com/', '??', 0, '??', 2, 22, '2018-12-28 21:19:35', 'http://images.frontendjs.com/baidu.ico');
INSERT INTO `fq_website_dir` VALUES (3, 'https://stackoverflow.com/', '??', 0, 'StackOverflow', 1, 22, '2018-12-28 21:19:35', 'http://images.frontendjs.com/stackoverflow.png');

-- ----------------------------
-- Table structure for general_comment
-- ----------------------------
DROP TABLE IF EXISTS `general_comment`;
CREATE TABLE `general_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `topic_type` int(11) DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `post_user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `has_reply` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '评论表设计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for general_like
-- ----------------------------
DROP TABLE IF EXISTS `general_like`;
CREATE TABLE `general_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `topic_type` int(11) DEFAULT NULL,
  `like_value` int(11) DEFAULT 0,
  `post_user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '点赞表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for general_reply
-- ----------------------------
DROP TABLE IF EXISTS `general_reply`;
CREATE TABLE `general_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `post_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `reply_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '回复评论的' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for job_talk
-- ----------------------------
DROP TABLE IF EXISTS `job_talk`;
CREATE TABLE `job_talk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `comment_count` int(11) DEFAULT 0,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `last_pub_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_pub_time` datetime DEFAULT NULL,
  `see_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nginx_log
-- ----------------------------
DROP TABLE IF EXISTS `nginx_log`;
CREATE TABLE `nginx_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `local_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `http` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `bytes` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `xforward` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `request_time` double DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `spider_type` int(11) DEFAULT 0 COMMENT '//0代表没有爬虫 1 百度爬虫 2 google爬虫 3 bing爬虫 4 搜狗',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `que_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `del_flag` int(255) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_beauty
-- ----------------------------
DROP TABLE IF EXISTS `super_beauty`;
CREATE TABLE `super_beauty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `upload_user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(255) DEFAULT 0,
  `like_count` int(11) DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '类别',
  `pic_list` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `pic_desc_list` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `see_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for thought
-- ----------------------------
DROP TABLE IF EXISTS `thought`;
CREATE TABLE `thought`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thought_content` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `comment_count` int(11) DEFAULT 0,
  `del_flag` int(11) DEFAULT 0,
  `area` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_reply_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '\'',
  `pic_list` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `last_reply_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '想法' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for upload_img_record
-- ----------------------------
DROP TABLE IF EXISTS `upload_img_record`;
CREATE TABLE `upload_img_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pic_md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pic_size` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_activate
-- ----------------------------
DROP TABLE IF EXISTS `user_activate`;
CREATE TABLE `user_activate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_activate
-- ----------------------------
INSERT INTO `user_activate` VALUES (9, 3, '0cdb48909e464482aee5719d350d2bc7', '2019-12-17 16:40:52');

-- ----------------------------
-- Table structure for user_follow
-- ----------------------------
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE `user_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_user_id` int(11) DEFAULT NULL,
  `followed_user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户关注表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_time_line
-- ----------------------------
DROP TABLE IF EXISTS `user_time_line`;
CREATE TABLE `user_time_line`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wang_hong_wan
-- ----------------------------
DROP TABLE IF EXISTS `wang_hong_wan`;
CREATE TABLE `wang_hong_wan`  (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pic_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
