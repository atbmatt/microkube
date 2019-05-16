DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `currency_id` varchar(10) NOT NULL,
  `balance` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000',
  `locked` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_accounts_on_currency_id_and_member_id` (`currency_id`,`member_id`),
  KEY `index_accounts_on_member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE, `members` READ;
INSERT INTO `accounts`
  SELECT 1, members.id, 'ast', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 2, members.id, 'cad', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 3, members.id, 'ast', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 4, members.id, 'cad', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
UNLOCK TABLES;