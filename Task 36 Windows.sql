USE task;
/* Problem 1: What are the top 5 patients who claimed the highest insurance amounts? */
SELECT *, 
RANK() OVER(ORDER BY claim DESC)
FROM insurance  
LIMIT 5;

/* Problem 2: What is the average insurance claimed by patients based on the number of children they have? */
SELECT children,avg_claim FROM (SELECT *,
AVG(claim) OVER(PARTITION BY children) AS avg_claim,
ROW_NUMBER() OVER(PARTITION BY children) AS row_no
FROM insurance)t
WHERE t.row_no = 1;

/* Problem 3: What is the highest and lowest claimed amount by patients in each region? */
SELECT * FROM (SELECT *,
MIN(claim) OVER(PARTITION BY region) AS min_claim,
MAX(claim) OVER(PARTITION BY region) AS max_claim,
ROW_NUMBER() OVER(PARTITION BY region) AS row_no
FROM insurance)t
WHERE t.row_no=1;

/*Problem 4: What is the percentage of smokers in each age group?
SELECT * FROM insurance*/

/*Problem 5: What is the difference between the claimed amount of each patient and the first patient claim amount?*/
SELECT *,
claim-FIRST_VALUE(claim) OVER() AS 'claim-first patient'
FROM insurance;

/*Problem 6: For each patient, calculate the difference between their claimed amount and the average claimed amount of patients with 
the same number of children*/
SELECT *,
claim-AVG(claim) OVER(PARTITION BY children)
FROM insurance;

/*Problem 7: Show the patient with the highest BMI in each region and their respective rank.*/
SELECT * FROM (SELECT *,
RANK() OVER(PARTITION BY region ORDER BY BMI DESC) AS 'rank_region',
RANK() OVER(ORDER BY BMI DESC) AS 'overall_rank'
FROM insurance)t
WHERE t.rank_region = 1;

/*Problem 8: Calculate the difference between the claimed amount of each patient and the claimed amount of the patient who has the 
highest BMI in their region.*/
SELECT *,
claim-FIRST_VALUE(claim) OVER(PARTITION BY region ORDER BY BMI DESC)
FROM insurance;

/*Problem 9: For each patient, calculate the difference in claim amount between the patient and the patient with the 
highest claim amount among patients with the same bmi and smoker status, within the same region. Return the result in descending 
order difference.*/
SELECT *, 
claim-MAX(claim) OVER(PARTITION BY region,smoker) AS 'diff_claim' 
FROM insurance 
ORDER BY diff_claim DESC;
 
/*Problem 10: For each patient, find the maximum BMI value among their next three records (ordered by age).*/
SELECT *,
 FROM insurance


/*Problem 11: For each patient, find the rolling average of the last 2 claims.*/



/*Problem 12: Find the first claimed insurance value for male and female patients, within each region order the data by patient age in ascending order, and only include patients who are non-diabetic and have a bmi value between 25 and 30.*/
