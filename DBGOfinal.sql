CREATE DATABASE  IF NOT EXISTS `genie` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `genie`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: genie
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AccumulatedChart`
--

DROP TABLE IF EXISTS `AccumulatedChart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AccumulatedChart` (
  `accumulatedChart_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_id` int(11) DEFAULT NULL,
  `ranking` int(11) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accumulatedChart_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `AccumulatedChart_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `Music` (`music_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccumulatedChart`
--

LOCK TABLES `AccumulatedChart` WRITE;
/*!40000 ALTER TABLE `AccumulatedChart` DISABLE KEYS */;
INSERT INTO `AccumulatedChart` VALUES (1,1,1,1),(2,4,2,1),(3,3,3,1),(4,13,4,1),(5,8,5,1),(6,1,1,1),(7,4,2,1),(8,13,3,1),(9,3,4,1),(10,8,5,1),(11,17,1,0),(12,19,2,0),(13,31,3,0),(14,32,4,0),(15,22,5,0);
/*!40000 ALTER TABLE `AccumulatedChart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddMusicMA`
--

DROP TABLE IF EXISTS `AddMusicMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AddMusicMA` (
  `myAlbum_id` int(11) DEFAULT NULL,
  `music_id` int(11) DEFAULT NULL,
  UNIQUE KEY `myAlbum_id` (`myAlbum_id`,`music_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `AddMusicMA_ibfk_1` FOREIGN KEY (`myAlbum_id`) REFERENCES `MyAlbum` (`myAlbum_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AddMusicMA_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `Music` (`music_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddMusicMA`
--

LOCK TABLES `AddMusicMA` WRITE;
/*!40000 ALTER TABLE `AddMusicMA` DISABLE KEYS */;
INSERT INTO `AddMusicMA` VALUES (7,1),(7,2),(7,5),(7,10),(7,13),(7,15);
/*!40000 ALTER TABLE `AddMusicMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddMusicPL`
--

DROP TABLE IF EXISTS `AddMusicPL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AddMusicPL` (
  `user_id` int(11) DEFAULT NULL,
  `music_id` int(11) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`,`music_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `AddMusicPL_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AddMusicPL_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `Music` (`music_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddMusicPL`
--

LOCK TABLES `AddMusicPL` WRITE;
/*!40000 ALTER TABLE `AddMusicPL` DISABLE KEYS */;
INSERT INTO `AddMusicPL` VALUES (1,1),(1,2),(1,3),(1,22),(1,32),(2,7),(2,8),(2,13),(2,17),(2,18),(2,23),(2,27),(2,32),(3,8),(3,10),(3,12),(3,13),(3,19),(3,33),(4,1),(4,4),(4,8),(4,20),(4,22),(4,27),(4,28),(4,34),(4,38),(5,1),(5,7),(5,8),(5,13),(5,17),(5,29),(6,3),(6,27),(6,31),(6,40),(6,41),(7,1),(7,2),(7,10),(7,24),(7,27),(7,30),(8,1),(8,2),(8,3),(8,4),(8,6),(8,27),(8,36),(8,37);
/*!40000 ALTER TABLE `AddMusicPL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Album`
--

DROP TABLE IF EXISTS `Album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `releasedDate` date NOT NULL,
  `genre` varchar(20) NOT NULL,
  `studio` varchar(30) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `numOfLike` int(11) NOT NULL DEFAULT '0',
  `introduction` varchar(300) DEFAULT NULL,
  `singer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `singer_id` (`singer_id`),
  CONSTRAINT `Album_ibfk_1` FOREIGN KEY (`singer_id`) REFERENCES `Singer` (`singer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album`
--

LOCK TABLES `Album` WRITE;
/*!40000 ALTER TABLE `Album` DISABLE KEYS */;
INSERT INTO `Album` VALUES (1,'사춘기집Ⅰ 꽃기운','2019-04-02','인디음악','(주) 카카오 M',4.5,1,'사랑스럽지만 위태롭고, 불안해서 더 찬란한 사춘기를 노래하는 소녀들의 첫 번째 계절, 봄. 봄의 시작을 알리는 사춘기 소녀들의 동화 같은 이야기의 첫 장을 열어본다.',1),(2,'장범준 3집','2019-03-21','록/메탈','(주) 카카오 M',4.2,1,'이번 3집은 좀더 작사 작곡에 균형을 맞추며 제 노래를 찾아주시는 분들이 어떤 점을 기대하시고 좋아하실까 고민을 많이 했습니다. 그리고 최대한 현재에서 써보려고 노력했습니다.',3),(3,'FLY HIGH PROJECT #2 `옥탑방','2019-01-02','록/메탈','(주) 카카오 M',4.4,1,'이승협의 자작곡 ‘옥탑방’은 연간 프로젝트 ‘FLY HIGH PROJECT’의 두 번째 싱글 타이틀 곡이다.',4),(4,'sleepless in _________','2019-03-11','(주) 카카오 M','랩/힙합',4.7,0,'잠 못들고 있나요? 악몽을 꾸나요? 실연을 당했나요? 울적하고, 우울하고, 희망이 없다고 느 껴지나요?',5),(5,'멍청이(twit)','2019-02-13','(주) 카카오 M','댄스',4.3,0,'연말 시상식 무대의 화려한 퍼포먼스로 엄청난 카리스마를 보여줌과 동시에, 예능에서는 잘 먹는 친구 같은 친근한 모습으로 많은 사랑을 받았던 화사가 데뷔 후 첫 솔로에 도전한다.',6),(6,'She`s Fine','2019-03-19','지니뮤직','R&B/Soul',4.1,1,'괜찮은 날도, 괜찮지 않은 날도 그저 지나가는 중.. 그러니까 괜찮아요!',7),(7,'신청곡 (Feat. SUGA of BTS)','2019-01-22','NHN벅스','발라드',4.8,0,'디제이가 들려주는 다른 사람의 슬픈 사연을 듣다가 너무 나 같아서 덩달아 울컥하기 일쑤지만 아이러니하게도 그 사실은 위로가 된다.',8),(8,'여자친구','2019-03-07','지니뮤직','발라드',3.8,1,'나의 여자친구가 되어주겠니? 긴 시간 숨겨온 마음의 고백... 하은요셉의 풋풋한 감성 세레나데',9),(9,'SOLO','2018-11-12','랩/힙합','YG PLUS',4.5,0,'한층 더 성숙하고, 섬세한 음악과 퍼포먼스, 다채로운 매력으로 ‘솔로’ 아티스트로서 하늘을 향해 도약하는 제니의 첫 번째 날갯짓, 그 도전과 비상은 기대를 모은다.',10),(10,'KILL THIS LOVE','2019-04-05','랩/힙합','YG PLUS',4.2,0,'올 봄, 블랙핑크는 타이틀곡 ‘Kill This Love’와 동명의 EP 앨범으로 또 한 번 도약에 나선다.',2),(11,'전설','2019-03-13','인디음악','(주) 카카오 M',4.1,0,'3년 만에 돌아온 잔나비의 2집이네요.',16),(12,'MAP OF THE SOUL : PERSONA','2019-04-12','랩/힙합','Dreamus',3.9,2,'글로벌 슈퍼스타 방탄소년단이 팬들에게 전하고 싶은 솔직한 이야기',17),(13,'ITz Different','2019-02-12','댄스','Dreamus',3.4,0,'JYP 5인조 신인 걸그룹 ITZY 달라달라 발매!',18),(14,'Circular','2019-01-02','발라드','(주) 카카오 M',3.0,0,'엠씨더맥스 3년만의 정규 앨범 발매!',19),(15,'키스 먼저 할까요?: OST Part.3','2018-03-20','발라드','Dreamus',3.7,2,'SBS 월화드라마 키스먼저할까요? OST의 3번째 주자로 폴킴이 출격한다.',20),(16,'너를 만나','2018-10-29','발라드','(주) 카카오 M',3.5,0,'지금 옆에 있는 누군가가 당신이 오랫동안 기다려온 완벽한 사랑이길 바라면서...',20),(17,'신용재','2018-11-06','발라드','지니뮤직',2.1,0,'그가 한 가수의 노래를 항상 불렀던 이유...',23),(18,'그때가 좋았어','2018-12-31','발라드','(주) 카카오 M',4.3,1,'사랑이 전부였던 그때가 좋았어 그때 알았더라면 더 사랑할 걸 더 안아줄 걸 후회가 돼”\n',11),(19,'YOU NEVER WALK ALONE','2017-02-13','랩/힙합','Dreamus',3.7,0,'이 시대의 청춘에게 건네는 위로와 희망의 메세지.',17),(20,'Spring','2019-03-13','R&B','NHN벅스',4.5,0,'올 봄! 9년 만에 컴백하는 박봄의 애절함이 실린 신곡 “봄(Spring)”!',12),(21,'초록빛','2019-01-17','발라드','(주) 카카오 M',3.8,1,'예전의 제 모습을 떠올리며 지금의 소소한 행복을 찾고 있습니다.',20),(22,'4.3','2019-03-07','인디음악','(주) 카카오 M',4.5,0,'스토커를 넘는 10cm식 이별 이야기',24),(23,'이 노래가 클럽에서 나온다','2019-01-23','랩/힙합','지니뮤직',4.6,1,'나와 헤어진 그녀가 이 노래를 듣는다면에서 시작된 이야기...\n',13),(24,'LOVE YOURSELF','2018-08-24','발라드','Dreamus',3.8,0,'진정한 사랑은 나 자신을 사랑하는 것부터!',17),(25,'Speak Your Mind (Deluxe)','2018-04-27','POP','워너뮤직',4.5,0,'영국이 주목하는 허스키보이스! 싱어송라이터 Anne-Marie의 데뷔앨범 [Speak Your Mind (Deluxe)] 발매',14),(26,'뷰티 인사이드: OST Part.4','2018-10-23','발라드','(주)뮤직앤뉴',4.3,0,'오직 한 여자만 알아보는 남자의 마법 같은 로맨스가 시작됐다!',25),(27,'MONKEY HOTEL','2016-08-04','인디음악','(주) 카카오 M',4.6,0,'이 앨범은 몽키호텔 시리즈의 첫 시작이 되겠습니다.',16),(28,'7 rings','2019-01-18','POP','Universal Music Group',4.5,1,NULL,26),(29,'사랑에 연습이 있었다면','2018-09-25','발라드','(주) 카카오 M',4.3,0,'작곡가 문성욱과 \"Crush\", \"웃으며\" 두개의 음원을 내며 잔잔한 반향을 일으켰던 보컬 임재현의 첫 개인앨범이 발매 됐다.',15),(30,'180도','2018-12-07','발라드','지니뮤직',3.4,0,'180도.. 이 노래는 달라짐에 대한 이야기...',21),(31,'이별하러 가는 길','2018-09-13','발라드','(주) 카카오 M',4.5,0,'“내 마음도 모르고, 날씨는 왜 그리도 좋을까...”',22),(32,'사계','2019-03-24','발라드','Dreamus',4.3,0,'얼터너티브 팝 장르의 타이틀 곡 사계와 발라드 수록곡 Blue 등 태연의 명품 보이스를 만끽할 수 있는 2곡이 수록되어 있다.',27),(33,'사월, 그리고 꽃 - The 1st Mini Album','2019-04-01','발라드','Dreamus',4.2,1,'타이틀 곡 사월이 지나면 우리 헤어져요를 비롯해 다양한 매력의 발라드 총 6곡이 수록되어, 첸의 감미로운 보컬과 따뜻한 음악 감성을 만날 수 있다.',28),(34,'Our love is great','2019-03-18','R&B','Dreamus',4.5,1,'백예린의 탁월한 음악적 오브제 선택과 순수한 목소리로 완성되었다.',29),(35,'White Wind','2019-03-14','댄스','(주) 카카오 M',4.0,0,'화이트로 CHILL한 마마무의 유쾌 발랄한 파티타임.',30),(36,'벌써 12시','2019-01-02','댄스','지니뮤직 Stone Music Entertainment',4.2,0,'기존 앨범들이 그녀가 가지고 있는 밝은 색채에 주목했다면 이번 신곡은 도발적이고 적극적이다.',31),(37,'HEART*IZ','2019-04-01','발라드/댄스','지니뮤직',3.8,0,'플라워로 시작해 하늘로 이어지는 이번 앨범.',32),(38,'너도 그냥 날 놓아주면 돼','2018-11-29','발라드','지니뮤직',4.0,0,'감성장인 윤건이 들려주는 또 하나의 명품 발라드.',33),(39,'Take','2018-06-27','인디음악','워너뮤직',1.4,0,'색다른 사운드 디자인과 뚜렷한 가사내용이 담겨져 있으며 어디에서도 느낄 수 없는 숀만의 간성으로 제작되었다.',34),(40,'YES or YES','2018-11-05','발라드/댄스','Dreamus',3.1,0,'사랑스러운 답정너 9인의 고백! 대답은? yes~',35);
/*!40000 ALTER TABLE `Album` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateUnitedMedia2
AFTER INSERT ON Album
FOR EACH ROW BEGIN
insert into UnitedMedia VALUES(NEW.album_id,2);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER DeleteUnitedMedia2
AFTER DELETE ON Album
FOR EACH ROW BEGIN
DELETE FROM UnitedMedia where old.album_id = media_id AND mediaInfo_id = 2;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `BookConcert`
--

DROP TABLE IF EXISTS `BookConcert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `BookConcert` (
  `user_id` int(11) DEFAULT NULL,
  `concert_id` int(11) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`,`concert_id`),
  KEY `concert_id` (`concert_id`),
  CONSTRAINT `BookConcert_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `BookConcert_ibfk_2` FOREIGN KEY (`concert_id`) REFERENCES `Concert` (`concert_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookConcert`
--

LOCK TABLES `BookConcert` WRITE;
/*!40000 ALTER TABLE `BookConcert` DISABLE KEYS */;
INSERT INTO `BookConcert` VALUES (1,1),(1,3),(2,2),(3,2),(4,2),(6,1),(8,1);
/*!40000 ALTER TABLE `BookConcert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateConcertNum1
AFTER INSERT on BookConcert
FOR EACH ROW BEGIN
IF (SELECT currentNum from Concert where new.concert_id = concert_id) <
(SELECT numOfLimit from Concert where new.concert_id = concert_id) THEN
UPDATE Concert SET currentNum = currentNum + 1 WHERE NEW.concert_id = concert_id;
ELSE
DELETE FROM BookConcert where new.concert_id = concert_id AND new.user_id = user_id;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateConcertNum2
AFTER DELETE on BookConcert
FOR EACH ROW BEGIN
UPDATE Concert SET currentNum = currentNum - 1 WHERE old.concert_id = concert_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parentComment_id` int(11) NOT NULL DEFAULT '-1',
  `user_id` int(11) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  `mediaInfo_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `Comment_ibfk_2_idx` (`mediaInfo_id`),
  KEY `Comment_ibfk_3_idx` (`media_id`),
  CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`mediaInfo_id`) REFERENCES `MediaInfo` (`mediaInfo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Comment_ibfk_3` FOREIGN KEY (`media_id`) REFERENCES `UnitedMedia` (`media_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (1,'갓 이수!!!','2019-05-14 03:59:55',-1,6,19,1),(2,'ITZY는 내 마음속에 있지!','2019-05-14 04:02:55',-1,5,18,1),(3,'화사 지화자!','2019-05-14 04:02:55',-1,1,6,1),(4,'노래보단 인성이 먼저','2019-05-14 04:07:06',1,2,19,1),(5,'자숙 충분히 하지 않았나요? ㅠㅠ','2019-05-14 04:08:15',4,1,19,1),(6,'곱창 완판녀! 매력 짱 화자언니!!','2019-05-14 04:09:12',3,8,6,1);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Concert`
--

DROP TABLE IF EXISTS `Concert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Concert` (
  `concert_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `concertStory` varchar(300) DEFAULT NULL,
  `genre` varchar(20) NOT NULL,
  `numOflimit` int(11) NOT NULL,
  `duedate` datetime NOT NULL,
  `currentNum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`concert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concert`
--

LOCK TABLES `Concert` WRITE;
/*!40000 ALTER TABLE `Concert` DISABLE KEYS */;
INSERT INTO `Concert` VALUES (1,'2019 Lee Seung Hwan Last Day','지구 어디에서 이런 내구성의 성대를, 이런 내실 있는 음악을, 이런 아름다운 내면을 가진 30년차 가수를 만날 수 있을까.','Ballad',99,'2019-06-16 23:59:59',3),(2,'TWICE WORLD TOUR 2019','트와이스 월드 투어 2019 로 북남미 4개 도시를 포함한 전 세계 9개 도시, 10회 공연으로 글로벌 팬들과 만난다.','Dance',3,'2019-05-26 20:00:00',3),(3,'Park Hyo Shin: Where is love?','우리 모두가 꿈꾸는 내일이란 어쩌면 서로 다른 두 손을 맞잡고 피어난 온기의 작은 어우러짐에서 시작되는 것이라 믿고 싶다.','Ballad',100,'2019-06-29 00:00:00',1),(4,'Standing Egg <innocent>','언제나 한결같이 맑고 포근한 어쿠스틱 감성을 들려주는 스탠딩 에그의 힐링효과는 계속 된다.','Indie',1000,'2019-05-01 23:59:59',0);
/*!40000 ALTER TABLE `Concert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DownloadMusic`
--

DROP TABLE IF EXISTS `DownloadMusic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DownloadMusic` (
  `user_id` int(11) DEFAULT NULL,
  `music_id` int(11) DEFAULT NULL,
  `downloadedDate` datetime NOT NULL,
  `expiredDate` datetime NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`music_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `DownloadMusic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `DownloadMusic_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `Music` (`music_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DownloadMusic`
--

LOCK TABLES `DownloadMusic` WRITE;
/*!40000 ALTER TABLE `DownloadMusic` DISABLE KEYS */;
INSERT INTO `DownloadMusic` VALUES (8,16,'2019-05-02 00:00:00','2019-06-01 00:00:00'),(8,11,'2019-05-17 17:30:00','2019-06-16 17:30:00'),(8,24,'2019-05-17 17:30:30','2019-06-16 17:30:30'),(8,31,'2019-05-18 00:31:17','2019-06-17 00:31:17'),(8,22,'2019-05-19 23:17:47','2019-06-18 23:17:47'),(3,1,'2019-05-15 12:38:30','2019-06-14 12:38:30'),(3,2,'2019-05-15 12:38:30','2019-06-14 12:38:30'),(3,5,'2019-05-15 12:40:30','2019-06-14 12:40:30'),(3,35,'2019-05-15 12:41:30','2019-06-14 12:41:30'),(3,17,'2019-05-15 23:38:30','2019-06-14 23:38:30'),(3,29,'2019-05-15 23:39:30','2019-06-14 23:39:30');
/*!40000 ALTER TABLE `DownloadMusic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikeMedia`
--

DROP TABLE IF EXISTS `LikeMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `LikeMedia` (
  `user_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `mediaInfo_id` int(11) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`,`media_id`,`mediaInfo_id`),
  KEY `media_id` (`media_id`),
  KEY `mediaInfo_id` (`mediaInfo_id`),
  CONSTRAINT `LikeMedia_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `LikeMedia_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `UnitedMedia` (`media_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `LikeMedia_ibfk_3` FOREIGN KEY (`mediaInfo_id`) REFERENCES `MediaInfo` (`mediaInfo_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikeMedia`
--

LOCK TABLES `LikeMedia` WRITE;
/*!40000 ALTER TABLE `LikeMedia` DISABLE KEYS */;
INSERT INTO `LikeMedia` VALUES (1,1,1),(1,1,3),(1,3,1),(1,3,4),(1,4,1),(1,4,4),(1,5,3),(1,7,3),(1,9,3),(2,1,1),(2,1,2),(2,1,3),(2,1,4),(2,2,2),(2,2,4),(2,3,4),(2,11,3),(2,17,3),(2,26,1),(2,27,1),(2,28,2),(3,1,4),(3,2,4),(3,5,4),(3,6,1),(3,16,3),(3,18,3),(3,20,3),(3,27,1),(3,28,3),(4,1,4),(4,2,4),(4,3,3),(4,3,4),(4,5,4),(4,6,2),(4,7,1),(4,8,1),(4,8,3),(4,15,2),(4,26,1),(4,30,3),(4,33,2),(5,NULL,2),(5,1,4),(5,2,4),(5,18,2),(5,27,1),(5,30,3),(5,34,2),(5,37,3),(6,3,2),(6,8,2),(6,30,1),(6,34,3),(6,41,3),(7,1,3),(7,1,4),(7,2,3),(7,3,3),(7,4,3),(7,7,3),(7,9,1),(7,12,2),(7,15,2),(7,28,3),(8,1,4),(8,4,3),(8,12,2),(8,17,3),(8,23,2),(8,30,1),(8,34,3),(8,36,3),(8,41,3);
/*!40000 ALTER TABLE `LikeMedia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IncreaseNumOfLike
AFTER INSERT ON LikeMedia
FOR each row begin
if new.mediaInfo_id = 1 then
update Singer set numOfLike = numOfLike + 1 where new.media_id = singer_id;
elseif new.mediaInfo_id = 2 then
update Album set numOfLike = numOfLike + 1 where new.media_id = album_id;
elseif new.mediaInfo_id = 3 then
update Music set numOfLike = numOfLike + 1 where new.media_id = music_id;
elseif new.mediaInfo_id = 4 then
update Video set numOfLike = numOfLike + 1 where new.media_id = video_id;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER DecreaseNumOfLike
AFTER DELETE ON LikeMedia
FOR each row begin
if old.mediaInfo_id = 1 then
update Singer set numOfLike = numOfLike - 1 where old.media_id = singer_id;
elseif old.mediaInfo_id = 2 then
update Album set numOfLike = numOfLike - 1 where old.media_id = album_id;
elseif old.mediaInfo_id = 3 then
update Music set numOfLike = numOfLike - 1 where old.media_id = music_id;
elseif old.mediaInfo_id = 4 then
update Video set numOfLike = numOfLike - 1 where old.media_id = video_id;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `MediaInfo`
--

DROP TABLE IF EXISTS `MediaInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MediaInfo` (
  `mediaInfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaInfoType` varchar(20) NOT NULL,
  PRIMARY KEY (`mediaInfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MediaInfo`
--

LOCK TABLES `MediaInfo` WRITE;
/*!40000 ALTER TABLE `MediaInfo` DISABLE KEYS */;
INSERT INTO `MediaInfo` VALUES (1,'Singer'),(2,'Album'),(3,'Music'),(4,'Video');
/*!40000 ALTER TABLE `MediaInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Music`
--

DROP TABLE IF EXISTS `Music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `lyrics` varchar(300) DEFAULT NULL,
  `playCount` int(11) NOT NULL DEFAULT '0',
  `numOfLike` int(11) NOT NULL DEFAULT '0',
  `album_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`music_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `Music_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Album` (`album_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Music`
--

LOCK TABLES `Music` WRITE;
/*!40000 ALTER TABLE `Music` DISABLE KEYS */;
INSERT INTO `Music` VALUES (1,'Spring Only For Me',NULL,11,3,1),(2,'Stars Over Me',NULL,5,1,1),(3,'every moment with you',NULL,8,1,2),(4,'karaoke',NULL,9,2,2),(5,'Rooftop',NULL,0,1,3),(6,'주저하는 연인들을 위해',NULL,3,0,11),(7,'Poem for Small Things',NULL,4,2,12),(8,'Different',NULL,8,1,13),(9,'넘쳐 흘러',NULL,0,1,14),(10,'Four Seasons(living a day)',NULL,2,0,14),(11,'Every Day, Every Moment',NULL,0,1,15),(12,'Me After You',NULL,0,0,16),(13,'Mikrokosmos',NULL,8,0,12),(14,'신용재',NULL,0,0,17),(15,'Spring Day',NULL,0,0,19),(16,'초록빛',NULL,0,1,21),(17,'Make It Right',NULL,4,2,12),(18,'그러나',NULL,1,1,22),(19,'IDOL',NULL,2,0,24),(20,'내 생에 아름다운',NULL,1,1,26),(22,'HOME',NULL,4,0,12),(23,'7rings',NULL,1,0,28),(24,'달라달라',NULL,3,0,13),(25,'봄(feat.산다라박)',NULL,0,0,20),(26,'술이 달다(Feat.Crush)',NULL,0,0,4),(27,'고고베베',NULL,7,0,35),(28,'넘쳐흘러',NULL,0,2,14),(29,'Fire Up',NULL,2,0,23),(30,'멍청이',NULL,2,2,5),(31,'사계(하루살이)',NULL,1,0,14),(32,'벌써 12시',NULL,4,0,36),(33,'Every Day, Every Moment',NULL,2,0,15),(34,'Me After You',NULL,0,2,16),(35,'Four Seasons',NULL,0,0,32),(36,'주저하는 연인들을 위해',NULL,4,1,11),(37,'KILL THIS LOVE',NULL,2,1,10),(38,'사월이 지나면 우리 헤어져요',NULL,5,0,33),(39,'Poem for Small Things',NULL,0,0,12),(40,'그때가 좋았어',NULL,1,0,18),(41,'그건 아마 우리의 잘못은 아닐거야',NULL,2,2,34);
/*!40000 ALTER TABLE `Music` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateUnitedMedia3
AFTER INSERT ON Music
FOR EACH ROW BEGIN
insert into UnitedMedia VALUES(NEW.music_id,3);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER DeleteUnitedMedia3
AFTER DELETE ON Music
FOR EACH ROW BEGIN
DELETE FROM UnitedMedia where old.music_id = media_id AND mediaInfo_id = 3;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `MyAlbum`
--

DROP TABLE IF EXISTS `MyAlbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MyAlbum` (
  `myAlbum_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(30) NOT NULL,
  `introduction` varchar(100) DEFAULT NULL,
  `isPrivate` int(11) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`myAlbum_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `MyAlbum_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyAlbum`
--

LOCK TABLES `MyAlbum` WRITE;
/*!40000 ALTER TABLE `MyAlbum` DISABLE KEYS */;
INSERT INTO `MyAlbum` VALUES (1,3,'2019 new music','workout',0,'2019-05-13 14:45:41'),(2,3,'2018 new music','study',0,'2019-05-13 14:45:41'),(3,4,'Indie music','인디음악 모음',0,'2019-05-13 14:45:42'),(4,4,'인디음악','개인소장용 인디음악',1,'2019-05-13 14:45:42'),(5,4,'비 오는 날','비 오는 날 듣는 노래',1,'2019-05-13 14:45:42'),(6,5,'Carol','크리스마스 특집',0,'2019-05-13 14:45:42'),(7,3,'1990s','pop',0,'2019-05-14 14:13:52');
/*!40000 ALTER TABLE `MyAlbum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayMusic`
--

DROP TABLE IF EXISTS `PlayMusic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PlayMusic` (
  `playMusic_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `music_id` int(11) DEFAULT NULL,
  `playedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playMusic_id`),
  KEY `user_id` (`user_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `PlayMusic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `AddMusicPL` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `PlayMusic_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `AddMusicPL` (`music_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayMusic`
--

LOCK TABLES `PlayMusic` WRITE;
/*!40000 ALTER TABLE `PlayMusic` DISABLE KEYS */;
INSERT INTO `PlayMusic` VALUES (1,1,3,'2019-05-13 09:53:24'),(8,3,8,'2019-05-13 14:39:16'),(9,3,8,'2019-05-13 14:39:16'),(10,3,13,'2019-05-13 14:39:17'),(11,3,13,'2019-05-13 14:39:17'),(12,3,13,'2019-05-13 14:39:17'),(13,3,19,'2019-05-13 14:39:17'),(14,3,33,'2019-05-13 14:39:18'),(15,4,20,'2019-05-13 14:39:18'),(16,4,22,'2019-05-13 14:39:18'),(17,4,27,'2019-05-13 14:39:19'),(18,4,27,'2019-05-13 14:39:19'),(19,4,27,'2019-05-13 14:39:19'),(20,4,38,'2019-05-13 14:39:19'),(21,4,38,'2019-05-13 14:39:20'),(23,3,19,'2019-05-13 14:41:16'),(24,3,8,'2019-05-13 14:41:17'),(25,3,13,'2019-05-13 14:41:17'),(26,3,33,'2019-05-13 14:41:17'),(27,4,38,'2019-05-13 14:41:17'),(28,4,38,'2019-05-13 14:41:18'),(29,4,38,'2019-05-13 14:41:18'),(30,4,22,'2019-05-13 14:41:18'),(37,1,2,'2019-05-11 13:55:30'),(38,1,3,'2019-05-11 13:55:30'),(39,6,3,'2019-05-13 17:10:31'),(40,6,27,'2019-05-13 17:10:36'),(41,6,31,'2019-05-13 17:10:40'),(42,6,40,'2019-05-13 17:10:52'),(43,6,41,'2019-05-13 17:10:55'),(45,5,7,'2019-05-13 17:15:06'),(46,5,1,'2019-05-13 17:15:06'),(47,5,13,'2019-05-13 17:15:06'),(48,5,17,'2019-05-13 17:15:06'),(49,5,29,'2019-05-13 17:15:06'),(50,2,7,'2019-05-11 13:50:30'),(51,2,8,'2019-05-11 13:55:30'),(52,5,1,'2019-05-13 17:18:00'),(53,5,1,'2019-05-13 17:18:00'),(54,5,13,'2019-05-13 17:18:00'),(55,5,17,'2019-05-13 17:18:00'),(56,5,29,'2019-05-13 17:18:01'),(57,1,18,'2019-05-11 13:50:00'),(58,2,13,'2019-05-16 13:50:30'),(59,2,17,'2019-05-17 13:55:30'),(60,6,3,'2019-05-13 17:19:07'),(61,6,3,'2019-05-13 17:19:07'),(62,6,3,'2019-05-13 17:19:07'),(63,6,3,'2019-05-13 17:19:08'),(64,6,41,'2019-05-13 17:19:08'),(65,1,22,'2019-05-11 13:50:00'),(66,1,23,'2019-05-16 13:50:30'),(67,1,32,'2019-05-17 13:55:30'),(68,2,32,'2019-05-17 13:55:30'),(69,1,1,'2019-05-14 13:00:10'),(70,1,32,'2019-05-14 13:00:10'),(71,1,32,'2019-05-14 14:10:10'),(72,1,22,'2019-05-14 13:00:10'),(73,2,7,'2019-05-14 13:00:10'),(74,2,7,'2019-05-14 14:10:10'),(75,2,8,'2019-05-14 03:00:10'),(76,2,8,'2019-05-14 14:30:10'),(77,2,13,'2019-05-14 06:10:10'),(78,2,17,'2019-05-14 08:00:10'),(81,7,1,'2019-05-14 06:29:42'),(82,7,1,'2019-05-14 06:30:41'),(83,7,1,'2019-05-14 06:30:49'),(84,7,1,'2019-05-14 06:30:53'),(85,7,1,'2019-05-14 06:30:56'),(86,7,1,'2019-05-14 06:31:02'),(87,7,2,'2019-05-14 06:31:20'),(88,7,2,'2019-05-14 06:31:23'),(89,7,10,'2019-05-14 06:32:17'),(90,7,10,'2019-05-14 06:32:29'),(91,7,24,'2019-05-14 06:32:41'),(92,7,24,'2019-05-14 06:32:46'),(93,7,24,'2019-05-14 06:32:49'),(94,7,30,'2019-05-14 06:33:07'),(95,7,30,'2019-05-14 06:33:15'),(96,7,2,'2019-05-14 06:33:32'),(97,8,3,'2019-05-14 06:33:48'),(98,8,3,'2019-05-14 06:34:07'),(99,8,4,'2019-05-14 06:34:18'),(100,8,4,'2019-05-14 06:34:23'),(101,8,4,'2019-05-14 06:34:25'),(102,8,4,'2019-05-14 06:34:30'),(103,8,4,'2019-05-14 06:34:34'),(104,8,6,'2019-05-14 06:35:42'),(105,8,6,'2019-05-14 06:35:42'),(106,8,6,'2019-05-14 06:35:42'),(107,8,36,'2019-05-14 06:35:42'),(108,8,36,'2019-05-14 06:35:43'),(109,8,36,'2019-05-14 06:35:43'),(110,8,36,'2019-05-14 06:35:43'),(111,8,37,'2019-05-14 06:35:43'),(112,8,37,'2019-05-14 06:35:44'),(113,1,4,'2019-05-14 07:41:16'),(114,2,4,'2019-05-14 07:47:36'),(115,3,4,'2019-05-14 07:47:36'),(116,4,4,'2019-05-14 07:48:00'),(117,4,8,'2019-05-14 09:54:21'),(118,5,8,'2019-05-14 09:54:21'),(119,6,27,'2019-05-14 09:54:21'),(120,7,27,'2019-05-14 09:54:21'),(121,8,27,'2019-05-14 09:54:22'),(122,8,1,'2019-05-14 17:54:18'),(123,8,2,'2019-05-14 17:56:36');
/*!40000 ALTER TABLE `PlayMusic` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IncreasePlaycount1
AFTER INSERT ON PlayMusic
for each row begin 
update Music set playCount =  playCount + 1 where new.music_id = music_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER DecreasePlaycount1
AFTER DELETE ON PlayMusic
for each row begin 
update Music set playCount =  playCount - 1 where old.music_id = music_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Singer`
--

DROP TABLE IF EXISTS `Singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Singer` (
  `singer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `debutDate` date NOT NULL,
  `introduction` varchar(300) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `numOfLike` int(11) NOT NULL DEFAULT '0',
  `relatedGroup` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Singer`
--

LOCK TABLES `Singer` WRITE;
/*!40000 ALTER TABLE `Singer` DISABLE KEYS */;
INSERT INTO `Singer` VALUES (1,'Bolbbalgan4','group','발라드','2016-04-22','발매하는 곡마다 메가 히트를 기록하는 히트곡 메이커 볼빨간사춘기는 인디 밴드를 넘어 대중에게 사랑받는 아티스트로 거듭난 여성 듀오다.','대한민국',2,NULL),(2,'BLACKPINK','group','랩/힙합','2016-08-08','BLACKPINK (블랙핑크)는 YG엔터테인컨트에 소속되어 있는 대한민국의 4인조 걸그룹이다.','대한민국',0,NULL),(3,'장범준','solo','발라드','2011-11-14','장범준은 대한민국의 싱어송라이터이다','대한민국',1,'버스커버스커'),(4,'NFlying','group','발라드','2015-05-20','엔플라잉 (N.Flying)은 FNC 엔터테인먼트 소속의 5인조 남성 그룹으로 이승협, 권광진, 차훈, 김재현 총 4인으로 구성되어 데뷔했다','대한민국',1,NULL),(5,'Epik High','group','랩/힙합','2003-10-23','에픽 하이 (Epik High)는 Tablo, 미쓰라 진, DJ 투컷으로 구성된 대한민국의 힙합 그룹이다.','대한민국',0,NULL),(6,'Hwasa','solo','R&B/Soul','2003-10-23','화사는 대한민국의 4인조 걸그룹 마마무의 멤버로 보컬과 랩을 맡고 있다.','대한민국',1,'마마무'),(7,'헤이즈','solo','랩/힙합','2014-01-17','\"언프리티 랩 스타 2\" 등장부터 지금까지 쉴 틈 없는 활동을 이어가는 헤이즈는 개성 있는 랩과 노래, 걸크러시적인 외모와 성격으로 주목받는 뮤지션이다.','대한민국',1,NULL),(8,'이소라','solo','발라드','1995-09-01','이소라는 대한민국의 가수이다. 내성적인 성격이지만 노래하는 것을 좋아했던 이소라는 대학 시절 창작 가요 동아리에 가입해 활동했으며, 1991년 동아리 후배의 권유로 그룹 낯선 사람들을 결성했다.','대한민국',1,NULL),(9,'하은요셉','group','발라드','2019-03-07','하은요셉은 인디안레이블 소속의 보컬 듀오이다.','대한민국',1,NULL),(10,'Jenny','solo','댄스','2016-08-08','제니 (JENNIE)는 YG 엔터테인먼트에 소속된 4인조 걸그룹 BLACKPINK의 멤버이다.','대한민국',0,'BLACKPINK'),(11,'케이시','solo','발라드','2015-04-06','케이시는 넥스타 엔터테인먼트에 소속된 래퍼이자 가수이다.','대한민국',0,NULL),(12,'박봄','solo','soul','2009-10-28','박봄은 대한민국의 가수이다.','대한민국',0,'2NE1'),(13,'우디','solo','랩/힙합','2011-05-27','우디는 대한민국의 싱어송라이터이다.','대한민국',0,NULL),(14,'Anne-Marie','solo','POP','2013-05-23','Anne-Marie는 잉글랜드의 싱어송라이터이다.','UK',0,NULL),(15,'임재현','solo','발라드','2015-02-16','임재현은 디원 미디어에 소속된 대한민국의 가수이다.','대한민국',0,NULL),(16,'잔나비','group','발라드','2014-04-28','잔나비는 페포니 뮤직 소속의 5인조 밴드이다.','대한민국',0,NULL),(17,'BTS','group','댄스','2013-06-12','가요계의 새로운 역사를 쓰고 있는 그룹 방탄소년단은 데뷔 이후 끊임없는 성장세를 보이며 빌보드 진입 기록을 갱신하였다.','대한민국',0,NULL),(18,'ITZY','group','댄스','2019-02-12','ITZY는 JYP 엔터테인먼트에 소속의 5인조 걸그룹이다.','대한민국',0,NULL),(19,'MC THE MAX','group','발라드','2002-10-01','엠씨더맥스는 대한민국의 3인조 밴드 그룹으로 문차일드가 재결성되어 만들어졌다.','대한민국',0,NULL),(20,'폴킴','solo','발라드','2014-01-21','폴킴은 뉴런 뮤직에 소속된 대한민국의 싱어송라이터이다.','대한민국',0,NULL),(21,'벤','solo','발라드','2010-11-01','벤은 대한민국 가수로 2010년에 데뷔하였다.','대한민국',0,'BeBe Mignon'),(22,'임한별','solo','발라드','2008-04-17','임한별은 모스트윅스에 소속된 대한민국 가수이다.','대한민국',0,NULL),(23,'하은','solo','발라드','2018-09-21','하은은 대한민국의 가수이다.','대한민국',0,NULL),(24,'10cm','solo','발라드','2010-04-22','10cm는 포크음악을 주로 하는 대한민국의 인디밴드이다.','대한민국',0,NULL),(25,'케이윌','solo','발라드','2007-03-06','케이윌은 스타쉽 엔터테인먼트 소속의 대한민국 발라드 가수이다.','대한민국',0,NULL),(26,'Ariana Grande','solo','POP','2011-12-24','Ariana Grande는 미국 가수이자 배우이다.','미국',2,NULL),(27,'Taeyeon','solo','아이돌','2007-08-03','대한민국의 9인조 걸 그룹 소녀시대의 멤버이며 리더를 맡고 있다.','대한민국',3,'소녀시대'),(28,'첸','solo','아이돌','2012-01-30','보이 그룹 EXO에서 메인 보컬을 맡고 있다.','대한민국',0,'EXO'),(29,'백예린','solo','R&B','2012-10-05','JYP엔터테인먼트에 소속된 대한민국의 가수이다.','대한민국',0,'15&'),(30,'Mamamoo','group','아이돌','2014-06-18','RBW에 소속된 대한민국의 4인조 걸그룹으로 솔라, 문별, 휘인, 화사로 구성되어 있다.','대한민국',2,NULL),(31,'청하','solo','아이돌','2016-05-05','I.O.I 멤버로 데뷔, 대중성과 실력을 고루 겸비한 솔로 여가수이다.','대한민국',0,'I.O.I'),(32,'IZ*ONE','group','아이돌','2018-10-29','다국적 12인조 걸르룹이다.','대한민국',0,NULL),(33,'윤건','solo','발라드','2003-11-13','대한민국을 대표하는 감성 싱어송라이터','대한민국',0,NULL),(34,'숀','solo','발라드','2010-06-15','대한민국의 싱어송라이터이자 프로듀서이다.','대한민국',0,NULL),(35,'트와이스','group','아이돌','2015-10-20','데뷔와 동시에 정상급 위치로 발돋움 한 9인조 걸그룹.','대한민국',0,NULL);
/*!40000 ALTER TABLE `Singer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateUnitedMedia1
AFTER INSERT ON Singer
FOR EACH ROW BEGIN
insert into UnitedMedia VALUES(NEW.singer_id,1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER DeleteUnitedMedia1
AFTER DELETE ON Singer
FOR EACH ROW BEGIN
DELETE FROM UnitedMedia where old.singer_id = media_id AND mediaInfo_id = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `UnitedMedia`
--

DROP TABLE IF EXISTS `UnitedMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `UnitedMedia` (
  `media_id` int(11) NOT NULL,
  `mediaInfo_id` int(11) DEFAULT NULL,
  UNIQUE KEY `media_id` (`media_id`,`mediaInfo_id`),
  KEY `mediaInfo_id` (`mediaInfo_id`),
  CONSTRAINT `UnitedMedia_ibfk_1` FOREIGN KEY (`mediaInfo_id`) REFERENCES `MediaInfo` (`mediaInfo_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnitedMedia`
--

LOCK TABLES `UnitedMedia` WRITE;
/*!40000 ALTER TABLE `UnitedMedia` DISABLE KEYS */;
INSERT INTO `UnitedMedia` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(4,4),(5,1),(5,2),(5,3),(5,4),(6,1),(6,2),(6,3),(6,4),(7,1),(7,2),(7,3),(7,4),(8,1),(8,2),(8,3),(8,4),(9,1),(9,2),(9,3),(9,4),(10,1),(10,2),(10,3),(11,1),(11,2),(11,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(14,1),(14,2),(14,3),(15,1),(15,2),(15,3),(16,1),(16,2),(16,3),(17,1),(17,2),(17,3),(18,1),(18,2),(18,3),(19,1),(19,2),(19,3),(20,1),(20,2),(20,3),(21,1),(21,2),(22,1),(22,2),(22,3),(23,1),(23,2),(23,3),(24,1),(24,2),(24,3),(25,1),(25,2),(25,3),(26,1),(26,2),(26,3),(27,1),(27,2),(27,3),(28,1),(28,2),(28,3),(29,1),(29,2),(29,3),(30,1),(30,2),(30,3),(31,1),(31,2),(31,3),(32,1),(32,2),(32,3),(33,1),(33,2),(33,3),(34,1),(34,2),(34,3),(35,1),(35,2),(35,3),(36,2),(36,3),(37,2),(37,3),(38,2),(38,3),(39,2),(39,3),(40,2),(40,3),(41,3);
/*!40000 ALTER TABLE `UnitedMedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `User` (
  `id` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `voucher` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('BAAAAAM','1234444','BAAAAM@naver.com','01034459340',2,NULL,1),('bird07','0987','bluebird@naver.com','01098765434',1,NULL,2),('dbgo','1234','dbgo@handong.edu','01056950391',1,'Streaming',3),('handongee','13rs22','handongee@handong.edu','01023595031',5,NULL,4),('jingon','940603','jingonyoo9406@naver.com','01089909406',1,NULL,5),('jinu9406','940614','jinwoo9406@naver.com','01047829406',3,'Streaming',6),('jeonlego','legolego','lego@gmail.com','01012341234',1,NULL,7),('jeon012','012012','012@naver.com','01043214321',1,'Download',8);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Video`
--

DROP TABLE IF EXISTS `Video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `lengthOfVideo` int(11) NOT NULL,
  `releasedDate` date NOT NULL,
  `playCount` int(11) NOT NULL DEFAULT '0',
  `numOfLike` int(11) NOT NULL DEFAULT '0',
  `music_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `Video_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `Music` (`music_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Video`
--

LOCK TABLES `Video` WRITE;
/*!40000 ALTER TABLE `Video` DISABLE KEYS */;
INSERT INTO `Video` VALUES (1,'Poem for Small Things',252,'2019-04-12',6,6,7),(2,'나만,봄',222,'2019-04-02',2,4,1),(3,'사계',210,'2019-03-24',2,3,10),(4,'Different',226,'2019-02-12',0,1,24),(5,'고고베베',226,'2019-03-14',2,2,27),(6,'IDOL',402,'2019-02-01',0,0,19),(7,'Mikrokosmos',278,'2019-03-03',0,0,13),(8,'HOME',326,'2018-09-20',0,0,22),(9,'Make It Right',240,'2014-04-05',0,0,17);
/*!40000 ALTER TABLE `Video` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateUnitedMedia4
AFTER INSERT ON Video
FOR EACH ROW BEGIN
insert into UnitedMedia VALUES(NEW.video_id,4);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER DeleteUnitedMedia4
AFTER DELETE ON Video
FOR EACH ROW BEGIN
DELETE FROM UnitedMedia where old.video_id = media_id AND mediaInfo_id = 4;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `WatchVideo`
--

DROP TABLE IF EXISTS `WatchVideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WatchVideo` (
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `WatchVideo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `WatchVideo_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `Video` (`video_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WatchVideo`
--

LOCK TABLES `WatchVideo` WRITE;
/*!40000 ALTER TABLE `WatchVideo` DISABLE KEYS */;
INSERT INTO `WatchVideo` VALUES (1,1),(1,2),(1,5),(2,1),(2,2),(2,3),(3,1),(4,3),(5,1),(5,5),(7,1),(8,1);
/*!40000 ALTER TABLE `WatchVideo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IncreasePlaycount2
AFTER INSERT ON WatchVideo
for each row begin 
update Video set playCount =  playCount + 1 where new.video_id = video_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER DecreasePlaycount2
AFTER DELETE ON WatchVideo
for each row begin 
update Video set playCount =  playCount - 1 where old.video_id = video_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'genie'
--

--
-- Dumping routines for database 'genie'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 17:48:14
