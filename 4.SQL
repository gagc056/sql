-- SELECT WITHIN SELECT TUTOTIAL

--//SELECT COUNTRIES NAME WHERE POPULATION IS LARGER THAN 'Russia'
SELECT name FROM world
  WHERE population > (SELECT population FROM world
      WHERE name='Russia');

--//SELECT COUNTRIES IN EUROPE WITH A GDP GREATER THAN 'United Kingdom'
SELECT name FROM world
  WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world
      WHERE name='United Kingdom');

--// SELCT NAME AND CONTINENT OF COUNTRIES IN THE CONTINENTS CONTAINING EITHER ARGENTINA OR AUSTALIA ORDER BY NAME OF THE COUNTRY
SELECT name, continent FROM world
  WHERE continent = (SELECT continent FROM world
    WHERE name = 'Australia') OR continent = (SELECT continent FROM world
      WHERE name = 'Argentina') ORDER BY name;

--// SELECT NAME AND  POPULATION FROM COUNTRIES WITH A POPULATION THAT IS GREATER THAN CANADA BUT LESS THAN POLAND
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world
    WHERE name = 'Canada') AND population < (SELECT population FROM world
      WHERE name = 'Poland');

--//SELECT  NAME AND  POPULATION OF EACH COUNTRY IN EUROPE AND THE POPULATION AS A PERCENTAGE OF  POPULATION OF GERMANY
SELECT name, concat(ROUND(100*population/(SELECT population
FROM world WHERE name = 'Germany')), '%') FROM world
  WHERE continent = 'Europe';

--//SELECT COUNTRIES WITH A GDP GREATER THAN EVERY COUNTRY IN EUROPE
SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world
    WHERE continent = 'Europe' AND gdp >0);

--//SELECT THE LARGEST COUNTRY BY AREA IN EACH CONTINENT, SHOW THE CONTINENT, NAME AND AREA
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0);

--//SELECT EACH CONTINENT AND  NAME OF COUNTRY THAT COMES FIRST ALPHABETICALLY
SELECT continent, name FROM world x
  WHERE name <= ALL (SELECT name FROM world y
    WHERE y.continent = x.continent);

--//SELCET CONTINENTS WHERE  COUNTRIES HAVE  POPULATION LOWER THAN 25000000 AND FIND  NAMES OF  COUNTRIES ASSOCIATED WITH THESE CONTINENTS. SHOW NAME, CONTINENT AND POPULATION.
SELECT name, continent, population FROM world
  WHERE continent IN (SELECT continent FROM world  x
    WHERE 25000000 >= (SELECT MAX(population) FROM world y
      WHERE x.continent = y.continent));

--//SELECT COUNTRIES WITH A POPULATION  THEREE TIME GREATER THAN ANY OF THEIR NEIGHBOURS IN THE SAME CONTINENT
SELECT name, continent FROM world x
  WHERE population > ALL (SELECT population*3 FROM world y
    WHERE y.continent = x.continent AND y.name != x.name);