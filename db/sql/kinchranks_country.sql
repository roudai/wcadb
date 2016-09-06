--- KinchRanksCountry

DROP TABLE IF EXISTS `KinchRanksCountry`;
CREATE TABLE `KinchRanksCountry`
(
SELECT countryId FROM `Persons` WHERE subid = '1' GROUP BY countryId ORDER BY countryId
);
ALTER TABLE `KinchRanksCountry` ADD
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
ALTER TABLE  `KinchRanksWorld` ADD INDEX ( `countryId` ) ;

DROP TABLE IF EXISTS `KinchRanksCountryAverageTemp`;
CREATE TABLE `KinchRanksCountryAverageTemp` AS
( 
SELECT RecordsAverage.countryId,RecordsAverage.eventId,RecordsAverage.average as best,WRecordsAverage.average,
round((WRecordsAverage.average/RecordsAverage.average)*100,2) AS score
FROM RecordsAverage,WRecordsAverage WHERE RecordsAverage.gender = 'a' AND WRecordsAverage.gender = 'a' AND RecordsAverage.eventId = WRecordsAverage.eventId collate utf8_general_ci
);

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333 = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.444 = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.555 = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.222 = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333oh = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333ft = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.minx = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.pyram = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.sq1 = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.clock = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.skewb = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.666 = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.777 = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333bf = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountrySingleTemp`;
CREATE TABLE `KinchRanksCountrySingleTemp` AS
( 
SELECT RecordsSingle.countryId,RecordsSingle.eventId,RecordsSingle.best,WRecordsSingle.best AS Wbest,
round((WRecordsSingle.best/RecordsSingle.best)*100,2) AS score
FROM RecordsSingle,WRecordsSingle WHERE RecordsSingle.gender = 'a' AND WRecordsSingle.gender = 'a' AND RecordsSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci
);

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountrySingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333bf = KinchEvents.score WHERE KinchRanksCountry.333bf < KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountrySingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333fm = KinchEvents.score WHERE KinchRanksCountry.333fm < KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountrySingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.444bf = KinchEvents.score;

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountrySingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryMbfTemp`;
CREATE TABLE `KinchRanksCountryMbfTemp` AS
( 
SELECT RecordsSingle.countryId,RecordsSingle.eventId,
round(((99-CAST(SUBSTRING(RecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RecordsSingle.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(WRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(WRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RecordsSingle,WRecordsSingle WHERE RecordsSingle.gender = 'a' AND WRecordsSingle.gender = 'a' AND RecordsSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci AND RecordsSingle.eventId = '333mbf'
);

UPDATE `KinchRanksCountry`
INNER JOIN (SELECT * FROM KinchRanksCountryMbfTemp) KinchEvents
ON KinchRanksCountry.countryId = KinchEvents.countryId
SET KinchRanksCountry.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksCountrySingleTemp`;
DROP TABLE IF EXISTS `KinchRanksCountryMbfTemp`;

UPDATE `KinchRanksCountry`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

--- KinchRanksCountryMale

DROP TABLE IF EXISTS `KinchRanksCountryMale`;
CREATE TABLE `KinchRanksCountryMale`
(
SELECT countryId FROM `Persons` WHERE subid = '1' GROUP BY countryId ORDER BY countryId
);
ALTER TABLE `KinchRanksCountryMale` ADD
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
ALTER TABLE  `KinchRanksWorld` ADD INDEX ( `countryId` ) ;

DROP TABLE IF EXISTS `KinchRanksCountryMaleAverageTemp`;
CREATE TABLE `KinchRanksCountryMaleAverageTemp` AS
( 
SELECT RecordsAverage.countryId,RecordsAverage.eventId,RecordsAverage.average as best,WRecordsAverage.average,
round((WRecordsAverage.average/RecordsAverage.average)*100,2) AS score
FROM RecordsAverage,WRecordsAverage WHERE RecordsAverage.gender = 'm' AND WRecordsAverage.gender = 'm' AND RecordsAverage.eventId = WRecordsAverage.eventId collate utf8_general_ci
);

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333 = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.444 = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.555 = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.222 = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333oh = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333ft = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.minx = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.pyram = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.sq1 = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.clock = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.skewb = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.666 = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.777 = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333bf = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryMaleSingleTemp`;
CREATE TABLE `KinchRanksCountryMaleSingleTemp` AS
( 
SELECT RecordsSingle.countryId,RecordsSingle.eventId,RecordsSingle.best,WRecordsSingle.best AS Wbest,
round((WRecordsSingle.best/RecordsSingle.best)*100,2) AS score
FROM RecordsSingle,WRecordsSingle WHERE RecordsSingle.gender = 'm' AND WRecordsSingle.gender = 'm' AND RecordsSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci
);

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333bf = KinchEvents.score WHERE KinchRanksCountryMale.333bf < KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333fm = KinchEvents.score WHERE KinchRanksCountryMale.333fm < KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.444bf = KinchEvents.score;

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryMaleMbfTemp`;
CREATE TABLE `KinchRanksCountryMaleMbfTemp` AS
( 
SELECT RecordsSingle.countryId,RecordsSingle.eventId,
round(((99-CAST(SUBSTRING(RecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RecordsSingle.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(WRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(WRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RecordsSingle,WRecordsSingle WHERE RecordsSingle.gender = 'm' AND WRecordsSingle.gender = 'm' AND RecordsSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci AND RecordsSingle.eventId = '333mbf'
);

UPDATE `KinchRanksCountryMale`
INNER JOIN (SELECT * FROM KinchRanksCountryMaleMbfTemp) KinchEvents
ON KinchRanksCountryMale.countryId = KinchEvents.countryId
SET KinchRanksCountryMale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryMaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksCountryMaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksCountryMaleMbfTemp`;

UPDATE `KinchRanksCountryMale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

--- KinchRanksCountryFemale

DROP TABLE IF EXISTS `KinchRanksCountryFemale`;
CREATE TABLE `KinchRanksCountryFemale`
(
SELECT countryId FROM `Persons` WHERE subid = '1' GROUP BY countryId ORDER BY countryId
);
ALTER TABLE `KinchRanksCountryFemale` ADD
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
ALTER TABLE  `KinchRanksWorld` ADD INDEX ( `countryId` ) ;

DROP TABLE IF EXISTS `KinchRanksCountryFemaleAverageTemp`;
CREATE TABLE `KinchRanksCountryFemaleAverageTemp` AS
( 
SELECT RecordsAverage.countryId,RecordsAverage.eventId,RecordsAverage.average as best,WRecordsAverage.average,
round((WRecordsAverage.average/RecordsAverage.average)*100,2) AS score
FROM RecordsAverage,WRecordsAverage WHERE RecordsAverage.gender = 'f' AND WRecordsAverage.gender = 'f' AND RecordsAverage.eventId = WRecordsAverage.eventId collate utf8_general_ci
);

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '333') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333 = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '444') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.444 = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '555') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.555 = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '222') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.222 = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '333oh') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333oh = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '333ft') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333ft = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = 'minx') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.minx = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = 'pyram') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.pyram = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = 'sq1') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.sq1 = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = 'clock') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.clock = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = 'skewb') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.skewb = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '666') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.666 = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '777') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.777 = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333bf = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleAverageTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333fm = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryFemaleSingleTemp`;
CREATE TABLE `KinchRanksCountryFemaleSingleTemp` AS
( 
SELECT RecordsSingle.countryId,RecordsSingle.eventId,RecordsSingle.best,WRecordsSingle.best AS Wbest,
round((WRecordsSingle.best/RecordsSingle.best)*100,2) AS score
FROM RecordsSingle,WRecordsSingle WHERE RecordsSingle.gender = 'f' AND WRecordsSingle.gender = 'f' AND RecordsSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci
);

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleSingleTemp WHERE eventId = '333bf') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333bf = KinchEvents.score WHERE KinchRanksCountryFemale.333bf < KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleSingleTemp WHERE eventId = '333fm') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333fm = KinchEvents.score WHERE KinchRanksCountryFemale.333fm < KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleSingleTemp WHERE eventId = '444bf') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.444bf = KinchEvents.score;

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleSingleTemp WHERE eventId = '555bf') KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.555bf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryFemaleMbfTemp`;
CREATE TABLE `KinchRanksCountryFemaleMbfTemp` AS
( 
SELECT RecordsSingle.countryId,RecordsSingle.eventId,
round(((99-CAST(SUBSTRING(RecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(RecordsSingle.best,3,5) AS SIGNED))/3600),4))/
((99-CAST(SUBSTRING(WRecordsSingle.best,1,2) AS SIGNED))+round(((3600-CAST(SUBSTRING(WRecordsSingle.best,3,5) AS SIGNED))/3600),4))*100,2) AS score
FROM RecordsSingle,WRecordsSingle WHERE RecordsSingle.gender = 'f' AND WRecordsSingle.gender = 'f' AND RecordsSingle.eventId = WRecordsSingle.eventId collate utf8_general_ci AND RecordsSingle.eventId = '333mbf'
);

UPDATE `KinchRanksCountryFemale`
INNER JOIN (SELECT * FROM KinchRanksCountryFemaleMbfTemp) KinchEvents
ON KinchRanksCountryFemale.countryId = KinchEvents.countryId
SET KinchRanksCountryFemale.333mbf = KinchEvents.score;

DROP TABLE IF EXISTS `KinchRanksCountryFemaleAverageTemp`;
DROP TABLE IF EXISTS `KinchRanksCountryFemaleSingleTemp`;
DROP TABLE IF EXISTS `KinchRanksCountryFemaleMbfTemp`;

UPDATE `KinchRanksCountryFemale`
SET `Score` = (`333`+`444`+`555`+`222`+`333oh`+`333ft`+`minx`+`pyram`+`sq1`+`clock`+`skewb`+`666`+`777`+`333bf`+`333fm`+`444bf`+`555bf`+`333mbf`)/18,
`ScoreMain` = (`222`+`333`+`444`+`555`)/4,
`Score333` = (`333`+`333oh`+`333ft`+`333bf`+`333fm`)/5,
`ScoreBig` = (`555`+`666`+`777`)/3,
`ScoreBld` = (`333bf`+`444bf`+`555bf`+`333mbf`)/4,
`ScoreVar` = (`minx`+`pyram`+`sq1`+`clock`+`skewb`)/5;

