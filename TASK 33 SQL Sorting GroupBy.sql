USE task;

-- Problem 1:
/*The question is:
Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.*/
SELECT AVG(`Sleep duration`) FROM sleep
WHERE `Sleep duration` >= 7.5 AND gender='MALE'
ORDER BY `Sleep duration` DESC LIMIT 15;

/* Problem 2: Show avg deep sleep time for both gender. Round result at 2 decimal places.
Note: sleep time and deep sleep percentage will give you, deep sleep time. */
SELECT Gender, round((`sleep duration`*(`Deep sleep percentage`/100)),2) FROM sleep
GROUP BY Gender;

/*Problem 3:
The question is: Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage values 
are between 25 to 45. Display age, light sleep percentage and deep sleep percentage columns only.*/
SELECT Age,`Light sleep percentage`,`Deep sleep percentage` FROM sleep
WHERE `Deep sleep percentage` BETWEEN 25 AND 45
ORDER BY `Light sleep percentage` LIMIT 10, 20;

/*Problem 4: Group by on exercise frequency and smoking status and show average deep sleep time, average light sleep time and 
avg rem sleep time.
Note the differences in deep sleep time for smoking and non smoking status*/
SELECT `Exercise frequency`,`Smoking status`,AVG(`sleep duration`*(`Deep sleep percentage`/100)) AS `Deep Sleep Time`, AVG(`sleep duration`*(`Light sleep percentage`/100)) AS `Light Sleep Time` ,AVG(`sleep duration`*(`REM sleep percentage`/100)) AS `REM sleep percentage` 
FROM sleep
GROUP BY `Exercise frequency`,`Smoking status`;

/*Problem 5: Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol consumption only for 
people who do exercise atleast 3 days a week. Show result in descending order awekenings */

SELECT Awakenings,`Exercise frequency`,AVG(`Caffeine consumption`) AS 'AVG Caff. consump',AVG(`sleep duration`*(`Deep sleep percentage`/100)) AS 'Deep Sleep Time',
AVG(`Alcohol consumption`) AS 'Alco. onsump'FROM sleep
WHERE `Exercise frequency` >= 3
GROUP BY Awakenings
ORDER BY Awakenings DESC;

/* Problem 6: The question is: Display those power stations which have average 'Monitored Cap.(MW)' (display the values) between 1000 and 2000 and 
the number of occurance of the power stations (also display these values) are greater than 200. 
Also sort the result in ascending order.*/
SELECT * FROM power;
SELECT `Power Station`, AVG(`Monitored Cap.(MW)`) AS 'AVG_Cap', COUNT(*) AS 'uniq_stn' FROM power
GROUP BY `Power Station`
HAVING (AVG_Cap BETWEEN 1000 AND 2000) AND uniq_stn > 200
ORDER BY AVG_cap ASC;

/* Problem 7:
The question is: Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 or 2021 and type is 
'Public In-State'. Also the number of occurance should be between 6 to 10. Display the average value upto 2 decimal places, 
state names and the occurance of the states.*/
SELECT Year, State, 'Value' FROM coll
WHERE YEAR IN (2013,2017,2021) AND Type = 'Public IN-State' ;

SELECT State, ROUND(AVG(Value),2) AS 'avg_val', COUNT(*) AS 'freq' FROM coll
WHERE YEAR IN (2013,2017,2021) AND Type = 'Public IN-State' 
GROUP BY State
HAVING freq BETWEEN 6 AND 10
ORDER BY AVG_val ASC LIMIT 10;

/* Problem -8: Best state in terms of low education cost (Tution Fees) in 'Public' type university.*/
SELECT State, AVG(Value)  FROM coll
WHERE Type LIKE '%Public%' AND Expense LIKE '%Tuition%'
GROUP BY State
ORDER BY AVG(Value) ASC LIMIT 1;

/*Problem 9: 2nd Costliest state for Private education in year 2021. Consider, Tution and Room fee both.*/
SELECT * FROM coll
WHERE YEAR = 2021 AND 
TYPE LIKE '%Private%' AND 
(Expense LIKE '%Tuition%' OR Expense LIKE '%Room')
GROUP BY State
ORDER BY State DESC LIMIT 1,1;

/*The question is:
Display total and average values of Discount_offered for all the combinations of 'Mode_of_Shipment' (display this feature) 
and 'Warehouse_block' (display this feature also) for all male ('M') and 'High' Product_importance. Also sort the values in 
descending order of Mode_of_Shipment and ascending order of Warehouse_block.*/
SELECT Mode_of_Shipment, Warehouse_block,SUM(Discount_offered),AVG(Discount_offered) FROM ecomm
WHERE Gender = 'M' AND 
Product_importance = 'High'
GROUP BY Mode_of_Shipment, Warehouse_block
ORDER BY Mode_of_Shipment DESC , Warehouse_block ASC

