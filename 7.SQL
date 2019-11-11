-- More JOIN operations

--//SELECT ID AND TITLE FROM FILMS WHERE yr IS 1962
SELECT id, title FROM movie
 WHERE yr=1962;

--//SELECT YEAR OF 'Citizen Kane'
SELECT yr FROM movie
  WHERE title = 'Citizen Kane';

--//SELECT ALL STAR TREK MOVIES, THE ID, TITLE AND yr
SELECT id, title, yr FROM movie
  WHERE title LIKE 'Star Trek%' ORDER BY yr;

--// SELECT ID NUMBER WHERE THE ACTOR 'Glenn Close'
SELECT id FROM actor
  WHERE name ='Glenn Close';

--//SELECT ID FROM FILM 'Casablanca'
SELECT id FROM movie
  WHERE title = 'Casablanca';

--//SELECT CAST LIST FOR 'Casablanca' USING movieid=11768
SELECT name FROM casting JOIN actor ON actorid = id
  WHERE movieid = 11768;

--//SELECT CAST LIST FOR THE FILM 'Alien'
SELECT name FROM casting JOIN actor ON actorid = actor.id JOIN movie ON movieid = movie.id
  WHERE title = 'Alien';

--//SELECT FILMS IN WHIC 'Harrison Ford' HAS APPEARED
SELECT title FROM casting JOIN actor ON actorid = actor.id JOIN movie ON movieid = movie.id
  WHERE name = 'Harrison Ford';

--//SELECT FILMS WHERE 'Harrison Ford' has appeared  BUT NOT IN  STARRING ROLE
SELECT title FROM casting JOIN actor ON actorid = actor.id JOIN movie ON movieid = movie.id
  WHERE name = 'Harrison Ford' AND ord != 1;

--//SELECT FILMS TOGETHER WITH THE LEADING STAR FOR ALL 1962 FILMS
SELECT title, name FROM casting JOIN actor ON actorid = actor.id JOIN movie ON movieid = movie.id
WHERE yr = 1962 AND ord = 1;

--// SELECT THE BUSIEST YEAR FOR 'Rock Hudson', SHOW YEAR AND NUMBER OF MOVIES HE MADE EACH YEAR FOR ANY YEAR IN WHICH HE MADE MORE THAN 2 MOVIES
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id
  WHERE name='Rock Hudson' GROUP BY yr HAVING COUNT(title) > 2;

--//SELECT FILM TITLE AND LEADING ACTOR FOR ALL THE FILMS 'Julie Andrews' PLAYED IN
SELECT title, name FROM movie JOIN casting ON (movieid = movie.id AND ord =1) JOIN actor ON (actorid = actor.id)
  WHERE movie.id IN (SELECT movieid FROM casting
    WHERE actorid IN (SELECT id FROM actor
      WHERE name='Julie Andrews'));

--// SELECT A LIST IN ALPHABETICHAL ORDER OF ACTORS WHO'VE HAD AT LEAST 30 STARRING ROLES
SELECT actor.name FROM actor JOIN casting ON casting.actorid = actor.id
  WHERE ord = 1 GROUP BY name HAVING COUNT(*) >= 30;

--//SELECT FILMS RELEASED IN 1978 ORDERED BY NUMBER OF ACTORS IN THE CAST, THEN BY TITLE
SELECT title, COUNT(actorid) FROM  casting JOIN actor ON actorid = actor.id JOIN movie ON movieid = movie.id
  WHERE yr = 1978 GROUP BY movieid, movie.title ORDER BY COUNT(name) DESC, title;

--//SELECT PEOPLE WHO HAVE WORKED WITH 'Art Garfunkel'
SELECT DISTINCT name FROM movie JOIN casting ON (movieid = movie.id) JOIN actor ON (actorid = actor.id)
  WHERE movie.id IN (SELECT movieid FROM casting
    WHERE actorid IN (SELECT id FROM actor
      WHERE name='Art Garfunkel')) AND name != 'Art Garfunkel'