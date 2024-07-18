SELECT * FROM `proj verra`.allprojects;

##1. Total Number Of Verra Projects In Kenya
select count(*) as Total_projects from `proj verra`.allprojects;

##2. total estimated annual emission reduction for all projects
SELECT SUM(`Estimated Annual Emission Reductions`)as Total_Estimated_Emission_Reduction FROM `proj verra`.allprojects;

##3. Which project has the highest estimated annual emission reduction?
SELECT Name, `Estimated Annual Emission Reductions` FROM `proj verra`.allprojects 
ORDER BY `Estimated Annual Emission Reductions` DESC 
LIMIT 5;

##4. How many projects are in each project type category?
SELECT `Project Type`, COUNT(*) as No_Of_Projects FROM `proj verra`.allprojects GROUP BY `Project Type`;

##5.  Which proponent has the most projects in Kenya?
SELECT `Proponent`, COUNT(*) as No_Of_Projects FROM `proj verra`.allprojects GROUP BY `Proponent` ORDER BY COUNT(*) DESC LIMIT 1;

##6. What is the distribution of project statuses in Kenya?
SELECT `Status`, COUNT(*) as No_of_projects FROM `proj verra`.allprojects  GROUP BY Status;

##7. AFOLU projects versus non-AFOLU projects in Kenya?
SELECT CASE WHEN `Project Type`= 'AFOLU' THEN 'AFOLU' ELSE 'Non-AFOLU' END AS Project_Type, COUNT(*) as No_of_projects FROM `proj verra`.allprojects  GROUP BY `Project_Type`;

##8. What are the start and end dates for the crediting period of the project with the highest emission reduction?
SELECT 
    `Name`, `project Type`,
    STR_TO_DATE(`Crediting Period Start Date`, '%m/%d/%Y') AS `Crediting Period Start Date`, 
    STR_TO_DATE(`Crediting Period End Date`, '%m/%d/%Y') AS `Crediting Period End Date`, 
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(`Crediting Period Start Date`, '%m/%d/%Y'), STR_TO_DATE(`Crediting Period End Date`, '%m/%d/%Y')) AS `Crediting Period Duration (Years)`
FROM 
    `proj verra`.allprojects 
ORDER BY 
    `Estimated Annual Emission Reductions` DESC 
LIMIT 5;

##9. projects currently under development in Kenya?
SELECT `Name`, `Proponent`, `Project type`, `Methodology` FROM `proj verra`.allprojects WHERE `Status` = 'Under development';

##10. Which methodologies are most frequently used in projects in Kenya?
SELECT Methodology, COUNT(*) FROM `proj verra`.allprojects where Status = "Registered" GROUP BY `Methodology` ORDER BY COUNT(*) DESC LIMIT 5;


##11. Top 5 Projects by Proponents with the Most Projects:
-- Specify the database name
USE `proj verra`;

-- Create a temporary table to store the top proponents
-- Specify the database name
USE `proj verra`;

-- Drop the temporary table if it already exists
DROP TEMPORARY TABLE IF EXISTS top_proponents;

-- Create a temporary table to store the top proponents
CREATE TEMPORARY TABLE top_proponents AS
SELECT `Proponent`
FROM `proj verra`.allprojects
GROUP BY `Proponent`
ORDER BY COUNT(*) DESC
LIMIT 5;

SELECT 
    p.`Proponent`, 
    p.`Name`, 
    p.`Estimated Annual Emission Reductions`
FROM 
    `proj verra`.allprojects p
JOIN 
    top_proponents tp ON p.`Proponent` = tp.`Proponent`
ORDER BY 
    p.`Proponent`, 
    p.`Estimated Annual Emission Reductions` DESC;

##12. Distribution of Estimated Annual Emission Reductions:
SELECT 
    CASE 
        WHEN `Estimated Annual Emission Reductions` < 300000 THEN '< 300000' 
        WHEN `Estimated Annual Emission Reductions` BETWEEN 300000 AND 3000000 THEN '300001 - 3000000' 
        WHEN `Estimated Annual Emission Reductions` BETWEEN 3000001 AND 7000000 THEN '3000001 - 7000000' 
        ELSE '> 7000000' 
    END AS Reduction_Range, 
    COUNT(*) AS Total_Projects 
FROM 
    `proj verra`.allprojects 
GROUP BY Reduction_Range;

##13. Projects with the Longest Crediting Periods:
SELECT 
    `Name`, 
    `Crediting Period Start Date`, 
    `Crediting Period End Date`, 
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(`Crediting Period Start Date`, '%m/%d/%Y'), STR_TO_DATE(`Crediting Period End Date`, '%m/%d/%Y')) AS `Crediting Period Duration (Years)`
FROM 
    `proj verra`.allprojects 
ORDER BY 
    `Crediting Period Duration (Years)` DESC 
LIMIT 10;

##14. Projects with the shortest Crediting Periods (excluding NULL durations)
SELECT 
    `Name`, 
    `Crediting Period Start Date`, 
    `Crediting Period End Date`, 
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(`Crediting Period Start Date`, '%m/%d/%Y'), STR_TO_DATE(`Crediting Period End Date`, '%m/%d/%Y')) AS `Crediting Period Duration (Years)`
FROM 
    `proj verra`.allprojects 
WHERE 
    `Crediting Period Start Date` IS NOT NULL 
    AND `Crediting Period End Date` IS NOT NULL
    AND TIMESTAMPDIFF(YEAR, STR_TO_DATE(`Crediting Period Start Date`, '%m/%d/%Y'), STR_TO_DATE(`Crediting Period End Date`, '%m/%d/%Y')) IS NOT NULL
ORDER BY 
    `Crediting Period Duration (Years)` ASC 
LIMIT 10;

##15. Proponents with the Highest Average Annual Emission Reductions:
SELECT Proponent, sum(`Estimated Annual Emission Reductions`) AS `Total Emission Reduction` 
FROM `proj verra`.allprojects 
GROUP BY Proponent 
ORDER BY `Total Emission Reduction` asc
LIMIT 5;





