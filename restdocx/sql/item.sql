-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pfyu
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `name` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `param` varchar(100) DEFAULT NULL,
  `format` varchar(100) NOT NULL,
  `input` varchar(1000) DEFAULT NULL,
  `output` varchar(1000) DEFAULT NULL,
  `note` varchar(3000) DEFAULT NULL,
  `categoryName` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `name` (`name`),
  KEY `PK_ITEM` (`categoryName`),
  CONSTRAINT `PK_ITEM` FOREIGN KEY (`categoryName`) REFERENCES `category` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('ActivateUser','GET','','JSON','','','&#22909;&#20687;&#24182;&#27809;&#26377;&#29992;&#21040;&#12290;&#20063;&#23601;&#26159;&#35828;&#40664;&#35748;&#29992;&#25143;&#23601;&#26159;&#28608;&#27963;&#29366;&#24577;','UserActivate','{activateId}');
INSERT INTO `item` VALUES ('BatchSaveOrUpdateBudget','POST','weddingid, name, note, userid','JSON','[{\"weddingid\":\"5358bb9a5de5f50816de8311\",\"name\":\"Traffic\",\"note\":\"budget for the wedding traffic\",\"userid\":\"535103765de5b361b7bc81bb\"},\r\n{\"weddingid\":\"5358bb9a5de5f50816de8311\",\"name\":\"Flower\",\"note\":\"budget for the wedding flower\",\"userid\":\"535103765de5b361b7bc81bb\"}]\r\n','','&#27880;&#24847;&#65306;\r\n#&#36825;&#37324;&#25209;&#37327;&#36807;&#26469;&#30340;JSON ARRAY&#21482;&#20250;&#21253;&#21547;&#21516;&#19968;&#20010;weddingid&#12290;&#20063;&#23601;&#26159;&#35828;&#65292;&#27599;&#27425;&#25209;&#37327;saveorupdate&#30340;&#26102;&#20505;&#65292;&#37117;&#26159;&#38024;&#23545;&#21516;&#19968;&#20010;wedding&#30340;&#12290;\r\n#&#35774;&#32622;&#20102;id&#30340;budgetCategory&#21017;&#35270;&#20026;&#26356;&#26032;.\r\n#&#27809;&#26377;&#35774;&#32622;id(&#38656;&#35201;&#35774;&#32622;weddingid)&#21017;&#38656;&#35201;&#20855;&#20307;&#20998;&#26512;&#65306;\r\n#&#22914;&#26524;&#25968;&#25454;&#24211;&#24050;&#26377;&#21517;&#31216;&#30456;&#21516;&#65288;&#23545;&#27169;&#26495;&#26469;&#35828;&#21487;&#20197;&#26159;&#22810;&#35821;&#35328;&#21517;&#31216;&#30456;&#21516;&#65289;&#30340;budgetCategory&#65292;&#21017;&#35270;&#20026;&#26356;&#26032;\r\n#&#22914;&#26524;&#25968;&#25454;&#24211;&#27809;&#26377;&#21517;&#31216;&#30456;&#21516;&#30340;budgetCategory&#65292;&#21017;&#35270;&#20026;&#25554;&#20837;\r\n','Budget','/saveorupdateAll');
INSERT INTO `item` VALUES ('BindEmail','GET','userid, email, newpass','JSON','userid=xxx&email=xxx&newpass=xxx','','&#21482;&#38024;&#23545;&#32769;&#29992;&#25143;&#12290;&#22914;&#26524;&#29992;&#25143;&#24050;&#36807;&#26399;&#65292;&#21017;&#36820;&#22238;&#12290;&#21542;&#21017;&#20445;&#23384;email&#21644;newpass&#21040;User&#20013;&#65292;&#23436;&#25104;&#29992;&#25143;&#21319;&#32423;ver=2&#12290;&#24182;&#21457;&#36865;&#28608;&#27963;&#37038;&#20214;.','User','/bundleEmail');
INSERT INTO `item` VALUES ('BindFacebook','GET','userid, token','JSON','userid=xxx&token=xxx','','&#22914;&#26524;&#29992;&#25143;&#24050;&#36807;&#26399;&#65292;&#21017;&#36820;&#22238;&#12290;&#20445;&#23384;Facebookid&#21040;User&#20013;&#65292;&#24182;&#26356;&#26032;&#29983;&#23384;&#21608;&#26399;&#65292;&#23436;&#25104;&#29992;&#25143;&#21319;&#32423;ver=2&#12290;&#21019;&#24314;SaveFacebookProfile&#23545;&#35937;&#24182;&#20445;&#23384;&#12290;','User','/{userid}/bundleFacebook');
INSERT INTO `item` VALUES ('CancelUser','GET','','JSON','','','&#22312;&#28608;&#27963;&#37038;&#20214;&#37324;&#26377;&#36825;&#20010;Link&#65292;&#19968;&#26086;&#35775;&#38382;&#65292;&#29992;&#25143;&#23601;&#34987;&#21462;&#28040;','UserActivate','/cancelEmail');
INSERT INTO `item` VALUES ('ChangeEmail','GET','userid, oldpass, email','JSON','userid=xxx&oldpass=xxx&email=xxx','','&#22914;&#26524;&#29992;&#25143;&#24050;&#36807;&#26399;&#65292;&#21017;&#36820;&#22238;&#12290;&#21305;&#37197;&#23494;&#30721;&#36890;&#36807;&#21518;&#65292;&#20445;&#23384;&#26032;&#30340;email&#21040;User&#20013;&#12290;','User','/{userid}/changeEmail');
INSERT INTO `item` VALUES ('ChangePassword','GET','oldpass, newpass','JSON','oldpass=000000&newpass=1234567890','','Change Password.\r\n&#22914;&#26524;&#29992;&#25143;&#24050;&#36807;&#26399;&#65292;&#21017;&#36820;&#22238;&#12290;&#21542;&#21017;&#39564;&#35777;oldpass&#65292;&#28982;&#21518;&#20445;&#23384;&#26032;&#30340;&#23494;&#30721;&#21040;User&#20013;&#12290;','User','/{userid}/changePassword');
INSERT INTO `item` VALUES ('CreateUser','POST','firstName, email, password','JSON','{\"firstName\":\"hello\", \"email\":\"hello@world.com\", \"password\":\"12345\"}','','Create a new user.','User','/create');
INSERT INTO `item` VALUES ('CreateWedding','POST','name, brideName, groomName, weddingDate, createrid','JSON','{\"name\":\"w1\",\"brideName\":\"b\",\"groomName\":\"g\",\"weddingDate\":197323330,\"createrid\":\"535103765de5b361b7bc81bb\"}','','&#22914;&#26524;&#29992;&#25143;&#27809;&#26377;&#36807;&#26399;&#65292;&#21017;&#20445;&#23384;wedding&#65292;&#24182;&#19988;&#21019;&#24314;&#25152;&#26377;&#30340;&#39044;&#23450;&#20041;&#30340;task&#19988;&#20837;&#24211;&#65288;&#22914;&#26524;tag&#19981;&#23384;&#22312;&#25968;&#25454;&#24211;&#30340;&#35805;&#65292;&#21516;&#26102;&#21019;&#24314;tag&#24182;&#19988;&#20837;&#24211;&#65289;&#12290;&#26368;&#21518;&#37325;&#26032;&#35745;&#31639;&#25152;&#26377;task&#30340;deadline&#21644;starttime&#24182;&#26356;&#26032;&#25968;&#25454;&#24211;&#12290;\r\n&#27880;&#24847;&#24517;&#39035;&#35201;&#25351;&#23450;creator id&#12290;\r\n\r\n&#22810;&#35821;&#35328;&#65306;&#25351;&#23450;lang=xxx&#21442;&#25968;&#65292;&#21017;&#33021;&#26681;&#25454;Locale&#26469;&#21019;&#24314;&#19981;&#21516;&#35821;&#35328;&#30340;Task&#27169;&#26495;&#65292;&#24182;&#20837;&#24211;&#12290;','Wedding','/create');
INSERT INTO `item` VALUES ('DeleteBudget','DELETE','','JSON','http://localhost:8080/weddingapp/budgetCategory/xxx','','xxx&#20195;&#34920;&#35201;&#21024;&#38500;&#30340;Budget Category&#30340;id&#12290;\r\n&#21024;&#38500;&#25104;&#21151;&#21518;&#65292;&#21518;&#21488;&#20250;&#36820;&#22238;&#35813;BudgetCategory&#23545;&#35937;&#30340;JSON&#20449;&#24687;&#12290;','Budget','/{budgetCategoryId}');
INSERT INTO `item` VALUES ('FacebookLogin','GET','token','JSON','token=xxx','','&#21033;&#29992;Facebook API&#30331;&#24405;&#24182;&#36820;&#22238;User&#23545;&#35937;&#65292;&#26356;&#26032;&#29983;&#23384;&#21608;&#26399;&#65292;&#28982;&#21518;&#36820;&#22238;User&#12290;','User','/facebook/login');
INSERT INTO `item` VALUES ('FindAllBudget','GET','weddingid, userid','JSON','weddingid=xxx&userid=xxx','','&#26597;&#25214;&#35813;wedding&#19979;&#30340;&#25152;&#26377;Budget Category&#12290;&#21442;&#25968;&#20013;&#30340;userid&#26159;&#29992;&#20316;&#23433;&#20840;&#26816;&#26597;&#30340;&#65306;&#29992;&#25143;&#24517;&#39035;&#23646;&#20110;&#35813;&#23130;&#31036;&#25165;&#21487;&#20197;&#26597;&#35810;&#12290;\r\n&#26597;&#35810;&#25104;&#21151;&#21518;&#65292;&#21518;&#21488;&#20250;&#36820;&#22238;&#35813;&#25152;&#26377;Budget Category&#30340;JSON&#20449;&#24687;&#12290;&#22914;&#26524;&#32467;&#26524;&#20026;&#31354;&#65292;&#21017;&#36820;&#22238;[]&#12290;','Budget','/findall');
INSERT INTO `item` VALUES ('FindAllComment','GET','taskid, userid','JSON','http://localhost:8080/weddingapptemp/comment/find?taskid=535245255de573a68b669c3b&userid=535103765de5b361b7bc81bb','','&#22914;&#26524;&#29992;&#25143;&#27809;&#26377;&#36807;&#26399;&#65292;&#21017;&#39564;&#35777;&#35813;&#29992;&#25143;&#26159;&#21542;&#23646;&#20110;&#35813;task&#23545;&#24212;&#30340;wedding&#65292;&#28982;&#21518;&#26597;&#25214;&#20986;&#25152;&#26377;&#30340;comment.&#20854;&#20013;lastModify&#26159;&#29992;&#26469;&#20570;&#22686;&#37327;&#26597;&#35810;&#30340;&#12290;','Comment','/find');
INSERT INTO `item` VALUES ('FindAllTask','GET','weddingid, userid, onlyMine, tagName','JSON','http://localhost:8080/weddingapptemp/task/find?weddingid=xxx&userid=xxx&onlyMine=xxx&tagName=xxx','','&#22312;Task&#25968;&#25454;&#24211;&#20013;&#65292;&#26681;&#25454;&#32473;&#23450;&#30340; weddingid&#65292;userid&#65292;&#20197;&#21450;tagName&#26597;&#25214;&#20986;&#25152;&#26377;&#30340;task&#12290;&#20063;&#23601;&#26159;&#35828;&#26597;&#25214;&#20986;&#26576;&#19968;&#20010;wedding&#19979;&#30340;&#25152;&#26377;task&#65288;Optional&#65306;&#25552;&#20379;tag&#21442;&#25968;&#21017;&#36820;&#22238;&#35813;tag&#19979;&#30340;&#25152;&#26377;task&#65292;&#25552;&#20379;onlyMine&#21017;&#36820;&#22238;&#35813;user&#30340;&#25152;&#26377;task&#65289;&#12290;\r\n&#20854;&#20013;userid&#21482;&#26159;&#29992;&#26469;&#20570;&#23433;&#20840;&#26816;&#26597;&#30340;&#65292;&#29992;&#25143;&#24517;&#39035;&#26159;&#35813;&#23130;&#31036;&#30340;&#19968;&#20010;&#21442;&#19982;&#32773;&#65292;&#21542;&#21017;&#26597;&#25214;&#22833;&#36133;&#12290;\r\n','Task','/find');
INSERT INTO `item` VALUES ('FindBudget','GET','','JSON','','','xxx&#20195;&#34920;&#35201;&#26597;&#25214;&#30340;Budget Category&#30340;id&#12290;\r\n&#26597;&#25214;&#25104;&#21151;&#21518;&#65292;&#21518;&#21488;&#20250;&#36820;&#22238;&#35813;BudgetCategory&#23545;&#35937;&#30340;JSON&#20449;&#24687;&#12290;','Budget','/{budgetCategoryId}');
INSERT INTO `item` VALUES ('FindComment','GET','taskid, userid','JSON','taskid=535245255de573a68b669c3b&userid=535103765de5b361b7bc81bb','','&#22914;&#26524;&#29992;&#25143;&#27809;&#26377;&#36807;&#26399;&#65292;&#21017;&#39564;&#35777;&#35813;&#29992;&#25143;&#26159;&#21542;&#23646;&#20110;&#35813;task&#23545;&#24212;&#30340;wedding&#65292;&#28982;&#21518;&#26597;&#25214;&#20986;&#25152;&#26377;&#30340;comment.&#20854;&#20013;lastModify&#26159;&#29992;&#26469;&#20570;&#22686;&#37327;&#26597;&#35810;&#30340;&#12290;','Comment','/find');
INSERT INTO `item` VALUES ('FindInvitation','GET','','JSON','','','&#26681;&#25454;uniqueKey&#20174;&#25968;&#25454;&#24211;&#20013;&#26597;&#25214;&#20986;Invitation&#65292;&#24182;&#36820;&#22238;&#35813;&#23545;&#35937;&#12290;','Invitation','/{invitationid}');
INSERT INTO `item` VALUES ('FindTask','GET','','JSON','','','','Task','/{taskid}');
INSERT INTO `item` VALUES ('ForgetPassword','GET','email','JSON','email=hello@world.com','','Send request to the server when processing forget password','User','/forgetPassword');
INSERT INTO `item` VALUES ('GenerateInvitation','GET','inviterid, groupName, weddingid','JSON','inviterid=535103765de5b361b7bc81bb&groupName=Guest&weddingid=535245255de573a68b669c39','','&#29983;&#25104;&#19968;&#20010;6&#20301;&#25968;&#23383;&#30340;&#36992;&#35831;&#30721;&#65292;&#24182;&#21019;&#24314;Invitation&#23545;&#35937;&#65292;&#24182;&#20445;&#23384;&#12290;&#36820;&#22238;&#35813;Invitation&#23545;&#35937;&#12290;','Invitation','/generateInvitation');
INSERT INTO `item` VALUES ('RegisterFacebook','GET','token','JSON','token=xxx','','&#26032;&#24314;User&#23545;&#35937;,&#35774;&#32622;facebookid,&#29256;&#26412;2&#65292;&#29983;&#23384;&#21608;&#26399;&#65292;&#24182;&#20445;&#23384;&#12290;&#21019;&#24314;SaveFacebookProfile&#23545;&#35937;&#24182;&#20445;&#23384;&#12290;','User','/facebook/register');
INSERT INTO `item` VALUES ('SaveOrUpdateBudget','POST','weddingid, name, note, userid','JSON','{\"weddingid\":\"5358bb9a5de5f50816de8311\",\"name\":\"Traffic\",\"note\":\"budget for the wedding traffic\",\"userid\":\"535103765de5b361b7bc81bb\"}','','#&#21019;&#24314;&#19968;&#20010;Budget Category&#12290;&#27880;&#24847;&#19981;&#35201;&#25351;&#23450;id&#65288;&#30001;&#21518;&#21488;&#31995;&#32479;&#33258;&#21160;&#20998;&#37197;&#65289;&#12290;&#20363;&#22914;&#65306;\r\n{\"weddingid\":\"5358bb9a5de5f50816de8311\",\"name\":\"Traffic\",\"note\":\"budget for the wedding traffic\",\"userid\":\"535103765de5b361b7bc81bb\"}\r\n&#21019;&#24314;&#25104;&#21151;&#21518;&#65292;&#21518;&#21488;&#20250;&#36820;&#22238;&#35813;BudgetCategory&#23545;&#35937;&#30340;JSON&#20449;&#24687;&#65292;&#21516;&#26102;&#21253;&#21547;id&#20449;&#24687;&#12290;\r\n\r\n#&#26356;&#25913;&#19968;&#20010;Budget Category&#65292;&#38656;&#35201;&#25351;&#23450;id&#65292;&#20197;&#21450;&#38656;&#35201;&#26356;&#25913;&#30340;&#23383;&#27573;&#65292;&#20363;&#22914;&#65306;\r\n{\"id\":\"538d4c855de59a5f6b93591c\",\"budget\":1200}\r\n&#26356;&#25913;&#25104;&#21151;&#21518;&#65292;&#21518;&#21488;&#20250;&#36820;&#22238;&#35813;BudgetCategory&#23545;&#35937;&#30340;JSON&#20449;&#24687;&#12290;','Budget','/saveorupdate');
INSERT INTO `item` VALUES ('SaveOrUpdateComment','POST','taskid, userid, text','JSON','{\"taskid\":\"535245255de573a68b669c3b\",\"userid\":\"535103765de5b361b7bc81bb\",\"text\":\"comment\"}','','&#22914;&#26524;&#29992;&#25143;&#26410;&#36807;&#26399;&#65292;&#26816;&#26597;&#29992;&#25143;&#26159;&#21542;&#23646;&#20110;&#35813;comment&#23545;&#24212;&#30340;task&#30340;wedding&#65292;&#28982;&#21518;&#26356;&#26032;task&#65288;&#20027;&#35201;&#26159;&#26356;&#26032;lastmodify&#65289;&#65292;&#26368;&#21518;&#20445;&#23384;comment&#12290;','Comment','/saveorupdate');
INSERT INTO `item` VALUES ('SaveOrUpdateTask','POST','','JSON','','','Task&#20837;&#24211;&#12290;&#36866;&#29992;&#20110;&#20174;APP&#30028;&#38754;&#19978;&#21019;&#24314;&#12289;&#26356;&#26032;Task&#12290;\r\n&#22914;&#26524;&#25552;&#20379;&#20102;id&#65292;&#21017;&#35270;&#20026;&#26356;&#26032;Task&#12290;&#21542;&#21017;&#35270;&#20026;&#21019;&#24314;&#26032;&#30340;Task&#12290;','Task','/saveorupdate');
INSERT INTO `item` VALUES ('SaveOrUpdateTotalBudget','POST','','JSON','&#21019;&#24314;&#65306;{\"weddingid\":\"53b4c63f5de55d7d09dd40a5\",\"userid\":\"53b4c4665de55d7d09dd40a3\"}\r\n&#26356;&#26032;&#65306;{\"id\":\"53ba4b785de5d01220a7cd02\",\"budget\":50000}','&#21019;&#24314;&#36820;&#22238;&#65306;{\"id\":\"53ba4b785de5d01220a7cd02\",\"lastModify\":1404717943,\"type\":null,\"state\":null,\"weddingid\":\"53b4c63f5de55d7d09dd40a5\",\"userid\":\"53b4c4665de55d7d09dd40a3\",\"budget\":null}\r\n&#26356;&#26032;&#36820;&#22238;&#65306;\r\n{\"id\":\"53ba4b785de5d01220a7cd02\",\"lastModify\":1404718176,\"type\":null,\"state\":null,\"weddingid\":\"53b4c63f5de55d7d09dd40a5\",\"userid\":\"53b4c4665de55d7d09dd40a3\",\"budget\":50000.0}','#&#26381;&#21153;&#31471;&#26816;&#26597;&#23130;&#31036;&#26159;&#21542;&#23384;&#22312;&#65292;&#29992;&#25143;&#26159;&#21542;&#36807;&#26399;&#65292;&#29992;&#25143;&#26159;&#21542;&#26159;&#23130;&#31036;&#30340;&#21442;&#19982;&#32773;&#12290;\r\n#&#22914;&#26524;JSON&#20013;&#25552;&#20379;id&#65292;&#21017;&#35270;&#20026;&#26356;&#26032;&#65307;&#21542;&#21017;&#35270;&#20026;&#26032;&#24314;&#23545;&#35937;&#12290;','TotalBudget','/saveorupdate');
INSERT INTO `item` VALUES ('UpdateWedding','POST','','JSON','','','&#22914;&#26524;&#20462;&#25913;wedding&#30340;date&#65292;&#21017;&#37325;&#26032;&#35745;&#31639;&#25152;&#26377;task&#30340;&#26102;&#38388;&#65292;&#26356;&#26032;&#25968;&#25454;&#24211;&#12290;&#28982;&#21518;&#26356;&#26032;wedding&#30340;&#25968;&#25454;&#24211;&#12290;','Wedding','/saveorupdate');
INSERT INTO `item` VALUES ('UserActivate','GET','','JSON','','','&#22909;&#20687;&#24182;&#27809;&#26377;&#29992;&#21040;&#12290;&#20063;&#23601;&#26159;&#35828;&#40664;&#35748;&#29992;&#25143;&#23601;&#26159;&#28608;&#27963;&#29366;&#24577;','UserActivate','/{activateId}');
INSERT INTO `item` VALUES ('UserLogin','GET','email=xxx&pass=xxx','JSON','email=hello@world.com&pass=12345','','API for user login','User','/login');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-07 18:41:23
