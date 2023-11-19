## Riešenie č.1

WITH medzirocna_zmena AS (
	SELECT
	t1.rok AS rok,
	t1.nazov_potraviny AS potravina,
	((t1.priemer_cena_zbozi-t2.priemer_cena_zbozi)/t2.priemer_cena_zbozi)*100 AS "zmena"
	FROM t_radovan_jankovic_project_sql_primary_final t1
	JOIN t_radovan_jankovic_project_sql_primary_final t2 ON t1.rok = t2.rok+1 AND t1.nazov_potraviny=t2.nazov_potraviny
	)
SELECT 
	mz.potravina,
	ROUND (AVG(zmena)) AS "priemerna_medzirocna_zmena"
FROM medzirocna_zmena mz 
GROUP BY mz.potravina
ORDER BY priemerna_medzirocna_zmena ASC;



## Riešenie č.2

SELECT
	DISTINCT t1.rok AS rok,
	t1.nazov_potraviny AS potravina,
	((t1.priemer_cena_zbozi-t2.priemer_cena_zbozi)/t2.priemer_cena_zbozi)*100 AS "zmena"
FROM t_radovan_jankovic_project_sql_primary_final t1
JOIN t_radovan_jankovic_project_sql_primary_final t2 ON t1.rok = t2.rok+1 AND t1.nazov_potraviny=t2.nazov_potraviny
ORDER BY zmena;