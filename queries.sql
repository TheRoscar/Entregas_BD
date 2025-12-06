-- queries.sql

-- Query 1: Retrieve the names and areas of all continents.
SELECT Name, Area
FROM Continent;

-- Query 2: Find the area and depth of Lake Malawi.
SELECT Area, Depth
FROM Lake
WHERE Name = 'Lake Malawi';

-- Query 3: List the names and areas of lakes ordered by depth in descending order.
SELECT Name, Area
FROM Lake
ORDER BY Depth DESC;

-- Query 4: List the names of countries where agriculture constitutes at least 50% of their economy.
SELECT Country.Name
FROM Country
INNER JOIN Economy ON Country.Code = Economy.Country
WHERE Economy.Agriculture >= 50;

-- Query 5: Find the name of the longest river.
SELECT Name
FROM River
WHERE Length = (SELECT MAX(Length) FROM River);