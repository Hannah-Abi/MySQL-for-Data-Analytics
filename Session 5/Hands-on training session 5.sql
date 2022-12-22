# Hands-on training session 5 

# Task 1 
SELECT productCode, COUNT(DISTINCT priceEach) num_price
FROM orderdetails
GROUP BY productCode HAVING num_price > 5;

# Task 2 
UPDATE cfpb_complaints_2500 SET Sub_product = NULL WHERE Sub_product = ''l;

# Task 3 
SELECT Company, COUNT(Issue) AS num_complaints
FROM cfpb_complaints_2500 WHERE WEEKDAY(Data_received) = 2
GROUP BY Company
ORDER BY num_complaints DESC LIMIT 1;

# Task 4: 5 = Saturday
SELECT WEEKDAY(Data_received) AS Day_of_the_week, COUNT(Issue) AS num_complaints
FROM cfpb_complaints_2500
GROUP BY Day_of_the_week ORDER BY num_complaints LIMIT 1;

# Task 5 
SELECT MONTHNAME(Data_received) AS Month_of_the_years, COUNT(Issue) AS num_complaints
FROM cfpb_complaints_2500
GROUP BY Month_of_the_years ORDER BY num_complaints DESC LIMIT 1;

# Task 6 
SELECT MONTHNAME(o2.Data_received) AS Month_of_the_years, 
(SELECT WEEKDAY(o1.Data_received) FROM cfpb_complaints_2500 AS o1 WHERE MONTHNAME(o1.Data_received) = MONTHNAME(o2.Data_received) AND WEEKDAY(o1.Data_received) NOT IN (5,6))  AS num_complaints
FROM cfpb_complaints_2500 AS o2
GROUP BY Month_of_the_years 
#ORDER BY num_complaints DESC LIMIT 1;

# Task 7 
ALTER TABLE cfpb_complaints_2500 ADD datedifference INT;
UPDATE cfpb_complaints_2500 SET datedifference = DATEDIFF(Data_sent_to_company, Data_received);

# Task 8 
SELECT ADDDATE("1994-02-06", INTERVAL 10000 DAY) AS 'My 10000th day living';
/* Affected rows: 0  Found rows: 1  Warnings: 0  Duration for 1 query: 0,000 sec. */

# Task 9
SELECT DATEDIFF("1994-02-06", CURRENT_DATE()) AS 'How many days I have lived';

# Task 10 
ALTER TABLE products ADD Price_difference DECIMAL(10,2);
UPDATE products SET Price_difference = MSRP-buyPrice;
ALTER TABLE products ADD Value_difference DECIMAL(10,2);
UPDATE products SET 	Value_difference = (MSRP-buyPrice)* quantityInStock;

# Task 11
ALTER TABLE products DROP Price_difference;
ALTER TABLE products DROP Value_difference;

# Task 12
SELECT Distinct cus.customerName
FROM customers AS cus
JOIN orders ON orders.customerNumber = cus.customerNumber
JOIN products ON cus.customerNumber = orders.customerNumber
WHERE EXTRACT(YEAR FROM orders.orderDate) = 2004 AND products.productName LIKE '%Ferrari%';








