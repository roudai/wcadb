DROP TABLE IF EXISTS `RanksSingleTemp`;
DROP TABLE IF EXISTS `RanksAverageTemp`;

-- index
ALTER TABLE  `Competitions` ADD INDEX index_competitions( `id` ) ;
ALTER TABLE  `Persons` ADD INDEX index_persons( `id` ) ;
ALTER TABLE  `RanksAverage` ADD INDEX index_ranksaverage( `personId`,`eventId` ) ;
ALTER TABLE  `RanksSingle` ADD INDEX index_rankssingle( `personId`,`eventId` ) ;
ALTER TABLE  `Results` ADD INDEX index_results( `competitionId`,`eventId`,`roundId`,`best`,`average`,`personId` ) ;
ALTER TABLE  `Scrambles` ADD INDEX index_scrambles( `competitionId`,`eventId`,`roundId`,`groupId`,`isExtra`,`scrambleNum` ) ;

-- Persons
-- 大陸名の追加
ALTER TABLE `Persons` ADD `continentId` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL AFTER `countryId`;
UPDATE `Persons`,`Countries` SET Persons.continentId = Countries.continentId WHERE Persons.countryId = Countries.id;

ALTER TABLE `Persons` ADD 
(
`competitions` INT(11) NOT NULL DEFAULT '0',
`gold` INT( 11 ) NOT NULL DEFAULT '0',
`silver` INT( 11 ) NOT NULL DEFAULT '0',
`bronze` INT( 11 ) NOT NULL DEFAULT '0'
);

-- 大会参加数の追加
UPDATE `Persons`
INNER JOIN (SELECT personId, COUNT(DISTINCT competitionId) competitions FROM Results GROUP BY personId) CompetitionCnt
ON Persons.id = CompetitionCnt.personId 
SET Persons.competitions = CompetitionCnt.competitions;

-- Competitions
-- 大会ごとに連番を追加
ALTER TABLE `Competitions` ADD `competitionNum` INT( 11 ) NOT NULL DEFAULT '0' FIRST;
SET @i := 0;
UPDATE Competitions SET competitionNum = (@i := @i +1);

ALTER TABLE  `Competitions` ADD  `result` INT( 1 ) NOT NULL DEFAULT  '0';

-- 大会結果の有無を追加
UPDATE `Competitions`
INNER JOIN (SELECT competitionId,CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END AS result FROM `Results` GROUP BY competitionId) ResultsCnt
ON Competitions.id = ResultsCnt.competitionId 
SET Competitions.result = ResultsCnt.result;

-- 日本語大会名を追加
ALTER TABLE `Competitions` ADD
(
`jname` VARCHAR( 100 ) COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`jarea` VARCHAR( 10 ) COLLATE utf8_unicode_ci NULL DEFAULT NULL
);

UPDATE Competitions,JCompetitions 
SET Competitions.jname = JCompetitions.jname,Competitions.jarea = JCompetitions.jarea
WHERE Competitions.id = JCompetitions.id;

-- Results
ALTER TABLE `Results` ADD 
(
`bestAndNum` BIGINT( 20 ) NOT NULL DEFAULT '0',
`averageAndNum` BIGINT( 20 ) NOT NULL DEFAULT '0',
`jname` VARCHAR( 100 ) COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`jarea` VARCHAR( 10 ) COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`cellName` VARCHAR( 50 ) COLLATE utf8_unicode_ci NOT NULL,
`countryId` VARCHAR( 50 ) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
`year` smallint( 5 )  unsigned NOT NULL DEFAULT '0',
`month` smallint( 5 )  unsigned NOT NULL DEFAULT '0',
`day` smallint( 5 )  unsigned NOT NULL DEFAULT '0',
`endMonth` smallint( 5 )  unsigned NOT NULL DEFAULT '0',
`endDay` smallint( 5 )  unsigned NOT NULL DEFAULT '0'
);

-- 結果テーブルに大会情報を追加
UPDATE Results,Competitions 
SET Results.bestAndNum = (Results.best * 1000000 + Competitions.competitionNum), Results.averageAndNum = (Results.average * 1000000 + Competitions.competitionNum),
Results.jname = Competitions.jname, Results.jarea = Competitions.jarea, Results.cellName = Competitions.cellName, Results.countryId = Competitions.countryId, Results.year = Competitions.year, Results.month = Competitions.month, 
Results.day = Competitions.day, Results.endMonth = Competitions.endMonth, Results.endDay = Competitions.endDay
WHERE Results.competitionId = Competitions.id;

ALTER TABLE `Results` ADD INDEX index_personal( `personId`,`eventId` ) ;

-- Prize
-- Prizeテーブルの作成
DROP TABLE IF EXISTS `Prize`;
CREATE TABLE `Prize` AS
(SELECT eventId,personId,pos,count(*) AS num FROM `Results` WHERE pos IN('1','2','3') AND best > 0 AND roundId IN('c','f') GROUP BY eventId,personId,pos);

-- 現非公式競技を削除
DELETE FROM `Prize` WHERE eventId IN(SELECT id FROM `Events` WHERE rank > 990);

-- Prizeに入賞回数の追加
UPDATE `Persons`
LEFT OUTER JOIN (SELECT personId,SUM(num) AS gold FROM `Prize` WHERE pos = '1' GROUP BY personId) PrizeGold
ON Persons.id = PrizeGold.personId
LEFT OUTER JOIN (SELECT personId,SUM(num) AS silver FROM `Prize` WHERE pos = '2' GROUP BY personId) PrizeSilver
ON Persons.id = PrizeSilver.personId
LEFT OUTER JOIN (SELECT personId,SUM(num) AS bronze FROM `Prize` WHERE pos = '3' GROUP BY personId) PrizeBronze
ON Persons.id = PrizeBronze.personId 
SET Persons.gold = PrizeGold.gold,Persons.silver = PrizeSilver.silver,Persons.bronze = PrizeBronze.bronze;

-- RanksSingle
CREATE TABLE RanksSingleTemp AS
(SELECT personId,personName,eventId,MIN(bestAndNum) AS bestAndNumMin FROM `Results` WHERE best > 0 GROUP BY personId,eventId ORDER BY eventId,bestAndNumMin);

ALTER TABLE `RanksSingleTemp` ADD
(
`best` INT( 11 ) NOT NULL DEFAULT '0',
`competitionNum` INT( 11 ) NOT NULL DEFAULT '0'
);

UPDATE RanksSingleTemp
SET best = bestAndNumMin DIV 1000000, competitionNum = bestAndNumMin - (bestAndNumMin DIV 1000000) * 1000000;

DROP TABLE IF EXISTS `RanksSingleResults`;
CREATE TABLE RanksSingleResults AS
(
SELECT RanksSingleTemp.personId,RanksSingleTemp.personName,RanksSingleTemp.eventId,RanksSingleTemp.bestAndNumMin,RanksSingleTemp.best,RanksSingleTemp.competitionNum,Competitions.id AS competitionId,Competitions.jname,Competitions.jarea,Competitions.cellName,Competitions.year,Competitions.month,Competitions.day,Competitions.endMonth,Competitions.endDay,Persons.countryId,Persons.continentId,Persons.gender
FROM RanksSingleTemp,Competitions,Persons
WHERE RanksSingleTemp.competitionNum = Competitions.competitionNum AND RanksSingleTemp.personId = Persons.id AND Persons.subid = '1'
ORDER BY RanksSingleTemp.eventId,RanksSingleTemp.best
);

DROP TABLE `RanksSingleTemp`;

-- RanksAverageResults
CREATE TABLE RanksAverageTemp AS
(SELECT personId,personName,eventId,MIN(averageAndNum) AS averageAndNumMin FROM `Results` WHERE average > 0 GROUP BY personId,eventId ORDER BY eventId,averageAndNumMin);

ALTER TABLE `RanksAverageTemp` ADD
(
`average` INT( 11 ) NOT NULL DEFAULT '0',
`competitionNum` INT( 11 ) NOT NULL DEFAULT '0'
);

UPDATE RanksAverageTemp
SET average = averageAndNumMin DIV 1000000, competitionNum = averageAndNumMin - (averageAndNumMin DIV 1000000) * 1000000;

DROP TABLE IF EXISTS `RanksAverageResults`;
CREATE TABLE RanksAverageResults AS
(
SELECT RanksAverageTemp.personId,RanksAverageTemp.personName,RanksAverageTemp.eventId,RanksAverageTemp.averageAndNumMin,RanksAverageTemp.average,RanksAverageTemp.competitionNum,Competitions.id AS competitionId,Competitions.jname,Competitions.jarea,Competitions.cellName,Competitions.year,Competitions.month,Competitions.day,Competitions.endMonth,Competitions.endDay,Persons.countryId,Persons.continentId,Persons.gender
FROM RanksAverageTemp,Competitions,Persons
WHERE RanksAverageTemp.competitionNum = Competitions.competitionNum AND RanksAverageTemp.personId = Persons.id AND Persons.subid = '1'
ORDER BY RanksAverageTemp.eventId,RanksAverageTemp.average
);

DROP TABLE `RanksAverageTemp`;

-- index
ALTER TABLE  `RanksSingleResults` ADD INDEX index_rankssingleresultss( `personId`,`eventId` ) ;
ALTER TABLE  `RanksAverageResults` ADD INDEX index_ranksaverageresults( `personId`,`eventId` ) ;

-- Average Details
ALTER TABLE  `RanksAverageResults` ADD  `value1` INT( 11 ) NOT NULL DEFAULT  '0' AFTER `average` ,
ADD `value2` INT( 11 ) NOT NULL DEFAULT '0' AFTER `value1` ,
ADD `value3` INT( 11 ) NOT NULL DEFAULT '0' AFTER `value2` ,
ADD `value4` INT( 11 ) NOT NULL DEFAULT '0' AFTER `value3` ,
ADD `value5` INT( 11 ) NOT NULL DEFAULT '0' AFTER `value4` ;

UPDATE RanksAverageResults,Results 
SET RanksAverageResults.value1 = Results.value1,RanksAverageResults.value2 = Results.value2,RanksAverageResults.value3 = Results.value3,RanksAverageResults.value4 = Results.value4,RanksAverageResults.value5 = Results.value5
WHERE RanksAverageResults.personId = Results.personId AND RanksAverageResults.competitionId = Results.competitionId AND RanksAverageResults.average = Results.average;

-- RecordsSingle
DROP TABLE IF EXISTS `RecordsSingle`;
CREATE TABLE RecordsSingle AS 
(
SELECT A.* FROM
(SELECT * FROM `RanksSingleResults`) A
INNER JOIN (SELECT countryId,eventId,MIN(best) AS record FROM `RanksSingleResults` GROUP BY countryId,eventId) B 
ON A.countryId = B.countryId AND A.eventId = B.eventId AND A.best = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.countryId,C.rank,A.personName
);
UPDATE RecordsSingle SET gender = 'a';
INSERT INTO RecordsSingle
(
SELECT A.* FROM
(SELECT * FROM `RanksSingleResults`) A
INNER JOIN (SELECT countryId,eventId,gender,MIN(best) AS record FROM `RanksSingleResults` WHERE gender <> '' GROUP BY countryId,eventId,gender) B 
ON A.countryId = B.countryId AND A.eventId = B.eventId AND A.gender = B.gender AND A.best = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.countryId,C.rank,A.personName
);

-- RecordsAverage
DROP TABLE IF EXISTS `RecordsAverage`;
CREATE TABLE RecordsAverage AS 
(
SELECT A.* FROM
(SELECT * FROM `RanksAverageResults`) A
INNER JOIN (SELECT countryId,eventId,MIN(average) AS record FROM `RanksAverageResults` GROUP BY countryId,eventId) B 
ON A.countryId = B.countryId AND A.eventId = B.eventId AND A.average = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.countryId,C.rank,A.personName
);
UPDATE RecordsAverage SET gender = 'a';
INSERT INTO RecordsAverage
(
SELECT A.* FROM
(SELECT * FROM `RanksAverageResults`) A
INNER JOIN (SELECT countryId,eventId,gender,MIN(average) AS record FROM `RanksAverageResults` WHERE gender <> ''  GROUP BY countryId,eventId,gender) B 
ON A.countryId = B.countryId AND A.eventId = B.eventId AND A.gender = B.gender AND A.average = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.countryId,C.rank,A.personName
);

-- CRecordsSingle
DROP TABLE IF EXISTS `CRecordsSingle`;
CREATE TABLE CRecordsSingle AS 
(
SELECT A.* FROM
(SELECT * FROM `RanksSingleResults`) A
INNER JOIN (SELECT continentId,eventId,MIN(best) AS record FROM `RanksSingleResults` GROUP BY continentId,eventId) B 
ON A.continentId = B.continentId AND A.eventId = B.eventId AND A.best = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.continentId,C.rank,A.personName
);
UPDATE CRecordsSingle SET gender = 'a';
INSERT INTO CRecordsSingle
(
SELECT A.* FROM
(SELECT * FROM `RanksSingleResults`) A
INNER JOIN (SELECT continentId,eventId,gender,MIN(best) AS record FROM `RanksSingleResults` WHERE gender <> '' GROUP BY continentId,eventId,gender) B 
ON A.continentId = B.continentId AND A.eventId = B.eventId AND A.gender = B.gender AND A.best = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.continentId,C.rank,A.personName
);

-- CRecordsAverage
DROP TABLE IF EXISTS `CRecordsAverage`;
CREATE TABLE CRecordsAverage AS 
(
SELECT A.* FROM
(SELECT * FROM `RanksAverageResults`) A
INNER JOIN (SELECT continentId,eventId,MIN(average) AS record FROM `RanksAverageResults` GROUP BY continentId,eventId) B 
ON A.continentId = B.continentId AND A.eventId = B.eventId AND A.average = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.continentId,C.rank,A.personName
);
UPDATE CRecordsAverage SET gender = 'a';
INSERT INTO CRecordsAverage
(
SELECT A.* FROM
(SELECT * FROM `RanksAverageResults`) A
INNER JOIN (SELECT continentId,eventId,gender,MIN(average) AS record FROM `RanksAverageResults` WHERE gender <> '' GROUP BY continentId,eventId,gender) B 
ON A.continentId = B.continentId AND A.eventId = B.eventId AND A.gender = B.gender AND A.average = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY A.continentId,C.rank,A.personName
);

-- WRecordsSingle
DROP TABLE IF EXISTS `WRecordsSingle`;
CREATE TABLE WRecordsSingle AS 
(
SELECT A.* FROM
(SELECT * FROM `RanksSingleResults`) A
INNER JOIN (SELECT eventId,MIN(best) AS record FROM `RanksSingleResults` GROUP BY eventId) B ON A.eventId = B.eventId AND A.best = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY C.rank,A.personName
);
UPDATE WRecordsSingle SET gender = 'a';
INSERT INTO WRecordsSingle
(
SELECT A.* FROM
(SELECT * FROM `RanksSingleResults`) A
INNER JOIN (SELECT eventId,gender,MIN(best) AS record FROM `RanksSingleResults` WHERE gender <> '' GROUP BY eventId,gender) B ON A.eventId = B.eventId AND A.gender = B.gender AND A.best = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY C.rank,A.personName
);

-- WRecordsAverage
DROP TABLE IF EXISTS `WRecordsAverage`;
CREATE TABLE WRecordsAverage AS 
(
SELECT A.* FROM
(SELECT * FROM `RanksAverageResults`) A
INNER JOIN (SELECT eventId,MIN(average) AS record FROM `RanksAverageResults` GROUP BY eventId) B ON A.eventId = B.eventId AND A.average = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY C.rank,A.personName
);
UPDATE WRecordsAverage SET gender = 'a';
INSERT INTO WRecordsAverage
(
SELECT A.* FROM
(SELECT * FROM `RanksAverageResults`) A
INNER JOIN (SELECT eventId,gender,MIN(average) AS record FROM `RanksAverageResults` WHERE gender <> '' GROUP BY eventId,gender) B ON A.eventId = B.eventId AND A.gender = B.gender AND A.average = B.record
INNER JOIN (SELECT * FROM `Events`) C ON A.eventId = C.id
ORDER BY C.rank,A.personName
);

ALTER TABLE `RecordsSingle` ADD INDEX index_recordssingle( `personId`,`eventId` );
ALTER TABLE `RecordsAverage` ADD INDEX index_recordaverage( `personId`,`eventId` );
ALTER TABLE `CRecordsSingle` ADD INDEX index_crecordssingle( `personId`,`eventId` );
ALTER TABLE `CRecordsAverage` ADD INDEX index_crecordaverage( `personId`,`eventId` );
ALTER TABLE `WRecordsSingle` ADD INDEX index_wrecordssingle( `personId`,`eventId` );
ALTER TABLE `WRecordsAverage` ADD INDEX index_wrecordaverage( `personId`,`eventId` );

DROP TABLE IF EXISTS `HistoryWR`;
CREATE TABLE HistoryWR
(
SELECT A.*,B.eventRank,C.roundRank FROM
(SELECT personId,eventId,best,average,competitionId,jname,jarea,cellName,countryId,roundId,value1,value2,value3,value4,value5,regionalSingleRecord,regionalAverageRecord,year,month,day,endMonth,endDay FROM `Results` WHERE regionalSingleRecord = 'WR' OR regionalAverageRecord = 'WR') A
INNER JOIN (SELECT id,rank AS eventRank FROM `Events`) B ON A.eventId = B.id
INNER JOIN (SELECT id,rank AS roundRank FROM `Rounds`) C ON A.roundId = C.id
ORDER BY B.eventRank,A.year DESC,A.month DESC,A.day DESC,C.roundRank
);

DROP TABLE IF EXISTS `HistoryCR`;
CREATE TABLE HistoryCR
(
SELECT A.*,B.eventRank,C.roundRank FROM
(SELECT personId,eventId,best,average,competitionId,jname,jarea,cellName,countryId,roundId,value1,value2,value3,value4,value5,regionalSingleRecord,regionalAverageRecord,year,month,day,endMonth,endDay FROM `Results` WHERE regionalSingleRecord IN('AfR','AsR','ER','NAR','OcR','SAR') OR regionalAverageRecord IN('AfR','AsR','ER','NAR','OcR','SAR')) A
INNER JOIN (SELECT id,rank AS eventRank FROM `Events`) B ON A.eventId = B.id
INNER JOIN (SELECT id,rank AS roundRank FROM `Rounds`) C ON A.roundId = C.id
ORDER BY B.eventRank,A.year DESC,A.month DESC,A.day DESC,C.roundRank
);

DROP TABLE IF EXISTS `HistoryNR`;
CREATE TABLE HistoryNR
(
SELECT A.*,B.eventRank,C.roundRank FROM
(SELECT personId,eventId,best,average,competitionId,jname,jarea,cellName,countryId,roundId,value1,value2,value3,value4,value5,regionalSingleRecord,regionalAverageRecord,year,month,day,endMonth,endDay FROM `Results` WHERE regionalSingleRecord = 'NR' OR regionalAverageRecord = 'NR') A
INNER JOIN (SELECT id,rank AS eventRank FROM `Events`) B ON A.eventId = B.id
INNER JOIN (SELECT id,rank AS roundRank FROM `Rounds`) C ON A.roundId = C.id
ORDER BY B.eventRank,A.year DESC,A.month DESC,A.day DESC,C.roundRank
);

DROP TABLE IF EXISTS `PodiumWorld`;
CREATE TABLE PodiumWorld AS
(
SELECT A.*,B.rank FROM
(SELECT personId,competitionId,countryId,eventId,pos,best,average,value1,value2,value3,value4,value5 FROM `Results` WHERE pos <= '3' AND roundId IN('c','f') AND best>0 AND competitionId LIKE 'WC%') A
INNER JOIN (SELECT id,rank FROM `Events`) B ON A.eventId = B.id
ORDER BY A.competitionId DESC,B.rank,A.pos
);

DROP TABLE IF EXISTS `PodiumAsian`;
CREATE TABLE PodiumAsian AS
(
SELECT A.*,B.rank FROM
(SELECT personId,competitionId,countryId,eventId,pos,best,average,value1,value2,value3,value4,value5 FROM `Results` WHERE pos <= '3' AND roundId IN('c','f') AND best>0 AND competitionId LIKE 'Asian%') A
INNER JOIN (SELECT id,rank FROM `Events`) B ON A.eventId = B.id
ORDER BY A.competitionId DESC,B.rank,A.pos
);

DROP TABLE IF EXISTS `PodiumEuro`;
CREATE TABLE PodiumEuro AS
(
SELECT A.*,B.rank FROM
(SELECT personId,competitionId,countryId,eventId,pos,best,average,value1,value2,value3,value4,value5 FROM `Results` WHERE pos <= '3' AND roundId IN('c','f') AND best>0 AND competitionId LIKE 'Euro%%') A
INNER JOIN (SELECT id,rank FROM `Events`) B ON A.eventId = B.id
ORDER BY A.competitionId DESC,B.rank,A.pos
);

DROP TABLE IF EXISTS `PodiumJapan`;
CREATE TABLE PodiumJapan AS
(
SELECT A.*,B.rank FROM
(SELECT personId,competitionId,countryId,eventId,pos,best,average,value1,value2,value3,value4,value5 FROM `Results` WHERE pos <= '3' AND roundId IN('c','f') AND best>0 AND (competitionId LIKE 'JapanOpen%' OR competitionId IN('Japan2005','Japan2006'))) A
INNER JOIN (SELECT id,rank FROM `Events`) B ON A.eventId = B.id
ORDER BY A.competitionId DESC,B.rank,A.pos
);

ALTER TABLE `HistoryWR` ADD INDEX index_historywr( `personId` );
ALTER TABLE `HistoryCR` ADD INDEX index_historycr( `personId` );
ALTER TABLE `HistoryNR` ADD INDEX index_historynr( `personId` );
ALTER TABLE `PodiumWorld` ADD INDEX index_worldpodium( `personId` );
ALTER TABLE `PodiumAsian` ADD INDEX index_asianpodium( `personId` );
ALTER TABLE `PodiumEuro` ADD INDEX index_europodium( `personId` );
ALTER TABLE `PodiumJapan` ADD INDEX index_japanpodium( `personId` );
