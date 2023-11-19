WITH zmena_mzdy AS (
	SELECT 
		t1.rok AS rok,
		t1.priemer_mzdy_rok AS mzda_minuly_rok,
		t2.priemer_mzdy_rok AS mzda_aktualne,
		ROUND (((AVG (t1.priemer_mzdy_rok)-(AVG (t2.priemer_mzdy_rok)))/AVG(t2.priemer_mzdy_rok))*100,2) AS "medziroc_zmena_mzdy"
	FROM t_radovan_jankovic_project_sql_primary_final t1
	JOIN t_radovan_jankovic_project_sql_primary_final t2 ON t1.rok = t2.rok+1
	GROUP BY t1.rok 
	),
	zmena_ceny AS (
	SELECT
		t1.rok AS rok,
		t1.priemer_cena_zbozi AS ceny_minuly_rok,
		t2.priemer_cena_zbozi AS ceny_aktualne,
		ROUND (((AVG(t1.priemer_cena_zbozi)-(AVG(t2.priemer_cena_zbozi)))/AVG(t2.priemer_cena_zbozi))*100,2) AS "medziroc_zmena_ceny"
	FROM t_radovan_jankovic_project_sql_primary_final t1
	JOIN t_radovan_jankovic_project_sql_primary_final t2 ON t1.rok = t2.rok+1
	GROUP BY t1.rok
	)
SELECT
	t1.rok AS rok,
	medziroc_zmena_mzdy,
	medziroc_zmena_ceny,
	medziroc_zmena_mzdy-medziroc_zmena_ceny AS rozdiel
FROM t_radovan_jankovic_project_sql_primary_final t1
JOIN zmena_mzdy zm ON t1.rok=zm.rok
JOIN zmena_ceny zc ON t1.rok=zc.rok
GROUP BY t1.rok;