USE task;
/*Problem 1: Display the names of athletes who won a gold medal in the 2008 Olympics and whose height is greater than the average height of all 
athletes in the 2008 Olympics.*/
SELECT Name,Height,Medal FROM olympics_cleaned_v4
WHERE Year = 2008 AND 
Medal ='Gold'
AND
Height > (SELECT AVG(Height) FROM olympics_cleaned_v4);

/*Problem 2: Display the names of athletes who won a medal in the sport of basketball in the 2016 Olympics and 
whose weight is less than the average weight of all athletes who won a medal in the 2016 Olympics.*/
SELECT * FROM olympics_cleaned_v4
WHERE Sport = 'Basketball' AND
Medal IS NOT NULL AND
Year = 2016 AND
Weight < (SELECT AVG(Weight) FROM olympics_cleaned_v4 WHERE Year=2016 AND Medal IS NOT NULL);

/*Problem 3 : Display the names of all athletes who have won a medal in the sport of swimming in both the 2008 and 2016 Olympics.*/
SELECT Name FROM olympics_cleaned_v4
WHERE Sport ='Swimming' AND 
Year IN (2008,2016) AND
Medal IS NOT NULL;

/*Problem 4 : Display the names of all countries that have won more than 50 medals in a single year.*/
SELECT Name,Year,country,COUNT(*) FROM olympics_cleaned_v4
WHERE Medal IS NOT NULL
GROUP BY Year,country
HAVING COUNT(*)>50
ORDER BY Year;

/*Problem 5 : Display the names of all athletes who have won medals in more than one sport in the same year.*/
SELECT Name FROM olympics_cleaned_v4
WHERE ID in (SELECT DISTINCT ID FROM olympics_cleaned_v4
WHERE Medal IS NOT NULL
GROUP BY ID,Year,Name
HAVING COUNT(Medal)>1);

/*Problem 6 : What is the average weight difference between male and female athletes in the Olympics who have won a medal in 
the same event?*/
SELECT * FROM olympics_cleaned_v4
