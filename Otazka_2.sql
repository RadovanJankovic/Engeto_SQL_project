## Riešenie č.1

SELECT 
	t1.rok,
	ROUND (AVG ((t1.priemer_mzdy_rok)/t1.priemer_cena_zbozi)) AS "mnozstvo chleba",
	ROUND (AVG ((t2.priemer_mzdy_rok)/t2.priemer_cena_zbozi)) AS "mnozstvo mleka"
FROM t_radovan_jankovic_project_sql_primary_final t1 
JOIN t_radovan_jankovic_project_sql_primary_final t2 ON t1.rok=t2.rok
WHERE t1.rok IN (2006, 2018) AND t1.nazov_potraviny="Chléb konzumní kmínový" AND t2.nazov_potraviny="Mléko polotučné pasterované"
GROUP BY t1.rok;



## Riešenie č.2

WITH krajne_hodnoty AS (
	SELECT 
	MIN(t1.rok) AS "najstarsia_hodnota",
	MAX (t1.rok) AS "najnovsia_hodnota"
	FROM t_radovan_jankovic_project_sql_primary_final t1
	)
SELECT
t2.rok,
ROUND (AVG (t2.priemer_mzdy_rok/t2.priemer_cena_zbozi)) AS "mnozstvo chleba",
ROUND (AVG (t3.priemer_mzdy_rok/t3.priemer_cena_zbozi)) AS "mnozstvo mleka"
FROM t_radovan_jankovic_project_sql_primary_final t2
JOIN krajne_hodnoty kh ON t2.rok=kh.najstarsia_hodnota OR t2.rok=kh.najnovsia_hodnota
JOIN t_radovan_jankovic_project_sql_primary_final t3 ON t3.rok=t2.rok 
WHERE t2.nazov_potraviny="Chléb konzumní kmínový" AND t3.nazov_potraviny="Mléko polotučné pasterované"
GROUP BY (t2.rok);
