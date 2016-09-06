-- KinchRanksWorld

DROP TABLE IF EXISTS `KinchRanksWorld`;
CREATE TABLE `KinchRanksWorld`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksWorld` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksWorld` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksWorldAverageTemp`;
CREATE TABLE `KinchRanksWorldAverageTemp` AS
( 
SELECT RanksAverage.personId,RanksAverage.eventId,RanksAverage.best,WRecordsAverage.average,
round((WRecordsAverage.average/RanksAverage.best)*100,2) AS score
FROM RanksAverage,WRecordsAverage WHERE WRecordsAverage.gender = 'a' AND RanksAverage.eventId = WRecordsAverage.eventId collate utf8_general_ci
);

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333 = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.444 = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.555 = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.222 = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333oh = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333ft = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.minx = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.pyram = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.sq1 = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.clock = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.skewb = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.666 = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.777 = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333bf = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldSingleTemp`;
CREATE TABLE `KinchRanksWorldSingleTemp` AS
( 
SELECT RanksSingle.personId,RanksSingle.eventId,RanksSingle.best,WRecordsSingle.best AS Wbest,
round((WRecordsSingle.best/RanksSingle.best)*100,2) AS score
FROM RanksSingle,WRecordsSingle WHERE WRecordsSingle.gender = 'a' AND RanksSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci
);

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333bf = KinchEvents.score WHERE KinchRanksWorld.333bf < KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333fm = KinchEvents.score WHERE KinchRanksWorld.333fm < KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.444bf = KinchEvents.score;

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldMbfTemp`;
CREATE TABLE `KinchRanksWorldMbfTemp` AS
( 
SELECT RanksSingle.personId,RanksSingle.eventId,
round(((99-CAST(SUBSTRING(RanksSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingle.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(WRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(WRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingle,WRecordsSingle  WHERE WRecordsSingle.gender = 'a' AND RanksSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci AND RanksSingle.eventId = '333mbf'
);

UPDATE `KinchRanksWorld`
INNER JOIN (SELECT * FROM KinchRanksWorldMbfTemp) KinchEvents
ON KinchRanksWorld.personId = KinchEvents.personId
SET KinchRanksWorld.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksWorldSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksWorldMbfTemp`;

UPDATE `KinchRanksWorld`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksWorldFemale

DROP TABLE IF EXISTS `KinchRanksWorldFemale`;
CREATE TABLE `KinchRanksWorldFemale`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksWorldFemale` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksWorldFemale` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksWorldFemaleAverageTemp`;
CREATE TABLE `KinchRanksWorldFemaleAverageTemp` AS
( 
SELECT RanksAverage.personId,RanksAverage.eventId,RanksAverage.best,WRecordsAverage.average,
round((WRecordsAverage.average/RanksAverage.best)*100,2) AS score
FROM RanksAverage,WRecordsAverage WHERE WRecordsAverage.gender = 'f' AND RanksAverage.eventId = WRecordsAverage.eventId collate utf8_general_ci
);

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333 = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.444 = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.555 = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.222 = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333oh = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333ft = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.minx = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.pyram = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.sq1 = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.clock = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.skewb = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.666 = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.777 = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333bf = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldFemaleSingleTemp`;
CREATE TABLE `KinchRanksWorldFemaleSingleTemp` AS
( 
SELECT RanksSingle.personId,RanksSingle.eventId,RanksSingle.best,WRecordsSingle.best AS Wbest,
round((WRecordsSingle.best/RanksSingle.best)*100,2) AS score
FROM RanksSingle,WRecordsSingle WHERE WRecordsSingle.gender = 'f' AND RanksSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci
);

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333bf = KinchEvents.score WHERE KinchRanksWorldFemale.333bf < KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333fm = KinchEvents.score WHERE KinchRanksWorldFemale.333fm < KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.444bf = KinchEvents.score;

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldFemaleMbfTemp`;
CREATE TABLE `KinchRanksWorldFemaleMbfTemp` AS
( 
SELECT RanksSingle.personId,RanksSingle.eventId,
round(((99-CAST(SUBSTRING(RanksSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingle.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(WRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(WRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingle,WRecordsSingle  WHERE WRecordsSingle.gender = 'f' AND RanksSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci AND RanksSingle.eventId = '333mbf'
);

UPDATE `KinchRanksWorldFemale`
INNER JOIN (SELECT * FROM KinchRanksWorldFemaleMbfTemp) KinchEvents
ON KinchRanksWorldFemale.personId = KinchEvents.personId
SET KinchRanksWorldFemale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldFemaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksWorldFemaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksWorldFemaleMbfTemp`;

UPDATE `KinchRanksWorldFemale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksWorldMale

DROP TABLE IF EXISTS `KinchRanksWorldMale`;
CREATE TABLE `KinchRanksWorldMale`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksWorldMale` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksWorldMale` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksWorldMaleAverageTemp`;
CREATE TABLE `KinchRanksWorldMaleAverageTemp` AS
( 
SELECT RanksAverage.personId,RanksAverage.eventId,RanksAverage.best,WRecordsAverage.average,
round((WRecordsAverage.average/RanksAverage.best)*100,2) AS score
FROM RanksAverage,WRecordsAverage WHERE WRecordsAverage.gender = 'm' AND RanksAverage.eventId = WRecordsAverage.eventId collate utf8_general_ci
);

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333 = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.444 = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.555 = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.222 = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333oh = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333ft = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.minx = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.pyram = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.sq1 = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.clock = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.skewb = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.666 = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.777 = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333bf = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldMaleSingleTemp`;
CREATE TABLE `KinchRanksWorldMaleSingleTemp` AS
( 
SELECT RanksSingle.personId,RanksSingle.eventId,RanksSingle.best,WRecordsSingle.best AS Wbest,
round((WRecordsSingle.best/RanksSingle.best)*100,2) AS score
FROM RanksSingle,WRecordsSingle WHERE WRecordsSingle.gender = 'm' AND RanksSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci
);

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333bf = KinchEvents.score WHERE KinchRanksWorldMale.333bf < KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333fm = KinchEvents.score WHERE KinchRanksWorldMale.333fm < KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.444bf = KinchEvents.score;

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldMaleMbfTemp`;
CREATE TABLE `KinchRanksWorldMaleMbfTemp` AS
( 
SELECT RanksSingle.personId,RanksSingle.eventId,
round(((99-CAST(SUBSTRING(RanksSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingle.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(WRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(WRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingle,WRecordsSingle  WHERE WRecordsSingle.gender = 'm' AND RanksSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci AND RanksSingle.eventId = '333mbf'
);

UPDATE `KinchRanksWorldMale`
INNER JOIN (SELECT * FROM KinchRanksWorldMaleMbfTemp) KinchEvents
ON KinchRanksWorldMale.personId = KinchEvents.personId
SET KinchRanksWorldMale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksWorldMaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksWorldMaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksWorldMaleMbfTemp`;

UPDATE `KinchRanksWorldMale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksContinent

DROP TABLE IF EXISTS `KinchRanksContinent`;
CREATE TABLE `KinchRanksContinent`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksContinent` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksContinent` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksContinentAverageTemp`;
CREATE TABLE `KinchRanksContinentAverageTemp` AS
( 
SELECT RanksAverageResults.personId,RanksAverageResults.continentId,RanksAverageResults.eventId,RanksAverageResults.average,CRecordsAverage.average AS Caverage,
round((CRecordsAverage.average/RanksAverageResults.average)*100,2) AS score
FROM RanksAverageResults,CRecordsAverage WHERE CRecordsAverage.gender = 'a' AND RanksAverageResults.eventId = CRecordsAverage.eventId collate utf8_general_ci AND RanksAverageResults.continentId = CRecordsAverage.continentId collate utf8_general_ci
);

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333 = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.444 = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.555 = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.222 = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333oh = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333ft = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.minx = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.pyram = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.sq1 = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.clock = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.skewb = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.666 = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.777 = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333bf = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentSingleTemp`;
CREATE TABLE `KinchRanksContinentSingleTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.continentId,RanksSingleResults.eventId,RanksSingleResults.best,CRecordsSingle.best AS Cbest,
round((CRecordsSingle.best/RanksSingleResults.best)*100,2) AS score
FROM RanksSingleResults,CRecordsSingle WHERE CRecordsSingle.gender = 'a' AND RanksSingleResults.eventId = CRecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.continentId = CRecordsSingle.continentId collate utf8_general_ci
);

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333bf = KinchEvents.score WHERE KinchRanksContinent.333bf < KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333fm = KinchEvents.score WHERE KinchRanksContinent.333fm < KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.444bf = KinchEvents.score;

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentMbfTemp`;
CREATE TABLE `KinchRanksContinentMbfTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.continentId,RanksSingleResults.eventId,
round(((99-CAST(SUBSTRING(RanksSingleResults.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingleResults.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(CRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(CRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingleResults,CRecordsSingle WHERE CRecordsSingle.gender = 'a' AND RanksSingleResults.eventId = CRecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.continentId = CRecordsSingle.continentId collate utf8_general_ci AND RanksSingleResults.eventId = '333mbf'
);

UPDATE `KinchRanksContinent`
INNER JOIN (SELECT * FROM KinchRanksContinentMbfTemp) KinchEvents
ON KinchRanksContinent.personId = KinchEvents.personId
SET KinchRanksContinent.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksContinentSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksContinentMbfTemp`;

UPDATE `KinchRanksContinent`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksContinentFemale

DROP TABLE IF EXISTS `KinchRanksContinentFemale`;
CREATE TABLE `KinchRanksContinentFemale`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksContinentFemale` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksContinentFemale` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksContinentFemaleAverageTemp`;
CREATE TABLE `KinchRanksContinentFemaleAverageTemp` AS
( 
SELECT RanksAverageResults.personId,RanksAverageResults.continentId,RanksAverageResults.eventId,RanksAverageResults.average,CRecordsAverage.average AS Caverage,
round((CRecordsAverage.average/RanksAverageResults.average)*100,2) AS score
FROM RanksAverageResults,CRecordsAverage WHERE CRecordsAverage.gender = 'f' AND RanksAverageResults.eventId = CRecordsAverage.eventId collate utf8_general_ci AND RanksAverageResults.continentId = CRecordsAverage.continentId collate utf8_general_ci
);

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333 = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.444 = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.555 = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.222 = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333oh = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333ft = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.minx = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.pyram = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.sq1 = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.clock = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.skewb = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.666 = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.777 = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333bf = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentFemaleSingleTemp`;
CREATE TABLE `KinchRanksContinentFemaleSingleTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.continentId,RanksSingleResults.eventId,RanksSingleResults.best,CRecordsSingle.best AS Cbest,
round((CRecordsSingle.best/RanksSingleResults.best)*100,2) AS score
FROM RanksSingleResults,CRecordsSingle WHERE CRecordsSingle.gender = 'f' AND RanksSingleResults.eventId = CRecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.continentId = CRecordsSingle.continentId collate utf8_general_ci
);

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333bf = KinchEvents.score WHERE KinchRanksContinentFemale.333bf < KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333fm = KinchEvents.score WHERE KinchRanksContinentFemale.333fm < KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.444bf = KinchEvents.score;

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentFemaleMbfTemp`;
CREATE TABLE `KinchRanksContinentFemaleMbfTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.continentId,RanksSingleResults.eventId,
round(((99-CAST(SUBSTRING(RanksSingleResults.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingleResults.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(CRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(CRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingleResults,CRecordsSingle WHERE CRecordsSingle.gender = 'f' AND RanksSingleResults.eventId = CRecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.continentId = CRecordsSingle.continentId collate utf8_general_ci AND RanksSingleResults.eventId = '333mbf'
);

UPDATE `KinchRanksContinentFemale`
INNER JOIN (SELECT * FROM KinchRanksContinentFemaleMbfTemp) KinchEvents
ON KinchRanksContinentFemale.personId = KinchEvents.personId
SET KinchRanksContinentFemale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentFemaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksContinentFemaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksContinentFemaleMbfTemp`;

UPDATE `KinchRanksContinentFemale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksContinentMale

DROP TABLE IF EXISTS `KinchRanksContinentMale`;
CREATE TABLE `KinchRanksContinentMale`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksContinentMale` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksContinentMale` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksContinentMaleAverageTemp`;
CREATE TABLE `KinchRanksContinentMaleAverageTemp` AS
( 
SELECT RanksAverageResults.personId,RanksAverageResults.continentId,RanksAverageResults.eventId,RanksAverageResults.average,CRecordsAverage.average AS Caverage,
round((CRecordsAverage.average/RanksAverageResults.average)*100,2) AS score
FROM RanksAverageResults,CRecordsAverage WHERE CRecordsAverage.gender = 'm' AND RanksAverageResults.eventId = CRecordsAverage.eventId collate utf8_general_ci AND RanksAverageResults.continentId = CRecordsAverage.continentId collate utf8_general_ci
);

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333 = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.444 = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.555 = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.222 = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333oh = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333ft = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.minx = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.pyram = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.sq1 = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.clock = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.skewb = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.666 = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.777 = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333bf = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentMaleSingleTemp`;
CREATE TABLE `KinchRanksContinentMaleSingleTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.continentId,RanksSingleResults.eventId,RanksSingleResults.best,CRecordsSingle.best AS Cbest,
round((CRecordsSingle.best/RanksSingleResults.best)*100,2) AS score
FROM RanksSingleResults,CRecordsSingle WHERE CRecordsSingle.gender = 'm' AND RanksSingleResults.eventId = CRecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.continentId = CRecordsSingle.continentId collate utf8_general_ci
);

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333bf = KinchEvents.score WHERE KinchRanksContinentMale.333bf < KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333fm = KinchEvents.score WHERE KinchRanksContinentMale.333fm < KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.444bf = KinchEvents.score;

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentMaleMbfTemp`;
CREATE TABLE `KinchRanksContinentMaleMbfTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.continentId,RanksSingleResults.eventId,
round(((99-CAST(SUBSTRING(RanksSingleResults.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingleResults.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(CRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(CRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingleResults,CRecordsSingle WHERE CRecordsSingle.gender = 'm' AND RanksSingleResults.eventId = CRecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.continentId = CRecordsSingle.continentId collate utf8_general_ci AND RanksSingleResults.eventId = '333mbf'
);

UPDATE `KinchRanksContinentMale`
INNER JOIN (SELECT * FROM KinchRanksContinentMaleMbfTemp) KinchEvents
ON KinchRanksContinentMale.personId = KinchEvents.personId
SET KinchRanksContinentMale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksContinentMaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksContinentMaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksContinentMaleMbfTemp`;

UPDATE `KinchRanksContinentMale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksRegion

DROP TABLE IF EXISTS `KinchRanksRegion`;
CREATE TABLE `KinchRanksRegion`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksRegion` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksRegion` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksRegionAverageTemp`;
CREATE TABLE `KinchRanksRegionAverageTemp` AS
( 
SELECT RanksAverageResults.personId,RanksAverageResults.countryId,RanksAverageResults.eventId,RanksAverageResults.average,RecordsAverage.average AS Raverage,
round((RecordsAverage.average/RanksAverageResults.average)*100,2) AS score
FROM RanksAverageResults,RecordsAverage WHERE RecordsAverage.gender = 'a' AND RanksAverageResults.eventId = RecordsAverage.eventId collate utf8_general_ci AND RanksAverageResults.countryId = RecordsAverage.countryId collate utf8_general_ci
);

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333 = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.444 = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.555 = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.222 = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333oh = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333ft = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.minx = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.pyram = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.sq1 = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.clock = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.skewb = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.666 = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.777 = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333bf = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionSingleTemp`;
CREATE TABLE `KinchRanksRegionSingleTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.countryId,RanksSingleResults.eventId,RanksSingleResults.best,RecordsSingle.best AS Rbest,
round((RecordsSingle.best/RanksSingleResults.best)*100,2) AS score
FROM RanksSingleResults,RecordsSingle WHERE RecordsSingle.gender = 'a' AND RanksSingleResults.eventId = RecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.countryId = RecordsSingle.countryId collate utf8_general_ci
);

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333bf = KinchEvents.score WHERE KinchRanksRegion.333bf < KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333fm = KinchEvents.score WHERE KinchRanksRegion.333fm < KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.444bf = KinchEvents.score;

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionMbfTemp`;
CREATE TABLE `KinchRanksRegionMbfTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.countryId,RanksSingleResults.eventId,
round(((99-CAST(SUBSTRING(RanksSingleResults.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingleResults.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(RecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingleResults,RecordsSingle WHERE RecordsSingle.gender = 'a' AND RanksSingleResults.eventId = RecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.countryId = RecordsSingle.countryId collate utf8_general_ci AND RanksSingleResults.eventId = '333mbf'
);

UPDATE `KinchRanksRegion`
INNER JOIN (SELECT * FROM KinchRanksRegionMbfTemp) KinchEvents
ON KinchRanksRegion.personId = KinchEvents.personId
SET KinchRanksRegion.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksRegionSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksRegionMbfTemp`;

UPDATE `KinchRanksRegion`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksRegionFemale

DROP TABLE IF EXISTS `KinchRanksRegionFemale`;
CREATE TABLE `KinchRanksRegionFemale`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksRegionFemale` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksRegionFemale` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksRegionFemaleAverageTemp`;
CREATE TABLE `KinchRanksRegionFemaleAverageTemp` AS
( 
SELECT RanksAverageResults.personId,RanksAverageResults.countryId,RanksAverageResults.eventId,RanksAverageResults.average,RecordsAverage.average AS Raverage,
round((RecordsAverage.average/RanksAverageResults.average)*100,2) AS score
FROM RanksAverageResults,RecordsAverage WHERE RecordsAverage.gender = 'f' AND RanksAverageResults.eventId = RecordsAverage.eventId collate utf8_general_ci AND RanksAverageResults.countryId = RecordsAverage.countryId collate utf8_general_ci
);

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333 = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.444 = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.555 = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.222 = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333oh = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333ft = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.minx = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.pyram = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.sq1 = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.clock = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.skewb = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.666 = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.777 = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333bf = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionFemaleSingleTemp`;
CREATE TABLE `KinchRanksRegionFemaleSingleTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.countryId,RanksSingleResults.eventId,RanksSingleResults.best,RecordsSingle.best AS Rbest,
round((RecordsSingle.best/RanksSingleResults.best)*100,2) AS score
FROM RanksSingleResults,RecordsSingle WHERE RecordsSingle.gender = 'f' AND RanksSingleResults.eventId = RecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.countryId = RecordsSingle.countryId collate utf8_general_ci
);

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333bf = KinchEvents.score WHERE KinchRanksRegionFemale.333bf < KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333fm = KinchEvents.score WHERE KinchRanksRegionFemale.333fm < KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.444bf = KinchEvents.score;

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionFemaleMbfTemp`;
CREATE TABLE `KinchRanksRegionFemaleMbfTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.countryId,RanksSingleResults.eventId,
round(((99-CAST(SUBSTRING(RanksSingleResults.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingleResults.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(RecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingleResults,RecordsSingle WHERE RecordsSingle.gender = 'f' AND RanksSingleResults.eventId = RecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.countryId = RecordsSingle.countryId collate utf8_general_ci AND RanksSingleResults.eventId = '333mbf'
);

UPDATE `KinchRanksRegionFemale`
INNER JOIN (SELECT * FROM KinchRanksRegionFemaleMbfTemp) KinchEvents
ON KinchRanksRegionFemale.personId = KinchEvents.personId
SET KinchRanksRegionFemale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionFemaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksRegionFemaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksRegionFemaleMbfTemp`;

UPDATE `KinchRanksRegionFemale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

-- KinchRanksRegionMale

DROP TABLE IF EXISTS `KinchRanksRegionMale`;
CREATE TABLE `KinchRanksRegionMale`
(
SELECT id AS personId,name,countryId,continentId,gender FROM Persons
WHERE subid = '1' ORDER BY id
);
ALTER TABLE `KinchRanksRegionMale` ADD
(
`Score` DECIMAL(16,2) DEFAULT 0.00,
`ScoreMain` DECIMAL(16,2) DEFAULT 0.00,
`Score333` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBig` DECIMAL(16,2) DEFAULT 0.00,
`ScoreBld` DECIMAL(16,2) DEFAULT 0.00,
`ScoreVar` DECIMAL(16,2) DEFAULT 0.00,
`333` DECIMAL(16,2) DEFAULT 0.00,
`444` DECIMAL(16,2) DEFAULT 0.00,
`555` DECIMAL(16,2) DEFAULT 0.00,
`222` DECIMAL(16,2) DEFAULT 0.00,
`333oh` DECIMAL(16,2) DEFAULT 0.00,
`333ft` DECIMAL(16,2) DEFAULT 0.00,
`minx` DECIMAL(16,2) DEFAULT 0.00,
`pyram` DECIMAL(16,2) DEFAULT 0.00,
`sq1` DECIMAL(16,2) DEFAULT 0.00,
`clock` DECIMAL(16,2) DEFAULT 0.00,
`skewb` DECIMAL(16,2) DEFAULT 0.00,
`666` DECIMAL(16,2) DEFAULT 0.00,
`777` DECIMAL(16,2) DEFAULT 0.00,
`333bf` DECIMAL(16,2) DEFAULT 0.00,
`333fm` DECIMAL(16,2) DEFAULT 0.00,
`444bf` DECIMAL(16,2) DEFAULT 0.00,
`555bf` DECIMAL(16,2) DEFAULT 0.00,
`333mbf` DECIMAL(16,2) DEFAULT 0.00
);
ALTER TABLE  `KinchRanksRegionMale` ADD INDEX (  `personId` ) ;

DROP TABLE IF EXISTS `KinchRanksRegionMaleAverageTemp`;
CREATE TABLE `KinchRanksRegionMaleAverageTemp` AS
( 
SELECT RanksAverageResults.personId,RanksAverageResults.countryId,RanksAverageResults.eventId,RanksAverageResults.average,RecordsAverage.average AS Raverage,
round((RecordsAverage.average/RanksAverageResults.average)*100,2) AS score
FROM RanksAverageResults,RecordsAverage WHERE RecordsAverage.gender = 'm' AND RanksAverageResults.eventId = RecordsAverage.eventId collate utf8_general_ci AND RanksAverageResults.countryId = RecordsAverage.countryId collate utf8_general_ci
);

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333 = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.444 = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.555 = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.222 = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333oh = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333ft = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.minx = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.pyram = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.sq1 = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.clock = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.skewb = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.666 = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.777 = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333bf = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionMaleSingleTemp`;
CREATE TABLE `KinchRanksRegionMaleSingleTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.countryId,RanksSingleResults.eventId,RanksSingleResults.best,RecordsSingle.best AS Rbest,
round((RecordsSingle.best/RanksSingleResults.best)*100,2) AS score
FROM RanksSingleResults,RecordsSingle WHERE RecordsSingle.gender = 'm' AND RanksSingleResults.eventId = RecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.countryId = RecordsSingle.countryId collate utf8_general_ci
);

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333bf = KinchEvents.score WHERE KinchRanksRegionMale.333bf < KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333fm = KinchEvents.score WHERE KinchRanksRegionMale.333fm < KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.444bf = KinchEvents.score;

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionMaleMbfTemp`;
CREATE TABLE `KinchRanksRegionMaleMbfTemp` AS
( 
SELECT RanksSingleResults.personId,RanksSingleResults.countryId,RanksSingleResults.eventId,
round(((99-CAST(SUBSTRING(RanksSingleResults.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RanksSingleResults.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(RecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RanksSingleResults,RecordsSingle WHERE RecordsSingle.gender = 'm' AND RanksSingleResults.eventId = RecordsSingle.eventId collate utf8_general_ci AND RanksSingleResults.countryId = RecordsSingle.countryId collate utf8_general_ci AND RanksSingleResults.eventId = '333mbf'
);

UPDATE `KinchRanksRegionMale`
INNER JOIN (SELECT * FROM KinchRanksRegionMaleMbfTemp) KinchEvents
ON KinchRanksRegionMale.personId = KinchEvents.personId
SET KinchRanksRegionMale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksRegionMaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksRegionMaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksRegionMaleMbfTemp`;

UPDATE `KinchRanksRegionMale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;
