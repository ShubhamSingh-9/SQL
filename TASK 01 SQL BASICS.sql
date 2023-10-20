USE task;
-- Show records of 'male' patient from 'southwest' region.
SELECT * FROM insurance
WHERE gender='male' AND region='southwest';

-- Show all records having bmi in range 30 to 45 both inclusive.
SELECT * FROM insurance
WHERE bmi BETWEEN 30 AND 45;

-- Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively. 
SELECT MIN(bloodpressure) AS MINBP,MAX(bloodpressure) AS MAXBP FROM insurance
WHERE diabetic='Yes' AND smoker='Yes';

-- Find no of unique patients who are not from southwest region.
SELECT COUNT(DISTINCT(PatientID)) AS 'No. of unique patients not from southwest' FROM insurance
WHERE region NOT IN ('southwest');

-- Total claim amount from male smoker.
SELECT SUM(claim) AS 'Total claim from male smokers' FROM insurance
WHERE gender='male' AND smoker='Yes';

-- Select all records of south region.
SELECT * FROM insurance
WHERE region LIKE 'south%';

-- No of patient having normal blood pressure. Normal range[90-120]
SELECT * FROM insurance
WHERE bloodpressure BETWEEN 90 AND 120;

/* No of pateint below 17 years of age having normal blood pressure as per below formula 
BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
Note: Formula taken just for practice, don't take in real sense. */

SELECT COUNT(*) FROM insurance
WHERE age<17 AND (bloodpressure BETWEEN 80+(age*2) AND 100+(age*2));

-- What is the average claim amount for non-smoking female patients who are diabetic?
SELECT AVG(claim) FROM insurance
WHERE gender='FEMALE' AND smoker='NO' AND diabetic='Yes';

-- Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
UPDATE insurance
SET claim = 5000
WHERE PatientID=1234;

-- Write a SQL query to delete all records for patients who are smokers and have no children.
DELETE FROM insurance
WHERE smoker='YES' and children=0
