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


-- Dumping database structure for chatbot_db
CREATE DATABASE IF NOT EXISTS `chatbot_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `chatbot_db`;

-- Dumping structure for table chatbot_db.frequent_asks
CREATE TABLE IF NOT EXISTS `frequent_asks` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `question_id` int(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table chatbot_db.frequent_asks: ~68 rows (approximately)
INSERT INTO `frequent_asks` (`id`, `question_id`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 4),
	(12, 1),
	(13, 6),
	(14, 7),
	(15, 7),
	(16, 1),
	(17, 7),
	(18, 8),
	(19, 7),
	(20, 7),
	(21, 7),
	(22, 6),
	(23, 7),
	(24, 7),
	(25, 7),
	(26, 7),
	(27, 7),
	(28, 7),
	(29, 9),
	(30, 1),
	(31, 8),
	(32, 2),
	(33, 7),
	(34, 14),
	(35, 9),
	(36, 9),
	(37, 9),
	(38, 1),
	(39, 4),
	(40, 6),
	(41, 7),
	(42, 9),
	(43, 9),
	(44, 14),
	(45, 9),
	(46, 9),
	(47, 9),
	(48, 12),
	(49, 9),
	(50, 9),
	(51, 9),
	(52, 9),
	(53, 4),
	(54, 9),
	(55, 9),
	(56, 16),
	(57, 14),
	(58, 1),
	(59, 4),
	(60, 7),
	(61, 9),
	(62, 9),
	(63, 8),
	(64, 8),
	(65, 16),
	(66, 17),
	(67, 17),
	(68, 19);

-- Dumping structure for table chatbot_db.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `question` text DEFAULT NULL,
  `response_id` int(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table chatbot_db.questions: ~15 rows (approximately)
INSERT INTO `questions` (`id`, `question`, `response_id`) VALUES
	(1, 'what are you', 1),
	(2, 'who are you', 1),
	(3, 'what is your name', 1),
	(4, 'What can you do', 2),
	(7, 'what is PHP', 4),
	(8, 'What is ChatBot', 5),
	(9, 'hi', 6),
	(10, 'hello', 6),
	(11, 'yow', 6),
	(12, 'good day', 6),
	(14, 'sample', 7),
	(15, 'what topic can I ask', 8),
	(16, 'test', 9),
	(18, 'supplement', 10),
	(22, 'what supplement i can get', 14);

-- Dumping structure for table chatbot_db.responses
CREATE TABLE IF NOT EXISTS `responses` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `response_message` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table chatbot_db.responses: ~14 rows (approximately)
INSERT INTO `responses` (`id`, `response_message`) VALUES
	(1, 'I am John, the chatBot of this application.'),
	(2, 'I am in charge to answer your questions.'),
	(3, 'You can ask me about something related to this website.'),
	(4, 'PHP (recursive acronym for PHP: Hypertext Preprocessor ) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.'),
	(5, 'A chatbot is a software application used to conduct an on-line chat conversation via text or text-to-speech, in lieu of providing direct contact with a live human agent.'),
	(6, 'Hi there, how can I help you ? :)'),
	(7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam congue, lectus non tincidunt viverra, lacus erat venenatis mauris, sed hendrerit libero diam ac tellus. Integer imperdiet massa lacus, sed porta ligula efficitur at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; '),
	(8, 'You can ask me about something related to this website.'),
	(9, 'Hi. this is test'),
	(10, 'You can browse in product to see supplement list.'),
	(11, 'http://localhost/powerhouse/?p=view_product&id=e4da3b7fbbce2345d7772b0674a318d5'),
	(12, '<a href= "http://localhost/powerhouse/?p=view_product&id=e4da3b7fbbce2345d7772b0674a318d5" </a>'),
	(13, '<a href= "http://localhost/powerhouse/?p=view_product&id=e4da3b7fbbce2345d7772b0674a318d5" </a>'),
	(14, 'http://localhost/powerhouse/?p=view_product&id=e4da3b7fbbce2345d7772b0674a318d5');

-- Dumping structure for table chatbot_db.system_info
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table chatbot_db.system_info: ~7 rows (approximately)
INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
	(1, 'name', 'Ultimate Fitness Powerhouse'),
	(4, 'intro', 'Boleh saya bantu?'),
	(6, 'short_name', 'Ultimate Fitness Powerhouse'),
	(10, 'no_result', 'Sorry, please re-enter your question. ..'),
	(11, 'logo', 'uploads/1682062440_logo (1).png'),
	(12, 'bot_avatar', 'uploads/bot_avatar.jpg'),
	(13, 'user_avatar', 'uploads/user_avatar.jpg');

-- Dumping structure for table chatbot_db.unanswered
CREATE TABLE IF NOT EXISTS `unanswered` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `question` text DEFAULT NULL,
  `no_asks` int(30) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table chatbot_db.unanswered: ~1 rows (approximately)
INSERT INTO `unanswered` (`id`, `question`, `no_asks`) VALUES
	(32, 'gdrsf', 2);

-- Dumping structure for table chatbot_db.admin
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table chatbot_db.admin: ~1 rows (approximately)
INSERT INTO `admin` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `date_added`, `date_updated`) VALUES
	(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1620201300_avatar.png', NULL, '2021-01-20 14:02:37', '2021-05-05 15:55:28');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
