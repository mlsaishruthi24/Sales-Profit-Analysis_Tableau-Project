SELECT * from customer;

SELECT * from product;

SELECT * from sales;


/* SUBQUERY IN WHERE CLAUSE */

SELECT * from sales
WHERE customer_id in (SELECT customer_id from customer WHERE age>60);


/* SUBQUERY IN FROM CLAUSE */

SELECT 
a.product_id ,
a.product_name ,
a.category,
b.quantity
from product as a 
LEFT JOIN (SELECT product_id, 
           SUM(quantity) as quantity 
           from sales GROUP BY product_id) as b
on a.product_id = b.product_id
ORDER BY b.quantity desc;


/* SUBQUERY IN SELECT CLAUSE */

SELECT customer_id, order_line, 
      (SELECT customer_name from customer WHERE sales.customer_id = customer.customer_id)
FROM sales 
ORDER BY customer_id;