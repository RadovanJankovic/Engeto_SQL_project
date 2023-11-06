SELECT 
	e.country,
	e.GDP,
	e.gini,
	e.`year`
FROM economies e 
CROSS JOIN countries c ON e.country = c.country AND e.YEAR >= 2006 AND e.YEAR <= 2018
WHERE c.continent = 'Europe'
ORDER BY e.YEAR;
