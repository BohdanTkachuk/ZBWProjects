DROP TABLE IF EXISTS `tbl_doi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_doi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `doi` varchar(50) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `year` varchar(50) NOT NULL DEFAULT '',
  `issn` varchar(500) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `publisher` varchar(200) DEFAULT NULL,
  `discipline` varchar(20) DEFAULT NULL,
  `electronic` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`doi`)
) ENGINE=InnoDB AUTO_INCREMENT=598910 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_reader_count_academic_status`
--

DROP TABLE IF EXISTS `tbl_reader_count_academic_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reader_count_academic_status_bottom30` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_doi` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`id_doi`,`status`)
); ENGINE=InnoDB AUTO_INCREMENT=2893968 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_reader_count_country`
--

DROP TABLE IF EXISTS `tbl_reader_count_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reader_count_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_doi` int(11) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`id_doi`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=612467 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_reader_count_subdiscipline`
--

DROP TABLE IF EXISTS `tbl_reader_count_subdiscipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reader_count_subdiscipline_top30` (
  `id` int(11) NOT NULL,
  `id_doi` int(11) DEFAULT NULL,
  `category` varchar(100)  DEFAULT '',
  `discipline` varchar(150) DEFAULT '',
  `number_1` int(11) DEFAULT NULL,
  `number_2` int(11) DEFAULT NULL,
  `link` varchar(150)  DEFAULT '',
   `number_3` int(11) DEFAULT NULL,
   `years` int(11) DEFAULT NULL,
   `online_issn` varchar(150) DEFAULT '',
   `article_name` varchar(1500) DEFAULT '',
   `publisher` varchar(150)  DEFAULT '',
   `bwl` varchar(150)  DEFAULT '',
  PRIMARY KEY (`id`)

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
