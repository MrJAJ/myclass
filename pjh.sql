/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : pjh

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2015-07-05 18:54:57
*/
use pjh;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `brands`
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(20) NOT NULL,
  `brand_image` varchar(256) DEFAULT NULL,
  `brand_production` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brands
-- ----------------------------

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(20) NOT NULL,
  `cate_image` varchar(256) DEFAULT NULL,
  `cate_super_id` int(11) DEFAULT NULL,
  `cate_description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '数码', null, null, '数码玩具，数码产品');
INSERT INTO `categories` VALUES ('2', '美食', null, null, '美食小吃');
INSERT INTO `categories` VALUES ('3', '饰品', null, null, '服装饰品');
INSERT INTO `categories` VALUES ('4', '家居', null, null, '家居产品');

-- ----------------------------
-- Table structure for `followings`
-- ----------------------------
DROP TABLE IF EXISTS `followings`;
CREATE TABLE `followings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned DEFAULT NULL,
  `o_user_id` int(11) unsigned DEFAULT NULL,
  `tag_id` int(11) unsigned DEFAULT NULL,
  `brand_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `o_user_id` (`o_user_id`),
  KEY `tag_id` (`tag_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `followings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `followings_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `followings_ibfk_3` FOREIGN KEY (`o_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `followings_ibfk_4` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `followings_ibfk_5` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `followings_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followings
-- ----------------------------

-- ----------------------------
-- Table structure for `pimages`
-- ----------------------------
DROP TABLE IF EXISTS `pimages`;
CREATE TABLE `pimages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `i_url` varchar(256) NOT NULL,
  `sortcode` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `pimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pimages
-- ----------------------------

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `p_name` varchar(50) NOT NULL,
  `p_production` text NOT NULL,
  `taobao_url` varchar(256) NOT NULL,
  `take_url` varchar(256) NOT NULL,
  `brand_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `old_price` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` int(2) NOT NULL DEFAULT '0' COMMENT '0普通用户1管理员',
  `state` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('15', 'admin', '6a7f135cccaa4ebfbaf5bbcd5f3f0e5f', '杨淘', '806400289@qq.com', '1', '1', '2015-06-25 17:18:50', '2015-06-25 17:18:56');
