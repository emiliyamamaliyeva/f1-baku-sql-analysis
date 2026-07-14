-- Winners of the Azerbaijan Grand Prix (Baku) by year

SELECT
	ra.year,
	ra.name,
	re.points,
	d.forename,
	d.surname
FROM races AS ra
LEFT JOIN results AS re
	ON ra.raceid = re.raceid
LEFT JOIN drivers AS d
	ON re.driverid = d.driverid
WHERE ra.name LIKE '%Azerbaijan%' AND re.positionOrder = 1;
