--// SELECT basics

SELECT population FROM world
  WHERE name = 'Germay'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'India');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

