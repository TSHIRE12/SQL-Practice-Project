--------epl data table------------------------------------------------------

select * from epl_results


----------------remove unwanted date(1899-12-30) from Time column---------------------

alter table epl_results 
add ConvertedTime time

update epl_results
set ConvertedTime = CONVERT(time, [Time])

alter table epl_results
drop column [Time]

------------------list of all matches ended in draw-------------------------------

select HomeTeam, AwayTeam, FTHG, FTAG
from epl_results
where FTHG = FTAG

------------------------list of matches Man City won----------------------------------

select HomeTeam, AwayTeam, FTHG, FTAG
from epl_results 
where(HomeTeam = 'Man City' and FTHG > FTAG)
or (HomeTeam = 'Man City' and FTAG < FTHG)

--------------------------adding totalgoalscored column in a table----------------------------

select * from epl_results

alter table epl_results
add totalGoalScored int

update epl_results
set totalGoalScored = FTHG + FTAG


------------------------top 3 of matches with many goals-----------------------------------

select top(3) HomeTeam, AwayTeam, FTHG, FTAG, totalGoalScored
from epl_results
order by totalGoalScored desc







