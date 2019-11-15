-- SELF JOIN

--//HOW MANY STOPS ARE IN THE DATABASE
SELECT COUNT(name) FROM stops;

--//FIND ID VALUE FOR THE STOP 'Craiglockhart'
SELECT id FROM stops
  WHERE name = 'Craiglockhart';

--//GIVE ID AND THE NAME FOR THE STOPS ON THE '4' 'LRT' SERVICE
SELECT id, name FROM stops JOIN route ON  id = stop
  WHERE num = 4 AND company = 'LRT';

--//RUN THE QUERY AND NOTICE THE TWO SERVICES THAT LINK THESE STOPS HAVE A COUNT OF 2. ADD A HAVING CLAUSE TO RESTRICT THE OUTPUT TO THESE TWO ROUTES
SELECT company, num, COUNT(*) FROM route
  WHERE stop=149 OR stop=53 GROUP BY company, num HAVING COUNT(*) = 2;

--//EXECUTE THE SELF JOIN SHOWN AND OBSERVE THAT b.stop GIVES ALL THE PLACES YOU CAN GET TO FROM Craiglockhart, WITHOUT CHANGING ROUTES. CHANGE THE QUERY SO THAT IT SHOWS THE SERVICES FROM Craiglockhart TO LONDON ROAD
SELECT a.company, a.num, a.stop, b.stop FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  WHERE a.stop=53 AND b.stop = 149;

--//CHANGE THE QUERY SO THAT THE SERVICES BETWEEN 'Craiglockhart' AND 'London Road' ARE SHOWN
SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

--//SELECT LIST OF ALL SERVICES WHICH CONNECT STOPS 115 AND 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  WHERE a.stop=115 AND b.stop = 137;

--//SELECT A LIST OF SERVICES WHICH CONNECT THE STOPS 'Craiglockhart' AND 'Tollcross'
SELECT a.company, a.num FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num) JOIN stops stopa ON (a.stop = stopa.id) JOIN stops stopb ON (b.stop = stopb.id)
  WHERE stopa.name ='Craiglockhart' AND stopb.name = 'Tollcross';

--//SELECT A DISTINCT LIST OF STOPS WHICH MAY BE REACHED FROM 'Craiglockhart' BY TAKING ONE BUS, INCLUDING 'Craiglockhart' ITSELF, OFFERED BY THE LRT COMPANY. INCLUDE COMPANY AND BUS No. OF THE RELEVANT SERVICES
SELECT stopb.name, a.company, a.num
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Craiglockhart';
--//FIND THE ROUTES INVOLVING TWO BUSES THAT CAN GO FROM Craiglockhart TO Lochend. SHOW THE BUS No. AND COMPANY FOR THE FIRST BUS, THE NAME OF THE STOP FOR THE TRANSFER, AND THE BUS No. AND COMPANY FOR SECOND BUS
SELECT  a.num, a.company, stopb.name, d.num, d.company FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num) JOIN ( route c JOIN route d ON (c.company = d.company AND c.num= d.num))
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  JOIN stops stopc ON (c.stop=stopc.id)
JOIN stops stopd ON (d.stop=stopd.id)
  WHERE  stopa.name = 'Craiglockhart' AND stopd.name = 'Lochend' AND  stopb.name = stopc.name;