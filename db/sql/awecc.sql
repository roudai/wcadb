DROP TABLE IF EXISTS Awecc;
CREATE TABLE Awecc (
  rank varchar(10)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  id varchar(10)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  name varchar(80)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  countryId varchar(50)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  HoWR varchar(10)  COLLATE utf8_unicode_ci DEFAULT NULL,
  HoCR varchar(10)  COLLATE utf8_unicode_ci DEFAULT NULL,
  WCPodium varchar(10)  COLLATE utf8_unicode_ci DEFAULT NULL,
  day DATE NOT NULL DEFAULT '0000-00-00',
  lack varchar(10)  COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/* Platinum member */
INSERT INTO Awecc
(
SELECT 'Platinum' AS rank, Person.id, Person.name, Person.countryId ,HistoryWR.done AS HoWR, HistoryCR.done AS HoCR, WCPodium.done AS WCP, '0000-00-00' AS day, NULL FROM
(SELECT personId,count(*) AS num FROM RanksSingle GROUP BY personId HAVING num = '18') Single
INNER JOIN
(SELECT personId,count(*) AS num FROM RanksAverage GROUP BY personId HAVING num = '15') Average
ON Single.personId = Average.personId
INNER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE regionalSingleRecord = 'WR' OR regionalAverageRecord = 'WR' GROUP BY personId) HistoryWR
ON Single.personId = HistoryWR.personId
INNER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE regionalSingleRecord IN('AfR','AsR','ER','NAR','OcR','SAR') OR regionalAverageRecord IN('AfR','AsR','ER','NAR','OcR','SAR') GROUP BY personId) HistoryCR
ON Single.personId = HistoryCR.personId
INNER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE competitionId LIKE 'WC%' AND pos IN('1','2','3') AND best <> '-1' AND roundId IN('c','f') GROUP BY personId) WCPodium
ON Single.personId = WCPodium.personId
INNER JOIN
(SELECT * FROM Persons WHERE subid = '1') Person
ON Single.personId = Person.Id
);

/* Gold member */
INSERT INTO Awecc
(
SELECT 'Gold' AS rank, Person.id, Person.name, Person.countryId ,HistoryWR.done AS HoWR, HistoryCR.done AS HoCR, WCPodium.done AS WCP, '0000-00-00' AS day, NULL FROM
(SELECT personId,count(*) AS num FROM RanksSingle GROUP BY personId HAVING num = '18') Single
INNER JOIN
(SELECT personId,count(*) AS num FROM RanksAverage GROUP BY personId HAVING num = '15') Average
ON Single.personId = Average.personId
LEFT OUTER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE regionalSingleRecord = 'WR' OR regionalAverageRecord = 'WR' GROUP BY personId) HistoryWR
ON Single.personId = HistoryWR.personId
LEFT OUTER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE regionalSingleRecord IN('AfR','AsR','ER','NAR','OcR','SAR') OR regionalAverageRecord IN('AfR','AsR','ER','NAR','OcR','SAR') GROUP BY personId) HistoryCR
ON Single.personId = HistoryCR.personId
LEFT OUTER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE competitionId LIKE 'WC%' AND pos IN('1','2','3') AND best <> '-1' AND roundId IN('c','f') GROUP BY personId) WCPodium
ON Single.personId = WCPodium.personId
INNER JOIN
(SELECT * FROM Persons WHERE subid = '1') Person
ON Single.personId = Person.Id
WHERE HistoryWR.personId IS NULL OR HistoryCR.personId IS NULL OR WCPodium.personId IS NULL
);

/* Bronze member */
INSERT INTO Awecc
(
SELECT 'Bronze' AS rank, Person.id, Person.name, Person.countryId ,HistoryWR.done AS HoWR, HistoryCR.done AS HoCR, WCPodium.done, '0000-00-00' AS day, NULL FROM
(SELECT personId,count(*) AS num FROM RanksSingle GROUP BY personId HAVING num = '18') Single
LEFT OUTER JOIN
(SELECT personId,count(*) AS num FROM RanksAverage GROUP BY personId HAVING num = '15') Average
ON Single.personId = Average.personId
LEFT OUTER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE regionalSingleRecord = 'WR' OR regionalAverageRecord = 'WR' GROUP BY personId) HistoryWR
ON Single.personId = HistoryWR.personId
LEFT OUTER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE regionalSingleRecord IN('AfR','AsR','ER','NAR','OcR','SAR') OR regionalAverageRecord IN('AfR','AsR','ER','NAR','OcR','SAR') GROUP BY personId) HistoryCR
ON Single.personId = HistoryCR.personId
LEFT OUTER JOIN
(SELECT personId, 'Done!' AS done FROM Results WHERE competitionId LIKE 'WC%' AND pos IN('1','2','3') AND best <> '-1' AND roundId IN('c','f') GROUP BY personId) WCPodium
ON Single.personId = WCPodium.personId
INNER JOIN
(SELECT * FROM Persons WHERE subid = '1') Person
ON Single.personId = Person.Id
WHERE Average.personId IS NULL
);

/* One event missing */
INSERT INTO Awecc
(
SELECT 'Missing' AS rank, Person.id, Person.name, Person.countryId , NULL, NULL, NULL, NULL, NULL FROM
(SELECT personId,count(*) AS num FROM RanksSingle GROUP BY personId HAVING num = '17') Single
INNER JOIN
(SELECT * FROM Persons WHERE subid = '1') Person
ON Single.personId = Person.Id
);

