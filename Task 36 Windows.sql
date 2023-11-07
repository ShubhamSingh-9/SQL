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
WHERE t.row_no=1