-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: b.assistance.bg    Database: ghost_demo
-- ------------------------------------------------------
-- Server version	10.3.0-MariaDB-10.3.0+maria~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesstokens`
--

DROP TABLE IF EXISTS `accesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesstokens` (
  `id` varchar(24) NOT NULL,
  `token` varchar(191) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `issued_by` varchar(24) DEFAULT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accesstokens_token_unique` (`token`),
  KEY `accesstokens_user_id_foreign` (`user_id`),
  KEY `accesstokens_client_id_foreign` (`client_id`),
  CONSTRAINT `accesstokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `accesstokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesstokens`
--

LOCK TABLES `accesstokens` WRITE;
/*!40000 ALTER TABLE `accesstokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesstokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` varchar(24) NOT NULL,
  `resource_id` varchar(24) DEFAULT NULL,
  `resource_type` varchar(50) NOT NULL,
  `actor_id` varchar(24) NOT NULL,
  `actor_type` varchar(50) NOT NULL,
  `event` varchar(50) NOT NULL,
  `context` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES ('5c8d34e7c7d5d2747a9951e6','5c8d2cd197618a61c6fa0bf0','post','1','user','edited',NULL,'2019-03-16 17:39:51'),('5c8d34f6c7d5d2747a9951e7','5c8d2cd197618a61c6fa0bf0','post','1','user','edited',NULL,'2019-03-16 17:40:06'),('5c8f6221ea58f000e2622516','5c8d2cd197618a61c6fa0bf0','post','1','user','edited',NULL,'2019-03-18 09:17:21'),('5c8f6229ea58f000e2622517','5c8d2cd197618a61c6fa0bf0','post','1','user','edited',NULL,'2019-03-18 09:17:29'),('5c8f66f7ea58f000e2622518','5c8d2cd197618a61c6fa0bf0','post','1','user','edited',NULL,'2019-03-18 09:37:59'),('5c8f66fbea58f000e2622519','5c8d2cd197618a61c6fa0bf0','post','1','user','edited',NULL,'2019-03-18 09:38:03');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `id` varchar(24) NOT NULL,
  `type` varchar(50) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `role_id` varchar(24) DEFAULT NULL,
  `integration_id` varchar(24) DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `last_seen_version` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_secret_unique` (`secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES ('5c8d2cd197618a61c6fa0bf3','admin','ee45609f40fbee2d8d347e2a25cdecf52513e04b3d9ad175c0777dd9bbcde4c7','5c8d2ccd97618a61c6fa0b9c','5c8d2cd197618a61c6fa0bf2',NULL,NULL,'2019-03-16 17:05:21','1','2019-03-16 17:05:21','1');
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fields`
--

DROP TABLE IF EXISTS `app_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fields` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'html',
  `app_id` varchar(24) NOT NULL,
  `relatable_id` varchar(24) NOT NULL,
  `relatable_type` varchar(50) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_fields_app_id_foreign` (`app_id`),
  CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fields`
--

LOCK TABLES `app_fields` WRITE;
/*!40000 ALTER TABLE `app_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `app_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_settings_key_unique` (`key`),
  KEY `app_settings_app_id_foreign` (`app_id`),
  CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `version` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apps_name_unique` (`name`),
  UNIQUE KEY `apps_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brute`
--

DROP TABLE IF EXISTS `brute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brute` (
  `key` varchar(191) NOT NULL,
  `firstRequest` bigint(20) NOT NULL,
  `lastRequest` bigint(20) NOT NULL,
  `lifetime` bigint(20) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brute`
--

LOCK TABLES `brute` WRITE;
/*!40000 ALTER TABLE `brute` DISABLE KEYS */;
INSERT INTO `brute` VALUES ('oHUubZQTM66eOWJCFaoi+8dO/eXPG5zwBOW8P5YAuKM=',1552910206253,1552910210739,1552913810744,2);
/*!40000 ALTER TABLE `brute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_trusted_domains`
--

DROP TABLE IF EXISTS `client_trusted_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_trusted_domains` (
  `id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `trusted_domain` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_trusted_domains_client_id_foreign` (`client_id`),
  CONSTRAINT `client_trusted_domains_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_trusted_domains`
--

LOCK TABLES `client_trusted_domains` WRITE;
/*!40000 ALTER TABLE `client_trusted_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_trusted_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `redirection_uri` varchar(2000) DEFAULT NULL,
  `client_uri` varchar(2000) DEFAULT NULL,
  `auth_uri` varchar(2000) DEFAULT NULL,
  `logo` varchar(2000) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'development',
  `type` varchar(50) NOT NULL DEFAULT 'ua',
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_name_unique` (`name`),
  UNIQUE KEY `clients_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('5c8d2ccd97618a61c6fa0b93','37830fa1-fefd-46a3-88bc-c7ac46de2ea9','Ghost Admin','ghost-admin','40aa47a4b27c',NULL,NULL,NULL,NULL,'enabled','ua',NULL,'2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b94','344a7d28-8dd1-42f8-a594-490e269625c7','Ghost Frontend','ghost-frontend','65caa2aec70c',NULL,NULL,NULL,NULL,'enabled','ua',NULL,'2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b95','4212c031-b29d-41ab-9d86-9babcf236224','Ghost Scheduler','ghost-scheduler','ee137810d0e5',NULL,NULL,NULL,NULL,'enabled','web',NULL,'2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b96','a08abb00-ccdb-40bf-b74e-356cbac4ce11','Ghost Backup','ghost-backup','dccf300e6ac8',NULL,NULL,NULL,NULL,'enabled','web',NULL,'2019-03-16 17:05:17','1','2019-03-16 17:05:17','1');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrations`
--

DROP TABLE IF EXISTS `integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrations` (
  `id` varchar(24) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'custom',
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `icon_image` varchar(2000) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `integrations_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrations`
--

LOCK TABLES `integrations` WRITE;
/*!40000 ALTER TABLE `integrations` DISABLE KEYS */;
INSERT INTO `integrations` VALUES ('5c8d2cd197618a61c6fa0bf2','builtin','Zapier','zapier',NULL,'Built-in Zapier integration','2019-03-16 17:05:21','1','2019-03-16 17:05:21','1');
/*!40000 ALTER TABLE `integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `token` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `expires` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invites_token_unique` (`token`),
  UNIQUE KEY `invites_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` varchar(24) NOT NULL,
  `email` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `version` varchar(70) NOT NULL,
  `currentVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_name_version_unique` (`name`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'1-create-tables.js','init','2.18'),(2,'2-create-fixtures.js','init','2.18'),(3,'1-post-excerpt.js','1.3','2.18'),(4,'1-codeinjection-post.js','1.4','2.18'),(5,'1-og-twitter-post.js','1.5','2.18'),(6,'1-add-backup-client.js','1.7','2.18'),(7,'1-add-permissions-redirect.js','1.9','2.18'),(8,'1-custom-template-post.js','1.13','2.18'),(9,'2-theme-permissions.js','1.13','2.18'),(10,'1-add-webhooks-table.js','1.18','2.18'),(11,'1-webhook-permissions.js','1.19','2.18'),(12,'1-remove-settings-keys.js','1.20','2.18'),(13,'1-add-contributor-role.js','1.21','2.18'),(14,'1-multiple-authors-DDL.js','1.22','2.18'),(15,'1-multiple-authors-DML.js','1.22','2.18'),(16,'1-update-koenig-beta-html.js','1.25','2.18'),(17,'2-demo-post.js','1.25','2.18'),(18,'1-rename-amp-column.js','2.0','2.18'),(19,'2-update-posts.js','2.0','2.18'),(20,'3-remove-koenig-labs.js','2.0','2.18'),(21,'4-permalink-setting.js','2.0','2.18'),(22,'5-remove-demo-post.js','2.0','2.18'),(23,'6-replace-fixture-posts.js','2.0','2.18'),(24,'1-add-sessions-table.js','2.2','2.18'),(25,'2-add-integrations-and-api-key-tables.js','2.2','2.18'),(26,'3-insert-admin-integration-role.js','2.2','2.18'),(27,'4-insert-integration-and-api-key-permissions.js','2.2','2.18'),(28,'5-add-mobiledoc-revisions-table.js','2.2','2.18'),(29,'1-add-webhook-columns.js','2.3','2.18'),(30,'2-add-webhook-edit-permission.js','2.3','2.18'),(31,'1-add-webhook-permission-roles.js','2.6','2.18'),(32,'1-add-members-table.js','2.8','2.18'),(33,'1-remove-empty-strings.js','2.13','2.18'),(34,'1-add-actions-table.js','2.14','2.18'),(35,'2-add-actions-permissions.js','2.14','2.18'),(36,'1-add-type-column-to-integrations.js','2.15','2.18'),(37,'2-insert-zapier-integration.js','2.15','2.18'),(38,'1-add-members-perrmissions.js','2.16','2.18'),(39,'1-normalize-settings.js','2.17','2.18'),(40,'2-posts-add-canonical-url.js','2.17','2.18'),(41,'1-restore-settings-from-backup.js','2.18','2.18');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations_lock`
--

DROP TABLE IF EXISTS `migrations_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations_lock` (
  `lock_key` varchar(191) NOT NULL,
  `locked` tinyint(1) DEFAULT 0,
  `acquired_at` datetime DEFAULT NULL,
  `released_at` datetime DEFAULT NULL,
  UNIQUE KEY `migrations_lock_lock_key_unique` (`lock_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations_lock`
--

LOCK TABLES `migrations_lock` WRITE;
/*!40000 ALTER TABLE `migrations_lock` DISABLE KEYS */;
INSERT INTO `migrations_lock` VALUES ('km01',0,'2019-04-20 16:22:35','2019-04-20 16:22:35');
/*!40000 ALTER TABLE `migrations_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobiledoc_revisions`
--

DROP TABLE IF EXISTS `mobiledoc_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobiledoc_revisions` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `mobiledoc` longtext DEFAULT NULL,
  `created_at_ts` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobiledoc_revisions_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobiledoc_revisions`
--

LOCK TABLES `mobiledoc_revisions` WRITE;
/*!40000 ALTER TABLE `mobiledoc_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobiledoc_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `object_id` varchar(24) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('5c8d2ccd97618a61c6fa0b9d','Export database','db','exportContent',NULL,'2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b9e','Import database','db','importContent',NULL,'2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2cce97618a61c6fa0b9f','Delete all content','db','deleteAllContent',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba0','Send mail','mail','send',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba1','Browse notifications','notification','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba2','Add notifications','notification','add',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba3','Delete notifications','notification','destroy',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba4','Browse posts','post','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba5','Read posts','post','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba6','Edit posts','post','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba7','Add posts','post','add',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba8','Delete posts','post','destroy',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0ba9','Browse settings','setting','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0baa','Read settings','setting','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bab','Edit settings','setting','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bac','Generate slugs','slug','generate',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bad','Browse tags','tag','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bae','Read tags','tag','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0baf','Edit tags','tag','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb0','Add tags','tag','add',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb1','Delete tags','tag','destroy',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb2','Browse themes','theme','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb3','Edit themes','theme','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb4','Activate themes','theme','activate',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb5','Upload themes','theme','add',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb6','Download themes','theme','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb7','Delete themes','theme','destroy',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb8','Browse users','user','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bb9','Read users','user','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bba','Edit users','user','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bbb','Add users','user','add',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bbc','Delete users','user','destroy',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bbd','Assign a role','role','assign',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bbe','Browse roles','role','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bbf','Browse clients','client','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc0','Read clients','client','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc1','Edit clients','client','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc2','Add clients','client','add',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc3','Delete clients','client','destroy',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc4','Browse subscribers','subscriber','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc5','Read subscribers','subscriber','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc6','Edit subscribers','subscriber','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc7','Add subscribers','subscriber','add',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc8','Delete subscribers','subscriber','destroy',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bc9','Browse invites','invite','browse',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bca','Read invites','invite','read',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2cce97618a61c6fa0bcb','Edit invites','invite','edit',NULL,'2019-03-16 17:05:18','1','2019-03-16 17:05:18','1'),('5c8d2ccf97618a61c6fa0bcc','Add invites','invite','add',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bcd','Delete invites','invite','destroy',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bce','Download redirects','redirect','download',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bcf','Upload redirects','redirect','upload',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd0','Add webhooks','webhook','add',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd1','Edit webhooks','webhook','edit',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd2','Delete webhooks','webhook','destroy',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd3','Browse integrations','integration','browse',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd4','Read integrations','integration','read',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd5','Edit integrations','integration','edit',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd6','Add integrations','integration','add',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd7','Delete integrations','integration','destroy',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd8','Browse API keys','api_key','browse',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bd9','Read API keys','api_key','read',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bda','Edit API keys','api_key','edit',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bdb','Add API keys','api_key','add',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bdc','Delete API keys','api_key','destroy',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bdd','Browse Actions','action','browse',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bde','Browse Members','member','browse',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0bdf','Read Members','member','read',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0be0','Edit Members','member','edit',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0be1','Add Members','member','add',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1'),('5c8d2ccf97618a61c6fa0be2','Delete Members','member','destroy',NULL,'2019-03-16 17:05:19','1','2019-03-16 17:05:19','1');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_apps`
--

DROP TABLE IF EXISTS `permissions_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_apps` (
  `id` varchar(24) NOT NULL,
  `app_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_apps`
--

LOCK TABLES `permissions_apps` WRITE;
/*!40000 ALTER TABLE `permissions_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
INSERT INTO `permissions_roles` VALUES ('5c8d2cd197618a61c6fa0bf4','5c8d2ccd97618a61c6fa0b97','5c8d2ccd97618a61c6fa0b9d'),('5c8d2cd197618a61c6fa0bf5','5c8d2ccd97618a61c6fa0b97','5c8d2ccd97618a61c6fa0b9e'),('5c8d2cd197618a61c6fa0bf6','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0b9f'),('5c8d2cd197618a61c6fa0bf7','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba0'),('5c8d2cd197618a61c6fa0bf8','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba1'),('5c8d2cd197618a61c6fa0bf9','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba2'),('5c8d2cd197618a61c6fa0bfa','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba3'),('5c8d2cd197618a61c6fa0bfb','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba4'),('5c8d2cd197618a61c6fa0bfc','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba5'),('5c8d2cd197618a61c6fa0bfd','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba6'),('5c8d2cd197618a61c6fa0bfe','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba7'),('5c8d2cd197618a61c6fa0bff','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba8'),('5c8d2cd197618a61c6fa0c00','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0ba9'),('5c8d2cd197618a61c6fa0c01','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0baa'),('5c8d2cd197618a61c6fa0c02','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bab'),('5c8d2cd197618a61c6fa0c03','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bac'),('5c8d2cd197618a61c6fa0c04','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bad'),('5c8d2cd197618a61c6fa0c05','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bae'),('5c8d2cd197618a61c6fa0c06','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0baf'),('5c8d2cd197618a61c6fa0c07','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb0'),('5c8d2cd197618a61c6fa0c08','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb1'),('5c8d2cd197618a61c6fa0c09','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb2'),('5c8d2cd197618a61c6fa0c0a','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb3'),('5c8d2cd197618a61c6fa0c0b','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb4'),('5c8d2cd197618a61c6fa0c0c','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb5'),('5c8d2cd197618a61c6fa0c0d','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb6'),('5c8d2cd197618a61c6fa0c0e','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb7'),('5c8d2cd197618a61c6fa0c0f','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb8'),('5c8d2cd197618a61c6fa0c10','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bb9'),('5c8d2cd197618a61c6fa0c11','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bba'),('5c8d2cd197618a61c6fa0c12','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bbb'),('5c8d2cd197618a61c6fa0c13','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bbc'),('5c8d2cd197618a61c6fa0c14','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bbd'),('5c8d2cd197618a61c6fa0c15','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bbe'),('5c8d2cd197618a61c6fa0c16','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bbf'),('5c8d2cd197618a61c6fa0c17','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc0'),('5c8d2cd197618a61c6fa0c18','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc1'),('5c8d2cd197618a61c6fa0c19','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc2'),('5c8d2cd197618a61c6fa0c1a','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc3'),('5c8d2cd197618a61c6fa0c1b','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc4'),('5c8d2cd197618a61c6fa0c1c','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc5'),('5c8d2cd197618a61c6fa0c1d','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc6'),('5c8d2cd197618a61c6fa0c1e','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc7'),('5c8d2cd197618a61c6fa0c1f','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc8'),('5c8d2cd197618a61c6fa0c20','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bc9'),('5c8d2cd197618a61c6fa0c21','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bca'),('5c8d2cd197618a61c6fa0c22','5c8d2ccd97618a61c6fa0b97','5c8d2cce97618a61c6fa0bcb'),('5c8d2cd197618a61c6fa0c23','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bcc'),('5c8d2cd197618a61c6fa0c24','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bcd'),('5c8d2cd197618a61c6fa0c25','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bce'),('5c8d2cd197618a61c6fa0c26','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bcf'),('5c8d2cd197618a61c6fa0c27','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd0'),('5c8d2cd197618a61c6fa0c28','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd1'),('5c8d2cd197618a61c6fa0c29','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd2'),('5c8d2cd297618a61c6fa0c2a','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd3'),('5c8d2cd297618a61c6fa0c2b','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd4'),('5c8d2cd297618a61c6fa0c2c','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd5'),('5c8d2cd297618a61c6fa0c2d','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd6'),('5c8d2cd297618a61c6fa0c2e','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd7'),('5c8d2cd297618a61c6fa0c2f','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd8'),('5c8d2cd297618a61c6fa0c30','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bd9'),('5c8d2cd297618a61c6fa0c31','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bda'),('5c8d2cd297618a61c6fa0c32','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bdb'),('5c8d2cd297618a61c6fa0c33','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bdc'),('5c8d2cd297618a61c6fa0c34','5c8d2ccd97618a61c6fa0b97','5c8d2ccf97618a61c6fa0bdd'),('5c8d2cd297618a61c6fa0c35','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba0'),('5c8d2cd297618a61c6fa0c36','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba1'),('5c8d2cd297618a61c6fa0c37','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba2'),('5c8d2cd297618a61c6fa0c38','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba3'),('5c8d2cd297618a61c6fa0c39','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba4'),('5c8d2cd297618a61c6fa0c3a','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba5'),('5c8d2cd297618a61c6fa0c3b','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba6'),('5c8d2cd297618a61c6fa0c3c','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba7'),('5c8d2cd297618a61c6fa0c3d','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba8'),('5c8d2cd297618a61c6fa0c3e','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0ba9'),('5c8d2cd297618a61c6fa0c3f','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0baa'),('5c8d2cd297618a61c6fa0c40','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bab'),('5c8d2cd297618a61c6fa0c41','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bac'),('5c8d2cd297618a61c6fa0c42','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bad'),('5c8d2cd297618a61c6fa0c43','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bae'),('5c8d2cd297618a61c6fa0c44','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0baf'),('5c8d2cd297618a61c6fa0c45','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb0'),('5c8d2cd297618a61c6fa0c46','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb1'),('5c8d2cd297618a61c6fa0c47','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb2'),('5c8d2cd297618a61c6fa0c48','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb3'),('5c8d2cd297618a61c6fa0c49','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb4'),('5c8d2cd297618a61c6fa0c4a','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb5'),('5c8d2cd297618a61c6fa0c4b','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb6'),('5c8d2cd297618a61c6fa0c4c','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb7'),('5c8d2cd297618a61c6fa0c4d','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb8'),('5c8d2cd297618a61c6fa0c4e','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bb9'),('5c8d2cd297618a61c6fa0c4f','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bba'),('5c8d2cd297618a61c6fa0c50','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bbb'),('5c8d2cd297618a61c6fa0c51','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bbc'),('5c8d2cd297618a61c6fa0c52','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bbd'),('5c8d2cd297618a61c6fa0c53','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bbe'),('5c8d2cd297618a61c6fa0c54','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bbf'),('5c8d2cd297618a61c6fa0c55','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc0'),('5c8d2cd297618a61c6fa0c56','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc1'),('5c8d2cd297618a61c6fa0c57','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc2'),('5c8d2cd297618a61c6fa0c58','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc3'),('5c8d2cd297618a61c6fa0c59','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc4'),('5c8d2cd297618a61c6fa0c5a','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc5'),('5c8d2cd297618a61c6fa0c5b','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc6'),('5c8d2cd297618a61c6fa0c5c','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc7'),('5c8d2cd297618a61c6fa0c5d','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc8'),('5c8d2cd297618a61c6fa0c5e','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bc9'),('5c8d2cd297618a61c6fa0c5f','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bca'),('5c8d2cd297618a61c6fa0c60','5c8d2ccd97618a61c6fa0b9c','5c8d2cce97618a61c6fa0bcb'),('5c8d2cd297618a61c6fa0c61','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bcc'),('5c8d2cd297618a61c6fa0c62','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bcd'),('5c8d2cd297618a61c6fa0c63','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bce'),('5c8d2cd297618a61c6fa0c64','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bcf'),('5c8d2cd297618a61c6fa0c65','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bd0'),('5c8d2cd297618a61c6fa0c66','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bd1'),('5c8d2cd297618a61c6fa0c67','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bd2'),('5c8d2cd297618a61c6fa0c68','5c8d2ccd97618a61c6fa0b9c','5c8d2ccf97618a61c6fa0bdd'),('5c8d2cd297618a61c6fa0c69','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0ba4'),('5c8d2cd297618a61c6fa0c6a','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0ba5'),('5c8d2cd297618a61c6fa0c6b','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0ba6'),('5c8d2cd297618a61c6fa0c6c','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0ba7'),('5c8d2cd297618a61c6fa0c6d','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0ba8'),('5c8d2cd297618a61c6fa0c6e','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0ba9'),('5c8d2cd297618a61c6fa0c6f','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0baa'),('5c8d2cd297618a61c6fa0c70','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bac'),('5c8d2cd297618a61c6fa0c71','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bad'),('5c8d2cd297618a61c6fa0c72','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bae'),('5c8d2cd297618a61c6fa0c73','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0baf'),('5c8d2cd297618a61c6fa0c74','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bb0'),('5c8d2cd297618a61c6fa0c75','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bb1'),('5c8d2cd297618a61c6fa0c76','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bb8'),('5c8d2cd297618a61c6fa0c77','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bb9'),('5c8d2cd297618a61c6fa0c78','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bba'),('5c8d2cd297618a61c6fa0c79','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bbb'),('5c8d2cd297618a61c6fa0c7a','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bbc'),('5c8d2cd297618a61c6fa0c7b','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bbd'),('5c8d2cd297618a61c6fa0c7c','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bbe'),('5c8d2cd297618a61c6fa0c7d','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bbf'),('5c8d2cd297618a61c6fa0c7e','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bc0'),('5c8d2cd297618a61c6fa0c7f','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bc1'),('5c8d2cd297618a61c6fa0c80','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bc2'),('5c8d2cd297618a61c6fa0c81','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bc3'),('5c8d2cd297618a61c6fa0c82','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bc7'),('5c8d2cd297618a61c6fa0c83','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bc9'),('5c8d2cd297618a61c6fa0c84','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bca'),('5c8d2cd297618a61c6fa0c85','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bcb'),('5c8d2cd297618a61c6fa0c86','5c8d2ccd97618a61c6fa0b98','5c8d2ccf97618a61c6fa0bcc'),('5c8d2cd297618a61c6fa0c87','5c8d2ccd97618a61c6fa0b98','5c8d2ccf97618a61c6fa0bcd'),('5c8d2cd397618a61c6fa0c88','5c8d2ccd97618a61c6fa0b98','5c8d2cce97618a61c6fa0bb2'),('5c8d2cd397618a61c6fa0c89','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0ba4'),('5c8d2cd397618a61c6fa0c8a','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0ba5'),('5c8d2cd397618a61c6fa0c8b','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0ba7'),('5c8d2cd397618a61c6fa0c8c','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0ba9'),('5c8d2cd397618a61c6fa0c8d','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0baa'),('5c8d2cd397618a61c6fa0c8e','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bac'),('5c8d2cd397618a61c6fa0c8f','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bad'),('5c8d2cd397618a61c6fa0c90','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bae'),('5c8d2cd397618a61c6fa0c91','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bb0'),('5c8d2cd397618a61c6fa0c92','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bb8'),('5c8d2cd397618a61c6fa0c93','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bb9'),('5c8d2cd397618a61c6fa0c94','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bbe'),('5c8d2cd397618a61c6fa0c95','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bbf'),('5c8d2cd397618a61c6fa0c96','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bc0'),('5c8d2cd397618a61c6fa0c97','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bc1'),('5c8d2cd397618a61c6fa0c98','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bc2'),('5c8d2cd397618a61c6fa0c99','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bc3'),('5c8d2cd397618a61c6fa0c9a','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bc7'),('5c8d2cd397618a61c6fa0c9b','5c8d2ccd97618a61c6fa0b99','5c8d2cce97618a61c6fa0bb2'),('5c8d2cd397618a61c6fa0c9c','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0ba4'),('5c8d2cd397618a61c6fa0c9d','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0ba5'),('5c8d2cd397618a61c6fa0c9e','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0ba7'),('5c8d2cd397618a61c6fa0c9f','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0ba9'),('5c8d2cd397618a61c6fa0ca0','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0baa'),('5c8d2cd397618a61c6fa0ca1','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bac'),('5c8d2cd397618a61c6fa0ca2','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bad'),('5c8d2cd397618a61c6fa0ca3','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bae'),('5c8d2cd397618a61c6fa0ca4','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bb8'),('5c8d2cd397618a61c6fa0ca5','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bb9'),('5c8d2cd397618a61c6fa0ca6','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bbe'),('5c8d2cd397618a61c6fa0ca7','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bbf'),('5c8d2cd397618a61c6fa0ca8','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bc0'),('5c8d2cd397618a61c6fa0ca9','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bc1'),('5c8d2cd397618a61c6fa0caa','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bc2'),('5c8d2cd397618a61c6fa0cab','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bc3'),('5c8d2cd397618a61c6fa0cac','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bc7'),('5c8d2cd397618a61c6fa0cad','5c8d2ccd97618a61c6fa0b9a','5c8d2cce97618a61c6fa0bb2');
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_users`
--

DROP TABLE IF EXISTS `permissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_users` (
  `id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_users`
--

LOCK TABLES `permissions_users` WRITE;
/*!40000 ALTER TABLE `permissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `mobiledoc` longtext DEFAULT NULL,
  `html` longtext DEFAULT NULL,
  `comment_id` varchar(50) DEFAULT NULL,
  `plaintext` longtext DEFAULT NULL,
  `feature_image` varchar(2000) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `page` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'draft',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `author_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` varchar(24) DEFAULT NULL,
  `custom_excerpt` varchar(2000) DEFAULT NULL,
  `codeinjection_head` text DEFAULT NULL,
  `codeinjection_foot` text DEFAULT NULL,
  `og_image` varchar(2000) DEFAULT NULL,
  `og_title` varchar(300) DEFAULT NULL,
  `og_description` varchar(500) DEFAULT NULL,
  `twitter_image` varchar(2000) DEFAULT NULL,
  `twitter_title` varchar(300) DEFAULT NULL,
  `twitter_description` varchar(500) DEFAULT NULL,
  `custom_template` varchar(100) DEFAULT NULL,
  `canonical_url` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('5c8d2cd097618a61c6fa0be4','97443d76-e53d-4e2c-8cb1-693a82317451','Creating a custom theme','themes','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[[\"image\",{\"src\":\"https://static.ghost.org/v1.0.0/images/marketplace.jpg\",\"caption\":\"Anyone can write a completely custom Ghost theme with some solid knowledge of HTML and CSS\"}]],\"markups\":[[\"a\",[\"href\",\"http://marketplace.ghost.org\"]],[\"code\"],[\"a\",[\"href\",\"https://github.com/TryGhost/Casper\"]],[\"a\",[\"href\",\"https://docs.ghost.org/api/handlebars-themes/\"]],[\"strong\"],[\"a\",[\"href\",\"https://forum.ghost.org/c/themes\"]]],\"sections\":[[1,\"p\",[[0,[],0,\"Ghost comes with a beautiful default theme called Casper, which is designed to be a clean, readable publication layout and can be adapted for most purposes. However, Ghost can also be completely themed to suit your needs. Rather than just giving you a few basic settings which act as a poor proxy for code, we just let you write code.\"]]],[1,\"p\",[[0,[],0,\"There are a huge range of both free and premium pre-built themes which you can get from the \"],[0,[0],1,\"Ghost Theme Marketplace\"],[0,[],0,\", or you can create your own from scratch.\"]]],[10,0],[1,\"p\",[[0,[],0,\"Ghost themes are written with a templating language called handlebars, which has a set of dynamic helpers to insert your data into template files. For example: \"],[0,[1],1,\"{{author.name}}\"],[0,[],0,\" outputs the name of the current author.\"]]],[1,\"p\",[[0,[],0,\"The best way to learn how to write your own Ghost theme is to have a look at \"],[0,[2],1,\"the source code for Casper\"],[0,[],0,\", which is heavily commented and should give you a sense of how everything fits together.\"]]],[3,\"ul\",[[[0,[1],1,\"default.hbs\"],[0,[],0,\" is the main template file, all contexts will load inside this file unless specifically told to use a different template.\"]],[[0,[1],1,\"post.hbs\"],[0,[],0,\" is the file used in the context of viewing a post.\"]],[[0,[1],1,\"index.hbs\"],[0,[],0,\" is the file used in the context of viewing the home page.\"]],[[0,[],0,\"and so on\"]]]],[1,\"p\",[[0,[],0,\"We\'ve got \"],[0,[3],1,\"full and extensive theme documentation\"],[0,[],0,\" which outlines every template file, context and helper that you can use.\"]]],[1,\"p\",[[0,[],0,\"If you want to chat with other people making Ghost themes to get any advice or help, there\'s also a \"],[0,[4],1,\"themes\"],[0,[],0,\" section on our \"],[0,[5],1,\"public Ghost forum\"],[0,[],0,\".\"]]]]}','<p>Ghost comes with a beautiful default theme called Casper, which is designed to be a clean, readable publication layout and can be adapted for most purposes. However, Ghost can also be completely themed to suit your needs. Rather than just giving you a few basic settings which act as a poor proxy for code, we just let you write code.</p><p>There are a huge range of both free and premium pre-built themes which you can get from the <a href=\"http://marketplace.ghost.org\">Ghost Theme Marketplace</a>, or you can create your own from scratch.</p><!--kg-card-begin: image--><figure class=\"kg-card kg-image-card kg-card-hascaption\"><img src=\"https://static.ghost.org/v1.0.0/images/marketplace.jpg\" class=\"kg-image\"><figcaption>Anyone can write a completely custom Ghost theme with some solid knowledge of HTML and CSS</figcaption></figure><!--kg-card-end: image--><p>Ghost themes are written with a templating language called handlebars, which has a set of dynamic helpers to insert your data into template files. For example: <code>{{author.name}}</code> outputs the name of the current author.</p><p>The best way to learn how to write your own Ghost theme is to have a look at <a href=\"https://github.com/TryGhost/Casper\">the source code for Casper</a>, which is heavily commented and should give you a sense of how everything fits together.</p><ul><li><code>default.hbs</code> is the main template file, all contexts will load inside this file unless specifically told to use a different template.</li><li><code>post.hbs</code> is the file used in the context of viewing a post.</li><li><code>index.hbs</code> is the file used in the context of viewing the home page.</li><li>and so on</li></ul><p>We\'ve got <a href=\"https://docs.ghost.org/api/handlebars-themes/\">full and extensive theme documentation</a> which outlines every template file, context and helper that you can use.</p><p>If you want to chat with other people making Ghost themes to get any advice or help, there\'s also a <strong>themes</strong> section on our <a href=\"https://forum.ghost.org/c/themes\">public Ghost forum</a>.</p>','5c8d2cd097618a61c6fa0be4','Ghost comes with a beautiful default theme called Casper, which is designed to\nbe a clean, readable publication layout and can be adapted for most purposes.\nHowever, Ghost can also be completely themed to suit your needs. Rather than\njust giving you a few basic settings which act as a poor proxy for code, we just\nlet you write code.\n\nThere are a huge range of both free and premium pre-built themes which you can\nget from the Ghost Theme Marketplace [http://marketplace.ghost.org], or you can\ncreate your own from scratch.\n\nAnyone can write a completely custom Ghost theme with some solid knowledge of\nHTML and CSSGhost themes are written with a templating language called\nhandlebars, which has a set of dynamic helpers to insert your data into template\nfiles. For example: {{author.name}}  outputs the name of the current author.\n\nThe best way to learn how to write your own Ghost theme is to have a look at \nthe\nsource code for Casper [https://github.com/TryGhost/Casper], which is heavily\ncommented and should give you a sense of how everything fits together.\n\n * default.hbs  is the main template file, all contexts will load inside this\n   file unless specifically told to use a different template.\n * post.hbs  is the file used in the context of viewing a post.\n * index.hbs  is the file used in the context of viewing the home page.\n * and so on\n\nWe\'ve got full and extensive theme documentation\n[https://docs.ghost.org/api/handlebars-themes/]  which outlines every template\nfile, context and helper that you can use.\n\nIf you want to chat with other people making Ghost themes to get any advice or\nhelp, there\'s also a themes  section on our public Ghost forum\n[https://forum.ghost.org/c/themes].','https://static.ghost.org/v2.0.0/images/creating-a-custom-theme.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2019-03-16 17:05:20','1','2019-03-16 17:05:20','1','2019-03-16 17:05:20','1','Ghost comes with a beautiful default theme called Casper, which is designed to be a clean, readable publication layout and can be easily adapted for most purposes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5c8d2cd097618a61c6fa0be6','e7332047-d686-4169-b49e-db0cc0e66c56','Apps & integrations','apps-integrations','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[[\"markdown\",{\"markdown\":\"<script src=\\\"https://zapier.com/apps/embed/widget.js?services=Ghost&container=true&limit=8\\\"></script>\\n\"}]],\"markups\":[[\"a\",[\"href\",\"https://zapier.com\"]],[\"strong\"],[\"a\",[\"href\",\"https://docs.ghost.org/api/handlebars-themes/\"]],[\"em\"],[\"a\",[\"href\",\"https://docs.ghost.org/integrations/disqus/\"]],[\"a\",[\"href\",\"https://docs.ghost.org/integrations/discourse/\"]],[\"a\",[\"href\",\"https://help.ghost.org/article/89-mathjax\"]],[\"a\",[\"href\",\"https://prismjs.com/\"]],[\"a\",[\"href\",\"https://www.google.com/forms/\"]],[\"a\",[\"href\",\"https://www.typeform.com/\"]],[\"a\",[\"href\",\"https://docs.ghost.org/api/\"]],[\"a\",[\"href\",\"/themes/\"]]],\"sections\":[[1,\"p\",[[0,[],0,\"There are three primary ways to work with third-party services in Ghost: using Zapier, editing your theme, or using the Ghost API.\"]]],[1,\"h1\",[[0,[],0,\"Zapier\"]]],[1,\"p\",[[0,[],0,\"You can connect your Ghost site to over 1,000 external services using the official integration with \"],[0,[0],1,\"Zapier\"],[0,[],0,\".\"]]],[1,\"p\",[[0,[],0,\"Zapier sets up automations with Triggers and Actions, which allows you to create and customise a wide range of connected applications.\"]]],[1,\"blockquote\",[[0,[1],1,\"Example\"],[0,[],0,\": When someone new subscribes to a newsletter on a Ghost site (Trigger) then the contact information is automatically pushed into MailChimp (Action).\"]]],[1,\"p\",[[0,[1],1,\"Here are the most popular Ghost<>Zapier automation templates:\"],[0,[],0,\" \"]]],[10,0],[1,\"h1\",[[0,[],0,\"Editing your theme\"]]],[1,\"p\",[[0,[],0,\"One of the biggest advantages of using Ghost over centralised platforms is that you have total control over the front end of your site. Either customise your existing theme, or create a new theme from scratch with our \"],[0,[2],1,\"Theme SDK\"],[0,[],0,\". \"]]],[1,\"p\",[[0,[],0,\"You can integrate \"],[0,[3],1,\"any\"],[0,[],0,\" front end code into a Ghost theme without restriction, and it will work just fine. No restrictions!\"]]],[1,\"p\",[[0,[1],1,\"Here are some common examples\"],[0,[],0,\":\"]]],[3,\"ul\",[[[0,[],0,\"Include comments on a Ghost blog with \"],[0,[4],1,\"Disqus\"],[0,[],0,\" or \"],[0,[5],1,\"Discourse\"]],[[0,[],0,\"Implement \"],[0,[6],1,\"MathJAX\"],[0,[],0,\" with a little bit of JavaScript\"]],[[0,[],0,\"Add syntax highlighting to your code snippets using \"],[0,[7],1,\"Prism.js\"]],[[0,[],0,\"Integrate any dynamic forms from \"],[0,[8],1,\"Google\"],[0,[],0,\" or \"],[0,[9],1,\"Typeform\"],[0,[],0,\" to capture data\"]],[[0,[],0,\"Just about anything which uses JavaScript, APIs and Markup.\"]]]],[1,\"h1\",[[0,[],0,\"Using the Public API\"]]],[1,\"p\",[[0,[],0,\"Ghost itself is driven by a set of core APIs, and so you can access the Public Ghost JSON API from external webpages or applications in order to pull data and display it in other places.\"]]],[1,\"blockquote\",[[0,[],0,\"The Ghost API is \"],[0,[10],1,\"thoroughly documented\"],[0,[],0,\" and straightforward to work with for developers of almost any level. \"]]],[1,\"p\",[[0,[],0,\"Alright, the last post in our welcome-series! If you\'re curious about creating your own Ghost theme from scratch, here are \"],[0,[11],1,\"some more details\"],[0,[],0,\" on how that works.\"]]]]}','<p>There are three primary ways to work with third-party services in Ghost: using Zapier, editing your theme, or using the Ghost API.</p><h1 id=\"zapier\">Zapier</h1><p>You can connect your Ghost site to over 1,000 external services using the official integration with <a href=\"https://zapier.com\">Zapier</a>.</p><p>Zapier sets up automations with Triggers and Actions, which allows you to create and customise a wide range of connected applications.</p><blockquote><strong>Example</strong>: When someone new subscribes to a newsletter on a Ghost site (Trigger) then the contact information is automatically pushed into MailChimp (Action).</blockquote><p><strong>Here are the most popular Ghost&lt;&gt;Zapier automation templates:</strong> </p><!--kg-card-begin: markdown--><script src=\"https://zapier.com/apps/embed/widget.js?services=Ghost&container=true&limit=8\"></script>\n<!--kg-card-end: markdown--><h1 id=\"editing-your-theme\">Editing your theme</h1><p>One of the biggest advantages of using Ghost over centralised platforms is that you have total control over the front end of your site. Either customise your existing theme, or create a new theme from scratch with our <a href=\"https://docs.ghost.org/api/handlebars-themes/\">Theme SDK</a>. </p><p>You can integrate <em>any</em> front end code into a Ghost theme without restriction, and it will work just fine. No restrictions!</p><p><strong>Here are some common examples</strong>:</p><ul><li>Include comments on a Ghost blog with <a href=\"https://docs.ghost.org/integrations/disqus/\">Disqus</a> or <a href=\"https://docs.ghost.org/integrations/discourse/\">Discourse</a></li><li>Implement <a href=\"https://help.ghost.org/article/89-mathjax\">MathJAX</a> with a little bit of JavaScript</li><li>Add syntax highlighting to your code snippets using <a href=\"https://prismjs.com/\">Prism.js</a></li><li>Integrate any dynamic forms from <a href=\"https://www.google.com/forms/\">Google</a> or <a href=\"https://www.typeform.com/\">Typeform</a> to capture data</li><li>Just about anything which uses JavaScript, APIs and Markup.</li></ul><h1 id=\"using-the-public-api\">Using the Public API</h1><p>Ghost itself is driven by a set of core APIs, and so you can access the Public Ghost JSON API from external webpages or applications in order to pull data and display it in other places.</p><blockquote>The Ghost API is <a href=\"https://docs.ghost.org/api/\">thoroughly documented</a> and straightforward to work with for developers of almost any level. </blockquote><p>Alright, the last post in our welcome-series! If you\'re curious about creating your own Ghost theme from scratch, here are <a href=\"/themes/\">some more details</a> on how that works.</p>','5c8d2cd097618a61c6fa0be6','There are three primary ways to work with third-party services in Ghost: using\nZapier, editing your theme, or using the Ghost API.\n\nZapier\nYou can connect your Ghost site to over 1,000 external services using the\nofficial integration with Zapier [https://zapier.com].\n\nZapier sets up automations with Triggers and Actions, which allows you to create\nand customise a wide range of connected applications.\n\n> Example: When someone new subscribes to a newsletter on a Ghost site (Trigger)\nthen the contact information is automatically pushed into MailChimp (Action).\nHere are the most popular Ghost<>Zapier automation templates:  \n\nEditing your theme\nOne of the biggest advantages of using Ghost over centralised platforms is that\nyou have total control over the front end of your site. Either customise your\nexisting theme, or create a new theme from scratch with our Theme SDK\n[https://docs.ghost.org/api/handlebars-themes/]. \n\nYou can integrate any  front end code into a Ghost theme without restriction,\nand it will work just fine. No restrictions!\n\nHere are some common examples:\n\n * Include comments on a Ghost blog with Disqus\n   [https://docs.ghost.org/integrations/disqus/]  or Discourse\n   [https://docs.ghost.org/integrations/discourse/]\n * Implement MathJAX [https://help.ghost.org/article/89-mathjax]  with a little\n   bit of JavaScript\n * Add syntax highlighting to your code snippets using Prism.js\n   [https://prismjs.com/]\n * Integrate any dynamic forms from Google [https://www.google.com/forms/]  or \n   Typeform [https://www.typeform.com/]  to capture data\n * Just about anything which uses JavaScript, APIs and Markup.\n\nUsing the Public API\nGhost itself is driven by a set of core APIs, and so you can access the Public\nGhost JSON API from external webpages or applications in order to pull data and\ndisplay it in other places.\n\n> The Ghost API is thoroughly documented [https://docs.ghost.org/api/]  and\nstraightforward to work with for developers of almost any level. \nAlright, the last post in our welcome-series! If you\'re curious about creating\nyour own Ghost theme from scratch, here are some more details [/themes/]  on how\nthat works.','https://static.ghost.org/v2.0.0/images/app-integrations.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2019-03-16 17:05:20','1','2019-03-16 17:05:20','1','2019-03-16 17:05:21','1','There are three primary ways to work with third-party services in Ghost: using Zapier, editing your theme, or using the Ghost API.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5c8d2cd097618a61c6fa0be8','ed9dcda1-8172-4062-bbed-f98ef6aa8964','Organising your content','organising-content','{\"version\":\"0.3.1\",\"atoms\":[[\"soft-return\",\"\",{}]],\"cards\":[],\"markups\":[[\"strong\"],[\"code\"],[\"em\"],[\"a\",[\"href\",\"https://docs.ghost.org/api/handlebars-themes/\"]],[\"a\",[\"href\",\"http://yaml.org/spec/1.2/spec.html\",\"rel\",\"noreferrer nofollow noopener\"]],[\"a\",[\"href\",\"https://docs.ghost.org/concepts/routing/\"]],[\"a\",[\"href\",\"/apps-integrations/\"]]],\"sections\":[[1,\"p\",[[0,[],0,\"Ghost has a flexible organisational taxonomy called\"],[0,[0],1,\" tags\"],[0,[],0,\" which can be used to configure your site structure using \"],[0,[0],1,\"dynamic routing\"],[0,[],0,\". \"]]],[1,\"h1\",[[0,[],0,\"Basic Tagging\"]]],[1,\"p\",[[0,[],0,\"You can think of tags like Gmail labels. By tagging posts with one or more keyword, you can organise articles into buckets of related content.\"]]],[1,\"p\",[[0,[],0,\"When you create content for your publication you can assign tags to help differentiate between categories of content. \"]]],[1,\"p\",[[0,[],0,\"For example you may tag some content with  News and other content with Podcast, which would create two distinct categories of content listed on \"],[0,[1],1,\"/tag/news/\"],[0,[],0,\" and \"],[0,[1],1,\"/tag/weather/\"],[0,[],0,\", respectively.\"]]],[1,\"p\",[[0,[],0,\"If you tag a post with both \"],[0,[1],1,\"News\"],[0,[],0,\" \"],[0,[2],1,\"and\"],[0,[],0,\" \"],[0,[1],1,\"Weather\"],[0,[],0,\" - then it appears in both sections. Tag archives are like dedicated home-pages for each category of content that you have. They have their own pages, their own RSS feeds, and can support their own cover images and meta data.\"]]],[1,\"h1\",[[0,[],0,\"The primary tag\"]]],[1,\"p\",[[0,[],0,\"Inside the Ghost editor, you can drag and drop tags into a specific order. The first tag in the list is always given the most importance, and some themes will only display the primary tag (the first tag in the list) by default. \"]]],[1,\"blockquote\",[[0,[2,0],1,\"News\"],[0,[],1,\", Technology, Startup\"]]],[1,\"p\",[[0,[],0,\"So you can add the most important tag which you want to show up in your theme, but also add related tags which are less important.\"]]],[1,\"h1\",[[0,[],0,\"Private tags\"]]],[1,\"p\",[[0,[],0,\"Sometimes you may want to assign a post a specific tag, but you don\'t necessarily want that tag appearing in the theme or creating an archive page. In Ghost, hashtags are private and can be used for special styling.\"]]],[1,\"p\",[[0,[],0,\"For example, if you sometimes publish posts with video content - you might want your theme to adapt and get rid of the sidebar for these posts, to give more space for an embedded video to fill the screen. In this case, you could use private tags to tell your theme what to do.\"]]],[1,\"blockquote\",[[0,[2,0],1,\"News\"],[0,[],1,\", #video\"]]],[1,\"p\",[[0,[],0,\"Here, the theme would assign the post publicly displayed tags of News - but it would also keep a private record of the post being tagged with #video. In your theme, you could then look for private tags conditionally and give them special formatting. \"]]],[1,\"blockquote\",[[0,[2],0,\"You can find documentation for theme development techniques like this and many more over on Ghost\'s extensive \"],[0,[3],1,\"theme documentation\"],[0,[],1,\".\"]]],[1,\"h1\",[[0,[],0,\"Dynamic Routing\"]]],[1,\"p\",[[0,[],0,\"Dynamic routing gives you the ultimate freedom to build a custom publication to suit your needs. Routes are rules that map URL patterns to your content and templates. \"]]],[1,\"p\",[[0,[],0,\"For example, you may not want content tagged with \"],[0,[1],1,\"News\"],[0,[],0,\" to exist on: \"],[0,[1],1,\"example.com/tag/news\"],[0,[],0,\". Instead, you want it to exist on \"],[0,[1],1,\"example.com/news\"],[0,[],0,\" . \"]]],[1,\"p\",[[0,[],0,\"In this case you can use dynamic routes to create customised collections of content on your site. It\'s also possible to use multiple templates in your theme to render each content type differently.\"]]],[1,\"p\",[[0,[],0,\"There are lots of use cases for dynamic routing with Ghost, here are a few common examples: \"]]],[3,\"ul\",[[[0,[],0,\"Setting a custom home page with its own template\"]],[[0,[],0,\"Having separate content hubs for blog and podcast, that render differently, and have custom RSS feeds to support two types of content\"]],[[0,[],0,\"Creating a founders column as a unique view, by filtering content created by specific authors\"]],[[0,[],0,\"Including dates in permalinks for your posts\"]],[[0,[],0,\"Setting posts to have a URL relative to their primary tag like \"],[0,[1],1,\"example.com/europe/story-title/\"],[1,[],0,0]]]],[1,\"blockquote\",[[0,[2],0,\"Dynamic routing can be configured in Ghost using \"],[0,[4],1,\"YAML\"],[0,[],0,\" files. Read our dynamic routing \"],[0,[5],1,\"documentation\"],[0,[],1,\" for further details.\"]]],[1,\"p\",[[0,[],0,\"You can further customise your site using \"],[0,[6],1,\"Apps & Integrations\"],[0,[],0,\".\"]]]]}','<p>Ghost has a flexible organisational taxonomy called<strong> tags</strong> which can be used to configure your site structure using <strong>dynamic routing</strong>. </p><h1 id=\"basic-tagging\">Basic Tagging</h1><p>You can think of tags like Gmail labels. By tagging posts with one or more keyword, you can organise articles into buckets of related content.</p><p>When you create content for your publication you can assign tags to help differentiate between categories of content. </p><p>For example you may tag some content with  News and other content with Podcast, which would create two distinct categories of content listed on <code>/tag/news/</code> and <code>/tag/weather/</code>, respectively.</p><p>If you tag a post with both <code>News</code> <em>and</em> <code>Weather</code> - then it appears in both sections. Tag archives are like dedicated home-pages for each category of content that you have. They have their own pages, their own RSS feeds, and can support their own cover images and meta data.</p><h1 id=\"the-primary-tag\">The primary tag</h1><p>Inside the Ghost editor, you can drag and drop tags into a specific order. The first tag in the list is always given the most importance, and some themes will only display the primary tag (the first tag in the list) by default. </p><blockquote><em><strong>News</strong>, Technology, Startup</em></blockquote><p>So you can add the most important tag which you want to show up in your theme, but also add related tags which are less important.</p><h1 id=\"private-tags\">Private tags</h1><p>Sometimes you may want to assign a post a specific tag, but you don\'t necessarily want that tag appearing in the theme or creating an archive page. In Ghost, hashtags are private and can be used for special styling.</p><p>For example, if you sometimes publish posts with video content - you might want your theme to adapt and get rid of the sidebar for these posts, to give more space for an embedded video to fill the screen. In this case, you could use private tags to tell your theme what to do.</p><blockquote><em><strong>News</strong>, #video</em></blockquote><p>Here, the theme would assign the post publicly displayed tags of News - but it would also keep a private record of the post being tagged with #video. In your theme, you could then look for private tags conditionally and give them special formatting. </p><blockquote><em>You can find documentation for theme development techniques like this and many more over on Ghost\'s extensive <a href=\"https://docs.ghost.org/api/handlebars-themes/\">theme documentation</a>.</em></blockquote><h1 id=\"dynamic-routing\">Dynamic Routing</h1><p>Dynamic routing gives you the ultimate freedom to build a custom publication to suit your needs. Routes are rules that map URL patterns to your content and templates. </p><p>For example, you may not want content tagged with <code>News</code> to exist on: <code>example.com/tag/news</code>. Instead, you want it to exist on <code>example.com/news</code> . </p><p>In this case you can use dynamic routes to create customised collections of content on your site. It\'s also possible to use multiple templates in your theme to render each content type differently.</p><p>There are lots of use cases for dynamic routing with Ghost, here are a few common examples: </p><ul><li>Setting a custom home page with its own template</li><li>Having separate content hubs for blog and podcast, that render differently, and have custom RSS feeds to support two types of content</li><li>Creating a founders column as a unique view, by filtering content created by specific authors</li><li>Including dates in permalinks for your posts</li><li>Setting posts to have a URL relative to their primary tag like <code>example.com/europe/story-title/</code><br></li></ul><blockquote><em>Dynamic routing can be configured in Ghost using <a href=\"http://yaml.org/spec/1.2/spec.html\" rel=\"noreferrer nofollow noopener\">YAML</a> files. Read our dynamic routing <a href=\"https://docs.ghost.org/concepts/routing/\">documentation</a> for further details.</em></blockquote><p>You can further customise your site using <a href=\"/apps-integrations/\">Apps &amp; Integrations</a>.</p>','5c8d2cd097618a61c6fa0be8','Ghost has a flexible organisational taxonomy called  tags  which can be used to\nconfigure your site structure using dynamic routing. \n\nBasic Tagging\nYou can think of tags like Gmail labels. By tagging posts with one or more\nkeyword, you can organise articles into buckets of related content.\n\nWhen you create content for your publication you can assign tags to help\ndifferentiate between categories of content. \n\nFor example you may tag some content with  News and other content with Podcast,\nwhich would create two distinct categories of content listed on /tag/news/  and \n/tag/weather/, respectively.\n\nIf you tag a post with both News  and  Weather  - then it appears in both\nsections. Tag archives are like dedicated home-pages for each category of\ncontent that you have. They have their own pages, their own RSS feeds, and can\nsupport their own cover images and meta data.\n\nThe primary tag\nInside the Ghost editor, you can drag and drop tags into a specific order. The\nfirst tag in the list is always given the most importance, and some themes will\nonly display the primary tag (the first tag in the list) by default. \n\n> News, Technology, Startup\nSo you can add the most important tag which you want to show up in your theme,\nbut also add related tags which are less important.\n\nPrivate tags\nSometimes you may want to assign a post a specific tag, but you don\'t\nnecessarily want that tag appearing in the theme or creating an archive page. In\nGhost, hashtags are private and can be used for special styling.\n\nFor example, if you sometimes publish posts with video content - you might want\nyour theme to adapt and get rid of the sidebar for these posts, to give more\nspace for an embedded video to fill the screen. In this case, you could use\nprivate tags to tell your theme what to do.\n\n> News, #video\nHere, the theme would assign the post publicly displayed tags of News - but it\nwould also keep a private record of the post being tagged with #video. In your\ntheme, you could then look for private tags conditionally and give them special\nformatting. \n\n> You can find documentation for theme development techniques like this and many\nmore over on Ghost\'s extensive theme documentation\n[https://docs.ghost.org/api/handlebars-themes/].\nDynamic Routing\nDynamic routing gives you the ultimate freedom to build a custom publication to\nsuit your needs. Routes are rules that map URL patterns to your content and\ntemplates. \n\nFor example, you may not want content tagged with News  to exist on: \nexample.com/tag/news. Instead, you want it to exist on example.com/news  . \n\nIn this case you can use dynamic routes to create customised collections of\ncontent on your site. It\'s also possible to use multiple templates in your theme\nto render each content type differently.\n\nThere are lots of use cases for dynamic routing with Ghost, here are a few\ncommon examples: \n\n * Setting a custom home page with its own template\n * Having separate content hubs for blog and podcast, that render differently,\n   and have custom RSS feeds to support two types of content\n * Creating a founders column as a unique view, by filtering content created by\n   specific authors\n * Including dates in permalinks for your posts\n * Setting posts to have a URL relative to their primary tag like \n   example.com/europe/story-title/\n   \n\n> Dynamic routing can be configured in Ghost using YAML\n[http://yaml.org/spec/1.2/spec.html]  files. Read our dynamic routing \ndocumentation [https://docs.ghost.org/concepts/routing/]  for further details.\nYou can further customise your site using Apps & Integrations\n[/apps-integrations/].','https://static.ghost.org/v2.0.0/images/organising-your-content.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2019-03-16 17:05:20','1','2019-03-16 17:05:20','1','2019-03-16 17:05:22','1','Ghost has a flexible organisational taxonomy called tags which can be used to configure your site structure using dynamic routing.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5c8d2cd097618a61c6fa0bea','b142173f-bd65-46f2-83ec-f0ab4fe184da','Managing admin settings','admin-settings','{\"version\":\"0.3.1\",\"atoms\":[[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}]],\"cards\":[[\"image\",{\"src\":\"https://static.ghost.org/v1.0.0/images/private.png\"}],[\"hr\",{}]],\"markups\":[[\"a\",[\"href\",\"/ghost/settings/general/\"]],[\"em\"],[\"strong\"],[\"a\",[\"href\",\"https://ghost.org/pricing/\"]],[\"a\",[\"href\",\"/organising-content/\"]]],\"sections\":[[1,\"p\",[[0,[],0,\"There are a couple of things to do next while you\'re getting set up:\"]]],[1,\"h1\",[[0,[],0,\"Make your site private\"]]],[1,\"p\",[[0,[],0,\"If you\'ve got a publication that you don\'t want the world to see yet because it\'s not ready to launch, you can hide your Ghost site behind a basic shared pass-phrase.\"]]],[1,\"p\",[[0,[],0,\"You can toggle this preference on at the bottom of Ghost\'s \"],[0,[0],1,\"General Settings\"],[0,[],0,\":\"]]],[10,0],[1,\"p\",[[0,[],0,\"Ghost will give you a short, randomly generated pass-phrase which you can share with anyone who needs access to the site while you\'re working on it. While this setting is enabled, all search engine optimisation features will be switched off to help keep your site under the radar.\"]]],[1,\"p\",[[0,[],0,\"Do remember though, this is \"],[0,[1],1,\"not\"],[0,[],0,\" secure authentication. You shouldn\'t rely on this feature for protecting important private data. It\'s just a simple, shared pass-phrase for some very basic privacy.\"]]],[10,1],[1,\"h1\",[[0,[],0,\"Invite your team \"]]],[1,\"p\",[[0,[],0,\"Ghost has a number of different user roles for your team:\"]]],[1,\"p\",[[0,[2],1,\"Contributors\"],[1,[],0,0],[0,[],0,\"This is the base user level in Ghost. Contributors can create and edit their own draft posts, but they are unable to edit drafts of others or publish posts. Contributors are \"],[0,[2],1,\"untrusted\"],[0,[],0,\" users with the most basic access to your publication.\"]]],[1,\"p\",[[0,[2],1,\"Authors\"],[1,[],0,1],[0,[],0,\"Authors are the 2nd user level in Ghost. Authors can write, edit  and publish their own posts. Authors are \"],[0,[2],1,\"trusted\"],[0,[],0,\" users. If you don\'t trust users to be allowed to publish their own posts, they should be set as Contributors.\"]]],[1,\"p\",[[0,[2],1,\"Editors\"],[1,[],0,2],[0,[],0,\"Editors are the 3rd user level in Ghost. Editors can do everything that an Author can do, but they can also edit and publish the posts of others - as well as their own. Editors can also invite new Contributors+Authors to the site.\"]]],[1,\"p\",[[0,[2],1,\"Administrators\"],[1,[],0,3],[0,[],0,\"The top user level in Ghost is Administrator. Again, administrators can do everything that Authors and Editors can do, but they can also edit all site settings and data, not just content. Additionally, administrators have full access to invite, manage or remove any other user of the site.\"],[1,[],0,4],[1,[],0,5],[0,[2],1,\"The Owner\"],[1,[],0,6],[0,[],0,\"There is only ever one owner of a Ghost site. The owner is a special user which has all the same permissions as an Administrator, but with two exceptions: The Owner can never be deleted. And in some circumstances the owner will have access to additional special settings if applicable. For example: billing details, if using \"],[0,[3,2],2,\"Ghost(Pro)\"],[0,[],0,\".\"]]],[1,\"blockquote\",[[0,[1],1,\"It\'s a good idea to ask all of your users to fill out their user profiles, including bio and social links. These will populate rich structured data for posts and generally create more opportunities for themes to fully populate their design.\"]]],[1,\"p\",[[0,[],0,\"Next up: \"],[0,[4],1,\"Organising your content\"],[0,[],0,\" \"]]]]}','<p>There are a couple of things to do next while you\'re getting set up:</p><h1 id=\"make-your-site-private\">Make your site private</h1><p>If you\'ve got a publication that you don\'t want the world to see yet because it\'s not ready to launch, you can hide your Ghost site behind a basic shared pass-phrase.</p><p>You can toggle this preference on at the bottom of Ghost\'s <a href=\"/ghost/settings/general/\">General Settings</a>:</p><!--kg-card-begin: image--><figure class=\"kg-card kg-image-card\"><img src=\"https://static.ghost.org/v1.0.0/images/private.png\" class=\"kg-image\"></figure><!--kg-card-end: image--><p>Ghost will give you a short, randomly generated pass-phrase which you can share with anyone who needs access to the site while you\'re working on it. While this setting is enabled, all search engine optimisation features will be switched off to help keep your site under the radar.</p><p>Do remember though, this is <em>not</em> secure authentication. You shouldn\'t rely on this feature for protecting important private data. It\'s just a simple, shared pass-phrase for some very basic privacy.</p><!--kg-card-begin: hr--><hr><!--kg-card-end: hr--><h1 id=\"invite-your-team\">Invite your team </h1><p>Ghost has a number of different user roles for your team:</p><p><strong>Contributors</strong><br>This is the base user level in Ghost. Contributors can create and edit their own draft posts, but they are unable to edit drafts of others or publish posts. Contributors are <strong>untrusted</strong> users with the most basic access to your publication.</p><p><strong>Authors</strong><br>Authors are the 2nd user level in Ghost. Authors can write, edit  and publish their own posts. Authors are <strong>trusted</strong> users. If you don\'t trust users to be allowed to publish their own posts, they should be set as Contributors.</p><p><strong>Editors</strong><br>Editors are the 3rd user level in Ghost. Editors can do everything that an Author can do, but they can also edit and publish the posts of others - as well as their own. Editors can also invite new Contributors+Authors to the site.</p><p><strong>Administrators</strong><br>The top user level in Ghost is Administrator. Again, administrators can do everything that Authors and Editors can do, but they can also edit all site settings and data, not just content. Additionally, administrators have full access to invite, manage or remove any other user of the site.<br><br><strong>The Owner</strong><br>There is only ever one owner of a Ghost site. The owner is a special user which has all the same permissions as an Administrator, but with two exceptions: The Owner can never be deleted. And in some circumstances the owner will have access to additional special settings if applicable. For example: billing details, if using <a href=\"https://ghost.org/pricing/\"><strong>Ghost(Pro)</strong></a>.</p><blockquote><em>It\'s a good idea to ask all of your users to fill out their user profiles, including bio and social links. These will populate rich structured data for posts and generally create more opportunities for themes to fully populate their design.</em></blockquote><p>Next up: <a href=\"/organising-content/\">Organising your content</a> </p>','5c8d2cd097618a61c6fa0bea','There are a couple of things to do next while you\'re getting set up:\n\nMake your site private\nIf you\'ve got a publication that you don\'t want the world to see yet because\nit\'s not ready to launch, you can hide your Ghost site behind a basic shared\npass-phrase.\n\nYou can toggle this preference on at the bottom of Ghost\'s General Settings\n[/ghost/settings/general/]:\n\nGhost will give you a short, randomly generated pass-phrase which you can share\nwith anyone who needs access to the site while you\'re working on it. While this\nsetting is enabled, all search engine optimisation features will be switched off\nto help keep your site under the radar.\n\nDo remember though, this is not  secure authentication. You shouldn\'t rely on\nthis feature for protecting important private data. It\'s just a simple, shared\npass-phrase for some very basic privacy.\n\n\n--------------------------------------------------------------------------------\n\nInvite your team \nGhost has a number of different user roles for your team:\n\nContributors\nThis is the base user level in Ghost. Contributors can create and edit their own\ndraft posts, but they are unable to edit drafts of others or publish posts.\nContributors are untrusted  users with the most basic access to your\npublication.\n\nAuthors\nAuthors are the 2nd user level in Ghost. Authors can write, edit  and publish\ntheir own posts. Authors are trusted  users. If you don\'t trust users to be\nallowed to publish their own posts, they should be set as Contributors.\n\nEditors\nEditors are the 3rd user level in Ghost. Editors can do everything that an\nAuthor can do, but they can also edit and publish the posts of others - as well\nas their own. Editors can also invite new Contributors+Authors to the site.\n\nAdministrators\nThe top user level in Ghost is Administrator. Again, administrators can do\neverything that Authors and Editors can do, but they can also edit all site\nsettings and data, not just content. Additionally, administrators have full\naccess to invite, manage or remove any other user of the site.\n\nThe Owner\nThere is only ever one owner of a Ghost site. The owner is a special user which\nhas all the same permissions as an Administrator, but with two exceptions: The\nOwner can never be deleted. And in some circumstances the owner will have access\nto additional special settings if applicable. For example: billing details, if\nusing Ghost(Pro) [https://ghost.org/pricing/].\n\n> It\'s a good idea to ask all of your users to fill out their user profiles,\nincluding bio and social links. These will populate rich structured data for\nposts and generally create more opportunities for themes to fully populate their\ndesign.\nNext up: Organising your content [/organising-content/]','https://static.ghost.org/v2.0.0/images/admin-settings.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2019-03-16 17:05:20','1','2019-03-16 17:05:20','1','2019-03-16 17:05:23','1','There are a couple of things to do next while you\'re getting set up: making your site private and inviting your team.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5c8d2cd097618a61c6fa0bec','78865945-9f87-4ddf-af89-d38b739825b4','Publishing options','publishing-options','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[[\"code\",{\"code\":\"{\\n    \\\"@context\\\": \\\"https://schema.org\\\",\\n    \\\"@type\\\": \\\"Article\\\",\\n    \\\"publisher\\\": {\\n        \\\"@type\\\": \\\"Organization\\\",\\n        \\\"name\\\": \\\"Publishing options\\\",\\n        \\\"logo\\\": \\\"https://static.ghost.org/ghost-logo.svg\\\"\\n    },\\n    \\\"author\\\": {\\n        \\\"@type\\\": \\\"Person\\\",\\n        \\\"name\\\": \\\"Ghost\\\",\\n        \\\"url\\\": \\\"http://demo.ghost.io/author/ghost/\\\",\\n        \\\"sameAs\\\": []\\n    },\\n    \\\"headline\\\": \\\"Publishing options\\\",\\n    \\\"url\\\": \\\"http://demo.ghost.io/publishing-options\\\",\\n    \\\"datePublished\\\": \\\"2018-08-08T11:44:00.000Z\\\",\\n    \\\"dateModified\\\": \\\"2018-08-09T12:06:21.000Z\\\",\\n    \\\"keywords\\\": \\\"Getting Started\\\",\\n    \\\"description\\\": \\\"The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page.\\\",\\n    }\\n}\\n    \"}]],\"markups\":[[\"a\",[\"href\",\"https://schema.org/\"]],[\"a\",[\"href\",\"https://search.google.com/structured-data/testing-tool\",\"rel\",\"noreferrer nofollow noopener\"]],[\"strong\"],[\"a\",[\"href\",\"/ghost/settings/code-injection/\"]],[\"a\",[\"href\",\"/admin-settings/\"]]],\"sections\":[[1,\"p\",[[0,[],0,\"The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page. \"]]],[1,\"blockquote\",[[0,[],0,\"Access the post settings menu in the top right hand corner of the editor. \"]]],[1,\"h2\",[[0,[],0,\"Post feature image\"]]],[1,\"p\",[[0,[],0,\"Insert your post feature image from the very top of the post settings menu. Consider resizing or optimising your image first to ensure it\'s an appropriate size.\"]]],[1,\"h2\",[[0,[],0,\"Structured data & SEO\"]]],[1,\"p\",[[0,[],0,\"Customise your social media sharing cards for Facebook and Twitter, enabling you to add custom images, titles and descriptions for social media.\"]]],[1,\"p\",[[0,[],0,\"There’s no need to hard code your meta data. You can set your meta title and description using the post settings tool, which has a handy character guide and SERP preview. \"]]],[1,\"p\",[[0,[],0,\"Ghost will automatically implement structured data for your publication using JSON-LD to further optimise your content.\"]]],[10,0],[1,\"p\",[[0,[],0,\"You can test that the structured data \"],[0,[0],1,\"schema\"],[0,[],0,\" on your site is working as it should using \"],[0,[1],1,\"Google’s structured data tool\"],[0,[],0,\". \"]]],[1,\"h2\",[[0,[],0,\"Code Injection\"]]],[1,\"p\",[[0,[],0,\"This tool allows you to inject code on a per post or page basis, or across your entire site. This means you can modify CSS, add unique tracking codes, or add other scripts to the head or foot of your publication without making edits to your theme files. \"]]],[1,\"p\",[[0,[2],1,\"To add code site-wide\"],[0,[],0,\", use the code injection tool \"],[0,[3],1,\"in the main admin menu\"],[0,[],0,\". This is useful for adding a Facebook Pixel, a Google Analytics tracking code, or to start tracking with any other analytics tool.\"]]],[1,\"p\",[[0,[2],1,\"To add code to a post or page\"],[0,[],0,\", use the code injection tool within the post settings menu. This is useful if you want to add art direction, scripts or styles that are only applicable to one post or page. \"]]],[1,\"p\",[[0,[],0,\"From here, you might be interested in managing some more specific \"],[0,[4],1,\"admin settings\"],[0,[],0,\"!\"]]]]}','<p>The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page. </p><blockquote>Access the post settings menu in the top right hand corner of the editor. </blockquote><h2 id=\"post-feature-image\">Post feature image</h2><p>Insert your post feature image from the very top of the post settings menu. Consider resizing or optimising your image first to ensure it\'s an appropriate size.</p><h2 id=\"structured-data-seo\">Structured data &amp; SEO</h2><p>Customise your social media sharing cards for Facebook and Twitter, enabling you to add custom images, titles and descriptions for social media.</p><p>There’s no need to hard code your meta data. You can set your meta title and description using the post settings tool, which has a handy character guide and SERP preview. </p><p>Ghost will automatically implement structured data for your publication using JSON-LD to further optimise your content.</p><!--kg-card-begin: code--><pre><code>{\n    \"@context\": \"https://schema.org\",\n    \"@type\": \"Article\",\n    \"publisher\": {\n        \"@type\": \"Organization\",\n        \"name\": \"Publishing options\",\n        \"logo\": \"https://static.ghost.org/ghost-logo.svg\"\n    },\n    \"author\": {\n        \"@type\": \"Person\",\n        \"name\": \"Ghost\",\n        \"url\": \"http://demo.ghost.io/author/ghost/\",\n        \"sameAs\": []\n    },\n    \"headline\": \"Publishing options\",\n    \"url\": \"http://demo.ghost.io/publishing-options\",\n    \"datePublished\": \"2018-08-08T11:44:00.000Z\",\n    \"dateModified\": \"2018-08-09T12:06:21.000Z\",\n    \"keywords\": \"Getting Started\",\n    \"description\": \"The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page.\",\n    }\n}\n    </code></pre><!--kg-card-end: code--><p>You can test that the structured data <a href=\"https://schema.org/\">schema</a> on your site is working as it should using <a href=\"https://search.google.com/structured-data/testing-tool\" rel=\"noreferrer nofollow noopener\">Google’s structured data tool</a>. </p><h2 id=\"code-injection\">Code Injection</h2><p>This tool allows you to inject code on a per post or page basis, or across your entire site. This means you can modify CSS, add unique tracking codes, or add other scripts to the head or foot of your publication without making edits to your theme files. </p><p><strong>To add code site-wide</strong>, use the code injection tool <a href=\"/ghost/settings/code-injection/\">in the main admin menu</a>. This is useful for adding a Facebook Pixel, a Google Analytics tracking code, or to start tracking with any other analytics tool.</p><p><strong>To add code to a post or page</strong>, use the code injection tool within the post settings menu. This is useful if you want to add art direction, scripts or styles that are only applicable to one post or page. </p><p>From here, you might be interested in managing some more specific <a href=\"/admin-settings/\">admin settings</a>!</p>','5c8d2cd097618a61c6fa0bec','The Ghost editor has everything you need to fully optimise your content. This is\nwhere you can add tags and authors, feature a post, or turn a post into a page. \n\n> Access the post settings menu in the top right hand corner of the editor. \nPost feature image\nInsert your post feature image from the very top of the post settings menu.\nConsider resizing or optimising your image first to ensure it\'s an appropriate\nsize.\n\nStructured data & SEO\nCustomise your social media sharing cards for Facebook and Twitter, enabling you\nto add custom images, titles and descriptions for social media.\n\nThere’s no need to hard code your meta data. You can set your meta title and\ndescription using the post settings tool, which has a handy character guide and\nSERP preview. \n\nGhost will automatically implement structured data for your publication using\nJSON-LD to further optimise your content.\n\n{\n    \"@context\": \"https://schema.org\",\n    \"@type\": \"Article\",\n    \"publisher\": {\n        \"@type\": \"Organization\",\n        \"name\": \"Publishing options\",\n        \"logo\": \"https://static.ghost.org/ghost-logo.svg\"\n    },\n    \"author\": {\n        \"@type\": \"Person\",\n        \"name\": \"Ghost\",\n        \"url\": \"http://demo.ghost.io/author/ghost/\",\n        \"sameAs\": []\n    },\n    \"headline\": \"Publishing options\",\n    \"url\": \"http://demo.ghost.io/publishing-options\",\n    \"datePublished\": \"2018-08-08T11:44:00.000Z\",\n    \"dateModified\": \"2018-08-09T12:06:21.000Z\",\n    \"keywords\": \"Getting Started\",\n    \"description\": \"The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page.\",\n    }\n}\n    \n\nYou can test that the structured data schema [https://schema.org/]  on your site\nis working as it should using Google’s structured data tool\n[https://search.google.com/structured-data/testing-tool]. \n\nCode Injection\nThis tool allows you to inject code on a per post or page basis, or across your\nentire site. This means you can modify CSS, add unique tracking codes, or add\nother scripts to the head or foot of your publication without making edits to\nyour theme files. \n\nTo add code site-wide, use the code injection tool in the main admin menu\n[/ghost/settings/code-injection/]. This is useful for adding a Facebook Pixel, a\nGoogle Analytics tracking code, or to start tracking with any other analytics\ntool.\n\nTo add code to a post or page, use the code injection tool within the post\nsettings menu. This is useful if you want to add art direction, scripts or\nstyles that are only applicable to one post or page. \n\nFrom here, you might be interested in managing some more specific admin settings\n[/admin-settings/]!','https://static.ghost.org/v2.0.0/images/publishing-options.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2019-03-16 17:05:20','1','2019-03-16 17:05:20','1','2019-03-16 17:05:24','1','The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5c8d2cd197618a61c6fa0bee','a03977e1-d40c-4229-9496-81526e170d1e','Writing posts with Ghost ✍️','the-editor','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[[\"image\",{\"src\":\"https://static.ghost.org/v2.0.0/images/formatting-editor-demo.gif\"}],[\"code\",{\"code\":\"<header class=\\\"site-header outer\\\">\\n    <div class=\\\"inner\\\">\\n        {{> \\\"site-nav\\\"}}\\n    </div>\\n</header>\"}],[\"image\",{\"src\":\"https://static.ghost.org/v2.0.0/images/using-images-demo.gif\"}]],\"markups\":[[\"strong\"],[\"code\"],[\"a\",[\"href\",\"/publishing-options/\"]]],\"sections\":[[1,\"p\",[[0,[],0,\"Ghost has a powerful visual editor with familiar formatting options, as well as the ability to seamlessly add dynamic content. \"]]],[1,\"p\",[[0,[],0,\"Select the text to add formatting, headers or create links, or use Markdown shortcuts to do the work for you - if that\'s your thing. \"]]],[10,0],[1,\"h2\",[[0,[],0,\"Rich editing at your fingertips\"]]],[1,\"p\",[[0,[],0,\"The editor can also handle rich media objects, called \"],[0,[0],1,\"cards\"],[0,[],0,\". \"]]],[1,\"p\",[[0,[],0,\"You can insert a card either by clicking the  \"],[0,[1],1,\"+\"],[0,[],0,\"  button on a new line, or typing  \"],[0,[1],1,\"/\"],[0,[],0,\"  on a new line to search for a particular card. This allows you to efficiently insert\"],[0,[0],1,\" images\"],[0,[],0,\", \"],[0,[0],1,\"markdown\"],[0,[],0,\", \"],[0,[0],1,\"html\"],[0,[],0,\" and \"],[0,[0],1,\"embeds\"],[0,[],0,\".\"]]],[1,\"p\",[[0,[0],1,\"For Example\"],[0,[],0,\":\"]]],[3,\"ul\",[[[0,[],0,\"Insert a video from YouTube directly into your content by pasting the URL \"]],[[0,[],0,\"Create unique content like a button or content opt-in using the HTML card\"]],[[0,[],0,\"Need to share some code? Embed code blocks directly \"]]]],[10,1],[1,\"h1\",[[0,[],0,\"Working with images in posts\"]]],[1,\"p\",[[0,[],0,\"You can add images to your posts in many ways:\"]]],[3,\"ul\",[[[0,[],0,\"Upload from your computer\"]],[[0,[],0,\"Click and drag an image into the browser\"]],[[0,[],0,\"Paste directly into the editor from your clipboard\"]],[[0,[],0,\"Insert using a URL\"]]]],[1,\"p\",[[0,[],0,\"Once inserted you can blend images beautifully into your content at different sizes and add captions wherever needed.\"]]],[10,2],[1,\"p\",[[0,[],0,\"The post settings menu and publishing options can be found in the top right hand corner. For more advanced tips on post settings check out the \"],[0,[2],1,\"publishing options\"],[0,[],0,\" post!\"]]],[1,\"p\",[]]]}','<p>Ghost has a powerful visual editor with familiar formatting options, as well as the ability to seamlessly add dynamic content. </p><p>Select the text to add formatting, headers or create links, or use Markdown shortcuts to do the work for you - if that\'s your thing. </p><!--kg-card-begin: image--><figure class=\"kg-card kg-image-card\"><img src=\"https://static.ghost.org/v2.0.0/images/formatting-editor-demo.gif\" class=\"kg-image\"></figure><!--kg-card-end: image--><h2 id=\"rich-editing-at-your-fingertips\">Rich editing at your fingertips</h2><p>The editor can also handle rich media objects, called <strong>cards</strong>. </p><p>You can insert a card either by clicking the  <code>+</code>  button on a new line, or typing  <code>/</code>  on a new line to search for a particular card. This allows you to efficiently insert<strong> images</strong>, <strong>markdown</strong>, <strong>html</strong> and <strong>embeds</strong>.</p><p><strong>For Example</strong>:</p><ul><li>Insert a video from YouTube directly into your content by pasting the URL </li><li>Create unique content like a button or content opt-in using the HTML card</li><li>Need to share some code? Embed code blocks directly </li></ul><!--kg-card-begin: code--><pre><code>&lt;header class=\"site-header outer\"&gt;\n    &lt;div class=\"inner\"&gt;\n        {{&gt; \"site-nav\"}}\n    &lt;/div&gt;\n&lt;/header&gt;</code></pre><!--kg-card-end: code--><h1 id=\"working-with-images-in-posts\">Working with images in posts</h1><p>You can add images to your posts in many ways:</p><ul><li>Upload from your computer</li><li>Click and drag an image into the browser</li><li>Paste directly into the editor from your clipboard</li><li>Insert using a URL</li></ul><p>Once inserted you can blend images beautifully into your content at different sizes and add captions wherever needed.</p><!--kg-card-begin: image--><figure class=\"kg-card kg-image-card\"><img src=\"https://static.ghost.org/v2.0.0/images/using-images-demo.gif\" class=\"kg-image\"></figure><!--kg-card-end: image--><p>The post settings menu and publishing options can be found in the top right hand corner. For more advanced tips on post settings check out the <a href=\"/publishing-options/\">publishing options</a> post!</p>','5c8d2cd197618a61c6fa0bee','Ghost has a powerful visual editor with familiar formatting options, as well as\nthe ability to seamlessly add dynamic content. \n\nSelect the text to add formatting, headers or create links, or use Markdown\nshortcuts to do the work for you - if that\'s your thing. \n\nRich editing at your fingertips\nThe editor can also handle rich media objects, called cards. \n\nYou can insert a card either by clicking the+   button on a new line, or typing/ \n  on a new line to search for a particular card. This allows you to efficiently\ninsert  images, markdown, html  and embeds.\n\nFor Example:\n\n * Insert a video from YouTube directly into your content by pasting the URL \n * Create unique content like a button or content opt-in using the HTML card\n * Need to share some code? Embed code blocks directly \n\n<header class=\"site-header outer\">\n    <div class=\"inner\">\n        {{> \"site-nav\"}}\n    </div>\n</header>\n\nWorking with images in posts\nYou can add images to your posts in many ways:\n\n * Upload from your computer\n * Click and drag an image into the browser\n * Paste directly into the editor from your clipboard\n * Insert using a URL\n\nOnce inserted you can blend images beautifully into your content at different\nsizes and add captions wherever needed.\n\nThe post settings menu and publishing options can be found in the top right hand\ncorner. For more advanced tips on post settings check out the publishing options\n[/publishing-options/]  post!','https://static.ghost.org/v2.0.0/images/writing-posts-with-ghost.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2019-03-16 17:05:21','1','2019-03-16 17:05:21','1','2019-03-16 17:05:25','1','Getting started with the editor is simple, with familiar formatting options in a functional toolbar and the ability to add dynamic content seamlessly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5c8d2cd197618a61c6fa0bf0','8881e22d-59ce-4cca-8902-47b376eae808','Welcome to Ghost','welcome','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[],\"markups\":[[\"strong\"],[\"a\",[\"href\",\"https://ghost.org/downloads/\"]],[\"a\",[\"href\",\"https://ghost.org/pricing\"]],[\"a\",[\"href\",\"https://github.com/TryGhost\"]],[\"a\",[\"href\",\"/the-editor/\"]],[\"em\"]],\"sections\":[[1,\"p\",[[0,[],0,\"👋 Welcome, it\'s great to have you here.\"]]],[1,\"p\",[[0,[],0,\"We know that first impressions are important, so we\'ve populated your new site with some initial \"],[0,[0],1,\"getting started\"],[0,[],0,\" posts that will help you get familiar with everything in no time. This is the first one!\"]]],[1,\"p\",[[0,[0],1,\"A few things you should know upfront\"],[0,[],0,\":\"]]],[3,\"ol\",[[[0,[],0,\"Ghost is designed for ambitious, professional publishers who want to actively build a business around their content. That\'s who it works best for. \"]],[[0,[],0,\"The entire platform can be modified and customised to suit your needs. It\'s very powerful, but does require some knowledge of code. Ghost is not necessarily a good platform for beginners or people who just want a simple personal blog. \"]],[[0,[],0,\"For the best experience we recommend downloading the \"],[0,[1],1,\"Ghost Desktop App\"],[0,[],0,\" for your computer, which is the best way to access your Ghost site on a desktop device. \"]]]],[1,\"p\",[[0,[],0,\"Ghost is made by an independent non-profit organisation called the Ghost Foundation. We are 100% self funded by revenue from our \"],[0,[2],1,\"Ghost(Pro)\"],[0,[],0,\" service, and every penny we make is re-invested into funding further development of free, open source technology for modern publishing.\"]]],[1,\"p\",[[0,[],0,\"The version of Ghost you are looking at right now would not have been made possible without generous contributions from the open source \"],[0,[3],1,\"community\"],[0,[],0,\".\"]]],[1,\"h2\",[[0,[],0,\"Next up, the editor\"]]],[1,\"p\",[[0,[],0,\"The main thing you\'ll want to read about next is probably: \"],[0,[4],1,\"the Ghost editor\"],[0,[],0,\". This is where the good stuff happens.\"]]],[1,\"blockquote\",[[0,[5],0,\"By the way, once you\'re done reading, you can simply delete the default \"],[0,[0],1,\"Ghost\"],[0,[],1,\" user from your team to remove all of these introductory posts! \"]]]]}','<p>👋 Welcome, it\'s great to have you here.</p><p>We know that first impressions are important, so we\'ve populated your new site with some initial <strong>getting started</strong> posts that will help you get familiar with everything in no time. This is the first one!</p><p><strong>A few things you should know upfront</strong>:</p><ol><li>Ghost is designed for ambitious, professional publishers who want to actively build a business around their content. That\'s who it works best for. </li><li>The entire platform can be modified and customised to suit your needs. It\'s very powerful, but does require some knowledge of code. Ghost is not necessarily a good platform for beginners or people who just want a simple personal blog. </li><li>For the best experience we recommend downloading the <a href=\"https://ghost.org/downloads/\">Ghost Desktop App</a> for your computer, which is the best way to access your Ghost site on a desktop device. </li></ol><p>Ghost is made by an independent non-profit organisation called the Ghost Foundation. We are 100% self funded by revenue from our <a href=\"https://ghost.org/pricing\">Ghost(Pro)</a> service, and every penny we make is re-invested into funding further development of free, open source technology for modern publishing.</p><p>The version of Ghost you are looking at right now would not have been made possible without generous contributions from the open source <a href=\"https://github.com/TryGhost\">community</a>.</p><h2 id=\"next-up-the-editor\">Next up, the editor</h2><p>The main thing you\'ll want to read about next is probably: <a href=\"/the-editor/\">the Ghost editor</a>. This is where the good stuff happens.</p><blockquote><em>By the way, once you\'re done reading, you can simply delete the default <strong>Ghost</strong> user from your team to remove all of these introductory posts! </em></blockquote>','5c8d2cd197618a61c6fa0bf0','👋 Welcome, it\'s great to have you here.\n\nWe know that first impressions are important, so we\'ve populated your new site\nwith some initial getting started  posts that will help you get familiar with\neverything in no time. This is the first one!\n\nA few things you should know upfront:\n\n 1. Ghost is designed for ambitious, professional publishers who want to\n    actively build a business around their content. That\'s who it works best\n    for. \n 2. The entire platform can be modified and customised to suit your needs. It\'s\n    very powerful, but does require some knowledge of code. Ghost is not\n    necessarily a good platform for beginners or people who just want a simple\n    personal blog. \n 3. For the best experience we recommend downloading the Ghost Desktop App\n    [https://ghost.org/downloads/]  for your computer, which is the best way to\n    access your Ghost site on a desktop device. \n\nGhost is made by an independent non-profit organisation called the Ghost\nFoundation. We are 100% self funded by revenue from our Ghost(Pro)\n[https://ghost.org/pricing]  service, and every penny we make is re-invested\ninto funding further development of free, open source technology for modern\npublishing.\n\nThe version of Ghost you are looking at right now would not have been made\npossible without generous contributions from the open source community\n[https://github.com/TryGhost].\n\nNext up, the editor\nThe main thing you\'ll want to read about next is probably: the Ghost editor\n[/the-editor/]. This is where the good stuff happens.\n\n> By the way, once you\'re done reading, you can simply delete the default Ghost \nuser from your team to remove all of these introductory posts!','https://s3.eu-central-1.amazonaws.com/ghst/ghost-demo/2019/03/5c52264a06636.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2019-03-16 17:05:21','1','2019-03-18 09:38:03','1','2019-03-16 17:05:26','1','Welcome, it\'s great to have you here.\nWe know that first impressions are important, so we\'ve populated your new site with some initial getting started posts that will help you get familiar with everything in no time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_authors`
--

DROP TABLE IF EXISTS `posts_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_authors` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `author_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `posts_authors_post_id_foreign` (`post_id`),
  KEY `posts_authors_author_id_foreign` (`author_id`),
  CONSTRAINT `posts_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_authors_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_authors`
--

LOCK TABLES `posts_authors` WRITE;
/*!40000 ALTER TABLE `posts_authors` DISABLE KEYS */;
INSERT INTO `posts_authors` VALUES ('5c8d2cd097618a61c6fa0be5','5c8d2cd097618a61c6fa0be4','5951f5fca366002ebd5dbef7',0),('5c8d2cd097618a61c6fa0be7','5c8d2cd097618a61c6fa0be6','5951f5fca366002ebd5dbef7',0),('5c8d2cd097618a61c6fa0be9','5c8d2cd097618a61c6fa0be8','5951f5fca366002ebd5dbef7',0),('5c8d2cd097618a61c6fa0beb','5c8d2cd097618a61c6fa0bea','5951f5fca366002ebd5dbef7',0),('5c8d2cd097618a61c6fa0bed','5c8d2cd097618a61c6fa0bec','5951f5fca366002ebd5dbef7',0),('5c8d2cd197618a61c6fa0bef','5c8d2cd197618a61c6fa0bee','5951f5fca366002ebd5dbef7',0),('5c8d2cd197618a61c6fa0bf1','5c8d2cd197618a61c6fa0bf0','5951f5fca366002ebd5dbef7',0);
/*!40000 ALTER TABLE `posts_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `tag_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES ('5c8d2cd397618a61c6fa0cae','5c8d2cd097618a61c6fa0be4','5c8d2ccd97618a61c6fa0b92',0),('5c8d2cd397618a61c6fa0caf','5c8d2cd097618a61c6fa0be6','5c8d2ccd97618a61c6fa0b92',0),('5c8d2cd397618a61c6fa0cb0','5c8d2cd097618a61c6fa0be8','5c8d2ccd97618a61c6fa0b92',0),('5c8d2cd397618a61c6fa0cb1','5c8d2cd097618a61c6fa0bea','5c8d2ccd97618a61c6fa0b92',0),('5c8d2cd397618a61c6fa0cb2','5c8d2cd097618a61c6fa0bec','5c8d2ccd97618a61c6fa0b92',0),('5c8d2cd397618a61c6fa0cb3','5c8d2cd197618a61c6fa0bee','5c8d2ccd97618a61c6fa0b92',0),('5c8d2cd397618a61c6fa0cb4','5c8d2cd197618a61c6fa0bf0','5c8d2ccd97618a61c6fa0b92',0);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refreshtokens`
--

DROP TABLE IF EXISTS `refreshtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refreshtokens` (
  `id` varchar(24) NOT NULL,
  `token` varchar(191) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refreshtokens_token_unique` (`token`),
  KEY `refreshtokens_user_id_foreign` (`user_id`),
  KEY `refreshtokens_client_id_foreign` (`client_id`),
  CONSTRAINT `refreshtokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `refreshtokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refreshtokens`
--

LOCK TABLES `refreshtokens` WRITE;
/*!40000 ALTER TABLE `refreshtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `refreshtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('5c8d2ccd97618a61c6fa0b97','Administrator','Administrators','2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b98','Editor','Editors','2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b99','Author','Authors','2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b9a','Contributor','Contributors','2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b9b','Owner','Blog Owner','2019-03-16 17:05:17','1','2019-03-16 17:05:17','1'),('5c8d2ccd97618a61c6fa0b9c','Admin Integration','External Apps','2019-03-16 17:05:17','1','2019-03-16 17:05:17','1');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES ('5c8d2cd097618a61c6fa0be3','5c8d2ccd97618a61c6fa0b99','5951f5fca366002ebd5dbef7'),('5c8d2cd397618a61c6fa0cb5','5c8d2ccd97618a61c6fa0b9b','1');
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(24) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `session_data` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessions_session_id_unique` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('5c8d34d8c7d5d2747a9951e5','cNF3gE1OqXJPY0TR2rAeT26l3LfRFrpM','1','{\"cookie\":{\"originalMaxAge\":15768000000,\"expires\":\"2019-09-15T05:39:36.908Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/ghost\",\"sameSite\":\"lax\"},\"user_id\":\"1\",\"origin\":\"http://localhost:2300\",\"user_agent\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36\",\"ip\":\"127.0.0.1\"}','2019-03-16 17:39:36','2019-03-16 17:39:36'),('5c8e8e26ea58f000e2622513','tsyZpJfFEzfN40OcGAMVTZ4Gfol_61hc','1','{\"cookie\":{\"originalMaxAge\":15768000000,\"expires\":\"2019-09-16T06:12:54.227Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/ghost\",\"sameSite\":\"lax\"},\"user_id\":\"1\",\"origin\":\"http://ghost-demo.b.assistance.bg\",\"user_agent\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36\",\"ip\":\"82.146.26.121\"}','2019-03-17 18:12:54','2019-03-17 18:12:54'),('5c8f4de6ea58f000e2622514','_BriQNL0dkHLWfX5c0r5vjYGjhYToVKR','1','{\"cookie\":{\"originalMaxAge\":15768000000,\"expires\":\"2019-09-16T19:51:02.171Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/ghost\",\"sameSite\":\"lax\"},\"user_id\":\"1\",\"origin\":\"http://ghost-demo.b.assistance.bg\",\"user_agent\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36\",\"ip\":\"94.155.193.66\"}','2019-03-18 07:51:02','2019-03-18 07:51:02'),('5c8f6216ea58f000e2622515','jd8Pq5Cco-_DR3zxtmrIRG6ILWA1GEXu','1','{\"cookie\":{\"originalMaxAge\":15768000000,\"expires\":\"2019-09-16T21:17:10.955Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/ghost\",\"sameSite\":\"lax\"},\"user_id\":\"1\",\"origin\":\"http://ghost-demo.b.assistance.bg\",\"user_agent\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36\",\"ip\":\"94.155.193.66\"}','2019-03-18 09:17:10','2019-03-18 09:17:10'),('5c8f8782d8f65d34ec991211','GA3L0vHHN5NJ62VS6GPLM5kaWKW7QUTn','1','{\"cookie\":{\"originalMaxAge\":15768000000,\"expires\":\"2019-09-16T23:56:50.901Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/ghost\",\"sameSite\":\"lax\"},\"user_id\":\"1\",\"origin\":\"http://localhost:2300\",\"user_agent\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36\",\"ip\":\"127.0.0.1\"}','2019-03-18 11:56:50','2019-03-18 11:56:50');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('5c8d2e46bbc28c64c8bba9c5','db_hash','7402fbe6-2bef-4a02-bce2-9af3a87fe862','core','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9c6','next_update_check','1552932755','core','2019-03-16 17:11:34','1','2019-03-17 18:12:34','1'),('5c8d2e46bbc28c64c8bba9c7','notifications','[]','core','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9c8','session_secret','9f86f76ea9c465ab5a440e76c25d89e6abd75e4aac34cd99f3c0da5de362e45a','core','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9c9','title','Demo Site','blog','2019-03-16 17:11:34','1','2019-03-16 17:39:36','1'),('5c8d2e46bbc28c64c8bba9ca','description','Thoughts, stories and ideas.','blog','2019-03-16 17:11:34','1','2019-03-16 17:39:36','1'),('5c8d2e46bbc28c64c8bba9cb','logo','https://static.ghost.org/v1.0.0/images/ghost-logo.svg','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9cc','cover_image','https://static.ghost.org/v1.0.0/images/blog-cover.jpg','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9cd','icon',NULL,'blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9ce','default_locale','en','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9cf','active_timezone','Etc/UTC','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d0','force_i18n','true','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d1','permalinks','/:slug/','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d2','amp','true','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d3','ghost_head',NULL,'blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d4','ghost_foot',NULL,'blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d5','facebook','ghost','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d6','twitter','tryghost','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d7','labs','{}','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d8','navigation','[{\"label\":\"Home\", \"url\":\"/\"},{\"label\":\"Tag\", \"url\":\"/tag/getting-started/\"}, {\"label\":\"Author\", \"url\":\"/author/ghost/\"},{\"label\":\"Help\", \"url\":\"https://docs.ghost.org\"}]','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9d9','slack','[{\"url\":\"\", \"username\":\"Ghost\"}]','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9da','unsplash','{\"isActive\": true}','blog','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9db','active_theme','casper','theme','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9dc','active_apps','[]','app','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9dd','installed_apps','[]','app','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9de','is_private','false','private','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9df','password',NULL,'private','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9e0','public_hash','81bb66f15953e92389eeadd10f3fc6','private','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9e1','members_public_key','-----BEGIN RSA PUBLIC KEY-----\nMIGJAoGBAIBeq2JH2ZQo6BkIj0s3B8Ud1QPDdotqeZVkz2eOogGBzDlUdTdk1wM90GTbeq0N\nJtlYZaBpfQQ3GfW6L/6+jrkEkNOZclzS0rhRUhanyJSxdvxdV3rya4Q+7AIxnMPEJGX+mA6R\nimv69S+dXeDovhxdbkmS8Bann/WrqQIs0YdbAgMBAAE=\n-----END RSA PUBLIC KEY-----\n','members','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9e2','members_private_key','-----BEGIN RSA PRIVATE KEY-----\nMIICWwIBAAKBgQCAXqtiR9mUKOgZCI9LNwfFHdUDw3aLanmVZM9njqIBgcw5VHU3ZNcDPdBk\n23qtDSbZWGWgaX0ENxn1ui/+vo65BJDTmXJc0tK4UVIWp8iUsXb8XVd68muEPuwCMZzDxCRl\n/pgOkYpr+vUvnV3g6L4cXW5JkvAWp5/1q6kCLNGHWwIDAQABAoGAfjsZsspOlZfoK/2z0tWp\naVddiZbi8lNgfdyk6wNiIbM+XL3FihQ6LrDRROxiZNtC8YUwYh55VfTNLUrKOWmvM6hrF8Pi\nhw3EkWHm9rB2idSPM7SrUULC4OGciGDEOsMziuaAhHy2gRU8Xc7Lsg6Hymw9GbiyTyJv/WBs\nbonOcWECQQDlZrjmaB9IKR4MKz197axc1fT41PhlHiiAX53ks0+/6mB97k7UTcZeSTlvBiOC\n8NoR1rkpyH/Nw+hBnBTZTnWxAkEAj0EMS61yI4Vr7S2VRhoPLBAdjA4EKJHtUnhhBaQb9olf\nk3yNIVMz8YIPkV9FpTm0gk87MCms6R/8G+MBtiZ0ywJAR+oQ8uIXVGbXbZcsmsqkayIDvvH8\nwK5Yog3XkLeJu688+p13huSu2CX6ZEy3WzgoFMmMmIWrUxUkPVUx0AHhsQJAKs42HVrrkz+n\n+0w2oabhx7ndCl+Z0IGiV5VO8H+UN3vfClQaW83f5JeHjVnZlsCCdrm0JvUdDOAY1kBj34jo\nNwJAEoK5d8bOJrxNI8Ch+a4TA2bSKuFfl+aklXPzzSDugKpn/CGe8ZrueVqdpHbn+lnNZ5cK\nlYzIvETrpfVkkwbNog==\n-----END RSA PRIVATE KEY-----\n','members','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9e3','members_session_secret','ea7419c2aba16e358a01350d430efd3e9a537cb5cfd7ea5edc6199d6927df687','members','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1'),('5c8d2e46bbc28c64c8bba9e4','members_subscription_settings','{\"isPaid\":false,\"paymentProcessors\":[{\"adapter\":\"stripe\",\"config\":{\"secret_token\":\"\",\"public_token\":\"\",\"product\":{\"name\":\"Ghost Subscription\"},\"plans\":[{\"name\":\"Monthly\",\"currency\":\"usd\",\"interval\":\"month\",\"amount\":\"\"},{\"name\":\"Yearly\",\"currency\":\"usd\",\"interval\":\"year\",\"amount\":\"\"}]}}]}','members','2019-03-16 17:11:34','1','2019-03-16 17:11:34','1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `post_id` varchar(24) DEFAULT NULL,
  `subscribed_url` varchar(2000) DEFAULT NULL,
  `subscribed_referrer` varchar(2000) DEFAULT NULL,
  `unsubscribed_url` varchar(2000) DEFAULT NULL,
  `unsubscribed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `feature_image` varchar(2000) DEFAULT NULL,
  `parent_id` varchar(191) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES ('5c8d2ccd97618a61c6fa0b92','Getting Started','getting-started',NULL,NULL,NULL,'public',NULL,NULL,'2019-03-16 17:05:17','1','2019-03-16 17:05:17','1');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `ghost_auth_access_token` varchar(32) DEFAULT NULL,
  `ghost_auth_id` varchar(24) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(191) NOT NULL,
  `profile_image` varchar(2000) DEFAULT NULL,
  `cover_image` varchar(2000) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `website` varchar(2000) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `facebook` varchar(2000) DEFAULT NULL,
  `twitter` varchar(2000) DEFAULT NULL,
  `accessibility` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `tour` text DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','Vladimir Chavkov','vladimir',NULL,NULL,'$2a$10$Z9bNWn2R9ZbhMRXscXcOMOAkeF8oDCXR6MDbSuK0p4AofQ5Tds8C2','vchavkov@assistance.bg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active',NULL,'public',NULL,NULL,NULL,'2019-03-18 13:08:19','2019-03-16 17:05:19','1','2019-03-18 13:08:19','1'),('5951f5fca366002ebd5dbef7','Ghost','ghost',NULL,NULL,'$2a$10$iSxIkfy5eZ2DP5Iwf/fideKWqOtt3Qb6MdynyODX6/LsxtVsFpHr2','ghost-author@example.com','https://static.ghost.org/v2.0.0/images/ghost.png',NULL,'You can delete this user to remove all the welcome posts','https://ghost.org','The Internet','ghost','tryghost',NULL,'active',NULL,'public',NULL,NULL,NULL,NULL,'2019-03-16 17:05:20','1','2019-03-16 17:05:20','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhooks` (
  `id` varchar(24) NOT NULL,
  `event` varchar(50) NOT NULL,
  `target_url` varchar(2000) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `secret` varchar(191) DEFAULT NULL,
  `api_version` varchar(50) NOT NULL DEFAULT 'v2',
  `integration_id` varchar(24) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'available',
  `last_triggered_at` datetime DEFAULT NULL,
  `last_triggered_status` varchar(50) DEFAULT NULL,
  `last_triggered_error` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-20 19:34:59
