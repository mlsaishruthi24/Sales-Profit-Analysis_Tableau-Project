SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* ~ */

SELECT * FROM customer
WHERE customer_name ~* '^a+[a-z\s]+$';

SELECT * FROM customer
WHERE customer_name ~* '^(a|b|c|d)+[a-z\s]+$';

SELECT * FROM customer
WHERE customer_name ~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';


create table users(id serial primary key, name character varying);
insert into users (name) VALUES ('Alex'), ('Jon Snow'), ('Christopher'), ('Arya'),('Sandip Debnath'), ('Lakshmi'),('alex@gmail.com'),('@sandip5004'), ('lakshmi@gmail.com');

SELECT * FROM users
WHERE name ~* '[a-z0-9\.\-\_]+@[a-z0-9\-]+\.[a-z]{2,5}';