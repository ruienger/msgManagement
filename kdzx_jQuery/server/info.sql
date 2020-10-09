/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : info

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 14/08/2020 00:22:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_config
-- ----------------------------
DROP TABLE IF EXISTS `base_config`;
CREATE TABLE `base_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_un` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_config
-- ----------------------------
BEGIN;
INSERT INTO `base_config` VALUES (1, '1', '1', '1');
INSERT INTO `base_config` VALUES (2, '2', '2', '2');
INSERT INTO `base_config` VALUES (3, '3', '3', '3');
COMMIT;

-- ----------------------------
-- Table structure for base_file
-- ----------------------------
DROP TABLE IF EXISTS `base_file`;
CREATE TABLE `base_file` (
  `id` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `file_name` varchar(256) DEFAULT NULL,
  `group_name` varchar(256) DEFAULT NULL,
  `upload_time` bigint(255) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_file
-- ----------------------------
BEGIN;
INSERT INTO `base_file` VALUES ('M00/00/06/rBD-SV81WL2AQnXCAAAUFlm5qZA257.png', 'logo.png', 'group1', 1597331645477, 5142);
INSERT INTO `base_file` VALUES ('M00/00/06/rBD-SV8qd-uAf4BdAAEzbXtgtjg616.png', '构造函数＋原型.png', 'group1', 1596618731720, 78701);
INSERT INTO `base_file` VALUES ('M00/00/06/rBD-SV8r99-AZQ4lAAYZaDB_qvk773.jpg', 'user.jpg', 'group1', 1596717023379, 399720);
COMMIT;

-- ----------------------------
-- Table structure for base_privilege
-- ----------------------------
DROP TABLE IF EXISTS `base_privilege`;
CREATE TABLE `base_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `hidden` int(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_privilege_privilege` (`parent_id`),
  CONSTRAINT `fk_privilege_privilege` FOREIGN KEY (`parent_id`) REFERENCES `base_privilege` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_privilege` VALUES (5, '用户管理', NULL, '/sys/user/List', NULL, 'menu', 'peoples', 0, NULL, 33);
INSERT INTO `base_privilege` VALUES (18, '权限管理', NULL, '/sys/privilege/List', NULL, 'menu', '', 0, NULL, 33);
INSERT INTO `base_privilege` VALUES (23, '角色管理', NULL, '/sys/role/List', NULL, 'menu', '', 0, NULL, 33);
INSERT INTO `base_privilege` VALUES (33, '角色权限', '', '/sys/', '', 'menu', 'peoples', 0, 4, NULL);
INSERT INTO `base_privilege` VALUES (53, '用户详情', NULL, '/sys/user/Details        \n        \n', 'user_details', 'menu', NULL, 1, NULL, 33);
INSERT INTO `base_privilege` VALUES (74, '分类管理', '', '/info/category', '', 'menu', 'list', 0, 2, NULL);
INSERT INTO `base_privilege` VALUES (75, '分类管理', '', '/info/category/List', '', 'menu', '', 0, NULL, 74);
INSERT INTO `base_privilege` VALUES (76, '资讯管理', '', '/info/article', '', 'menu', 'form', 0, 3, NULL);
INSERT INTO `base_privilege` VALUES (77, '资讯管理', '', '/info/article/List', '', 'menu', '', 0, NULL, 76);
INSERT INTO `base_privilege` VALUES (78, '评论管理', '', '/info/comments', '', 'menu', 'guide', 0, 1, NULL);
INSERT INTO `base_privilege` VALUES (79, '评论管理', '', '/info/comments/List', '', 'menu', '', 0, NULL, 78);
INSERT INTO `base_privilege` VALUES (80, '个人信息', '', '/sys/user', '', 'menu', 'list', 0, 5, NULL);
INSERT INTO `base_privilege` VALUES (81, '个人信息', '', '/sys/user/Details', '', 'menu', '', 0, NULL, 80);
INSERT INTO `base_privilege` VALUES (87, '文章编辑', NULL, '/info/article/Editor', NULL, 'menu', NULL, 1, NULL, 76);
COMMIT;

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role
-- ----------------------------
BEGIN;
INSERT INTO `base_role` VALUES (1, '教师');
INSERT INTO `base_role` VALUES (2, '管理员');
INSERT INTO `base_role` VALUES (6, '学生');
COMMIT;

-- ----------------------------
-- Table structure for base_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `base_role_privilege`;
CREATE TABLE `base_role_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `privilege_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_privilege_role` (`role_id`),
  KEY `fk_role_privilege_privilege` (`privilege_id`),
  CONSTRAINT `fk_role_privilege_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `base_privilege` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_role_privilege_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_role_privilege` VALUES (82, 2, 33);
INSERT INTO `base_role_privilege` VALUES (83, 2, 5);
INSERT INTO `base_role_privilege` VALUES (91, 2, 18);
INSERT INTO `base_role_privilege` VALUES (96, 2, 23);
INSERT INTO `base_role_privilege` VALUES (155, 2, 53);
INSERT INTO `base_role_privilege` VALUES (217, 2, 74);
INSERT INTO `base_role_privilege` VALUES (218, 2, 75);
INSERT INTO `base_role_privilege` VALUES (223, 2, 76);
INSERT INTO `base_role_privilege` VALUES (224, 2, 77);
INSERT INTO `base_role_privilege` VALUES (225, 2, 78);
INSERT INTO `base_role_privilege` VALUES (226, 2, 79);
INSERT INTO `base_role_privilege` VALUES (227, 2, 80);
INSERT INTO `base_role_privilege` VALUES (228, 2, 81);
INSERT INTO `base_role_privilege` VALUES (234, 1, 80);
INSERT INTO `base_role_privilege` VALUES (235, 1, 33);
INSERT INTO `base_role_privilege` VALUES (236, 1, 76);
INSERT INTO `base_role_privilege` VALUES (237, 1, 74);
INSERT INTO `base_role_privilege` VALUES (238, 1, 78);
INSERT INTO `base_role_privilege` VALUES (239, 2, 87);
COMMIT;

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth` bigint(255) DEFAULT NULL,
  `register_time` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_face` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `politics_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (1, 'teacher1', '123321', '18812344321', '张老师', 'female', 1572883200000, 1573892938430, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (2, 'teacher2', '123321', '18867541234', '胡老师', 'female', 1572883200000, 1573892938430, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (3, 'teacher3', '123321', '18812344325', '刘老师', 'female', 1572883200000, 1573892938430, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (5, 'admin1', '123321', '18812344321', '王总', 'male', 1572883200000, 1574155005310, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (6, 'admin2', '123321', '15512348854', '李总', 'male', 1572883200000, 1574839989546, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (8, '张明', '123321', '15512348854', '张明', 'male', 1572883200000, 1581673168302, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (9, '周盼', '123321', '15512348859', '周盼', 'female', 1572883200000, 1581673188565, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (10, '张琛', '123321', '15512348890', '张琛', 'male', 1572883200000, 1582112524753, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (11, '黄小雷', '123321', '15512348868', '黄小雷', 'male', NULL, 1583893653152, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (12, '王红艳', '123321', '15512348806', '王红艳', 'female', NULL, 1583893668341, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (13, '刘兰特', '123321', '15512348807', '刘兰特', 'male', NULL, 1583893686987, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (14, '张兰德', '123321', '15512348808', '张兰德', 'male', NULL, 1583893709080, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (15, '张德全', '123321', '15512346678', '张德全', 'male', NULL, 1583894200273, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (16, '李小露', '123321', '15512347765', '李小露', 'female', NULL, 1583894783567, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (17, '李大路', '123321', '15512348888', '李大路', 'male', NULL, 1583894819291, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (18, '张晓光', '123321', '15512348998', '张晓光', 'male', NULL, 1584262394712, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145598', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (19, '胡美丽', '123321', '15512348000', '胡美丽', 'female', NULL, 1584262394776, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145567', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (20, '张晓丽', '123321', '1.5512348111E10', '张晓丽', 'male', NULL, 1584353343230, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145501', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (21, '胡大光', '123321', '15512348112', '胡大光', 'male', NULL, 1584353343243, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145502', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (22, '刘涛', '123321', '15512348113', '刘涛', 'male', NULL, 1584353343250, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145503', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (23, '张强', '123321', '15512348114', '张强', 'male', NULL, 1584353343254, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145504', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (24, '张亮', '123321', '15512348115', '张亮', 'male', NULL, 1584353343259, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145505', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (25, '张晓明', '123321', '15512348116', '张晓明', 'male', NULL, 1584353343263, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145506', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (26, '胡晨', '123321', '15512348117', '胡晨', 'male', NULL, 1584353343266, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145507', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (27, '刘发光', '123321', '15512348118', '刘发光', 'male', NULL, 1584353343270, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145508', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (28, '张二妹', '123321', '15512348119', '张二妹', 'female', NULL, 1584353343274, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (29, '张1', '123321', '1.5512348111E10', '张1', 'male', NULL, 1584543335393, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145501', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (30, '刘2', '123321', '15512348112', '刘2', 'male', NULL, 1584543335405, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145502', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (31, '刘3', '123321', '15512348113', '刘3', 'male', NULL, 1584543335410, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145503', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (32, '张4', '123321', '15512348114', '张4', 'male', NULL, 1584543335415, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145504', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (33, '张5', '123321', '15512348115', '张5', 'male', NULL, 1584543335419, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145505', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (34, '张6', '123321', '15512348116', '张6', 'male', NULL, 1584543335424, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145506', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (35, '胡7', '123321', '15512348117', '胡7', 'male', NULL, 1584543335429, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145507', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (36, '刘9', '123321', '15512348118', '刘9', 'male', NULL, 1584543335434, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145508', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (37, '张10', '123321', '15512348119', '张10', 'female', NULL, 1584543335438, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (38, '张11', '123321', '15512348119', '张11', 'female', NULL, 1584543335442, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (39, '张12', '123321', '15512348119', '张12', 'female', NULL, 1584543335446, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (40, '张13', '123321', '15512348119', '张13', 'female', NULL, 1584543335450, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (41, '张14', '123321', '15512348119', '张14', 'female', NULL, 1584543335454, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众');
INSERT INTO `base_user` VALUES (44, 'guolei', '123', '123', '郭磊', 'male', 1597161600000, 1597222417034, '正常', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `base_user_role`;
CREATE TABLE `base_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_user` (`user_id`),
  KEY `fk_user_role_role` (`role_id`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user_role
-- ----------------------------
BEGIN;
INSERT INTO `base_user_role` VALUES (7, 2, 1);
INSERT INTO `base_user_role` VALUES (11, 5, 2);
INSERT INTO `base_user_role` VALUES (12, 1, 1);
INSERT INTO `base_user_role` VALUES (17, 3, 1);
INSERT INTO `base_user_role` VALUES (18, 6, 2);
INSERT INTO `base_user_role` VALUES (19, 8, 6);
INSERT INTO `base_user_role` VALUES (20, 9, 6);
INSERT INTO `base_user_role` VALUES (22, 10, 6);
INSERT INTO `base_user_role` VALUES (23, 11, 1);
INSERT INTO `base_user_role` VALUES (24, 12, 1);
INSERT INTO `base_user_role` VALUES (25, 13, 1);
INSERT INTO `base_user_role` VALUES (26, 14, 1);
INSERT INTO `base_user_role` VALUES (27, 15, 1);
INSERT INTO `base_user_role` VALUES (28, 17, 1);
INSERT INTO `base_user_role` VALUES (29, 16, 1);
INSERT INTO `base_user_role` VALUES (32, 20, 6);
INSERT INTO `base_user_role` VALUES (33, 21, 6);
INSERT INTO `base_user_role` VALUES (34, 22, 6);
INSERT INTO `base_user_role` VALUES (35, 23, 6);
INSERT INTO `base_user_role` VALUES (36, 24, 6);
INSERT INTO `base_user_role` VALUES (37, 25, 6);
INSERT INTO `base_user_role` VALUES (38, 26, 6);
INSERT INTO `base_user_role` VALUES (39, 27, 6);
INSERT INTO `base_user_role` VALUES (40, 28, 6);
INSERT INTO `base_user_role` VALUES (41, 19, 6);
INSERT INTO `base_user_role` VALUES (42, 18, 6);
INSERT INTO `base_user_role` VALUES (43, 29, 6);
INSERT INTO `base_user_role` VALUES (44, 30, 6);
INSERT INTO `base_user_role` VALUES (45, 31, 6);
INSERT INTO `base_user_role` VALUES (46, 32, 6);
INSERT INTO `base_user_role` VALUES (47, 33, 6);
INSERT INTO `base_user_role` VALUES (48, 34, 6);
INSERT INTO `base_user_role` VALUES (49, 35, 6);
INSERT INTO `base_user_role` VALUES (50, 36, 6);
INSERT INTO `base_user_role` VALUES (51, 37, 6);
INSERT INTO `base_user_role` VALUES (52, 38, 6);
INSERT INTO `base_user_role` VALUES (53, 39, 6);
INSERT INTO `base_user_role` VALUES (54, 40, 6);
INSERT INTO `base_user_role` VALUES (55, 41, 6);
INSERT INTO `base_user_role` VALUES (57, 44, 1);
COMMIT;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `source` text,
  `publish_time` bigint(20) DEFAULT NULL,
  `read_times` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `thump_up` bigint(255) DEFAULT NULL,
  `thump_down` bigint(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category` (`category_id`),
  KEY `fk_article_user` (`author_id`),
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`author_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_article` VALUES (1, '校领导调研东山校区疫情防控和企业复工工作', '<div style=\"width: 769px; margin: 20px auto; line-height: 25px;\">\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">学习贯彻习近平总书记在统筹推进新冠肺炎疫情防控和经济社会发展工作部署会议上的重要讲话精神，按照省委、省政府三&ldquo;要&rdquo;六&ldquo;统筹&rdquo;的工作要求，我校疫情防控工作领导小组多次专门研究东山校区复工问题，决定全力支持东山校区建筑工地有序复工 。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">3月5日上午，校长黄桂田、党委副书记李富明、副校长卢宇鸿一行深入东山校区建筑工地现场，调研检查疫情防控和企业复工工作，对开工企业和近600名工地人员表示慰问。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">黄桂田一行先后走访了校区进出口、理科教学与实验综合楼、电力学院楼建设项目和我校项目部，听取项目施工方在疫情防控、员工返岗、项目规划、安全保障等方面的情况汇报，详细了解项目建设中遇到的困难和问题。调研组人员充分肯定了中铁三局、中铁十七局等企业在复工准备和疫情防控方面的做法，点赞大型央企起到的模范带头作用。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">黄桂田指出，在抓好疫情防控的基础上，恢复经济社会生产生活秩序是当务之急，东山校区作为山西省重点工程要尽快复工。他强调，各相关部门要从发展大局出发，科学研判、统筹兼顾，强化责任意识，加强协调配合，千方百计破解疫情影响难题，全力支持东山校区各工地尽早复工，确保各项工作尽快回归正轨。同时，施工单位要切实扛起项目建设和疫情防控主体责任，在确保安全施工的前提下，加快组织力量，开足马力抓建设抢工期、抓质量提品质，确保各工程项目顺利推进。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">党办、校办、保卫部、基建处、国资处、校医院相关负责人参加调研检查。</p>\n</div>', '', 1583449535781, 0, '未审核', 0, 0, 1, 4);
INSERT INTO `cms_article` VALUES (2, '我校召开研究生教育和学科建设工作网络会议', '<div style=\"width: 769px; margin: 20px auto; line-height: 25px;\">\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">3月4日下午，我校召开了研究生教育和学科建设工作会议，安排部署2020年春季学期学位与研究生教育、第五轮学科评估等工作。副校长张天才、各培养单位相关负责人、教学秘书共85人参加了会议，此次会议利用企业微信网络会议形式进行，由研究生院院长肖连团主持。</p>\n<p style=\"text-align: center; text-indent: 0px;\"><img style=\"width: 250px; height: 382px;\" title=\"bbf7ade117ad408fa620d0bcc447265f.png\" src=\"http://news.sxu.edu.cn/images/2020-03/bbf7ade117ad408fa620d0bcc447265f.png\" alt=\"bbf7ade117ad408fa620d0bcc447265f.png\" width=\"250\" height=\"382\" border=\"0\" vspace=\"0\" /><img style=\"width: 300px; height: 231px;\" title=\"9889a9ed10244bcf8a6dd05f601823a6.png\" src=\"http://news.sxu.edu.cn/images/2020-03/9889a9ed10244bcf8a6dd05f601823a6.png\" alt=\"9889a9ed10244bcf8a6dd05f601823a6.png\" width=\"300\" height=\"231\" border=\"0\" vspace=\"0\" /></p>\n<p style=\"text-indent: 0px;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">肖连团针对新冠肺炎疫情对我校研究生教育相关工作的影响，根据教育部、山西省教育厅和学校的文件进行了整体工作部署。他强调，在疫情防控期间开展线上教育教学，是研究生混合式教学改革的重点之一，而不仅仅是疫情期间的应急措施；各培养单位要尽快完善工作预案，充分做好研究生招生、培养、学位申请工作全过程使用信息化手段的准备工作；导师要加强对研究生学习及心理方面的网络指导，特别是对于身处疫情严重地区的研究生，应重点给予关怀；同时各培养单位要加强研究生教学督导体系建设，开展在线教学检查并加强与校级督导形成联动，保障培养质量。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">研究生院三位副院长分别就研究生教学与培养过程管理、研究生招生工作、研究生学位工作做了具体安排。会议通报了研究生线上教学前期准备工作、第一周线上教学实施情况，后续研究生教学与培养过程管理工作；对2020年度的硕士研究生招生工作涉及到的工作管理、计划扩招、复试工作，调剂录取等进行了详细说明，介绍了本学期各类博士招生考试(考核）工作方案； 通报了学校对于研究生学位相关文件修订情况，包括研究生毕业要求和导师遴选办法，并对近期学位工作进行了安排，特别地对保障研究生学位论文质量的各项举措提出了具体要求。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">学科建设与发展规划办公室吕宏伟副主任通报了校、院两级就第五轮学科评估开展相关工作的进展情况，传达了学校疫情防控领导组&ldquo;关于统筹做好疫情防控和学校教育改革发展，扎实推进第五轮学科评估工作&rdquo;的有关精神，就进一步强化院系组织领导、加强与职能部门沟通、广泛发动学科力量，按既定方案扎实推进评估工作等内容进行了安排部署。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">张天才副校长要求各培养单位加强组织领导，积极主动作为，全面保障本学期的教学计划按时完成；细化预案，完善环节，查补漏洞，确保教学质量不滑坡；精心谋划，分工协作，创新教育教学理念和教学方法；加强质量监督与保障工作，完善相关的管理机制；切实做好毕业生工作，确保学位授予工作顺利进行。强调各单位要切实加强第五轮学科评估组织工作，抢抓机遇、全力以赴，积极推进各方面工作的落实，全力以赴服务于学校双一流建设。</p>\n</div>', '', 1583449535781, 0, '未审核', 0, 0, 1, 3);
INSERT INTO `cms_article` VALUES (11, '学校疫情防控工作领导小组召开第十五次工作会议', '<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">近日，教育部党组下发《关于统筹做好教育系统新冠肺炎疫情防控和教育改革发展工作的通知》，对统筹做好教育系统疫情防控和教育改革发展工作进行了部署安排，为再次深入学习贯彻习近平总书记在统筹推进新冠肺炎疫情防控和经济社会发展工作部署会议上的重要讲话精神，贯彻落实教育部党组相关通知精神和省委省政府近期关于疫情防控的相关决策部署，3月2日，校党委书记符惠明主持召开学校疫情防控工作领导小组第十五次工作会议，就下一阶段统筹做好学校疫情防控工作和教育改革发展工作进行了研究部署。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt; text-align: center;\"><img title=\"3d2cf4d3dbb9433cb7fc8032acb06972.jpg\" src=\"http://news.sxu.edu.cn/images/2020-03/3d2cf4d3dbb9433cb7fc8032acb06972.jpg\" alt=\"f.jpg\" /></p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">会议期间，符惠明、黄桂田同志带头，响应党中央对广大党员的号召，为支持新冠肺炎疫情防控工作捐款。与会其他校领导和相关部门负责人纷纷捐款。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt; text-align: center;\"><img title=\"7252998d1ea342069741780d58919384.jpg\" src=\"http://news.sxu.edu.cn/images/2020-03/7252998d1ea342069741780d58919384.jpg\" alt=\"h.jpg\" /></p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">符惠明表示，要深刻领会习近平总书记在统筹推进新冠肺炎疫情防控和经济社会发展工作部署会议上的重要讲话精神，明确中央关于疫情防控和经济社会发展工作的新判断、新要求，认真贯彻落实教育部党组关于统筹做好教育系统新冠肺炎疫情防控和教育改革发展工作做出的7项决策部署，贯彻落实省委省政府、省教育厅近期关于疫情防控的各项决策部署，结合学校实际，扎扎实实统筹做好学校疫情防控和当前各项重点工作。</p>', '<h1>this is test03</h1>', 1583449535781, 0, '未审核', 0, 0, 1, 3);
INSERT INTO `cms_article` VALUES (31, 'test-charles-03', 'this is a test01', NULL, 1590149486258, 0, '未审核', 0, 0, NULL, 3);
INSERT INTO `cms_article` VALUES (32, 'test-charles-04', 'test04', NULL, 1590150340427, 0, '未审核', 0, 0, NULL, 3);
INSERT INTO `cms_article` VALUES (33, 'test-charles-05', 'est', NULL, 1590150433030, 0, '未审核', 0, 0, NULL, 3);
INSERT INTO `cms_article` VALUES (34, 'test-charles-06', 'test', NULL, 1590150453056, 0, '未审核', 0, 0, NULL, 3);
INSERT INTO `cms_article` VALUES (36, 'test-charles-07', 'test', NULL, 1590150600197, 0, '未审核', 0, 0, NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_category` (`parent_id`),
  CONSTRAINT `fk_category_category` FOREIGN KEY (`parent_id`) REFERENCES `cms_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
BEGIN;
INSERT INTO `cms_category` VALUES (3, '校园新闻', '', 1, NULL);
INSERT INTO `cms_category` VALUES (4, '通知公告', NULL, 2, NULL);
INSERT INTO `cms_category` VALUES (5, '学术活动', NULL, 3, NULL);
INSERT INTO `cms_category` VALUES (6, '媒体聚焦', NULL, 4, NULL);
INSERT INTO `cms_category` VALUES (7, '学院快讯', NULL, 5, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `comment_time` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user` (`user_id`),
  KEY `fk_comment_article` (`article_id`),
  KEY `fk_comment_comment` (`parent_id`),
  CONSTRAINT `fk_comment_article` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`id`),
  CONSTRAINT `fk_comment_comment` FOREIGN KEY (`parent_id`) REFERENCES `cms_comment` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
BEGIN;
INSERT INTO `cms_comment` VALUES (1, '作者厉害', 1597334224546, '审核通过', NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (2, '作者牛皮', 1597334224546, '审核未通过', NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (3, 'springmvc到底怎么用？', 1597334224546, '未审核', NULL, 2, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
