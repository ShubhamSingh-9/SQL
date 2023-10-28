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

/*Problem 7
How many patients have claimed more than the average claim amount for patients who are smokers and have at least one child, 
and belong to the southeast region?*/
SELECT COUNT(*) FROM insurance
WHERE claim > (SELECT AVG(claim) FROM insurance  
        	   WHERE region = 'southeast' AND
	           smoker = 'Yes' AND
	           children>=1);
               
/*Problem 8 : How many patients have claimed more than the average claim amount for patients who are not smokers and have a 
BMI greater than the average BMI for patients who have at least one child?*/               
SELECT COUNT(*) FROM insurance
WHERE claim > (SELECT AVG(claim) FROM insurance 
				WHERE smoker = 'No' AND
				BMI> (SELECT AVG(BMI) FROM insurance 
				WHERE children>=1));


/*Problem 9 : How many patients have claimed more than the average claim amount for patients who have a BMI greater than the average 
BMI for patients who are diabetic, have at least one child, and are from the southwest region?*/
SELECT COUNT(*) FROM insurance
WHERE claim > (SELECT AVG(claim) FROM insurance 
				WHERE BMI > (SELECT AVG(BMI) FROM insurance
				WHERE diabetic = 'Yes' AND 
				children >=1 AND
				region = 'southeast'));
                
                
/*Problem 10: What is the difference in the average claim amount between patients who are smokers and patients who are non-smokers, 
and have the same BMI and number of children?*/
                