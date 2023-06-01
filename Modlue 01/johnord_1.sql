--====================================================== 
--John Ord
--CIS338: SQL / Oracle
--UNIT 1, CHAPTER 1 Assignment
--======================================================

--1--
SELECT firstname, lastname, pledgedate, pledgeamt
FROM dd_donor e, dd_pledge G
WHERE paymonths = 0
and e.iddonor = g.iddonor;

--2--
SELECT firstname, lastname, pledgedate, pledgeamt,
(pledgeamt/paymonths) AS monthlypayments
FROM dd_pledge, dd_donor
WHERE paymonths = 12
AND dd_donor.iddonor = dd_pledge.iddonor;

--3--
SELECT UNIQUE j.idproj, j.projname
FROM dd_project j, dd_pledge l
WHERE j.idproj = l.idproj
ORDER BY j.idproj;

--4--
SELECT e.iddonor, firstname, lastname, COUNT(g.iddonor) AS number_of_pledges
FROM dd_donor e, dd_pledge g
WHERE e.iddonor = g.iddonor
GROUP BY e.iddonor, firstname, lastname
ORDER BY number_of_pledges, e.iddonor;

--5--
SELECT *
FROM dd_pledge
WHERE pledgedate < '08-MAR-12'
ORDER BY idpledge;