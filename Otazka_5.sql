SELECT 
	t1.rok,
	AVG (t1.priemer_cena_zbozi) AS "priemerne_ceny",
	AVG (t1.priemer_mzdy_rok) AS "priemerna_mzda",
	t2.GDP AS "HDP"
FROM t_radovan_jankovic_project_sql_primary_final t1
JOIN t_radovan_jankovic_project_sql_seconday_final t2 ON t1.rok=t2.`year` 
WHERE t2.country="Czech Republic"
GROUP BY t2.`year`;
