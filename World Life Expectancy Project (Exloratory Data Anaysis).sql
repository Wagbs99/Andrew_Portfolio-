-- World Life Expectancy Project (Exloratory Data Anaysis)

SELECT *
FROM world_life_expectancy
;



SELECT country,
MIN(`Life expectancy`), 
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY country 
HAVING  MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0 
ORDER BY Life_Increase_15_Years DESC 
;


SELECT year, ROUND(AVG(`Life expectancy`), 2)
FROM world_life_expectancy
WHERE`Life expectancy` <> 0
AND `Life expectancy` <> 0 
GROUP BY year 
ORDER BY year
; 

SELECT *
FROM world_life_expectancy
;


SELECT country, ROUND(AVG(`Life expectancy`),1)AS Life_Exp , ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY country
HAVING Life_Exp > 0
AND GDP> 0  
ORDER BY Life_Exp ASC
; 

SELECT 	
SUM(CASE  WHEN GDP >=1500 THEN 1 ELSE 0 END)High_GDP_Count,
AVG(CASE  WHEN GDP >=1500 THEN `Life expectancy` ELSE NULL END)High_GDP_Life_expectancy,
SUM(CASE  WHEN GDP <=1500 THEN 1 ELSE 0 END)Low_GDP_Count,
AVG(CASE  WHEN GDP <=1500 THEN `Life expectancy` ELSE NULL END)Low_GDP_Life_expectancy
FROM world_life_expectancy

;

SELECT *
FROM world_life_expectancy
;


SELECT status, ROUND(AVG (`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY status 
;

SELECT status, COUNT(DISTINCT country),ROUND(AVG (`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY status 
;

SELECT country, ROUND(AVG(`Life expectancy`),1)AS Life_Exp , ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY country
HAVING Life_Exp > 0
AND BMI> 0  
ORDER BY BMI ASC
; 

SELECT country,
year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY country ORDER BY Year) AS Rolling_Total 
FROM world_life_expectancy
WHERE country LIKE '%United%'
;