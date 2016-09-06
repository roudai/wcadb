DROP TABLE IF EXISTS Podiums;
CREATE TABLE Podiums (
  competitionId varchar(32)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  competitionName varchar(50)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  countryId varchar(50)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  day DATE NOT NULL DEFAULT '0000-00-00',
  eventId varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  sum int(11) NOT NULL DEFAULT '0',
  average int(11)  NOT NULL DEFAULT '0',
  firstPersonId varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  firstPersonName varchar(80)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  firstCountryId varchar(50)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  firstResult int(11) NOT NULL DEFAULT '0',
  secondPersonId varchar(10)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  secondPersonName varchar(80)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  secondCountryId varchar(50)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  secondResult int(11) NOT NULL DEFAULT '0',   
  thirdPersonId varchar(10)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  thirdPersonName varchar(80)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  thirdCountryId varchar(50)  COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  thirdResult int(11) NOT NULL DEFAULT '0' 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO Podiums (competitionId, competitionName, countryId, eventId)
SELECT Results.competitionId, Competitions.name, Competitions.countryId, Results.eventId FROM
Results,Competitions WHERE Results.competitionId = Competitions.id
GROUP BY Results.competitionId, Results.eventId;

DELETE FROM Podiums
WHERE eventId IN ('magic','mmagic','333mbo');

UPDATE Podiums, Results
SET 
Podiums.firstPersonId = Results.personId,
Podiums.firstPersonName = Results.personName,
Podiums.firstCountryId = Results.personCountryId
WHERE Results.roundId IN ('f','c') AND Results.pos = '1' AND Results.best > 0
AND Podiums.competitionId = Results.competitionId AND Podiums.eventId = Results.eventId;

DELETE FROM Podiums
WHERE firstPersonId = "";

UPDATE Podiums, Results
SET 
Podiums.SecondPersonId = Results.personId,
Podiums.SecondPersonName = Results.personName,
Podiums.SecondCountryId = Results.personCountryId
WHERE Results.roundId IN ('f','c') AND Results.pos = '2' AND Results.best > 0
AND Podiums.competitionId = Results.competitionId AND Podiums.eventId = Results.eventId;

UPDATE Podiums, Results
SET 
Podiums.thirdPersonId = Results.personId,
Podiums.thirdPersonName = Results.personName,
Podiums.thirdCountryId = Results.personCountryId
WHERE Results.roundId IN ('f','c') AND Results.pos = '3' AND Results.best > 0
AND Podiums.competitionId = Results.competitionId AND Podiums.eventId = Results.eventId;
