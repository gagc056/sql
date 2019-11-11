--//SELECT FROM NOBEL

--//SELECT NOBEL PRIZES FOR 1950
SELECT yr, subject, winner FROM nobel
  WHERE yr = 1950;

--//SELECT THE NOBEL PRIZE OF LITERATURE ON 1962
SELECT winner FROM nobel
  WHERE yr = 1962 AND subject = 'literature'

--//SELECT THE YEAR AND SUBJECT THAT WON ALBERT EINSTEIN HIS PRIZE
SELECT yr, subject FROM nobel
 WHERE winner = 'Albert Einstein';

--//SELECT THE NAME OF THE PEACE WINNERS SINCE 2000
SELECT winner FROM nobel
  WHERE subject = 'Peace' AND yr >= 2000;

--//SELECT THE YEAR NAME AND SUBJECT OF THE  LITERATURE PEACE WINNERS FOR 1980 TO 1989
SELECT yr, subject, winner FROM nobel
  WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989;

-- //SELECT ALL DETAILS OF THE PRESIDENTIAL WINNERS
SELECT * FROM nobel
 WHERE winner = 'Theodore Roosevelt' OR winner = 'Woodrow Wilson' OR winner = 'Jimmy Carter' OR winner = 'Barack Obama';

--//SELECT  WINNERS WITH FIRST NAME JHON
SELECT winner FROM nobel
 WHERE winner LIKE 'John%';

--// SELECT YEAR, SUBJECT AND NAME OF PHYSICS WINNERS FOR 1980 TOGHETER WITH THE CHEMISTRY WINNERS FOR 1984
SELECT yr, subject, winner FROM nobel
 WHERE subject ='Physics' AND yr =1980 OR subject ='Chemistry' AND yr =1984;

--// SELECT YEAR, SUBJECT AND NAME OF WINNERS FOR 1980 EXCLUDING CHEMESTRY AND MEDICINE
SELECT yr, subject, winner FROM nobel
 WHERE subject NOT IN ('Chemistry', 'Medicine') AND yr = 1980;

--// SELECT YEAR, SUBJECT AND NAME OF PEOPLE WHO WON aA 'Medicine' PRIZE IN AN EARLY YEAR BEFORE 1910, NOT INCLUDING 1910) TOGETHER WITH WINNERS OF A 'Literature' PRIZE IN A LATER YEAR AFTER 2004
SELECT yr, subject, winner FROM nobel
 WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;

--// SELECT ALL DETAILS OF  PRIZE WON BY PETER GRÜNBERG
SELECT * FROM nobel
  WHERE winner  = 'Peter GrÜnberg';

--// SELECT ALL DETAILS OF PRIZE WON BY EUGENE O'NEILL
SELECT * FROM nobel
 WHERE winner  = 'Eugene O\'Neill';

--// SELECT  WINNERS, YEAR AND SUBJECT WHERE THE WINNER START WITH Sir. SHOW THE  MOST RECENT FIRST, THEN BY NAME
SELECT winner, yr, subject FROM nobel
 WHERE winner LIKE 'Sir%';

--// SELECT THE 1984 WINNERS AND SUBJECT ORDERED BY SUBJECT ADN WINNER NAME BUT LIST CHEMESTRY AND  PHYSICS LAST
SELECT winner, subject FROM nobel
   WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;
