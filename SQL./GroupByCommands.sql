SELECT * from customer;

SELECT * from product;

SELECT * from sales;


/* GROUP BY */

SELECT region, COUNT(customer_id) as customer_count from customer GROUP BY region;

SELECT region, avg(age) as age, COUNT(customer_id) as customer_count from customer 
GROUP BY region;

SELECT product_id, SUM(quantity) as quantity_sold from sales 
GROUP BY product_id ORDER BY quantity_sold desc;

SELECT customer_id,
MIN(sales) as min_sales,
MAX(sales) as max_sales, 
AVG(sales) as Average_sales, 
SUM(sales) as Total_sales
from sales 
GROUP BY customer_id
ORDER BY total_sales DESC 
LIMIT 5;


/* HAVING */

SELECT region, COUNT(customer_id) as customer_count from customer 
GROUP BY region HAVING COUNT(customer_id)>200;

SELECT region, COUNT(customer_id) as customer_count from customer 
WHERE customer_name like 'A%' GROUP BY region;

SELECT region, COUNT(customer_id) as customer_count from customer 
WHERE customer_name like 'A%' GROUP BY region HAVING COUNT(customer_id)>15;


/* CASE WHEN */

SELECT *,
  CASE WHEN age<30 then 'Young'
       WHEN age>60 then 'Senior Citizen'
       ELSE 'Middle aged'
  END as Age_category
from customer;