SELECT Results.competitionId,Results.eventId,Competitions.countryId,Competitions.name FROM
Results,Competitions WHERE Results.competitionId = Competitions.id
GROUP BY Results.competitionId, Results.eventId
