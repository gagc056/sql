-- JOIN

--//CHANGE IT TO SHOW THE MATHCID AND PLAYER NAME FOR GOALS SCORED BY GERMANY
SELECT matchid, player FROM goal
  WHERE teamid = 'GER';

--//SELECT ID, STADIUM, TEAM1, TEAM2 FOR GAME 1012
SELECT id,stadium,team1,team2 FROM game
  WHERE id = 1012;

--//CHANGE IT TO SHOW  PLAYER, TEAMID, STADIUN AND MDATE FOR EVERY GERMAN GOAL
SELECT player, teamid, stadium, mdate FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER';

--//SELECT TEAM1, TEAM2 AND PLAYER FOR EVERY GOAL SCORED BY PLAYER CALLED MARIO
SELECT team1,team2, player FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%';

--//SELECT PLAYER, TEAMID, COACH, GTIME FOR ALL GOALS SCORED IN THE FIRST 10 MINUTES
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON (teamid=id)
  WHERE gtime<=10;

--//SELECT THE DATES OF MATCHES AND NAME OF TEAM IN WHICH 'Fernando Santos' WAS TEAM1 COACH
SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id)
  WHERE coach =  'Fernando Santos';

--//SELECT PLAYER FOR EVERY GOAL SCORED IN A GAME WHERE STADIUM WAS 'National Stadium, Warsaw'
  SELECT player FROM game JOIN goal ON (id=matchid) WHERE stadium =  'National Stadium, Warsaw';

--//SELECT NAME OF ALL PLAYERS WHO SCORED GOAL AGAINST GERMANY
SELECT DISTINCT player FROM game JOIN goal ON matchid = id
    WHERE (team1='GER' OR team2='GER') AND teamid != 'GER';

--//SELECT TEAMNAME AND TOTAL NUMBER OF GOALS SCORED
SELECT teamname, COUNT(player) FROM eteam JOIN goal ON id=teamid GROUP BY teamname;

--//SELECT STADIUM AND NUMBER OF GOALS SCORED IN EACH STADIUM
SELECT stadium, COUNT(player) FROM game JOIN goal ON id=matchid GROUP BY stadium;

--//FOR MATCH INVOLVING 'POL', SELECT MATCHID, DATE AND NUMBER OF GOALS SCORED
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON matchid = id
  WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;

--//FOR MATCH WHERE 'GER' SCORED, SELECT MATCHID, MATCH DATE AND NUMBER OF GOALS SCORED
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON matchid = id
  WHERE(team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER' GROUP BY matchid, mdate;

--//SELECT EVERY MATCH WITH GOALS SCORED BY EACH TEAM AS SHOWN
SELECT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END)as score2
  FROM game LEFT JOIN goal ON matchid = id GROUP BY team1,mdate,team2,matchid ORDER BY mdate, matchid, team1, team2;