# Question 1 
SELECT customerNumber, COUNT(orderDate) AS 'frequency' FROM orders
WHERE EXTRACT(YEAR FROM orderDate) = '2004'
GROUP BY customerNumber
ORDER BY frequency DESC LIMIT 1;

# Question 2
SELECT customerName, COUNT(paymentDate) AS 'frequency_pay' FROM customers 
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
WHERE (WEEKDAY(paymentDate) = 5 OR WEEKDAY(paymentDate) = 6)
GROUP BY customerName
ORDER BY frequency_pay DESC LIMIT 2;

# Question 3 
SELECT salesRepEmployeeNumber, SUM(amount) AS 'revenue'
FROM customers
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
GROUP BY salesRepEmployeeNumber
ORDER BY revenue DESC LIMIT 1;

# Question 4 
SELECT Company, COUNT(Company_response) AS cases, 
COUNT(case when Company_response = 'closed with relief' then 1 ELSE null END)*100/COUNT(Company_response) AS relief_case
FROM cfpb_complaints_2500
GROUP BY Company HAVING COUNT(Company_response) > 30
ORDER BY relief_case DESC LIMIT 1;

# Question 5
SELECT Company, COUNT(case when Issue LIKE '%loan%' then 1 ELSE null END) AS num_loan_issue, State
FROM cfpb_complaints_2500
WHERE (WEEKDAY(Data_received) = 2 AND State LIKE 'A%' )
GROUP BY Company
ORDER BY num_loan_issue DESC LIMIT 1;

# Question 6 
ALTER TABLE chile
ADD Income_level VARCHAR(20) NOT NULL;

UPDATE chile 
SET Income_level = CASE
WHEN income > 100000 THEN 'High_income' 
WHEN income BETWEEN 10000 AND 100000 THEN 'Middle_income' 
WHEN income < 10000 THEN 'Low_income'
ELSE NULL
END;

SELECT Income_level, CAST(AVG(statusquo) AS DECIMAL(10,3)) AS 'Mean statusquo' FROM chile 
WHERE sex = 'F' AND vote = 'Y'
GROUP BY Income_level;

# Question 7 
SELECT Company, COUNT(*) AS num_complaints FROM cfpb_complaints_2500
WHERE Consumer_disputed = 'Yes' AND WEEKDAY(Data_received) = 4 AND DATEDIFF(Data_sent_to_company, Data_received) > 5
GROUP BY Company
ORDER BY num_complaints DESC LIMIT 1;

# Question 8
SELECT productName, (priceEach * quantityOrdered - buyPrice) AS profit 
FROM orderdetails
INNER JOIN products
ON orderdetails.productCode = products.productCode
ORDER BY profit DESC LIMIT 1;

# Question 9
