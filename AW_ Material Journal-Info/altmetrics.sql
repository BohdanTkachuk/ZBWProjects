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
  PRIMARY KEY (`id`)I
) ENGINE=InnoDB AUTO_INCREMENT=165902 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

select online_issn, print_issn avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics group by online_issn,;

select issn, sum(count) as doi from tbl_doi group by issn;

select altmetric.`online_issn`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi`, `IF`, `IF 5 years`, `Cites`, `SJR`, `Class BWL`, `Class VWL` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join journal_info on altmetric.online_issn = journal_info.online_issn;


select altmetric.`online_issn`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi group by issn) as mendeley on altmetric.print_issn = mendeley.issn

select  altmetric.`online_issn`, issn_names.`name`, altmetric.`print_issn`, `alt_score`, avg(`alt_score`),  `policy`, `news`, `doi`, `IF`, `IF 5 years`, `Cites`, `SJR`, `Class BWL`, `Class VWL` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join journal_info on altmetric.print_issn = journal_info.print_issn inner join issn_names on altmetric.print_issn = issn_names.print_issn;

create table issn_names (
print_issn varchar(100),
name varchar(100)
)
insert into issn_names  (name, print_issn) values ("Engineering Construction & Architectural Management", "0969-9988"),
("Finance & Stochastics", "0949-2984"),
("OR Spectrum", "0171-6468"),
("Astin Bulletin", "0515-0361"),
("Journal of Quality Technology", "0022-4065"),
("Concurrent Engineering: Research & Applications", "1063-293X"),
("Discrete Event Dynamic Systems", "0924-6703"),
("IISE Transactions", "2472-5854"),
("Journal of the Association for Information Systems", "1536-9323"),
("Flexible Services and Manufacturing Journal", "1936-6582")


\\select to 30 and intersect with journal_info
select  altmetric.`online_issn`, issn_names.`name`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi`, `IF`, `IF 5 years`, `Cites`, `SJR`, `Class BWL`, `Class VWL` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join journal_info on altmetric.print_issn = journal_info.print_issn inner join issn_names on altmetric.print_issn = issn_names.print_issn;

create table final_clean_agregated as (select  altmetric.`online_issn`, issn_names.`name`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi`, `IF`, `IF 5 years`, `Cites`, `SJR`, `Class BWL`, `Class VWL` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join journal_info on altmetric.print_issn = journal_info.print_issn inner join issn_names on altmetric.print_issn = issn_names.print_issn);

\\
select  altmetric.`online_issn`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi`, `IF`, `IF 5 years`, `Cites`, `SJR`, `Class BWL`, `Class VWL` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics_10bottom group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi_bottom group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join journal_info on altmetric.print_issn = journal_info.print_issn 
 
\\select all from bottom and intersect with jouranl_info 
select  altmetric.`online_issn`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi`, `IF`, `IF 5 years`, `Cites`, `SJR`, `Class BWL`, `Class VWL` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics_10bottom group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi_bottom group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join journal_info on altmetric.print_issn = journal_info.print_issn 
 



select  altmetric.`online_issn`, issn_names.`name`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics_10bottom group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi_bottom group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join issn_names on altmetric.print_issn = issn_names.print_issn;
 


create table final_clean_agregated_bottom as (select  altmetric.`online_issn`, issn_names.`name`, altmetric.`print_issn`, `alt_score`, `policy`, `news`, `doi` from (select online_issn, print_issn, avg(altmetric_score) as alt_score, sum(policy) as policy, sum(news) as news from altmetrics_10bottom group by online_issn, print_issn) as altmetric inner join (select issn, sum(count) as doi from tbl_doi_bottom group by issn) as mendeley on altmetric.print_issn = mendeley.issn inner join issn_names on altmetric.print_issn = issn_names.print_issn);














































































































































)