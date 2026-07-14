
-- Total constructor (team) points at the Azerbaijan Grand Prix (Baku)
-- Ranks teams by cumulative points scored across all Baku races

SELECT 
	c.name,
	SUM(re.points) AS totalpoints
FROM races AS ra

INNER JOIN results AS re
ON ra.raceid = re.raceid

INNER JOIN constructors AS c
ON re.constructorid = c.constructorid

WHERE ra.name LIKE '%Azerbaijan%'

GROUP BY c.name

ORDER BY totalpoints DESC