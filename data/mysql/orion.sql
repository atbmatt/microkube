DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `role` varchar(16) NOT NULL,
  `state` varchar(16) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES
(1,'ID59F88293B6','admin@orion.io',3,'admin','active',NOW(),NOW()),
(2,'ID8386BD19E2','samantha@orion.io',3,'member','active',NOW(),NOW()),
(3,'ID1A8E3B75E1','al@orion.io',3,'member','active',NOW(),NOW());
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

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
  SELECT 1, members.id, 'cad', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 2, members.id, 'ast', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 3, members.id, 'art', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 4, members.id, 'bdt', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 5, members.id, 'wpt', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 6, members.id, 'ypt', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 7, members.id, 'sft', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'admin@orion.io';
INSERT INTO `accounts`
  SELECT 8, members.id, 'cad', 1000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 9, members.id, 'ast', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 10, members.id, 'art', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 11, members.id, 'bdt', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 12, members.id, 'wpt', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 13, members.id, 'ypt', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 14, members.id, 'sft', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'samantha@orion.io';
INSERT INTO `accounts`
  SELECT 15, members.id, 'cad', 10000, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'al@orion.io';
INSERT INTO `accounts`
  SELECT 16, members.id, 'ast', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'al@orion.io';
INSERT INTO `accounts`
  SELECT 17, members.id, 'art', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'al@orion.io';
INSERT INTO `accounts`
  SELECT 18, members.id, 'bdt', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'al@orion.io';
INSERT INTO `accounts`
  SELECT 19, members.id, 'wpt', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'al@orion.io';
INSERT INTO `accounts`
  SELECT 20, members.id, 'ypt', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'al@orion.io';
INSERT INTO `accounts`
  SELECT 21, members.id, 'sft', 0, 0, NOW(), NOW()
  FROM `members`
  WHERE email = 'al@orion.io';
UNLOCK TABLES;