SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* COUNT */

SELECT COUNT (*) from sales;

SELECT COUNT (order_line) as "number of products ordered", COUNT (distinct order_id) as "number of orders" from sales WHERE customer_id='CG-12520'; 


/* SUM */

SELECT SUM(profit) as "total profit" from sales;

SELECT SUM(quantity) as "total quantity" from sales WHERE product_id='FUR-TA-10000577';

/* AVERAGE */

SELECT AVG(age) as "average customer age" from customer;

SELECT AVG(sales*0.10) as "average commission value" from sales;


/* MIN&MAX */

SELECT min(sales) as "minimum sales value june 15" 
from sales 
WHERE order_date between '2015-06-01' and '2015-06-30';

SELECT sales
from sales
WHERE order_date between '2015-06-01' and '2015-06-30' ORDER BY sales asc;

SELECT max(sales) as "maximum sales value june 15" 
from sales 
WHERE order_date between '2015-06-01' and '2015-06-30';
