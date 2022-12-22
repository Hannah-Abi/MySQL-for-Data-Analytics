# Task 1 
SELECT comp.*  
FROM cfpb_complaints_2500 AS comp WHERE comp.Data_received IN ('2012-01-01', '2012-02-01', '2012-03-01', '2012-04-01', '2012-05-01')

# Task 2 
SELECT comp.*
FROM cfpb_complaints_2500 AS comp WHERE comp.Company = 'Bank of America' AND comp.Issue LIKE '%ATM%';

#Task 3
SELECT comp.*
FROM cfpb_complaints_2500 AS comp WHERE comp.Company = 'Bank of America' AND Issue REGEXP 'ATM|theft';

#Task 4
SELECT Company, COUNT(*) AS num_issue
FROM cfpb_complaints_2500 WHERE Issue LIKE '%ATM%'
GROUP BY company 
ORDER BY num_issue DESC LIMIT 3;

# Task 5
SELECT *
FROM cfpb_complaints_2500 WHERE LENGTH(Issue) =7;
#OR
SELECT *
FROM cfpb_complaints_2500 WHERE Issue LIKE '_______';

# Task 6
SELECT* 
FROM cfpb_complaints_2500 WHERE Issue REGEXP 'loan|saving|credit'

# Task 7 
SELECT DISTINCT Company 
FROM cfpb_complaints_2500

# Task 8
SELECT product, COUNT(*) AS Frequency
FROM cfpb_complaints_2500
GROUP BY product

# Task 9
SELECT Submitted_via, COUNT(*) AS Frequency
FROM cfpb_complaints_2500
GROUP BY Submitted_via

# Task 10
SELECT Issue, LEFT(Issue,5) AS first_five, RIGHT(Issue,5) AS last_five
FROM cfpb_complaints_2500

# Task 11
SELECT Issue, SUBSTRING_INDEX(Issue, ' ', -2)
FROM cfpb_complaints_2500

# Task 12
SELECT Issue , REPLACE(Issue, 'fee', 'cost')
FROM cfpb_complaints_2500 WHERE Issue LIKE '%fee%'

# Task 13
