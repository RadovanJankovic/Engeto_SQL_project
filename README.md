# Sprievodná listina
## 1. Príprava dátových podkladov
Zložka "tabulky" obsahuje SQL kód použitý na vygenerovanie tabuliek "t_radovan_jankovic_project_SQL_primary_final.sql" a "t_radovan_jankovic_project_SQL_secondary_final.sql" z primárnych dátových sád.

Dáta v oboch tabuľkách sa vzťahujú k rovnakým časovým obdobiam (celým rokom, obdobie 2006-2018), aby boli jednoducho porovnateľné. 

Údaje o mzdách v tabuľke ""t_radovan_jankovic_project_SQL_primary_final.sql"" sa týkajú len plných pracovných úväzkov a tabuľka neobsahuje riadky, kde "industry_branch_code" v primárnych zdrojoch nadobúdal hodnotu NULL (celorepublikové údaje).

## 2. Odpovede na výskumné otázky

Jednotlivé SQL dotazy na GitHube sú označené poradovým číslom výskumnej otázky, ako bola uvedená na Engeto portáli.

#### 1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
V priebehu rokov 2006 až 2018 naprieč odvetviami mzdy prevažne stúpali. Vyskytli sa nižšie desiatky prípadov medziročnému poklesu miezd, a to hlavne v rokoch 2009, 2010, 2011 a 2013. Najväčšieho množstva odvetví sa týkal tento medziročný pokles práve v roku 2013 (až 11 z 19  odvetví). 
V segmente "Těžba a dobývání" došlo k medziročnému poklesu miezd aj v rokoch 2014 a 2016. Odvetvia "Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu" sa pokles dotkol v roku 2015.

#### 2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
Za aritmetický priemer miezd naprieč odvetviami si bolo možné kúpiť:
- 1 323 kilogramov chleba a 1 512 litrov mlieka v roku 2006,
- 1 379 kilogramov chleba a 1 655 litrov mlieka v roku 2018.

Na GitHub nájdete dva SQL dotazy: prvý kód vráti dáta striktne za roky 2016 a 2018, druhá varianta vracia (pre prípady zmien v tabuľke) najstaršie a najnovšie dostupné údaje.

#### 3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
V rokoch 2006 až 2018 najpomalšie zdražovali tieto tri položky: "Cukr krystalový", "Rajská jablka červená kulatá" a "Přírodní minerální voda uhličitá".

Na GitHub znova nájdete dve riešenia: prvý SQL dotaz vráti aritmetický priemer medziročných zmien v cenách jednotlivých potravín v rokoch 2006-2018 a zoradí ich vzostupne, druhý dotaz tieto položky zoraďuje vzostupne podľa medziročnej zmeny (nepočíta priemer).

#### 4) Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

Nie, takýto rok neexistuje. Najväčší rozdiel bol v roku 2013, kedy mzdy poklesli o necelých 1,6 % a ceny stúpil o takmer 5 %.

#### 5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
Z dostupných dát sa javí, že medziročná zmena HDP nemá na zmeny cien potravín a výšku miezd automatický (a okamžitý) vplyv. Do hry zrejme vstupuje viacero ekonomických faktorov, ktoré ovplyvňujú ako rast HDP, tak aj ceny potravín a mzdy. Z dát by sa však dalo usúdiť, že v období konštantného ekonomického rastu (2014-2018) stúpajú mzdy rýchlejšie (priemerné mzdy narástli o takmer 5 000 Kč, ceny o necelých 6 Kč) než v období spojenom s hospodárskou krízou (2008-2013; nárast miezd cca 2 500 Kč a cien o približne 5,5 Kč).
