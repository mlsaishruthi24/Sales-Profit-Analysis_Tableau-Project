SELECT * from customer;

SELECT * from product;

SELECT * from sales;

from sales
group by order_id
order by order_id;

/* CREATE USER */

CREATE USER starrtech
WITH PASSWORD 'academy'; 


/* GRANT & REVOKE */

GRANT select, update, insert, delete on product to starrtech;

REVOKE delete on product from starrtech;


/* DROP USER */

REVOKE all on product from starrtech;

DROP USER starrtech;


/* RENAME USER */

CREATE USER starrtech
WITH PASSWORD 'academy'; 

ALTER USER starrtech
RENAME TO ST;


/* FIND ALL USERS */

SELECT usename from pg_user;

SELECT * from pg_user;


/* FIND ALL LOGGED-IN USERS */

SELECT distinct usename from pg_stat_activity;

SELECT distinct * from pg_stat_activity;