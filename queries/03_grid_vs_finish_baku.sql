-- Grid (starting) position vs finishing position at the Azerbaijan Grand Prix
-- Positive "positions_gained" means the driver finished higher than they started

SELECT
	d.forename,
	d.surname,
	ra.year,
	re.grid,
	re.positionOrder,
	re.grid - re.positionOrder AS positions_gained
FROM drivers AS d

INNER JOIN results AS re
ON d.driverid = re.driverid

INNER JOIN races AS ra
ON ra.raceid = re.raceid

WHERE ra.name LIKE '%Azerbaijan%'
ORDER BY positions_gained DESC;