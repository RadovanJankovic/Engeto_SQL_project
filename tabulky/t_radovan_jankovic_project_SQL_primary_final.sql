CREATE TABLE t_radovan_jankovic_project_sql_primary_final AS
SELECT 
mzdy.payroll_year AS 'rok',
ceny.category_code AS 'kod_potraviny',
kod.name AS 'nazov_potraviny',
ROUND (AVG (ceny.value)) AS 'priemer_cena_zbozi',
mzdy.industry_branch_code AS 'kod_odvetvi',
odvetvi.name AS 'nazev_odvetvi',
ROUND (AVG (mzdy.value)) AS 'priemer_mzdy_rok'
FROM czechia_price AS ceny
JOIN czechia_price_category AS kod 
	ON ceny.category_code = kod.code
JOIN czechia_payroll AS mzdy
	ON YEAR (ceny.date_from) = mzdy.payroll_year 
JOIN czechia_payroll_industry_branch AS odvetvi
	ON mzdy.industry_branch_code = odvetvi.code 
WHERE mzdy.value_type_code=5958 AND mzdy.unit_code=200 AND mzdy.calculation_code=200 AND ceny.region_code IS NULL AND mzdy.industry_branch_code IS NOT NULL
GROUP BY mzdy.payroll_year, ceny.category_code, mzdy.industry_branch_code;
