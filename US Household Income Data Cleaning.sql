-- US Household Income Data Cleaning


SELECT *
FROM US_Project.us_household_income;

SELECT * 
FROM US_Project.us_household_income_statistics;


SELECT COUNT(id)
FROM US_Project.us_household_income;

SELECT COUNT(id)
FROM US_Project.us_household_income_statistics;

SELECT id, COUNT(id)
FROM US_Project.us_household_income
GROUP BY id
HAVING COUNT(id) >1
;
SELECT *
FROM(
SELECT row_id,
id,
ROW_NUMBER()OVER(PARTITION BY id ORDER BY id)
FROM us_project.us_household_income
)
WHERE row_num > 1
;



SELECT *
FROM(
SELECT row_id,
id,
ROW_NUMBER()OVER(PARTITION BY id ORDER BY id) row_num 
FROM us_project.us_household_income
) duplicates 
WHERE row_num > 1
;

DELETE FROM us_household_income
WHERE row_id IN (
    SELECT row_id
    FROM(
    SELECT row_id,
    id,
	ROW_NUMBER()OVER(PARTITION BY id ORDER BY id) row_num
	FROM us_project.us_household_income
	) dupicates
WHERE row_num > 1)
;

SELECT id, COUNT(id)
FROM US_Project.us_household_income_statistics
GROUP BY id
HAVING COUNT(id) >1
;

SELECT State_Name, COUNT(State_Name)
FROM US_Project.us_household_income
GROUP BY State_Name
;


UPDATE US_Project.us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE US_Project.us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
; 


SELECT *
FROM us_project.us_household_income
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE us_project.us_household_income
SET Place ='Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';


SELECT Type, COUNT(Type)
FROM us_project.us_household_income 
GROUP BY Type 
-- 	qORDER BY 1
;

UPDATE us_household_income 
SET Type = 'Borough' 
WHERE Type = 'Boroughs';


SELECT ALand,  AWater
FROM us_project.us_household_income
WHERE (AWater = 0 OR AWater = ''OR AWater IS NULL)
AND (ALand = 0 OR ALand = '' OR ALand IS NULL)
;