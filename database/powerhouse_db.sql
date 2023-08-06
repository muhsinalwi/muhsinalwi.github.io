-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for powerhouse_db
CREATE DATABASE IF NOT EXISTS `powerhouse_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `powerhouse_db`;

-- Dumping structure for table powerhouse_db.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.cart: ~0 rows (approximately)

-- Dumping structure for table powerhouse_db.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.categories: ~1 rows (approximately)
INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
	(5, 'Detox', '&lt;p&gt;&lt;span style=&quot;font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; white-space: pre-wrap;&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Helping customers improve their health and wellness through detoxification.&lt;/font&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2023-04-24 15:55:35');

-- Dumping structure for table powerhouse_db.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.clients: ~2 rows (approximately)
INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
	(1, 'John', 'Smith', 'Male', '091023456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-07-16 10:34:48'),
	(2, 'Test', 'Test2', 'Male', '0123456789', 'customer@test.com', '202cb962ac59075b964b07152d234b70', 'h62 taman dato hormat\r\ntelok panglima garang', '2023-04-21 15:43:26');

-- Dumping structure for table powerhouse_db.inventory
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.inventory: ~7 rows (approximately)
INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
	(1, 1, 50, 2500, '2021-07-16 10:02:39', NULL),
	(2, 2, 20, 3500, '2021-07-16 10:09:08', NULL),
	(3, 3, 10, 3000, '2021-07-16 12:05:54', '2023-04-24 01:00:08'),
	(4, 4, 50, 2000, '2021-07-16 13:12:10', '2023-04-24 00:59:11'),
	(5, 6, 500, 49.9, '2023-04-25 12:00:45', NULL),
	(6, 5, 450, 50, '2023-04-25 12:01:14', NULL),
	(7, 7, 500, 23.96, '2023-04-26 22:53:13', NULL);

-- Dumping structure for table powerhouse_db.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.orders: ~6 rows (approximately)
INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
	(5, 2, 'h62 taman dato hormat\r\ntelok panglima garang', 'Online Payment', 2, 250, 0, 1, '2023-04-25 12:39:22', NULL),
	(6, 2, 'h62 taman dato hormat\r\ntelok panglima garang', 'Online Payment', 2, 100, 0, 1, '2023-04-25 14:44:46', NULL),
	(7, 2, 'h62 taman dato hormat\r\ntelok panglima garang', 'Online Payment', 2, 250, 0, 1, '2023-04-25 22:48:48', NULL),
	(8, 2, 'h62 taman dato hormat\r\ntelok panglima garang', 'Online Payment', 2, 50, 0, 1, '2023-04-25 22:49:14', NULL),
	(9, 1, '', 'Online Payment', 2, 119.8, 0, 1, '2023-04-26 23:00:53', NULL),
	(10, 2, 'h62 taman dato hormat\r\ntelok panglima garang', 'Online Payment', 2, 50, 0, 1, '2023-04-26 23:05:03', NULL);

-- Dumping structure for table powerhouse_db.order_list
CREATE TABLE IF NOT EXISTS `order_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.order_list: ~6 rows (approximately)
INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
	(4, 5, 5, 5, 50, 250),
	(5, 6, 5, 2, 50, 100),
	(6, 7, 5, 5, 50, 250),
	(7, 8, 5, 1, 50, 50),
	(8, 9, 7, 5, 23.96, 119.8),
	(9, 10, 5, 1, 50, 50);

-- Dumping structure for table powerhouse_db.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `brand` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.products: ~3 rows (approximately)
INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `brand`, `description`, `status`, `date_created`) VALUES
	(5, 6, 8, 'Optimum Nutrition BCAA Boost (30 Servings)', 'Optimum Nutrition', '&lt;p style=\\&quot;margin-bottom: 20px; line-height: 1.8; word-break: break-word !important;\\&quot;&gt;INFO:&lt;/p&gt;&lt;ul style=\\&quot;margin-bottom: 1em; word-break: break-word !important;\\&quot;&gt;&lt;li&gt;Train, Hydrate and Recover.&lt;/li&gt;&lt;li&gt;Zero Carbs, Zero Caffeine.&lt;/li&gt;&lt;li&gt;Intra-workout.&lt;/li&gt;&lt;li&gt;2:1:1 BCAA Blend 8g, Electrolyte Blend 1.2g, L-Citrulline 1g (per serving).&lt;/li&gt;&lt;/ul&gt;&lt;p style=\\&quot;margin-bottom: 20px; line-height: 1.8; word-break: break-word !important;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=\\&quot;margin-bottom: 20px; line-height: 1.8; word-break: break-word !important;\\&quot;&gt;Introducing Optumum Nutition (ON) BCAA Boost. A flavoured BCAA drink containing the Amino Acid L-Citrulline &amp;amp; Electrolytes. BCAA Boost is ideal for intra-workout nutrition providing the nutrients to train, hydrate &amp;amp; recover. Available in a mouth watering range of flavours including grape burst, mango peach wave &amp;amp; watermelon cooler.&lt;/p&gt;&lt;p style=\\&quot;margin-bottom: 20px; line-height: 1.8; word-break: break-word !important;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=\\&quot;margin-bottom: 20px; line-height: 1.8; word-break: break-word !important;\\&quot;&gt;SUGGESTED USE:&lt;/p&gt;&lt;ul style=\\&quot;margin-bottom: 1em; word-break: break-word !important;\\&quot;&gt;&lt;li&gt;Add 13g (1 scoop) of ON BCAA Boost into 300-400ml of cold water or other beverage and stir or shake until dissolved. For best results, drink 1 scoop of BCAA Boost as intra-workout support and post-workout muscle recovery.&lt;/li&gt;&lt;/ul&gt;&lt;p style=\\&quot;margin-bottom: 20px; line-height: 1.8; word-break: break-word !important;\\&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=\\&quot;margin-bottom: 20px; line-height: 1.8; word-break: break-word !important;\\&quot;&gt;NOTE:&lt;/p&gt;&lt;ul style=\\&quot;margin-bottom: 1em; word-break: break-word !important;\\&quot;&gt;&lt;li style=\\&quot;\\&quot;&gt;Product\\&#039;s pictures, labeling, and descriptions are subject to change by the manufacturers without notice.&lt;/li&gt;&lt;li style=\\&quot;\\&quot;&gt;Product color may slightly vary due to photographic lighting sources or your monitor settings.&lt;/li&gt;&lt;li style=\\&quot;\\&quot;&gt;Nutrition facts may vary depending on the flavor.&lt;/li&gt;&lt;/ul&gt;', 1, '2023-04-24 16:07:33'),
	(6, 5, 0, 'CLENX TEA NATURAL DETOX TEA', 'Nh Detoxlim', '&lt;p&gt;Flush Out Your Body Toxins&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Natural Clenx Tea&trade; is a high quality detox slimming tea made from 100% natural organic green tea and herbs, with no laxatives, no added sugar and no side effects. It has been approved by the Ministry of Health Malaysia and is safe for consumption. It is certified HALAL by JAKIM and complies to international GMP production procedure standards.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Product Features&lt;/p&gt;&lt;p&gt;All natural and organic ingredients&lt;/p&gt;&lt;p&gt;Does not cause diarrhea&lt;/p&gt;&lt;p&gt;No diet required&lt;/p&gt;&lt;p&gt;Prepared in sachets for your convenience&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Recommended Consumption For Best Results&lt;/p&gt;&lt;p&gt;Consume 1 teabag daily after dinner for those who want to detoxify and maintain a slender figure.&lt;/p&gt;&lt;p&gt;Consume 2 teabags daily after lunch and dinner for those who are experiencing severe constipation or are overweight.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Product Functions&lt;/p&gt;&lt;p&gt;Reduces body weight and maintains an ideal body shape&lt;/p&gt;&lt;p&gt;Stimulates peristaltic bowel movement to remove excessive toxins, fat and cholesterol&lt;/p&gt;&lt;p&gt;Relieves constipation, flatulence and bloated tummy&lt;/p&gt;&lt;p&gt;Improves the functions of detoxification organs&lt;/p&gt;&lt;p&gt;Strengthens immunity&lt;/p&gt;&lt;p&gt;Improves face complexion&lt;/p&gt;&lt;p&gt;Promotes radiant beauty and health from within&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;The advantages of colon detoxifying&lt;/p&gt;&lt;p&gt;Lose weight and/ or control weight&lt;/p&gt;&lt;p&gt;Overcome or relieve constipation and improve bowel disorders&lt;/p&gt;&lt;p&gt;Prevent, eliminate and reduce frequency and intensity of headaches&lt;/p&gt;&lt;p&gt;Improve digestion and absorption of nutrients&lt;/p&gt;&lt;p&gt;Boost body immune function and reduce risk of infection&lt;/p&gt;&lt;p&gt;Purify the blood&lt;/p&gt;&lt;p&gt;Improve emotional health and stress tolerance&lt;/p&gt;&lt;p&gt;Regain mental sharpness and think more clearly&lt;/p&gt;&lt;p&gt;Achieve a sense of wellbeing&lt;/p&gt;&lt;p&gt;Achieve a clearer skin and radiant complexion&lt;/p&gt;&lt;p&gt;Improve sleep quality and feel more refreshed&lt;/p&gt;&lt;p&gt;Scavenge free radicals and remove toxins&lt;/p&gt;&lt;p&gt;Improve energy levels and restore vitality&lt;/p&gt;&lt;p&gt;** Repacked&amp;nbsp;&lt;/p&gt;', 1, '2023-04-25 08:30:32'),
	(7, 6, 8, 'Nutrition Electrolyte Test', 'TEST BRAND', '&lt;p&gt;TEST&lt;/p&gt;', 1, '2023-04-26 22:52:39');

-- Dumping structure for table powerhouse_db.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.sales: ~7 rows (approximately)
INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
	(1, 3, 8500, '2021-07-16 11:18:12'),
	(3, 5, 250, '2023-04-25 12:39:22'),
	(4, 6, 100, '2023-04-25 14:44:46'),
	(5, 7, 250, '2023-04-25 22:48:48'),
	(6, 8, 50, '2023-04-25 22:49:14'),
	(7, 9, 119.8, '2023-04-26 23:00:53'),
	(8, 10, 50, '2023-04-26 23:05:03');

-- Dumping structure for table powerhouse_db.sub_categories
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.sub_categories: ~2 rows (approximately)
INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
	(8, 6, 'Nutrition', '', 1, '2023-04-24 16:06:16'),
	(9, 6, 'Test', '', 1, '2023-04-26 23:10:48');

-- Dumping structure for table powerhouse_db.system_info
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.system_info: ~5 rows (approximately)
INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
	(1, 'name', 'Ultimate Fitness Powerhouse'),
	(6, 'short_name', 'Ultimate Fitness Powerhouse'),
	(11, 'logo', 'uploads/1682271000_download (3).png'),
	(13, 'user_avatar', 'uploads/user_avatar.jpg'),
	(14, 'cover', 'uploads/1682061960_slider_img.png');

-- Dumping structure for table powerhouse_db.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table powerhouse_db.admin: ~3 rows (approximately)
INSERT INTO `admin` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `date_added`, `date_updated`) VALUES
	(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
	(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', 'uploads/1682268840_png-transparent-computer-icons-user-profile-login-user-heroes-sphere-black-thumbnail.png', NULL, '2021-06-19 08:36:09', '2023-04-24 00:54:10'),
	(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
