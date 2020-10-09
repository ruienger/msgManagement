/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : university

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 21/08/2020 16:39:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_file
-- ----------------------------
DROP TABLE IF EXISTS `base_file`;
CREATE TABLE `base_file` (
  `id` varchar(255) NOT NULL,
  `fileName` varchar(256) DEFAULT NULL,
  `groupName` varchar(256) DEFAULT NULL,
  `uploadTime` bigint(255) DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_privilege_privilege` (`parent_id`),
  CONSTRAINT `fk_privilege_privilege` FOREIGN KEY (`parent_id`) REFERENCES `base_privilege` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_privilege` VALUES (1, '栏目管理', '', '/info/category/List', NULL, 'menu', '', NULL, 32);
INSERT INTO `base_privilege` VALUES (2, '消息管理', '', '/info/article/List', NULL, 'menu', '', NULL, 32);
INSERT INTO `base_privilege` VALUES (3, '栏目添加', NULL, '/category/saveOrUpdate', NULL, 'method', '', NULL, 1);
INSERT INTO `base_privilege` VALUES (4, '栏目列表', NULL, '/category/findAll', NULL, 'method', '', NULL, 1);
INSERT INTO `base_privilege` VALUES (5, '用户管理', NULL, '/sys/user/List', NULL, 'menu', 'peoples', NULL, 33);
INSERT INTO `base_privilege` VALUES (6, '用户添加或修改', '', '/baseUser/saveOrUpdate', NULL, 'method', '', NULL, 5);
INSERT INTO `base_privilege` VALUES (7, '文章查询', '', '/article/findAll', NULL, 'method', '', NULL, 2);
INSERT INTO `base_privilege` VALUES (8, '通过id删除', NULL, '/category/deleteById', NULL, 'method', '', NULL, 1);
INSERT INTO `base_privilege` VALUES (9, '批量删除', NULL, '/category/batchDelete', NULL, 'method', '', NULL, 1);
INSERT INTO `base_privilege` VALUES (10, '级联查询文章', NULL, '/article/cascadeFindAll', NULL, 'method', '', NULL, 2);
INSERT INTO `base_privilege` VALUES (11, '通过id查询文章', NULL, '/article/findById', NULL, 'method', '', NULL, 2);
INSERT INTO `base_privilege` VALUES (12, '保存或更新', NULL, '/article/saveOrUpdate', NULL, 'method', '', NULL, 2);
INSERT INTO `base_privilege` VALUES (13, '通过token查询用户信息', NULL, '/user/info', NULL, 'method', '', NULL, 5);
INSERT INTO `base_privilege` VALUES (14, '查询用户级联角色', NULL, '/baseUser/cascadeRoleFindAll', NULL, 'method', '', NULL, 5);
INSERT INTO `base_privilege` VALUES (15, '通过id删除', NULL, '/baseUser/deleteById', NULL, 'method', '', NULL, 5);
INSERT INTO `base_privilege` VALUES (16, '查询所有', NULL, '/baseUser/findAll', NULL, 'method', '', NULL, 5);
INSERT INTO `base_privilege` VALUES (17, '设置角色', NULL, '/baseUser/setRoles', NULL, 'method', '', NULL, 5);
INSERT INTO `base_privilege` VALUES (18, '权限管理', NULL, '/sys/privilege/List', NULL, 'menu', '', 1, 33);
INSERT INTO `base_privilege` VALUES (19, '查询所有', NULL, '/privilege/findAll', NULL, 'method', '', NULL, 18);
INSERT INTO `base_privilege` VALUES (20, '通过parentID查询权限', NULL, '/privilege/findByParentId', NULL, 'method', '', NULL, 18);
INSERT INTO `base_privilege` VALUES (21, '查询权限树', NULL, '/privilege/findPrivilegeTree', NULL, 'method', '', NULL, 18);
INSERT INTO `base_privilege` VALUES (22, '保存或更新', NULL, '/privilege/saveOrUpdate', NULL, 'method', '', NULL, 18);
INSERT INTO `base_privilege` VALUES (23, '角色管理', NULL, '/sys/role/List', NULL, 'menu', '', NULL, 33);
INSERT INTO `base_privilege` VALUES (24, '授权', NULL, '/role/authorization', NULL, 'method', '', NULL, 23);
INSERT INTO `base_privilege` VALUES (25, '级联权限查询', NULL, '/role/cascadePrivilegeFindAll', NULL, 'method', '', NULL, 23);
INSERT INTO `base_privilege` VALUES (26, '通过id删除', NULL, '/role/deleteById', NULL, 'method', '', NULL, 23);
INSERT INTO `base_privilege` VALUES (27, '查询所有', NULL, '/role/findAll', NULL, 'method', '', NULL, 23);
INSERT INTO `base_privilege` VALUES (28, '保存或更新', NULL, '/role/saveOrUpdate', NULL, 'method', '', NULL, 23);
INSERT INTO `base_privilege` VALUES (29, '消息导出', NULL, '/article/download', NULL, 'method', '', NULL, 2);
INSERT INTO `base_privilege` VALUES (32, '资讯发布', '', '/info/', NULL, 'menu', 'education', NULL, NULL);
INSERT INTO `base_privilege` VALUES (33, '角色权限', NULL, '/sys/', NULL, 'menu', 'peoples', NULL, NULL);
INSERT INTO `base_privilege` VALUES (34, '消息编辑', NULL, '/info/article/Editor', NULL, 'menu', 'user', 1, 32);
INSERT INTO `base_privilege` VALUES (36, '动态用户菜单', NULL, '/baseUser/findMenuByUserId', NULL, 'method', '', NULL, 5);
INSERT INTO `base_privilege` VALUES (53, '用户详情', NULL, '/sys/user/Details        \n        \n', 'user_details', 'menu', NULL, 1, 33);
INSERT INTO `base_privilege` VALUES (55, '教师课程', '', '/fitness', '', 'menu', 'list', NULL, NULL);
INSERT INTO `base_privilege` VALUES (56, '课程管理', '', '/university/teacher/Course', '', 'menu', '', NULL, 55);
INSERT INTO `base_privilege` VALUES (57, '必修课成绩录入', '', '/university/teacher/SelectCourse', '', 'menu', '', NULL, 55);
INSERT INTO `base_privilege` VALUES (58, '课表查看', '', '/university/teacher/CourseTable', '', 'menu', '', NULL, 55);
INSERT INTO `base_privilege` VALUES (59, '个人中心', '', '/fitness/member', '', 'menu', 'user', NULL, NULL);
INSERT INTO `base_privilege` VALUES (60, '个人主页', '', '/university/student/Details', '', 'menu', '', NULL, 59);
INSERT INTO `base_privilege` VALUES (61, '已选课程', '', '/university/student/SelectCourse', '', 'menu', '', NULL, 59);
INSERT INTO `base_privilege` VALUES (64, '选课表单', '', '/university/student/SelectCourseForm', '', 'menu', '', 1, 59);
INSERT INTO `base_privilege` VALUES (65, '院系设置', '', '/university/structure/College', '', 'menu', '', NULL, 68);
INSERT INTO `base_privilege` VALUES (66, '班级设置', '', '/university/structure/Clazz', '', 'menu', '', NULL, 68);
INSERT INTO `base_privilege` VALUES (67, '教室管理', '', '/university/structure/Classroom', '', 'menu', '', NULL, 68);
INSERT INTO `base_privilege` VALUES (68, '组织架构', NULL, '/university/structure', NULL, 'menu', 'tree', NULL, NULL);
INSERT INTO `base_privilege` VALUES (69, '排课中心', NULL, '/university/arranging', NULL, 'menu', 'table', NULL, NULL);
INSERT INTO `base_privilege` VALUES (70, '排课管理', NULL, '/university/arranging/CoursesArranging', NULL, 'menu', NULL, NULL, 69);
INSERT INTO `base_privilege` VALUES (71, '成绩查询', '', '/university/student/Grade', '', 'menu', '', NULL, 59);
INSERT INTO `base_privilege` VALUES (72, '我的课表', NULL, '/university/student/MyCourse', NULL, 'menu', NULL, NULL, 59);
INSERT INTO `base_privilege` VALUES (73, '选修课成绩录入', NULL, '/university/teacher/SelectCourse_xx', NULL, 'menu', NULL, NULL, 55);
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
  CONSTRAINT `fk_role_privilege_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `base_privilege` (`id`),
  CONSTRAINT `fk_role_privilege_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_role_privilege` VALUES (69, 2, 32);
INSERT INTO `base_role_privilege` VALUES (70, 2, 1);
INSERT INTO `base_role_privilege` VALUES (71, 2, 3);
INSERT INTO `base_role_privilege` VALUES (72, 2, 4);
INSERT INTO `base_role_privilege` VALUES (73, 2, 8);
INSERT INTO `base_role_privilege` VALUES (74, 2, 9);
INSERT INTO `base_role_privilege` VALUES (75, 2, 2);
INSERT INTO `base_role_privilege` VALUES (76, 2, 7);
INSERT INTO `base_role_privilege` VALUES (77, 2, 10);
INSERT INTO `base_role_privilege` VALUES (78, 2, 11);
INSERT INTO `base_role_privilege` VALUES (79, 2, 12);
INSERT INTO `base_role_privilege` VALUES (80, 2, 29);
INSERT INTO `base_role_privilege` VALUES (81, 2, 34);
INSERT INTO `base_role_privilege` VALUES (82, 2, 33);
INSERT INTO `base_role_privilege` VALUES (83, 2, 5);
INSERT INTO `base_role_privilege` VALUES (84, 2, 6);
INSERT INTO `base_role_privilege` VALUES (85, 2, 13);
INSERT INTO `base_role_privilege` VALUES (86, 2, 14);
INSERT INTO `base_role_privilege` VALUES (87, 2, 15);
INSERT INTO `base_role_privilege` VALUES (88, 2, 16);
INSERT INTO `base_role_privilege` VALUES (89, 2, 17);
INSERT INTO `base_role_privilege` VALUES (90, 2, 36);
INSERT INTO `base_role_privilege` VALUES (91, 2, 18);
INSERT INTO `base_role_privilege` VALUES (92, 2, 19);
INSERT INTO `base_role_privilege` VALUES (93, 2, 20);
INSERT INTO `base_role_privilege` VALUES (94, 2, 21);
INSERT INTO `base_role_privilege` VALUES (95, 2, 22);
INSERT INTO `base_role_privilege` VALUES (96, 2, 23);
INSERT INTO `base_role_privilege` VALUES (97, 2, 24);
INSERT INTO `base_role_privilege` VALUES (98, 2, 25);
INSERT INTO `base_role_privilege` VALUES (99, 2, 26);
INSERT INTO `base_role_privilege` VALUES (100, 2, 27);
INSERT INTO `base_role_privilege` VALUES (101, 2, 28);
INSERT INTO `base_role_privilege` VALUES (124, 1, 36);
INSERT INTO `base_role_privilege` VALUES (155, 2, 53);
INSERT INTO `base_role_privilege` VALUES (165, 2, 55);
INSERT INTO `base_role_privilege` VALUES (166, 2, 56);
INSERT INTO `base_role_privilege` VALUES (167, 1, 55);
INSERT INTO `base_role_privilege` VALUES (168, 1, 56);
INSERT INTO `base_role_privilege` VALUES (169, 2, 57);
INSERT INTO `base_role_privilege` VALUES (170, 1, 57);
INSERT INTO `base_role_privilege` VALUES (186, 6, 13);
INSERT INTO `base_role_privilege` VALUES (187, 6, 21);
INSERT INTO `base_role_privilege` VALUES (189, 1, 58);
INSERT INTO `base_role_privilege` VALUES (190, 2, 58);
INSERT INTO `base_role_privilege` VALUES (191, 6, 36);
INSERT INTO `base_role_privilege` VALUES (192, 6, 59);
INSERT INTO `base_role_privilege` VALUES (193, 6, 60);
INSERT INTO `base_role_privilege` VALUES (194, 6, 61);
INSERT INTO `base_role_privilege` VALUES (197, 1, 13);
INSERT INTO `base_role_privilege` VALUES (206, 2, 65);
INSERT INTO `base_role_privilege` VALUES (207, 2, 66);
INSERT INTO `base_role_privilege` VALUES (208, 2, 67);
INSERT INTO `base_role_privilege` VALUES (209, 2, 68);
INSERT INTO `base_role_privilege` VALUES (210, 2, 69);
INSERT INTO `base_role_privilege` VALUES (211, 2, 70);
INSERT INTO `base_role_privilege` VALUES (212, 6, 64);
INSERT INTO `base_role_privilege` VALUES (213, 6, 71);
INSERT INTO `base_role_privilege` VALUES (214, 6, 72);
INSERT INTO `base_role_privilege` VALUES (215, 2, 73);
INSERT INTO `base_role_privilege` VALUES (216, 1, 73);
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
  `clazz_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clazz_id` (`clazz_id`),
  CONSTRAINT `base_user_ibfk_1` FOREIGN KEY (`clazz_id`) REFERENCES `university_clazz` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (1, 'teacher1', '123321', '18812344321', '张老师', 'female', 1572883200000, 1573892938430, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (2, 'teacher2', '123321', '18867541234', '胡老师', 'female', 1572883200000, 1573892938430, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (3, 'teacher3', '123321', '18812344325', '刘老师', 'female', 1572883200000, 1573892938430, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (5, 'admin1', '123321', '18812344321', '王总', 'male', 1572883200000, 1574155005310, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (6, 'admin2', '123321', '15512348854', '李总', 'male', 1572883200000, 1574839989546, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (8, '张明', '123321', '15512348854', '张明', 'male', 1572883200000, 1581673168302, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (9, '周盼', '123321', '15512348859', '周盼', 'female', 1572883200000, 1581673188565, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (10, '张琛', '123321', '15512348890', '张琛', 'male', 1572883200000, 1582112524753, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (11, '黄小雷', '123321', '15512348868', '黄小雷', 'male', NULL, 1583893653152, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (12, '王红艳', '123321', '15512348806', '王红艳', 'female', NULL, 1583893668341, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (13, '刘兰特', '123321', '15512348807', '刘兰特', 'male', NULL, 1583893686987, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (14, '张兰德', '123321', '15512348808', '张兰德', 'male', NULL, 1583893709080, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (15, '张德全', '123321', '15512346678', '张德全', 'male', NULL, 1583894200273, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (16, '李小露', '123321', '15512347765', '李小露', 'female', NULL, 1583894783567, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (17, '李大路', '123321', '15512348888', '李大路', 'male', NULL, 1583894819291, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145568', '江苏省苏州市工业园区', '汉', '群众', NULL);
INSERT INTO `base_user` VALUES (18, '张晓光', '123321', '15512348998', '张晓光', 'male', NULL, 1584262394712, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145598', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (19, '胡美丽', '123321', '15512348000', '胡美丽', 'female', NULL, 1584262394776, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '051221199403145567', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (20, '张晓丽', '123321', '1.5512348111E10', '张晓丽', 'male', NULL, 1584353343230, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145501', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (21, '胡大光', '123321', '15512348112', '胡大光', 'male', NULL, 1584353343243, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145502', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (22, '刘涛', '123321', '15512348113', '刘涛', 'male', NULL, 1584353343250, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145503', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (23, '张强', '123321', '15512348114', '张强', 'male', NULL, 1584353343254, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145504', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (24, '张亮', '123321', '15512348115', '张亮', 'male', NULL, 1584353343259, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145505', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (25, '张晓明', '123321', '15512348116', '张晓明', 'male', NULL, 1584353343263, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145506', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (26, '胡晨', '123321', '15512348117', '胡晨', 'male', NULL, 1584353343266, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145507', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (27, '刘发光', '123321', '15512348118', '刘发光', 'male', NULL, 1584353343270, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145508', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (28, '张二妹', '123321', '15512348119', '张二妹', 'female', NULL, 1584353343274, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众', 1);
INSERT INTO `base_user` VALUES (29, '张1', '123321', '1.5512348111E10', '张1', 'male', NULL, 1584543335393, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145501', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (31, '刘3', '123321', '15512348113', '刘3', 'male', NULL, 1584543335410, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145503', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (35, '胡7', '123321', '15512348117', '胡7', 'male', NULL, 1584543335429, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145507', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (36, '刘9', '123321', '15512348118', '刘9', 'male', NULL, 1584543335434, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145508', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (37, '张10', '123321', '15512348119', '张10', 'female', NULL, 1584543335438, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (38, '张11', '123321', '15512348119', '张11', 'female', NULL, 1584543335442, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (39, '张12', '123321', '15512348119', '张12', 'female', NULL, 1584543335446, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众', 2);
INSERT INTO `base_user` VALUES (40, '张13', '123321', '15512348119', '张13', 'female', NULL, 1584543335450, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png', '51221199403145509', '江苏省苏州市工业园区', '汉', '群众', 2);
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
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

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
INSERT INTO `base_user_role` VALUES (44, NULL, 6);
INSERT INTO `base_user_role` VALUES (45, 31, 6);
INSERT INTO `base_user_role` VALUES (46, NULL, 6);
INSERT INTO `base_user_role` VALUES (47, NULL, 6);
INSERT INTO `base_user_role` VALUES (48, NULL, 6);
INSERT INTO `base_user_role` VALUES (49, 35, 6);
INSERT INTO `base_user_role` VALUES (50, 36, 6);
INSERT INTO `base_user_role` VALUES (51, 37, 6);
INSERT INTO `base_user_role` VALUES (52, 38, 6);
INSERT INTO `base_user_role` VALUES (53, 39, 6);
INSERT INTO `base_user_role` VALUES (54, 40, 6);
INSERT INTO `base_user_role` VALUES (55, NULL, 6);
INSERT INTO `base_user_role` VALUES (56, NULL, 6);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_article` VALUES (1, '校领导调研东山校区疫情防控和企业复工工作', '<div style=\"width: 769px; margin: 20px auto; line-height: 25px;\">\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">学习贯彻习近平总书记在统筹推进新冠肺炎疫情防控和经济社会发展工作部署会议上的重要讲话精神，按照省委、省政府三&ldquo;要&rdquo;六&ldquo;统筹&rdquo;的工作要求，我校疫情防控工作领导小组多次专门研究东山校区复工问题，决定全力支持东山校区建筑工地有序复工 。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">3月5日上午，校长黄桂田、党委副书记李富明、副校长卢宇鸿一行深入东山校区建筑工地现场，调研检查疫情防控和企业复工工作，对开工企业和近600名工地人员表示慰问。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">黄桂田一行先后走访了校区进出口、理科教学与实验综合楼、电力学院楼建设项目和我校项目部，听取项目施工方在疫情防控、员工返岗、项目规划、安全保障等方面的情况汇报，详细了解项目建设中遇到的困难和问题。调研组人员充分肯定了中铁三局、中铁十七局等企业在复工准备和疫情防控方面的做法，点赞大型央企起到的模范带头作用。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">黄桂田指出，在抓好疫情防控的基础上，恢复经济社会生产生活秩序是当务之急，东山校区作为山西省重点工程要尽快复工。他强调，各相关部门要从发展大局出发，科学研判、统筹兼顾，强化责任意识，加强协调配合，千方百计破解疫情影响难题，全力支持东山校区各工地尽早复工，确保各项工作尽快回归正轨。同时，施工单位要切实扛起项目建设和疫情防控主体责任，在确保安全施工的前提下，加快组织力量，开足马力抓建设抢工期、抓质量提品质，确保各工程项目顺利推进。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">党办、校办、保卫部、基建处、国资处、校医院相关负责人参加调研检查。</p>\n</div>', '', 1583449535781, 0, '未审核', 0, 0, 1, 4);
INSERT INTO `cms_article` VALUES (2, '我校召开研究生教育和学科建设工作网络会议', '<div style=\"width: 769px; margin: 20px auto; line-height: 25px;\">\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">3月4日下午，我校召开了研究生教育和学科建设工作会议，安排部署2020年春季学期学位与研究生教育、第五轮学科评估等工作。副校长张天才、各培养单位相关负责人、教学秘书共85人参加了会议，此次会议利用企业微信网络会议形式进行，由研究生院院长肖连团主持。</p>\n<p style=\"text-align: center; text-indent: 0px;\"><img style=\"width: 250px; height: 382px;\" title=\"bbf7ade117ad408fa620d0bcc447265f.png\" src=\"http://news.sxu.edu.cn/images/2020-03/bbf7ade117ad408fa620d0bcc447265f.png\" alt=\"bbf7ade117ad408fa620d0bcc447265f.png\" width=\"250\" height=\"382\" border=\"0\" vspace=\"0\" /><img style=\"width: 300px; height: 231px;\" title=\"9889a9ed10244bcf8a6dd05f601823a6.png\" src=\"http://news.sxu.edu.cn/images/2020-03/9889a9ed10244bcf8a6dd05f601823a6.png\" alt=\"9889a9ed10244bcf8a6dd05f601823a6.png\" width=\"300\" height=\"231\" border=\"0\" vspace=\"0\" /></p>\n<p style=\"text-indent: 0px;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">肖连团针对新冠肺炎疫情对我校研究生教育相关工作的影响，根据教育部、山西省教育厅和学校的文件进行了整体工作部署。他强调，在疫情防控期间开展线上教育教学，是研究生混合式教学改革的重点之一，而不仅仅是疫情期间的应急措施；各培养单位要尽快完善工作预案，充分做好研究生招生、培养、学位申请工作全过程使用信息化手段的准备工作；导师要加强对研究生学习及心理方面的网络指导，特别是对于身处疫情严重地区的研究生，应重点给予关怀；同时各培养单位要加强研究生教学督导体系建设，开展在线教学检查并加强与校级督导形成联动，保障培养质量。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">研究生院三位副院长分别就研究生教学与培养过程管理、研究生招生工作、研究生学位工作做了具体安排。会议通报了研究生线上教学前期准备工作、第一周线上教学实施情况，后续研究生教学与培养过程管理工作；对2020年度的硕士研究生招生工作涉及到的工作管理、计划扩招、复试工作，调剂录取等进行了详细说明，介绍了本学期各类博士招生考试(考核）工作方案； 通报了学校对于研究生学位相关文件修订情况，包括研究生毕业要求和导师遴选办法，并对近期学位工作进行了安排，特别地对保障研究生学位论文质量的各项举措提出了具体要求。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">学科建设与发展规划办公室吕宏伟副主任通报了校、院两级就第五轮学科评估开展相关工作的进展情况，传达了学校疫情防控领导组&ldquo;关于统筹做好疫情防控和学校教育改革发展，扎实推进第五轮学科评估工作&rdquo;的有关精神，就进一步强化院系组织领导、加强与职能部门沟通、广泛发动学科力量，按既定方案扎实推进评估工作等内容进行了安排部署。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">张天才副校长要求各培养单位加强组织领导，积极主动作为，全面保障本学期的教学计划按时完成；细化预案，完善环节，查补漏洞，确保教学质量不滑坡；精心谋划，分工协作，创新教育教学理念和教学方法；加强质量监督与保障工作，完善相关的管理机制；切实做好毕业生工作，确保学位授予工作顺利进行。强调各单位要切实加强第五轮学科评估组织工作，抢抓机遇、全力以赴，积极推进各方面工作的落实，全力以赴服务于学校双一流建设。</p>\n</div>', '', 1583449535781, 0, '未审核', 0, 0, 1, 3);
INSERT INTO `cms_article` VALUES (11, '学校疫情防控工作领导小组召开第十五次工作会议', '<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">近日，教育部党组下发《关于统筹做好教育系统新冠肺炎疫情防控和教育改革发展工作的通知》，对统筹做好教育系统疫情防控和教育改革发展工作进行了部署安排，为再次深入学习贯彻习近平总书记在统筹推进新冠肺炎疫情防控和经济社会发展工作部署会议上的重要讲话精神，贯彻落实教育部党组相关通知精神和省委省政府近期关于疫情防控的相关决策部署，3月2日，校党委书记符惠明主持召开学校疫情防控工作领导小组第十五次工作会议，就下一阶段统筹做好学校疫情防控工作和教育改革发展工作进行了研究部署。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt; text-align: center;\"><img title=\"3d2cf4d3dbb9433cb7fc8032acb06972.jpg\" src=\"http://news.sxu.edu.cn/images/2020-03/3d2cf4d3dbb9433cb7fc8032acb06972.jpg\" alt=\"f.jpg\" /></p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">会议期间，符惠明、黄桂田同志带头，响应党中央对广大党员的号召，为支持新冠肺炎疫情防控工作捐款。与会其他校领导和相关部门负责人纷纷捐款。</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt; text-align: center;\"><img title=\"7252998d1ea342069741780d58919384.jpg\" src=\"http://news.sxu.edu.cn/images/2020-03/7252998d1ea342069741780d58919384.jpg\" alt=\"h.jpg\" /></p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">&nbsp;</p>\n<p style=\"line-height: 180%; text-indent: 2em; font-size: 14pt;\">符惠明表示，要深刻领会习近平总书记在统筹推进新冠肺炎疫情防控和经济社会发展工作部署会议上的重要讲话精神，明确中央关于疫情防控和经济社会发展工作的新判断、新要求，认真贯彻落实教育部党组关于统筹做好教育系统新冠肺炎疫情防控和教育改革发展工作做出的7项决策部署，贯彻落实省委省政府、省教育厅近期关于疫情防控的各项决策部署，结合学校实际，扎扎实实统筹做好学校疫情防控和当前各项重点工作。</p>', '<h1>this is test03</h1>', 1583449535781, 0, '未审核', 0, 0, 1, 3);
INSERT INTO `cms_article` VALUES (29, 'test-charles-01', 'this is a test01', NULL, 1590147733263, 0, '未审核', 0, 0, NULL, 3);
INSERT INTO `cms_article` VALUES (30, 'test-charles-02', 'this is a test01', NULL, 1590149256353, 0, '未审核', 0, 0, NULL, 3);
INSERT INTO `cms_article` VALUES (31, 'test-charles-03', 'this is a test01', NULL, 1590149486258, 0, '未审核', 0, 0, NULL, 3);
INSERT INTO `cms_article` VALUES (32, 'test-charles-04', 'test04', NULL, 1590150340427, 0, '未审核', 0, 0, NULL, 3);
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
INSERT INTO `cms_comment` VALUES (1, '作者厉害', NULL, NULL, NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (2, '作者牛皮', NULL, NULL, NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (3, 'springmvc到底怎么用？', NULL, NULL, NULL, 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for university_clazz
-- ----------------------------
DROP TABLE IF EXISTS `university_clazz`;
CREATE TABLE `university_clazz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `paike_status` varchar(255) DEFAULT NULL,
  `college_id` bigint(20) DEFAULT NULL,
  `charge_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university_clazz
-- ----------------------------
BEGIN;
INSERT INTO `university_clazz` VALUES (1, '软件202001班', '已排课', 2, 2);
INSERT INTO `university_clazz` VALUES (2, '软件202002班', '已排课', 2, 3);
INSERT INTO `university_clazz` VALUES (3, '软件202003班', '未排课', 2, 2);
INSERT INTO `university_clazz` VALUES (4, '计科202001', '未排课', 1, 2);
INSERT INTO `university_clazz` VALUES (5, '计科202002', '未排课', 1, 1);
INSERT INTO `university_clazz` VALUES (6, '计科202003', '未排课', 1, 11);
COMMIT;

-- ----------------------------
-- Table structure for university_clazz_course
-- ----------------------------
DROP TABLE IF EXISTS `university_clazz_course`;
CREATE TABLE `university_clazz_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_day` varchar(255) DEFAULT NULL,
  `course_time` varchar(255) DEFAULT NULL,
  `clazz_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university_clazz_course
-- ----------------------------
BEGIN;
INSERT INTO `university_clazz_course` VALUES (1, '周一', '08:00-09:00', 4, 23);
INSERT INTO `university_clazz_course` VALUES (2, '周二', '10:00-11:00', 4, 22);
INSERT INTO `university_clazz_course` VALUES (3, '周二', '08:00-09:00', 5, 22);
INSERT INTO `university_clazz_course` VALUES (4, '周三', '14:00-15:00', 5, 20);
INSERT INTO `university_clazz_course` VALUES (5, '周二', '08:00-09:00', 4, 17);
INSERT INTO `university_clazz_course` VALUES (6, '周四', '10:00-11:00', 5, 17);
INSERT INTO `university_clazz_course` VALUES (7, '周三', '08:00-09:00', 4, 17);
INSERT INTO `university_clazz_course` VALUES (8, '周一', '08:00-09:00', 1, 23);
INSERT INTO `university_clazz_course` VALUES (9, '周四', '10:00-11:00', 1, 23);
INSERT INTO `university_clazz_course` VALUES (10, '周三', '08:00-09:00', 1, 22);
INSERT INTO `university_clazz_course` VALUES (11, '周二', '14:00-15:00', 1, 22);
INSERT INTO `university_clazz_course` VALUES (12, '周六', '08:00-09:00', 1, 19);
INSERT INTO `university_clazz_course` VALUES (13, '周五', '14:00-15:00', 1, 19);
INSERT INTO `university_clazz_course` VALUES (14, '周一', '08:00-09:00', 2, 23);
INSERT INTO `university_clazz_course` VALUES (15, '周五', '14:00-15:00', 2, 23);
INSERT INTO `university_clazz_course` VALUES (16, '周三', '10:00-11:00', 2, 22);
INSERT INTO `university_clazz_course` VALUES (17, '周五', '08:00-09:00', 2, 22);
INSERT INTO `university_clazz_course` VALUES (18, '周一', '14:00-15:00', 2, 21);
INSERT INTO `university_clazz_course` VALUES (19, '周四', '10:00-11:00', 2, 21);
COMMIT;

-- ----------------------------
-- Table structure for university_clazzroom
-- ----------------------------
DROP TABLE IF EXISTS `university_clazzroom`;
CREATE TABLE `university_clazzroom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `seats` int(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university_clazzroom
-- ----------------------------
BEGIN;
INSERT INTO `university_clazzroom` VALUES (1, 'A-01', 100, 'A栋');
INSERT INTO `university_clazzroom` VALUES (2, 'B-01', 100, 'B栋');
INSERT INTO `university_clazzroom` VALUES (3, 'A-02', 80, 'A栋');
INSERT INTO `university_clazzroom` VALUES (4, 'A-03', 80, 'A栋');
INSERT INTO `university_clazzroom` VALUES (5, 'A-04', 80, 'A栋');
COMMIT;

-- ----------------------------
-- Table structure for university_college
-- ----------------------------
DROP TABLE IF EXISTS `university_college`;
CREATE TABLE `university_college` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university_college
-- ----------------------------
BEGIN;
INSERT INTO `university_college` VALUES (1, '计算机学院', '成立于1998年');
INSERT INTO `university_college` VALUES (2, '软件学院', '成立于2010年');
INSERT INTO `university_college` VALUES (3, '大数据与云计算学院', '成立于2016年');
INSERT INTO `university_college` VALUES (4, '多媒体学院', '成立于2010年');
COMMIT;

-- ----------------------------
-- Table structure for university_course
-- ----------------------------
DROP TABLE IF EXISTS `university_course`;
CREATE TABLE `university_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `course_day` varchar(255) DEFAULT NULL,
  `course_time` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `credit` double(255,0) DEFAULT NULL,
  `max_num` int(10) DEFAULT NULL,
  `actual_num` int(10) DEFAULT NULL,
  `hours` double(255,0) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `clazzroom_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `university_course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `base_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university_course
-- ----------------------------
BEGIN;
INSERT INTO `university_course` VALUES (1, '瑜伽', '美女必修课', '周一', '08:00-09:00', '', '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 1, NULL);
INSERT INTO `university_course` VALUES (2, '动力单车', '动力小火车', '周二', '08:00-09:00', '', '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 2, NULL);
INSERT INTO `university_course` VALUES (3, '有氧操', '慢运动，具有减肥功效', '周三', '08:00-09:00', '', '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 2, NULL);
INSERT INTO `university_course` VALUES (5, '慢跑', '有氧慢跑', '周四', '08:00-09:00', '', '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 1, NULL);
INSERT INTO `university_course` VALUES (6, '跳绳', '跳跳更健康', '周一', '08:00-09:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 1, NULL);
INSERT INTO `university_course` VALUES (7, '爵士舞', '很有感觉', '周四', '16:00-17:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 1, NULL);
INSERT INTO `university_course` VALUES (8, '拉丁舞', '很酷的', '周五', '19:00-20:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 1, NULL);
INSERT INTO `university_course` VALUES (9, '民族舞', '很有艺术感', '周四', '14:00-15:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 1, NULL);
INSERT INTO `university_course` VALUES (10, '肚皮舞', '性感的很', '周五', '10:00-11:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 1, NULL);
INSERT INTO `university_course` VALUES (11, '印度舞', 'hello world', '周六', '08:00-09:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 2, NULL);
INSERT INTO `university_course` VALUES (12, '篮球', '个子高的占优势', '周日', '19:00-20:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 2, NULL);
INSERT INTO `university_course` VALUES (13, '有氧慢跑', 'test...', '周一', '10:00-11:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 2, NULL);
INSERT INTO `university_course` VALUES (14, '健美操', '美美的健美操', '周二', '14:00-15:00', NULL, '选修课', '2019-2020', '第二学期', 2, 150, 0, NULL, 2, NULL);
INSERT INTO `university_course` VALUES (16, '华尔兹', '', '周二', '16:00-17:00', '', '选修课', '2018-2019', '第一学期', 2, 150, NULL, 36, 1, NULL);
INSERT INTO `university_course` VALUES (17, 'C语言基础', '', '', '', '', '必修课', '2019-2020', '第二学期', 4, NULL, NULL, 48, 17, NULL);
INSERT INTO `university_course` VALUES (18, '数据结构', '', '', '', '', '必修课', '2019-2020', '第二学期', 4, NULL, NULL, 48, 17, NULL);
INSERT INTO `university_course` VALUES (19, '计算机组成原理', '计算机组成原理计算机分为五大组成部分,分别为:控制器、运算器、存储器、输入设备和输出设备。其中控制器+运算器是计算机的中央处理器(CPU),相当于人类的大脑。', '', '', '', '必修课', '2019-2020', '第一学期', 4, NULL, NULL, 48, 16, NULL);
INSERT INTO `university_course` VALUES (20, '高等数学上', '通常认为，高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。', '', '', '', '必修课', '2019-2020', '第一学期', 4, NULL, NULL, 48, 15, NULL);
INSERT INTO `university_course` VALUES (21, '高等数学下', '通常认为，高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。', '', '', '', '必修课', '2019-2020', '第二学期', 4, NULL, NULL, 48, 11, NULL);
INSERT INTO `university_course` VALUES (22, '离散数学', NULL, NULL, NULL, NULL, '必修课', '2019-2020', '第一学期', 4, NULL, NULL, 36, 15, NULL);
INSERT INTO `university_course` VALUES (23, '概率统计', '一次随机抽样中尽管多种事件都可能出现，但最容易出现（遇到）的事件（结局）是概率最高的事件。概率公理的表述中用了“一次随机抽样”、“最容易出现”和“概率”这三个词。', '', '', '', '必修课', '2019-2020', '第一学期', 4, NULL, NULL, 36, 15, NULL);
COMMIT;

-- ----------------------------
-- Table structure for university_student_course
-- ----------------------------
DROP TABLE IF EXISTS `university_student_course`;
CREATE TABLE `university_student_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `xk_time` bigint(20) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `id` (`id`),
  CONSTRAINT `university_student_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `university_student_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `university_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university_student_course
-- ----------------------------
BEGIN;
INSERT INTO `university_student_course` VALUES (20, 1584353376263, NULL, 8, 19);
INSERT INTO `university_student_course` VALUES (21, 1584353376269, '98', 8, 22);
INSERT INTO `university_student_course` VALUES (22, 1584353376271, '82', 8, 23);
INSERT INTO `university_student_course` VALUES (23, 1584353376277, NULL, 9, 19);
INSERT INTO `university_student_course` VALUES (24, 1584353376280, '72', 9, 22);
INSERT INTO `university_student_course` VALUES (25, 1584353376282, '98', 9, 23);
INSERT INTO `university_student_course` VALUES (26, 1584353376284, NULL, 18, 19);
INSERT INTO `university_student_course` VALUES (27, 1584353376286, '80', 18, 22);
INSERT INTO `university_student_course` VALUES (28, 1584353376287, '90', 18, 23);
INSERT INTO `university_student_course` VALUES (29, 1584353376289, NULL, 19, 19);
INSERT INTO `university_student_course` VALUES (30, 1584353376291, '89', 19, 22);
INSERT INTO `university_student_course` VALUES (31, 1584353376293, '96', 19, 23);
INSERT INTO `university_student_course` VALUES (32, 1584353376294, NULL, 20, 19);
INSERT INTO `university_student_course` VALUES (33, 1584353376296, NULL, 20, 22);
INSERT INTO `university_student_course` VALUES (34, 1584353376298, '80', 20, 23);
INSERT INTO `university_student_course` VALUES (35, 1584353376300, NULL, 21, 19);
INSERT INTO `university_student_course` VALUES (36, 1584353376302, NULL, 21, 22);
INSERT INTO `university_student_course` VALUES (37, 1584353376305, '92', 21, 23);
INSERT INTO `university_student_course` VALUES (38, 1584353376306, NULL, 22, 19);
INSERT INTO `university_student_course` VALUES (39, 1584353376308, NULL, 22, 22);
INSERT INTO `university_student_course` VALUES (40, 1584353376310, NULL, 22, 23);
INSERT INTO `university_student_course` VALUES (41, 1584353376312, NULL, 23, 19);
INSERT INTO `university_student_course` VALUES (42, 1584353376314, NULL, 23, 22);
INSERT INTO `university_student_course` VALUES (43, 1584353376317, NULL, 23, 23);
INSERT INTO `university_student_course` VALUES (44, 1584353376319, NULL, 24, 19);
INSERT INTO `university_student_course` VALUES (45, 1584353376321, NULL, 24, 22);
INSERT INTO `university_student_course` VALUES (46, 1584353376323, NULL, 24, 23);
INSERT INTO `university_student_course` VALUES (47, 1584353376325, NULL, 25, 19);
INSERT INTO `university_student_course` VALUES (48, 1584353376326, NULL, 25, 22);
INSERT INTO `university_student_course` VALUES (49, 1584353376329, NULL, 25, 23);
INSERT INTO `university_student_course` VALUES (50, 1584353376331, NULL, 26, 19);
INSERT INTO `university_student_course` VALUES (51, 1584353376333, NULL, 26, 22);
INSERT INTO `university_student_course` VALUES (52, 1584353376335, NULL, 26, 23);
INSERT INTO `university_student_course` VALUES (53, 1584353376337, NULL, 27, 19);
INSERT INTO `university_student_course` VALUES (54, 1584353376338, NULL, 27, 22);
INSERT INTO `university_student_course` VALUES (55, 1584353376339, NULL, 27, 23);
INSERT INTO `university_student_course` VALUES (56, 1584353376341, NULL, 28, 19);
INSERT INTO `university_student_course` VALUES (57, 1584353376343, NULL, 28, 22);
INSERT INTO `university_student_course` VALUES (58, 1584353376344, NULL, 28, 23);
INSERT INTO `university_student_course` VALUES (59, 1584366384469, '92', 24, 2);
INSERT INTO `university_student_course` VALUES (60, 1584432959752, '88', 28, 2);
INSERT INTO `university_student_course` VALUES (61, 1584432973760, NULL, 28, 13);
INSERT INTO `university_student_course` VALUES (62, 1584520276258, '98', 9, 2);
INSERT INTO `university_student_course` VALUES (63, 1584524394662, NULL, 21, 16);
INSERT INTO `university_student_course` VALUES (64, 1584543349010, NULL, 10, 21);
INSERT INTO `university_student_course` VALUES (65, 1584543349012, NULL, 10, 22);
INSERT INTO `university_student_course` VALUES (66, 1584543349015, '98', 10, 23);
INSERT INTO `university_student_course` VALUES (67, 1584543349021, NULL, 29, 21);
INSERT INTO `university_student_course` VALUES (68, 1584543349025, NULL, 29, 22);
INSERT INTO `university_student_course` VALUES (69, 1584543349028, '88', 29, 23);
INSERT INTO `university_student_course` VALUES (73, 1584543349042, NULL, 31, 21);
INSERT INTO `university_student_course` VALUES (74, 1584543349045, NULL, 31, 22);
INSERT INTO `university_student_course` VALUES (75, 1584543349047, NULL, 31, 23);
INSERT INTO `university_student_course` VALUES (85, 1584543349091, NULL, 35, 21);
INSERT INTO `university_student_course` VALUES (86, 1584543349094, NULL, 35, 22);
INSERT INTO `university_student_course` VALUES (87, 1584543349096, NULL, 35, 23);
INSERT INTO `university_student_course` VALUES (88, 1584543349099, NULL, 36, 21);
INSERT INTO `university_student_course` VALUES (89, 1584543349102, NULL, 36, 22);
INSERT INTO `university_student_course` VALUES (90, 1584543349105, NULL, 36, 23);
INSERT INTO `university_student_course` VALUES (91, 1584543349108, NULL, 37, 21);
INSERT INTO `university_student_course` VALUES (92, 1584543349113, NULL, 37, 22);
INSERT INTO `university_student_course` VALUES (93, 1584543349115, NULL, 37, 23);
INSERT INTO `university_student_course` VALUES (94, 1584543349117, NULL, 38, 21);
INSERT INTO `university_student_course` VALUES (95, 1584543349119, NULL, 38, 22);
INSERT INTO `university_student_course` VALUES (96, 1584543349123, NULL, 38, 23);
INSERT INTO `university_student_course` VALUES (97, 1584543349127, NULL, 39, 21);
INSERT INTO `university_student_course` VALUES (98, 1584543349130, NULL, 39, 22);
INSERT INTO `university_student_course` VALUES (99, 1584543349133, NULL, 39, 23);
INSERT INTO `university_student_course` VALUES (100, 1584543349137, NULL, 40, 21);
INSERT INTO `university_student_course` VALUES (101, 1584543349149, NULL, 40, 22);
INSERT INTO `university_student_course` VALUES (102, 1584543349153, NULL, 40, 23);
COMMIT;

-- ----------------------------
-- Table structure for university_user_course
-- ----------------------------
DROP TABLE IF EXISTS `university_user_course`;
CREATE TABLE `university_user_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `xk_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `id` (`id`),
  CONSTRAINT `university_user_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `university_user_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `university_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university_user_course
-- ----------------------------
BEGIN;
INSERT INTO `university_user_course` VALUES (1, 8, 1, 1581735944084);
INSERT INTO `university_user_course` VALUES (2, 8, 2, 1581735944084);
INSERT INTO `university_user_course` VALUES (3, 9, 2, 1581735944084);
INSERT INTO `university_user_course` VALUES (4, 9, 3, 1581735944084);
INSERT INTO `university_user_course` VALUES (6, 8, 5, 1581739884595);
INSERT INTO `university_user_course` VALUES (7, 8, 11, 1581740102491);
INSERT INTO `university_user_course` VALUES (9, 8, 8, 1581740738708);
INSERT INTO `university_user_course` VALUES (10, 8, 7, 1581839116581);
INSERT INTO `university_user_course` VALUES (11, 8, 12, 1581842624804);
INSERT INTO `university_user_course` VALUES (14, 8, 3, 1581905331967);
INSERT INTO `university_user_course` VALUES (15, 9, 6, 1581908539867);
INSERT INTO `university_user_course` VALUES (16, 8, 14, 1582001358128);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
