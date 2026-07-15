-- All Baku race appearances by drivers who have won at least once in Baku
-- Uses a subquery to first find the list of Baku winners, then shows all of their Baku results

SELECT 
	d.forename,
	d.surname,
	ra.year,
	ra.name
FROM results AS re

INNER JOIN drivers AS d
ON re.driverid = d.driverid

INNER JOIN races AS ra
ON ra.raceid = re.raceid

WHERE ra.name LIKE '%Azerbaijan%' AND re.driverid IN (
	SELECT re2.driverid
	FROM results AS re2

	INNER JOIN races AS ra2
	ON re2.raceid = ra2.raceid

	WHERE re2.positionorder = 1 AND ra2.name LIKE '%Azerbaijan%'
);SC;