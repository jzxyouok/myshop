/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : myshop

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-05-27 01:21:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ecs_ad
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad`;
CREATE TABLE `ecs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `link_email` varchar(60) NOT NULL DEFAULT '',
  `link_phone` varchar(60) NOT NULL DEFAULT '',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `target_id` int(11) DEFAULT '0' COMMENT '广告图重定向ID，分类ID、商品ID、店铺ID',
  `target_type` tinyint(3) DEFAULT '1' COMMENT '重定向类型，1=商品 2=分类 3=店铺',
  `bg_color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_id`) USING BTREE,
  KEY `enabled` (`enabled`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=993 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_ad_custom
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad_custom`;
CREATE TABLE `ecs_ad_custom` (
  `ad_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ad_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ad_name` varchar(60) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `url` varchar(255) DEFAULT NULL,
  `ad_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `target_id` int(11) DEFAULT '0' COMMENT '广告图重定向ID，目前两种，分类ID和商品ID',
  `target_type` tinyint(3) DEFAULT '1' COMMENT '重定向类型，1=商品 2=分类',
  `sort_order` int(11) DEFAULT '1' COMMENT '排序字段',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad_custom
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad_position`;
CREATE TABLE `ecs_ad_position` (
  `position_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `position_style` text NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad_position
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_dsf_login
-- ----------------------------
DROP TABLE IF EXISTS `ecs_dsf_login`;
CREATE TABLE `ecs_dsf_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '第三方登陆类型',
  `openid` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headpic` varchar(255) DEFAULT NULL,
  `ifbind` int(2) DEFAULT '0' COMMENT '是否绑定 0 否 1已经绑定',
  `userid` bigint(11) DEFAULT '0' COMMENT '绑定userid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_dsf_login
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods`;
CREATE TABLE `ecs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品类别',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `original_price` decimal(10,2) DEFAULT '0.00' COMMENT '原价',
  `event_type` tinyint(4) DEFAULT '0' COMMENT '活动类型表',
  `event_id` int(11) DEFAULT '0',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商店价格',
  `rsend_number` int(11) DEFAULT NULL COMMENT '转发数，测试',
  `month_sales` int(11) unsigned DEFAULT '0',
  `sales_volume` int(11) DEFAULT '0' COMMENT '销量',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除字段',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐字段',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热销',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次自动更新',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  `shop_id` int(4) DEFAULT '0' COMMENT '商店id',
  `shop_cat_id` int(4) DEFAULT '0',
  `shop_is_best` tinyint(1) DEFAULT '0',
  `size1` int(10) DEFAULT '0',
  `size2` int(10) DEFAULT '0',
  `size3` int(10) DEFAULT '0',
  `user_name` varchar(60) NOT NULL,
  `frt_id` int(10) unsigned DEFAULT '0' COMMENT '运费模板ID',
  `f_money` decimal(10,2) DEFAULT '0.00',
  `share_count` int(11) DEFAULT '0' COMMENT '分享次数',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE,
  KEY `last_update` (`last_update`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `goods_weight` (`goods_weight`) USING BTREE,
  KEY `promote_end_date` (`promote_end_date`) USING BTREE,
  KEY `promote_start_date` (`promote_start_date`) USING BTREE,
  KEY `goods_number` (`goods_number`) USING BTREE,
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25097 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_action
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_action`;
CREATE TABLE `ecs_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action_user` varchar(30) NOT NULL DEFAULT '',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_place` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_note` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_action
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_controlname
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_controlname`;
CREATE TABLE `ecs_order_controlname` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'order控制器内方法名称',
  `controlname` varchar(255) DEFAULT NULL,
  `is_del` tinyint(4) DEFAULT '0' COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_controlname
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_goods`;
CREATE TABLE `ecs_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单自增ID',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `discount` decimal(4,2) NOT NULL DEFAULT '1.00' COMMENT '商品折扣（仅用于卖家在修改订单商品价格时的折扣）',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `original_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣之前的原价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_detail_id` int(11) unsigned DEFAULT '0' COMMENT '商品规格ID',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `brokerage` decimal(10,0) DEFAULT '0' COMMENT '分销佣金',
  `service_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售后状态（1：买家申请退货，2：退货处理中，3：退款成功，4：退款失败）',
  `comment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价状态（0：没有评价，1：买家已评，2：双方都已评价）',
  `send_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '预留字段暂时没用',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `extension_code` varchar(30) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `cryptonym` varchar(60) NOT NULL DEFAULT '' COMMENT '匿名',
  `fuserid` int(11) DEFAULT '0' COMMENT '分销用户ID，如果此ID存在则需要计算分佣佣金',
  `fleixing` bigint(11) DEFAULT '0' COMMENT '属性id',
  `com_item` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '宝贝与描述相符:0-5',
  `com_serve` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '卖家的服务态度:0-5',
  `com_speed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '卖家发货的速度:0-5',
  `goods_thumb` varchar(255) NOT NULL COMMENT '商品图片',
  `f_money` decimal(10,2) DEFAULT '0.00' COMMENT '单个商品的佣金，',
  `event_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '活动类型：0.无；1.折扣；2.秒杀；3.团购；',
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '参加活动id，根据event_typeh活动类型取值',
  `mai_event_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '卖家折扣活动ID（已停用）',
  `seckill_event_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀ID（已停用）',
  `groupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '团购ID（已停用）',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4368 DEFAULT CHARSET=utf8 COMMENT='订单关联的商品表';

-- ----------------------------
-- Records of ecs_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_info
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_info`;
CREATE TABLE `ecs_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '物流状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_sort` text NOT NULL COMMENT '订单流程排序',
  `status_tpid` int(11) NOT NULL DEFAULT '0' COMMENT '状态模板字段',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '市',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `new_province` smallint(5) NOT NULL DEFAULT '0' COMMENT '新地址——省份',
  `new_city` smallint(5) NOT NULL DEFAULT '0' COMMENT '新地址——城市',
  `new_district` smallint(5) NOT NULL DEFAULT '0' COMMENT '新地址——地区',
  `new_address` varchar(255) NOT NULL DEFAULT '' COMMENT '新地址——地址',
  `new_zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '新地址——邮编',
  `new_consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '新地址——收货人姓名',
  `new_tel` varchar(60) NOT NULL DEFAULT '' COMMENT '新地址——收货人电话',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮编',
  `tel` varchar(60) NOT NULL DEFAULT '' COMMENT '固话',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `best_time` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `sign_building` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `shipping_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `shipping_name` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `pay_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式',
  `pay_trade_no` varchar(255) NOT NULL COMMENT '支付接口返回的支付交易编号',
  `how_oos` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `how_surplus` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `pack_name` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `card_name` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `card_message` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `inv_payee` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `inv_content` varchar(120) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '卖家修改价格的折扣金额',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额（已停用）',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价(含运费)/实付款',
  `referer` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `insure_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `pack_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `card_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `money_paid` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `surplus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预留字段暂时没用',
  `from_ad` smallint(5) NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `express_company_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '发货的物流公司',
  `invoice_no` varchar(255) NOT NULL DEFAULT '' COMMENT '运单号',
  `postscript` varchar(255) NOT NULL DEFAULT '' COMMENT '买家留言',
  `to_buyer` varchar(255) NOT NULL DEFAULT '' COMMENT '店家的备注',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单支付时间',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单发货时间',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单确认时间（关闭，成功）',
  `pack_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `card_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `bonus_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `extension_code` varchar(30) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `extension_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `pay_note` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `agency_id` smallint(5) unsigned NOT NULL COMMENT '预留字段暂时没用',
  `inv_type` varchar(60) NOT NULL COMMENT '预留字段暂时没用',
  `tax` decimal(10,2) NOT NULL COMMENT '预留字段暂时没用',
  `is_get_confirm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `is_separate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `shop_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '买家是否删除该订单（回收站）：0.否；1.是',
  `is_remind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '买家是否已提醒发货操作：0.未操作，1.已提醒操作',
  `is_overtime` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2185 DEFAULT CHARSET=utf8 COMMENT='订单信息表';

-- ----------------------------
-- Records of ecs_order_info
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_sort
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_sort`;
CREATE TABLE `ecs_order_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单控制器方法模板',
  `name` varchar(255) DEFAULT NULL COMMENT '自定义流程排序名称',
  `controlorder` text COMMENT 'order订单流程自定义json格式排序',
  `is_del` tinyint(4) DEFAULT '0' COMMENT '流程模板删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_sort
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_template
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_template`;
CREATE TABLE `ecs_order_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_status` tinyint(1) DEFAULT NULL COMMENT '订单状态',
  `shipping_status` tinyint(1) DEFAULT NULL COMMENT '物流状态',
  `pay_status` tinyint(1) DEFAULT NULL COMMENT '支付状态',
  `message` text CHARACTER SET utf8 COMMENT '订单流程状态自定义描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ecs_order_template
-- ----------------------------
INSERT INTO `ecs_order_template` VALUES ('1', '1', '0', '0', '卖家未发货');
INSERT INTO `ecs_order_template` VALUES ('2', '2', '0', '4', '自定义状态1');
INSERT INTO `ecs_order_template` VALUES ('3', '3', '5', '2', '自定义状态2');

-- ----------------------------
-- Table structure for ecs_payment
-- ----------------------------
DROP TABLE IF EXISTS `ecs_payment`;
CREATE TABLE `ecs_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pay_code` varchar(20) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pay_config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='停用，老的支付方式表';

-- ----------------------------
-- Records of ecs_payment
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_shop
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shop`;
CREATE TABLE `ecs_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shopname` varchar(255) NOT NULL COMMENT '店铺名称',
  `shopwww` varchar(255) DEFAULT NULL COMMENT '域名',
  `logo` varchar(255) DEFAULT NULL COMMENT 'LOGO',
  `salesserver` varchar(255) DEFAULT NULL COMMENT '在线客服',
  `salesserver2` varchar(100) DEFAULT NULL,
  `servertel` varchar(100) DEFAULT NULL COMMENT '服务电话',
  `province` int(11) DEFAULT NULL COMMENT '省',
  `city` int(11) DEFAULT NULL COMMENT '市',
  `district` int(11) DEFAULT NULL COMMENT '区',
  `address` varchar(255) DEFAULT NULL,
  `return_province` int(11) DEFAULT NULL,
  `return_city` int(11) DEFAULT NULL,
  `return_district` int(11) DEFAULT NULL,
  `return_address` varchar(255) DEFAULT NULL,
  `is_show_menu` tinyint(4) DEFAULT NULL COMMENT '是否显示在菜单栏',
  `brand_intro` text COMMENT '品牌介绍',
  `shopaddress` varchar(255) DEFAULT NULL COMMENT '所在地',
  `name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `shoppass` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `ispass` tinyint(1) DEFAULT '0' COMMENT '审核',
  `user_id` int(11) DEFAULT NULL COMMENT '会员Id',
  `company_logo` varchar(255) DEFAULT NULL,
  `work_startdate1` varchar(10) DEFAULT NULL,
  `work_enddate1` varchar(10) DEFAULT NULL,
  `work_starttime1` varchar(10) DEFAULT NULL,
  `work_endtime1` varchar(10) DEFAULT NULL,
  `work_startdate2` varchar(10) DEFAULT NULL,
  `work_enddate2` varchar(10) DEFAULT NULL,
  `work_starttime2` varchar(10) DEFAULT NULL,
  `work_endtime2` varchar(10) DEFAULT NULL,
  `Valuation_Ratio` float(10,2) DEFAULT '1.20' COMMENT '市场价格比例',
  `link_man` varchar(50) DEFAULT NULL COMMENT '联系人，用于开店申请审核联系',
  `link_mobile` varchar(20) DEFAULT NULL COMMENT '联系电话，用于开店申请审核联系',
  `shopkeywords` varchar(255) NOT NULL,
  `shopdescription` varchar(255) NOT NULL,
  `attention` int(20) NOT NULL DEFAULT '0' COMMENT '关注度',
  `repute` int(20) NOT NULL DEFAULT '0' COMMENT '人气',
  `is_show_brand` tinyint(1) DEFAULT '1' COMMENT '是否在品牌馆中显示',
  `edit_num` tinyint(3) DEFAULT '0' COMMENT '域名修改的次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '当前模板id（shop_template）',
  `mobile_template_id` mediumint(8) unsigned NOT NULL DEFAULT '3' COMMENT '微信当前模板id（shop_template）',
  `app_template_id` mediumint(8) unsigned NOT NULL DEFAULT '4' COMMENT 'APP店铺的模板ID',
  `represent_img` varchar(180) NOT NULL COMMENT '品牌代表图片',
  `is_recommend` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 1是推荐',
  `shop_Qrcode` varchar(255) DEFAULT NULL COMMENT '店铺二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1220 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ecs_shop
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_users
-- ----------------------------
DROP TABLE IF EXISTS `ecs_users`;
CREATE TABLE `ecs_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱，支持登录',
  `consignee` varchar(255) DEFAULT NULL COMMENT '用户真实姓名',
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名，支持登录',
  `mobile_phone` varchar(20) NOT NULL COMMENT '手机号码，支持登录',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码，32位md5加密',
  `pay_pwd` varchar(255) DEFAULT NULL COMMENT '支付密码',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `question` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `answer` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段暂时没用',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `frozen_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结余额，预留字段暂时没用',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消费积分，预留字段暂时没用',
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级积分，预留字段暂时没用',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货地址表关联ID',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次修改信息时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后一次登录IP',
  `visit_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `user_rank` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级，预留字段暂时没用',
  `is_special` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `ec_salt` varchar(10) DEFAULT NULL COMMENT '登录加密串，6位随机数',
  `salt` varchar(10) NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '推荐人会员ID，预留字段暂时没用',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '预留字段暂时没用',
  `alias` varchar(60) NOT NULL COMMENT '昵称，预留字段暂时没用',
  `msn` varchar(60) NOT NULL COMMENT '预留字段暂时没用',
  `qq` varchar(20) NOT NULL COMMENT '预留字段暂时没用',
  `office_phone` varchar(20) NOT NULL COMMENT '办公电话',
  `home_phone` varchar(20) NOT NULL COMMENT '家庭电话',
  `is_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否通过验证',
  `credit_line` decimal(10,2) unsigned NOT NULL COMMENT '预留字段暂时没用',
  `passwd_question` varchar(50) DEFAULT NULL COMMENT '预留字段暂时没用',
  `passwd_answer` varchar(255) DEFAULT NULL COMMENT '预留字段暂时没用',
  `head_portrait` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_type` int(11) NOT NULL DEFAULT '0' COMMENT '0  系统注册用户  1  微信授权用户  2  QQ授权用户  3  新浪授权用户',
  `live_district` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '居住地的县级ID',
  `home_district` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '家乡的县级ID',
  `bindqq` int(2) DEFAULT '0',
  `bindweixin` int(2) DEFAULT '0',
  `bindsina` int(2) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `email` (`email`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `flag` (`flag`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ecs_users
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_address`;
CREATE TABLE `ecs_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `address_name` varchar(50) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) DEFAULT '',
  `country` smallint(5) NOT NULL DEFAULT '0',
  `province` smallint(5) NOT NULL DEFAULT '0',
  `city` smallint(5) NOT NULL DEFAULT '0',
  `district` smallint(5) NOT NULL DEFAULT '0',
  `address` varchar(120) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `sign_building` varchar(120) DEFAULT '',
  `best_time` varchar(120) DEFAULT '',
  `is_default` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6529 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_address
-- ----------------------------