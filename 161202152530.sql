/*
MySQL Backup
Source Server Version: 5.5.35
Source Database: hellotom_release
Date: 2016/12/2 15:25:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `design_design`
-- ----------------------------
DROP TABLE IF EXISTS `design_design`;
CREATE TABLE `design_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `design_title` varchar(200) NOT NULL,
  `design_img_url` varchar(200) DEFAULT NULL,
  `design_source` varchar(20) NOT NULL,
  `design_link` varchar(200) DEFAULT NULL,
  `design_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `development_development`
-- ----------------------------
DROP TABLE IF EXISTS `development_development`;
CREATE TABLE `development_development` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_title` varchar(200) NOT NULL,
  `dev_source` varchar(20) NOT NULL,
  `dev_link` varchar(200) DEFAULT NULL,
  `dev_category` varchar(20) NOT NULL,
  `dev_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `marketing_marketing`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_marketing`;
CREATE TABLE `marketing_marketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_title` varchar(200) NOT NULL,
  `m_desc` varchar(1000) NOT NULL,
  `m_img_url` varchar(200) DEFAULT NULL,
  `m_source` varchar(20) NOT NULL,
  `m_link` varchar(200) DEFAULT NULL,
  `m_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `news_news`
-- ----------------------------
DROP TABLE IF EXISTS `news_news`;
CREATE TABLE `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(200) NOT NULL,
  `n_desc` varchar(1000) NOT NULL,
  `n_img_url` varchar(200) DEFAULT NULL,
  `n_source` varchar(20) NOT NULL,
  `n_link` varchar(200) DEFAULT NULL,
  `n_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_product`
-- ----------------------------
DROP TABLE IF EXISTS `product_product`;
CREATE TABLE `product_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(100) NOT NULL,
  `p_link` varchar(200) DEFAULT NULL,
  `p_desc` varchar(500) NOT NULL,
  `p_source` varchar(500) DEFAULT NULL,
  `p_source_link` varchar(200) DEFAULT NULL,
  `p_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1','Can add log entry','1','add_logentry'), ('2','Can change log entry','1','change_logentry'), ('3','Can delete log entry','1','delete_logentry'), ('4','Can add permission','2','add_permission'), ('5','Can change permission','2','change_permission'), ('6','Can delete permission','2','delete_permission'), ('7','Can add user','3','add_user'), ('8','Can change user','3','change_user'), ('9','Can delete user','3','delete_user'), ('10','Can add group','4','add_group'), ('11','Can change group','4','change_group'), ('12','Can delete group','4','delete_group'), ('13','Can add content type','5','add_contenttype'), ('14','Can change content type','5','change_contenttype'), ('15','Can delete content type','5','delete_contenttype'), ('16','Can add session','6','add_session'), ('17','Can change session','6','change_session'), ('18','Can delete session','6','delete_session'), ('19','Can add product','7','add_product'), ('20','Can change product','7','change_product'), ('21','Can delete product','7','delete_product'), ('22','Can add news','8','add_news'), ('23','Can change news','8','change_news'), ('24','Can delete news','8','delete_news'), ('25','Can add design','9','add_design'), ('26','Can change design','9','change_design'), ('27','Can delete design','9','delete_design'), ('28','Can add marketing','10','add_marketing'), ('29','Can change marketing','10','change_marketing'), ('30','Can delete marketing','10','delete_marketing'), ('31','Can add development','11','add_development'), ('32','Can change development','11','change_development'), ('33','Can delete development','11','delete_development');
INSERT INTO `auth_user` VALUES ('1','pbkdf2_sha256$30000$orNhYnirr8uM$5S1rfUPRgTz0XbVDspIZXbOGNj9le2hz5KvKid5t0oY=','2016-09-06 08:05:20','1','root','','','310@qq.com','1','1','2016-08-17 04:21:02');
INSERT INTO `design_design` VALUES ('1','杭州人民的现状-想屯点粮食都失败了...','http://i03.pictn.sogoucdn.com/b8a175235371daaf','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649434983&idx=1&sn=a257dc62d6985bbf118a6c43f81e87df&scene=4#wechat_redirect','2016-08-25 10:08:16'), ('2','苹果正式发出邀请函 9月7日新iPhone亮相','http://img1.imgtn.bdimg.com/it/u=4119569213,2459330310&fm=206&gp=0.jpg','网易科技','http://tech.163.com/16/0830/01/BVM9M3C000097U7R.html','2016-08-30 09:37:06'), ('3','小米联合银联正式推出小米支付 国内移动支付竞争加剧','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','小米科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:37:51'), ('4','跟王健林抢头条？马云：月薪三四万最幸福','http://n.sinaimg.cn/ent/transform/20160830/q9_--fxvixet4106501.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixer7453748.shtml','2016-08-30 09:38:19'), ('5','国产量子卫星有啥黑科技?一技术可星间激光通信','http://img3.utuku.china.com/600x0/mili/20160829/b10560a6-ff77-4fcf-834b-8d37e3ca73ab.jpg','搜狐','http://mil.sohu.com/20160830/n466690400.shtml','2016-08-30 09:38:49'), ('6','刘翔怒告滴滴要赔偿126万：滴滴如此回应','http://p2.ifengimg.com/haina/2016_36/7e48054a480f3bb_w600_h357.jpg','凤凰网','http://tech.ifeng.com/a/20160830/44444202_0.shtml','2016-08-30 09:39:32'), ('7','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','http://i9.hexunimg.cn/2014-09-16/168500100.jpg','百度百家','http://yanjuyang.baijia.baidu.com/article/603313','2016-08-30 09:40:09'), ('8','终于来了！新MacBook Pro惊人曝光：销魂','http://himg2.huanqiu.com/attachment2010/2016/0830/20160830082904430.png','环球网','http://tech.huanqiu.com/diginews/2016-08/9375395.html','2016-08-30 09:43:22'), ('9','非it勿入，程序猿才看得懂的段子','http://yun.hainei.org/forum/201511/12/190935zqeuoz9qq4uqq993.jpeg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435001&idx=1&sn=a6c027b11376b91b2d715432b4e7f900&scene=0#wechat_redirect','2016-08-30 09:43:44'), ('10','非it勿入，程序猿才看得懂的段子','http://yun.hainei.org/forum/201511/12/190935zqeuoz9qq4uqq993.jpeg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435001&idx=1&sn=a6c027b11376b91b2d715432b4e7f900&scene=0#wechat_redirect','2016-08-30 09:43:44'), ('11','杭州人民的现状-想屯点粮食都失败了...','http://i03.pictn.sogoucdn.com/b8a175235371daaf','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649434983&idx=1&sn=a257dc62d6985bbf118a6c43f81e87df&scene=4#wechat_redirect','2016-08-25 10:08:16'), ('12','苹果正式发出邀请函 9月7日新iPhone亮相','http://img1.imgtn.bdimg.com/it/u=4119569213,2459330310&fm=206&gp=0.jpg','网易科技','http://tech.163.com/16/0830/01/BVM9M3C000097U7R.html','2016-08-30 09:37:06'), ('13','小米联合银联正式推出小米支付 国内移动支付竞争加剧','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','小米科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:37:51'), ('14','跟王健林抢头条？马云：月薪三四万最幸福','http://n.sinaimg.cn/ent/transform/20160830/q9_--fxvixet4106501.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixer7453748.shtml','2016-08-30 09:38:19'), ('15','国产量子卫星有啥黑科技?一技术可星间激光通信','http://img3.utuku.china.com/600x0/mili/20160829/b10560a6-ff77-4fcf-834b-8d37e3ca73ab.jpg','搜狐','http://mil.sohu.com/20160830/n466690400.shtml','2016-08-30 09:38:49'), ('16','刘翔怒告滴滴要赔偿126万：滴滴如此回应','http://p2.ifengimg.com/haina/2016_36/7e48054a480f3bb_w600_h357.jpg','凤凰网','http://tech.ifeng.com/a/20160830/44444202_0.shtml','2016-08-30 09:39:32'), ('17','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','http://i9.hexunimg.cn/2014-09-16/168500100.jpg','百度百家','http://yanjuyang.baijia.baidu.com/article/603313','2016-08-30 09:40:09'), ('18','终于来了！新MacBook Pro惊人曝光：销魂','http://himg2.huanqiu.com/attachment2010/2016/0830/20160830082904430.png','环球网','http://tech.huanqiu.com/diginews/2016-08/9375395.html','2016-08-30 09:43:22'), ('19','非it勿入，程序猿才看得懂的段子','http://yun.hainei.org/forum/201511/12/190935zqeuoz9qq4uqq993.jpeg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435001&idx=1&sn=a6c027b11376b91b2d715432b4e7f900&scene=0#wechat_redirect','2016-08-30 09:43:44'), ('20','终于来了！新MacBook Pro惊人曝光：销魂','http://himg2.huanqiu.com/attachment2010/2016/0830/20160830082904430.png','环球网','http://tech.huanqiu.com/diginews/2016-08/9375395.html','2016-08-30 09:43:22'), ('21','杭州人民的现状-想屯点粮食都失败了...','http://i03.pictn.sogoucdn.com/b8a175235371daaf','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649434983&idx=1&sn=a257dc62d6985bbf118a6c43f81e87df&scene=4#wechat_redirect','2016-08-25 10:08:16'), ('22','苹果正式发出邀请函 9月7日新iPhone亮相','http://img1.imgtn.bdimg.com/it/u=4119569213,2459330310&fm=206&gp=0.jpg','网易科技','http://tech.163.com/16/0830/01/BVM9M3C000097U7R.html','2016-08-30 09:37:06'), ('23','小米联合银联正式推出小米支付 国内移动支付竞争加剧','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','小米科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:37:51'), ('24','跟王健林抢头条？马云：月薪三四万最幸福','http://n.sinaimg.cn/ent/transform/20160830/q9_--fxvixet4106501.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixer7453748.shtml','2016-08-30 09:38:19'), ('25','国产量子卫星有啥黑科技?一技术可星间激光通信','http://img3.utuku.china.com/600x0/mili/20160829/b10560a6-ff77-4fcf-834b-8d37e3ca73ab.jpg','搜狐','http://mil.sohu.com/20160830/n466690400.shtml','2016-08-30 09:38:49'), ('26','刘翔怒告滴滴要赔偿126万：滴滴如此回应','http://p2.ifengimg.com/haina/2016_36/7e48054a480f3bb_w600_h357.jpg','凤凰网','http://tech.ifeng.com/a/20160830/44444202_0.shtml','2016-08-30 09:39:32'), ('27','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','http://i9.hexunimg.cn/2014-09-16/168500100.jpg','百度百家','http://yanjuyang.baijia.baidu.com/article/603313','2016-08-30 09:40:09'), ('28','无印良品ICON 动态设计\n','http://i1.piimg.com/573817/d466929a3a15473c.png','视觉中国设计师社区','http://www.shijue.me/community/photo-details/f1cd75ff992d4ccebdccff1950a6c450_d','2016-09-07 09:40:09'), ('29','UI交互设计灵感','http://i1.piimg.com/573817/d190a11e29989b35.png','视觉中国设计师社区','http://www.shijue.me/community/photo-details/8af84672dfbc47ef8bb4ea3266b3be50_d','2016-09-07 09:50:09'), ('30','几何中国风','http://i1.piimg.com/573817/9a3f79218ac9b24ft.jpg','视觉中国设计师社区','http://www.shijue.me/community/photo-details/b640fe4cd36142af83d8334f1c8f7100_d','2016-09-07 10:50:09');
INSERT INTO `django_admin_log` VALUES ('1','2016-08-25 10:08:16','1','杭州人民的现状-想屯点粮食都失败了...','1','[{\"added\": {}}]','9','1'), ('2','2016-08-25 10:14:45','1','富士新款微单谍照曝光 采用银色拉丝复古设计','1','[{\"added\": {}}]','7','1'), ('3','2016-08-25 10:15:37','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_source\"]}}]','7','1'), ('4','2016-08-25 10:16:54','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_source\"]}}]','7','1'), ('5','2016-08-25 10:18:02','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_link\", \"p_desc\", \"p_source_link\"]}}]','7','1'), ('6','2016-08-25 10:18:34','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_desc\"]}}]','7','1'), ('7','2016-08-25 10:20:57','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_source\"]}}]','7','1'), ('8','2016-08-25 10:28:15','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_source\"]}}]','7','1'), ('9','2016-08-25 10:30:55','1','杭州人民的现状-想屯点粮食都失败了...','2','[{\"changed\": {\"fields\": [\"design_img_url\"]}}]','9','1'), ('10','2016-08-25 10:32:45','1','杭州人民的现状-想屯点粮食都失败了...','2','[{\"changed\": {\"fields\": [\"design_img_url\"]}}]','9','1'), ('11','2016-08-30 07:25:30','1','跟王万达抢头条 这些大咖也有“小目标”','1','[{\"added\": {}}]','8','1'), ('12','2016-08-30 07:26:32','1','跟王万达抢头条 这些大咖也有“小目标”','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('13','2016-08-30 07:27:14','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_source\"]}}]','7','1'), ('14','2016-08-30 07:28:00','1','富士新款微单谍照曝光 采用银色拉丝复古设计','2','[{\"changed\": {\"fields\": [\"p_source\"]}}]','7','1'), ('15','2016-08-30 07:31:14','2','非it勿入，程序猿才看得懂的段子','1','[{\"added\": {}}]','8','1'), ('16','2016-08-30 07:33:31','3','http://tech.163.com/16/0830/01/BVM9M3C000097U7R.html','1','[{\"added\": {}}]','8','1'), ('17','2016-08-30 07:33:54','3','苹果正式发出邀请函 9月7日新iPhone亮相','2','[{\"changed\": {\"fields\": [\"n_title\"]}}]','8','1'), ('18','2016-08-30 07:34:19','3','苹果正式发出邀请函 9月7日新iPhone亮相','2','[{\"changed\": {\"fields\": [\"n_source\"]}}]','8','1'), ('19','2016-08-30 07:36:26','4','小米联合银联正式推出小米支付 国内移动支付竞争加剧','1','[{\"added\": {}}]','8','1'), ('20','2016-08-30 07:37:11','4','小米联合银联正式推出小米支付 国内移动支付竞争加剧','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('21','2016-08-30 07:37:47','3','苹果正式发出邀请函 9月7日新iPhone亮相','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('22','2016-08-30 07:44:22','5','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixer7453748.shtml','1','[{\"added\": {}}]','8','1'), ('23','2016-08-30 07:44:49','5','跟王健林抢头条？马云：月薪三四万最幸福','2','[{\"changed\": {\"fields\": [\"n_title\"]}}]','8','1'), ('24','2016-08-30 08:24:17','1','http://www.niaogebiji.com/article-12215-1.html','1','[{\"added\": {}}]','10','1'), ('25','2016-08-30 08:25:46','1','杭州人民的现状-想屯点粮食都失败了...','2','[{\"changed\": {\"fields\": [\"design_img_url\"]}}]','9','1'), ('26','2016-08-30 08:26:20','1','杭州人民的现状-想屯点粮食都失败了...','2','[{\"changed\": {\"fields\": [\"design_img_url\"]}}]','9','1'), ('27','2016-08-30 08:27:04','1','杭州人民的现状-想屯点粮食都失败了...','2','[{\"changed\": {\"fields\": [\"design_img_url\"]}}]','9','1'), ('28','2016-08-30 08:28:53','1','杭州人民的现状-想屯点粮食都失败了...','2','[{\"changed\": {\"fields\": [\"design_img_url\"]}}]','9','1'), ('29','2016-08-30 08:29:49','1','运营，想好这三个问题才是和设计师沟通的正确姿势','2','[{\"changed\": {\"fields\": [\"m_title\"]}}]','10','1'), ('30','2016-08-30 08:32:13','6','终于来了！新MacBook Pro惊人曝光：销魂','1','[{\"added\": {}}]','8','1'), ('31','2016-08-30 08:34:05','2','小米Note2正面渲染图曝光：双摄+双曲面','1','[{\"added\": {}}]','7','1'), ('32','2016-08-30 08:34:58','2','小米Note2正面渲染图曝光：双摄+双曲面','2','[{\"changed\": {\"fields\": [\"p_link\", \"p_source\"]}}]','7','1'), ('33','2016-08-30 08:36:54','7','国产量子卫星有啥黑科技?一技术可星间激光通信','1','[{\"added\": {}}]','8','1'), ('34','2016-08-30 08:38:17','7','国产量子卫星有啥黑科技?一技术可星间激光通信','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('35','2016-08-30 08:39:31','7','国产量子卫星有啥黑科技?一技术可星间激光通信','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('36','2016-08-30 08:45:26','8','http://tech.ifeng.com/a/20160830/44444202_0.shtml','1','[{\"added\": {}}]','8','1'), ('37','2016-08-30 08:45:43','9','刘翔怒告滴滴要赔偿126万：滴滴如此回应','1','[{\"added\": {}}]','8','1'), ('38','2016-08-30 08:46:06','8','http://tech.ifeng.com/a/20160830/44444202_0.shtml','3','','8','1'), ('39','2016-08-30 08:47:49','10','图解：G20杭州峰会这些知识你再不知道就OUT啦','1','[{\"added\": {}}]','8','1'), ('40','2016-08-30 08:50:54','11','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','1','[{\"added\": {}}]','8','1'), ('41','2016-08-30 08:51:22','11','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','2','[]','8','1'), ('42','2016-08-30 08:52:08','11','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('43','2016-08-30 08:55:23','12','云计算市场四巨头格局显现 小公司或被迫转型','1','[{\"added\": {}}]','8','1'), ('44','2016-08-30 09:05:24','12','云计算市场四巨头格局显现 小公司或被迫转型','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('45','2016-08-30 09:06:40','2','小米Note2正面渲染图曝光：双摄+双曲面','2','[{\"changed\": {\"fields\": [\"p_desc\"]}}]','7','1'), ('46','2016-08-30 09:06:54','2','小米Note2正面渲染图曝光：双摄+双曲面','2','[{\"changed\": {\"fields\": [\"p_desc\"]}}]','7','1'), ('47','2016-08-30 09:31:02','3','云计算市场四巨头格局显现 小公司或被迫转型','1','[{\"added\": {}}]','7','1'), ('48','2016-08-30 09:31:18','3','云计算市场四巨头格局显现 小公司或被迫转型','2','[{\"changed\": {\"fields\": [\"p_source\"]}}]','7','1'), ('49','2016-08-30 09:31:57','4','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','1','[{\"added\": {}}]','7','1'), ('50','2016-08-30 09:32:22','5','图解：G20杭州峰会这些知识你再不知道就OUT啦','1','[{\"added\": {}}]','7','1'), ('51','2016-08-30 09:32:48','6','刘翔怒告滴滴要赔偿126万：滴滴如此回应','1','[{\"added\": {}}]','7','1'), ('52','2016-08-30 09:33:18','7','国产量子卫星有啥黑科技?一技术可星间激光通信','1','[{\"added\": {}}]','7','1'), ('53','2016-08-30 09:33:54','8','终于来了！新MacBook Pro惊人曝光：销魂','1','[{\"added\": {}}]','7','1'), ('54','2016-08-30 09:34:27','9','跟王健林抢头条？马云：月薪三四万最幸福','1','[{\"added\": {}}]','7','1'), ('55','2016-08-30 09:34:58','10','小米联合银联正式推出小米支付 国内移动支付竞争加剧','1','[{\"added\": {}}]','7','1'), ('56','2016-08-30 09:35:32','11','苹果正式发出邀请函 9月7日新iPhone亮相','1','[{\"added\": {}}]','7','1'), ('57','2016-08-30 09:37:06','2','苹果正式发出邀请函 9月7日新iPhone亮相','1','[{\"added\": {}}]','9','1'), ('58','2016-08-30 09:37:51','3','小米联合银联正式推出小米支付 国内移动支付竞争加剧','1','[{\"added\": {}}]','9','1'), ('59','2016-08-30 09:38:19','4','跟王健林抢头条？马云：月薪三四万最幸福','1','[{\"added\": {}}]','9','1'), ('60','2016-08-30 09:38:49','5','国产量子卫星有啥黑科技?一技术可星间激光通信','1','[{\"added\": {}}]','9','1'), ('61','2016-08-30 09:39:32','6','刘翔怒告滴滴要赔偿126万：滴滴如此回应','1','[{\"added\": {}}]','9','1'), ('62','2016-08-30 09:40:09','7','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','1','[{\"added\": {}}]','9','1'), ('63','2016-08-30 09:43:22','8','终于来了！新MacBook Pro惊人曝光：销魂','1','[{\"added\": {}}]','9','1'), ('64','2016-08-30 09:43:44','9','非it勿入，程序猿才看得懂的段子','1','[{\"added\": {}}]','9','1'), ('65','2016-08-30 09:48:26','2','云计算市场四巨头格局显现 小公司或被迫转型','1','[{\"added\": {}}]','10','1'), ('66','2016-08-30 09:48:50','3','小米联合银联正式推出小米支付 国内移动支付竞争加剧','1','[{\"added\": {}}]','10','1'), ('67','2016-08-30 09:49:28','4','跟王万达抢头条 这些大咖也有“小目标”','1','[{\"added\": {}}]','10','1'), ('68','2016-08-31 01:37:07','2','云计算市场四巨头格局显现 小公司或被迫转型','2','[{\"changed\": {\"fields\": [\"m_img_url\"]}}]','10','1'), ('69','2016-08-31 01:37:58','2','云计算市场四巨头格局显现 小公司或被迫转型','2','[]','10','1'), ('70','2016-08-31 01:38:23','12','云计算市场四巨头格局显现 小公司或被迫转型','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('71','2016-08-31 01:38:42','12','云计算市场四巨头格局显现 小公司或被迫转型','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('72','2016-09-06 09:53:54','13','惊呆了：谷歌自动驾驶能识别警车','1','[{\"added\": {}}]','8','1'), ('73','2016-09-06 09:55:41','13','惊呆了：谷歌自动驾驶能识别警车','2','[{\"changed\": {\"fields\": [\"n_img_url\", \"n_source\"]}}]','8','1'), ('74','2016-09-06 09:56:49','13','惊呆了：谷歌自动驾驶能识别警车','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('75','2016-09-06 10:00:03','13','惊呆了：谷歌自动驾驶能识别警车','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('76','2016-09-07 00:34:43','13','惊呆了：谷歌自动驾驶能识别警车','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('77','2016-09-07 00:34:57','13','惊呆了：谷歌自动驾驶能识别警车','2','[]','8','1'), ('78','2016-09-07 00:37:56','13','惊呆了：谷歌自动驾驶能识别警车','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('79','2016-09-07 00:44:14','13','惊呆了：谷歌自动驾驶能识别警车','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1'), ('80','2016-09-07 00:44:33','13','惊呆了：谷歌自动驾驶能识别警车','2','[{\"changed\": {\"fields\": [\"n_img_url\"]}}]','8','1');
INSERT INTO `django_content_type` VALUES ('1','admin','logentry'), ('4','auth','group'), ('2','auth','permission'), ('3','auth','user'), ('5','contenttypes','contenttype'), ('9','design','design'), ('11','development','development'), ('10','marketing','marketing'), ('8','news','news'), ('7','product','product'), ('6','sessions','session');
INSERT INTO `django_migrations` VALUES ('1','contenttypes','0001_initial','2016-08-25 04:00:13'), ('2','auth','0001_initial','2016-08-25 04:00:14'), ('3','admin','0001_initial','2016-08-25 04:00:14'), ('4','admin','0002_logentry_remove_auto_add','2016-08-25 04:00:14'), ('5','contenttypes','0002_remove_content_type_name','2016-08-25 04:00:14'), ('6','auth','0002_alter_permission_name_max_length','2016-08-25 04:00:14'), ('7','auth','0003_alter_user_email_max_length','2016-08-25 04:00:14'), ('8','auth','0004_alter_user_username_opts','2016-08-25 04:00:14'), ('9','auth','0005_alter_user_last_login_null','2016-08-25 04:00:14'), ('10','auth','0006_require_contenttypes_0002','2016-08-25 04:00:14'), ('11','auth','0007_alter_validators_add_error_messages','2016-08-25 04:00:14'), ('12','auth','0008_alter_user_username_max_length','2016-08-25 04:00:14'), ('13','design','0001_initial','2016-08-25 04:00:14'), ('14','design','0002_auto_20150908_0350','2016-08-25 04:00:14'), ('15','design','0003_auto_20150908_0417','2016-08-25 04:00:14'), ('16','design','0004_remove_design_design_desc','2016-08-25 04:00:14'), ('17','development','0001_initial','2016-08-25 04:00:14'), ('18','marketing','0001_initial','2016-08-25 04:00:14'), ('19','news','0001_initial','2016-08-25 04:00:14'), ('20','news','0002_auto_20150906_1152','2016-08-25 04:00:14'), ('21','sessions','0001_initial','2016-08-25 04:00:14'), ('22','product','0001_initial','2016-08-25 04:15:45');
INSERT INTO `django_session` VALUES ('5hmdvmqn73yx8ow3kd1n91qr8ljyt014','M2JjNmMwOTk3OGVhNGY1ZDAwYjdmOWMzZDYxYTlmODlmNmUzOGVmMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjBiMDNhNDIxNTZhZDAzMjBiN2EzNTVkOTQ1YzZiNDc5YzdlMzZlODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-08 04:04:05'), ('h697xvwyqa8p70c4o77uyu5q6wmfszsg','M2JjNmMwOTk3OGVhNGY1ZDAwYjdmOWMzZDYxYTlmODlmNmUzOGVmMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjBiMDNhNDIxNTZhZDAzMjBiN2EzNTVkOTQ1YzZiNDc5YzdlMzZlODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-08 09:47:03'), ('pe2mp8ead1wmw1pzrg99croymdrvj43a','MGM2ZmMxZTQ5NDMxYTgzNjU2ZTk1ZDkxNmYwZmJiY2NiODFmNTNkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIwYjAzYTQyMTU2YWQwMzIwYjdhMzU1ZDk0NWM2YjQ3OWM3ZTM2ZTgwIn0=','2016-09-20 08:05:20');
INSERT INTO `marketing_marketing` VALUES ('1','运营，想好这三个问题才是和设计师沟通的正确姿势','不管是产品汪，还是运营喵，都经常需要设计师为我们做设计，大到APP的页面设计，小到一张传单，一个banner。现实工作中，却经常可以听到设计MM这样的诉苦：某某产品让我改了10多稿，结果居然说还是我最初的第一版好','http://www.niaogebiji.com/data/attachment/portal/201608/30/115057cgxgg77totd72b7p.jpg','niaogebiji','http://www.niaogebiji.com/article-12215-1.html','2016-08-30 08:24:17'), ('2','云计算市场四巨头格局显现 小公司或被迫转型','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://a2.att.hudong.com/33/90/31300543319869144437903607325.jpg','腾讯科技','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 09:48:26'), ('3','小米联合银联正式推出小米支付 国内移动支付竞争加剧','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:48:50'), ('4','跟王万达抢头条 这些大咖也有“小目标”','跟王万达抢头条 这些大咖也有“小目标”，一起看看吧','http://img0.imgtn.bdimg.com/it/u=1343223103,4058034027&fm=206&gp=0.jpg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435004&idx=1&sn=936168b1a787a5ca4544a0b6d18fb034&scene=0#rdd','2016-08-30 09:49:28'), ('5','运营，想好这三个问题才是和设计师沟通的正确姿势','不管是产品汪，还是运营喵，都经常需要设计师为我们做设计，大到APP的页面设计，小到一张传单，一个banner。现实工作中，却经常可以听到设计MM这样的诉苦：某某产品让我改了10多稿，结果居然说还是我最初的第一版好','http://www.niaogebiji.com/data/attachment/portal/201608/30/115057cgxgg77totd72b7p.jpg','niaogebiji','http://www.niaogebiji.com/article-12215-1.html','2016-08-30 08:24:17'), ('6','云计算市场四巨头格局显现 小公司或被迫转型','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://a2.att.hudong.com/33/90/31300543319869144437903607325.jpg','腾讯科技','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 09:48:26'), ('7','小米联合银联正式推出小米支付 国内移动支付竞争加剧','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:48:50'), ('8','跟王万达抢头条 这些大咖也有“小目标”','跟王万达抢头条 这些大咖也有“小目标”，一起看看吧','http://img0.imgtn.bdimg.com/it/u=1343223103,4058034027&fm=206&gp=0.jpg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435004&idx=1&sn=936168b1a787a5ca4544a0b6d18fb034&scene=0#rdd','2016-08-30 09:49:28'), ('9','运营，想好这三个问题才是和设计师沟通的正确姿势','不管是产品汪，还是运营喵，都经常需要设计师为我们做设计，大到APP的页面设计，小到一张传单，一个banner。现实工作中，却经常可以听到设计MM这样的诉苦：某某产品让我改了10多稿，结果居然说还是我最初的第一版好','http://www.niaogebiji.com/data/attachment/portal/201608/30/115057cgxgg77totd72b7p.jpg','niaogebiji','http://www.niaogebiji.com/article-12215-1.html','2016-08-30 08:24:17'), ('13','云计算市场四巨头格局显现 小公司或被迫转型','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://a2.att.hudong.com/33/90/31300543319869144437903607325.jpg','腾讯科技','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 09:48:26'), ('14','小米联合银联正式推出小米支付 国内移动支付竞争加剧','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:48:50'), ('15','跟王万达抢头条 这些大咖也有“小目标”','跟王万达抢头条 这些大咖也有“小目标”，一起看看吧','http://img0.imgtn.bdimg.com/it/u=1343223103,4058034027&fm=206&gp=0.jpg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435004&idx=1&sn=936168b1a787a5ca4544a0b6d18fb034&scene=0#rdd','2016-08-30 09:49:28'), ('21','运营，想好这三个问题才是和设计师沟通的正确姿势','不管是产品汪，还是运营喵，都经常需要设计师为我们做设计，大到APP的页面设计，小到一张传单，一个banner。现实工作中，却经常可以听到设计MM这样的诉苦：某某产品让我改了10多稿，结果居然说还是我最初的第一版好','http://www.niaogebiji.com/data/attachment/portal/201608/30/115057cgxgg77totd72b7p.jpg','niaogebiji','http://www.niaogebiji.com/article-12215-1.html','2016-08-30 08:24:17'), ('22','云计算市场四巨头格局显现 小公司或被迫转型','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://a2.att.hudong.com/33/90/31300543319869144437903607325.jpg','腾讯科技','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 09:48:26'), ('23','小米联合银联正式推出小米支付 国内移动支付竞争加剧','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:48:50'), ('24','跟王万达抢头条 这些大咖也有“小目标”','跟王万达抢头条 这些大咖也有“小目标”，一起看看吧','http://img0.imgtn.bdimg.com/it/u=1343223103,4058034027&fm=206&gp=0.jpg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435004&idx=1&sn=936168b1a787a5ca4544a0b6d18fb034&scene=0#rdd','2016-08-30 09:49:28'), ('25','云计算市场四巨头格局显现 小公司或被迫转型','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://a2.att.hudong.com/33/90/31300543319869144437903607325.jpg','腾讯科技','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 09:48:26'), ('26','运营，想好这三个问题才是和设计师沟通的正确姿势','不管是产品汪，还是运营喵，都经常需要设计师为我们做设计，大到APP的页面设计，小到一张传单，一个banner。现实工作中，却经常可以听到设计MM这样的诉苦：某某产品让我改了10多稿，结果居然说还是我最初的第一版好','http://www.niaogebiji.com/data/attachment/portal/201608/30/115057cgxgg77totd72b7p.jpg','niaogebiji','http://www.niaogebiji.com/article-12215-1.html','2016-08-30 08:24:17'), ('27','小米联合银联正式推出小米支付 国内移动支付竞争加剧','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:48:50'), ('28','跟王万达抢头条 这些大咖也有“小目标”','跟王万达抢头条 这些大咖也有“小目标”，一起看看吧','http://img0.imgtn.bdimg.com/it/u=1343223103,4058034027&fm=206&gp=0.jpg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435004&idx=1&sn=936168b1a787a5ca4544a0b6d18fb034&scene=0#rdd','2016-08-30 09:49:28'), ('29','运营，想好这三个问题才是和设计师沟通的正确姿势','不管是产品汪，还是运营喵，都经常需要设计师为我们做设计，大到APP的页面设计，小到一张传单，一个banner。现实工作中，却经常可以听到设计MM这样的诉苦：某某产品让我改了10多稿，结果居然说还是我最初的第一版好','http://www.niaogebiji.com/data/attachment/portal/201608/30/115057cgxgg77totd72b7p.jpg','niaogebiji','http://www.niaogebiji.com/article-12215-1.html','2016-08-30 08:24:17'), ('30','云计算市场四巨头格局显现 小公司或被迫转型','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://a2.att.hudong.com/33/90/31300543319869144437903607325.jpg','腾讯科技','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 09:48:26'), ('31','小米联合银联正式推出小米支付 国内移动支付竞争加剧','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:48:50'), ('32','跟王万达抢头条 这些大咖也有“小目标”','跟王万达抢头条 这些大咖也有“小目标”，一起看看吧','http://img0.imgtn.bdimg.com/it/u=1343223103,4058034027&fm=206&gp=0.jpg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435004&idx=1&sn=936168b1a787a5ca4544a0b6d18fb034&scene=0#rdd','2016-08-30 09:49:28');
INSERT INTO `news_news` VALUES ('1','跟王万达抢头条 这些大咖也有“小目标”','跟王万达抢头条 这些大咖也有“小目标”，一起看看吧','http://img0.imgtn.bdimg.com/it/u=1343223103,4058034027&fm=206&gp=0.jpg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435004&idx=1&sn=936168b1a787a5ca4544a0b6d18fb034&scene=0#rdd','2016-08-30 07:25:30'), ('2','非it勿入，程序猿才看得懂的段子','非it勿入，程序猿才看得懂的段子。一起进来happy吧','http://yun.hainei.org/forum/201511/12/190935zqeuoz9qq4uqq993.jpeg','人云亦云','http://mp.weixin.qq.com/s?__biz=MjM5ODQ0MDY3OQ==&mid=2649435001&idx=1&sn=a6c027b11376b91b2d715432b4e7f900&scene=0#wechat_redirect','2016-08-30 07:31:14'), ('3','苹果正式发出邀请函 9月7日新iPhone亮相','网易科技讯 8月30日消息，苹果于周一向媒体发出邀请函，定于美国太平洋时间9月7日上午10点（北京时间9月8日凌晨1点）在旧金山比尔·格雷厄姆市政礼堂（Bill Graham Civic Auditorium）举行秋季产品发布会。','http://img1.imgtn.bdimg.com/it/u=4119569213,2459330310&fm=206&gp=0.jpg','网易科技','http://tech.163.com/16/0830/01/BVM9M3C000097U7R.html','2016-08-30 07:33:31'), ('4','小米联合银联正式推出小米支付 国内移动支付竞争加剧','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 07:36:26'), ('5','跟王健林抢头条？马云：月薪三四万最幸福','国民公公”王健林“先挣它一个亿”的“小目标”还在刷屏中，马云“爸爸”也在阿里内部会议上有金句爆出，他认为“中国最幸福的人是一个月有两三万块钱”、“超过一两千万，麻烦就来了”、“超过一两个亿的时候，麻烦就大了”，不知有多少网友想说“我不怕麻烦”呢？','http://n.sinaimg.cn/ent/transform/20160830/q9_--fxvixet4106501.jpg','新浪科技','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixer7453748.shtml','2016-08-30 07:44:22'), ('6','终于来了！新MacBook Pro惊人曝光：销魂','9月7日苹果要发布全新iPhone，而接下来的10月他们也是准备了新品，其中就有大家期待很高的新MacBook Pro。','http://himg2.huanqiu.com/attachment2010/2016/0830/20160830082904430.png','环球网','http://tech.huanqiu.com/diginews/2016-08/9375395.html','2016-08-30 08:32:13'), ('7','国产量子卫星有啥黑科技?一技术可星间激光通信','原标题：“墨子号”天地对接 用了哪些技术','http://img3.utuku.china.com/600x0/mili/20160829/b10560a6-ff77-4fcf-834b-8d37e3ca73ab.jpg','搜狐','http://mil.sohu.com/20160830/n466690400.shtml','2016-08-30 08:36:54'), ('9','刘翔怒告滴滴要赔偿126万：滴滴如此回应','本月初，奥运冠军刘翔状告滴滴出行，认为“滴滴出行”在官方微博中发布了使用其肖像的配图微博，以侵犯肖像权为由将“滴滴出行”运营公司诉至法院，要求删除侵权链接及图片、赔礼道歉，赔偿损失126万元。','http://p2.ifengimg.com/haina/2016_36/7e48054a480f3bb_w600_h357.jpg','凤凰网','http://tech.ifeng.com/a/20160830/44444202_0.shtml','2016-08-30 08:45:43'), ('10','图解：G20杭州峰会这些知识你再不知道就OUT啦','图解：G20杭州峰会这些知识你再不知道就OUT啦','http://www.minsheng360.com/ueditor/php/upload/20160226/14564677717813.jpg','光明网','http://politics.gmw.cn/2016-08/25/content_21628056.htm','2016-08-30 08:47:49'), ('11','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','《商业观察家》从宜家中国获悉，宜家中国8月底将在上海地区试水上线电商购物平台。  “也就两三天的时间，上海地区消费者就可以网购宜家商品了。”','http://i9.hexunimg.cn/2014-09-16/168500100.jpg','百度百家','http://yanjuyang.baijia.baidu.com/article/603313','2016-08-30 08:50:54'), ('12','云计算市场四巨头格局显现 小公司或被迫转型','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://a2.att.hudong.com/33/90/31300543319869144437903607325.jpg','腾讯科技','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 08:55:23'), ('13','惊呆了：谷歌自动驾驶能识别警车','据国外媒体DigitalTrends报道，近期美国专利局公布了一批新专利，其中谷歌的一个自动驾驶功能获得了许多关注。这项专利表明，谷歌正在为其自动驾驶汽车开发一个警车探测系统。汽车可以很清晰的识别对面开来的警车，并安全的把用户送到目的地。','http://i4.buimg.com/573817/a48b6d8831d51e67.jpg','网易科技','http://tech.163.com/16/0906/17/C0A0CLQR00097U7T.html','2016-09-06 09:53:54'), ('15','乐视互娱推出新硬件 试图连接家庭娱乐大屏','9月6日，乐视在举办的“购玩美”战略发布会上宣布，对“919”的投入将从8亿元上涨到10亿元。同时宣布推出新的家庭娱乐硬件—乐视K歌智能麦克风。','http://i1.piimg.com/573817/9c75ecaadc868e2c.jpg','搜狐科技','http://it.sohu.com/20160907/n467781065.shtml','2016-09-07 09:42:54');
INSERT INTO `product_product` VALUES ('1','富士新款微单谍照曝光 采用银色拉丝复古设计','http://www.cnbeta.com/articles/531889.htm','一个好看好玩的相机','http://img2.imgtn.bdimg.com/it/u=1952407696,2139509188&fm=206&gp=0.jpg','http://www.cnbeta.com/','2016-08-25 10:14:45'), ('2','小米Note2正面渲染图曝光：双摄+双曲面','http://tech.ifeng.com/a/20160830/44444263_0.shtml','随着时间的临近，小米Note2的消息也越来越多。随着之前小米联合创始人黎万强在微博表示小米将在今年进军...','http://p1.ifengimg.com/haina/2016_36/1a340d0e6ba4ce7_w670_h349.png','http://tech.ifeng.com/a/20160830/44444263_0.shtml','2016-08-30 08:34:05'), ('3','云计算市场四巨头格局显现 小公司或被迫转型','http://tech.qq.com/a/20160830/028624.htm','据ZDNet报道，云计算供应商Rackspace将在接受Apollo Global Management提出的43亿美元要约后私有化。','http://www.shangyuan.org/upload/2012/9/25182936171.jpg','http://tech.qq.com/a/20160830/028624.htm','2016-08-30 09:31:02'), ('4','宜家中国8月底上线电商：不补贴、不烧钱、不包邮','http://yanjuyang.baijia.baidu.com/article/603313','《商业观察家》从宜家中国获悉，宜家中国8月底将在上海地区试水上线电商购物平台。  “也就两三天的时间，上海地区消费者就可以网购宜家商品了。”','http://i9.hexunimg.cn/2014-09-16/168500100.jpg','http://yanjuyang.baijia.baidu.com/article/603313','2016-08-30 09:31:57'), ('5','图解：G20杭州峰会这些知识你再不知道就OUT啦','http://politics.gmw.cn/2016-08/25/content_21628056.htm','图解：G20杭州峰会这些知识你再不知道就OUT啦','http://www.minsheng360.com/ueditor/php/upload/20160226/14564677717813.jpg','http://politics.gmw.cn/2016-08/25/content_21628056.htm','2016-08-30 09:32:22'), ('6','刘翔怒告滴滴要赔偿126万：滴滴如此回应','http://tech.ifeng.com/a/20160830/44444202_0.shtml','本月初，奥运冠军刘翔状告滴滴出行，认为“滴滴出行”在官方微博中发布了使用其肖像的配图微博，以侵犯肖像权为由将“滴滴出行”运营公司诉至法院，要求删除侵权链接及图片、赔礼道歉，赔偿损失126万元。','http://p2.ifengimg.com/haina/2016_36/7e48054a480f3bb_w600_h357.jpg','http://tech.ifeng.com/a/20160830/44444202_0.shtml','2016-08-30 09:32:48'), ('7','国产量子卫星有啥黑科技?一技术可星间激光通信','http://mil.sohu.com/20160830/n466690400.shtml','原标题：“墨子号”天地对接 用了哪些技术','http://img3.utuku.china.com/600x0/mili/20160829/b10560a6-ff77-4fcf-834b-8d37e3ca73ab.jpg','http://mil.sohu.com/20160830/n466690400.shtml','2016-08-30 09:33:18'), ('8','终于来了！新MacBook Pro惊人曝光：销魂','http://tech.huanqiu.com/diginews/2016-08/9375395.html','9月7日苹果要发布全新iPhone，而接下来的10月他们也是准备了新品，其中就有大家期待很高的新MacBook Pro。','http://himg2.huanqiu.com/attachment2010/2016/0830/20160830082904430.png','http://tech.huanqiu.com/diginews/2016-08/9375395.html','2016-08-30 09:33:54'), ('9','跟王健林抢头条？马云：月薪三四万最幸福','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixer7453748.shtml','国民公公”王健林“先挣它一个亿”的“小目标”还在刷屏中，马云“爸爸”也在阿里内部会议上有金句爆出，他认为“中国最幸福的人是一个月有两三万块钱”、“超过一两千万，麻烦就来了”、“超过一两个亿的时候，麻烦就大了”，不知有多少网友想说“我不怕麻烦”呢？','http://n.sinaimg.cn/ent/transform/20160830/q9_--fxvixet4106501.jpg','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixer7453748.shtml','2016-08-30 09:34:27'), ('10','小米联合银联正式推出小米支付 国内移动支付竞争加剧','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','小米科技今日宣布与中国银联推出“小米支付”，并将在9月1日召开发布会对“小米支付”（MI Pay）做说明。这也意味着小米成为继苹果、三星后，成为又一家联合银联推出移动支付的手机厂商，此前华为推出了华为支付，但合作方为中国银行。','http://img4.imgtn.bdimg.com/it/u=3809588298,1156453262&fm=206&gp=0.jpg','http://tech.sina.com.cn/i/2016-08-30/doc-ifxvixeq0705682.shtml','2016-08-30 09:34:58'), ('11','苹果正式发出邀请函 9月7日新iPhone亮相','http://tech.163.com/16/0830/01/BVM9M3C000097U7R.html','网易科技讯 8月30日消息，苹果于周一向媒体发出邀请函，定于美国太平洋时间9月7日上午10点（北京时间9月8日凌晨1点）在旧金山比尔·格雷厄姆市政礼堂（Bill Graham Civic Auditorium）举行秋季产品发布会。','http://img1.imgtn.bdimg.com/it/u=4119569213,2459330310&fm=206&gp=0.jpg','http://tech.163.com/16/0830/01/BVM9M3C000097U7R.html','2016-08-30 09:35:32');
