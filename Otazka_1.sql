SELECT 
	DISTINCT t1.rok,
	t1.nazev_odvetvi,
	t1.kod_odvetvi,
	t1.priemer_mzdy_rok AS 'Mzda v aktualnom roku',
	t2.priemer_mzdy_rok AS 'Mzda v predoslom roku',
	CASE 
	WHEN t1.priemer_mzdy_rok > t2.priemer_mzdy_rok THEN 'Narast'
	WHEN t1.priemer_mzdy_rok < t2.priemer_mzdy_rok THEN 'Pokles'
	ELSE 'Stagnácia'
	END AS 'Trend'
FROM t_radovan_jankovic_project_sql_primary_final AS t1
JOIN
	(
		SELECT
		t2.rok,
		t2.nazev_odvetvi,
		t2.kod_odvetvi,
		t2.priemer_mzdy_rok
		FROM t_radovan_jankovic_project_sql_primary_final AS t2
		) t2
ON t1.rok = t2.rok+1 AND t1.kod_odvetvi = t2.kod_odvetvi;