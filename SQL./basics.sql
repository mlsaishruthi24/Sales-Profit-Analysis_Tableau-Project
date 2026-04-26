/* INSERT */

INSERT INTO consumer_table values
(1,'bee','cee',32,'bca@xyz.com');

INSERT INTO consumer_table (cust_id,first_name,age,email_id) values
(2,'dee',22,'edf@kml.com');

INSERT INTO consumer_table values
(3,'Gee','lee',27,'ihg@npo.com'),
(4,'tee','vee',30,'jlk@pst.com');

/* COPY */

COPY consumer_table from 'C:\Program Files\PostgreSQL\copy.csv' delimiter ',' csv header;

COPY consumer_table from 'C:\Program Files\PostgreSQL\copytext.txt' delimiter ',';

/* SELECT */

SELECT first_name from consumer_table;
SELECT first_name,last_name from consumer_table;
SELECT * from consumer_table;

/* SELECT DISTINCT */

SELECT DISTINCT first_name from consumer_table;
SELECT first_name from consumer_table;

SELECT DISTINCT first_name,age from consumer_table;

/* WHERE */

SELECT first_name from consumer_table WHERE age=25;
SELECT DISTINCT first_name from consumer_table WHERE age=25;
SELECT * from consumer_table WHERE first_name='gee';

/* AND , OR , NOT */
SELECT first_name,last_name,age from consumer_table WHERE age>20 AND age<30;
SELECT first_name,last_name,age from consumer_table WHERE age<20 OR age>=30;

SELECT * from consumer_table WHERE NOT AGE=25;
SELECT * from consumer_table WHERE NOT age=25 and NOT first_name='Jay';

/* UPDATE */
SELECT * from consumer_table WHERE cust_id=2;
UPDATE consumer_table SET last_name='Pe',age=17 WHERE cust_id=2;

SELECT * from consumer_table;

UPDATE consumer_table set email_id='gee@xyz.com' WHERE first_name='Gee' OR first_name='gee';

/* DELETE */

DELETE from consumer_table WHERE cust_id=6;

SELECT * from consumer_table;

DELETE from consumer_table WHERE age>30;

DELETE from consumer_table;