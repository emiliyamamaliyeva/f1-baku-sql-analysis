-- Number of podium finishes (top 3) per driver at the Azerbaijan Grand Prix

SELECT 
	d.forename,
	d.surname,
	COUNT(re.positionorder) AS podium_count
FROM drivers AS d

INNER JOIN results AS re
ON d.driverid = re.driverid

INNER JOIN races AS ra
ON ra.raceid = re.raceid

WHERE ra.name LIKE '%Azerbaijan%' AND re.positionorder IN (1, 2, 3)
GROUP BY d.forename, d.surname
ORDER BY podium_count DESC;