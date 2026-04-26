/* VIEWS */

CREATE VIEW logistics as 
SELECT a.order_line, 
a.order_id,
b.customer_name,
b.city, 
b.state, 
b.country 
from sales as a
LEFT JOIN customer as b
on a.customer_id = b.customer_id
ORDER BY a.order_line;

SELECT * from logistics;

DROP VIEW logistics;


/* INDEX */

CREATE INDEX mon_idx
on month_values(MM);

DROP INDEX mon_idx;