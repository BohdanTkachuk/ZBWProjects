DROP TABLE IF EXISTS `altmetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `altmetrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `altmetric_score` int(11) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `journal_name` varchar(500) DEFAULT NULL,
  `print_issn` varchar(500) DEFAULT NULL,
  `online_issn` varchar(500) DEFAULT NULL,
  `subjects` varchar(500) DEFAULT NULL,
  `affiliation` varchar(500) DEFAULT NULL,
  `publication_date` varchar(100) DEFAULT NULL,
  `doi` varchar(500) DEFAULT NULL,
  `news` int(11) DEFAULT NULL,
  `blog` int(11) DEFAULT NULL,
  `policy` int(11) DEFAULT NULL,
  `patent` int(11) DEFAULT NULL,
  `twitter` int(11) DEFAULT NULL,
  `peer_review` int(11) DEFAULT NULL,
  `weibo` int(11) DEFAULT NULL,
  `facebook` int(11) DEFAULT NULL,
  `wikipedia` int(11) DEFAULT NULL,
  `google` int(11) DEFAULT NULL,
  `linkedIn` int(11) DEFAULT NULL,
  `reddit` int(11) DEFAULT NULL,
  `pinterest` int(11) DEFAULT NULL,
  `f1000` int(11) DEFAULT NULL,
  `qa` int(11) DEFAULT NULL,
  `videos` int(11) DEFAULT NULL,
  `syllabi` int(11) DEFAULT NULL,
  `mendeley` int(11) DEFAULT NULL,
  `dimensions_citations` int(11) DEFAULT NULL,
  `details_page` varchar(500) DEFAULT NULL,
  `badge_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165902 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
