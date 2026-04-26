SELECT * from consumer_table;

ALTER TABLE consumer_table ADD test varchar(255);

ALTER TABLE consumer_table DROP test;
ALTER TABLE consumer_table DROP COLUMN test;

ALTER TABLE consumer_table ALTER COLUMN age type varchar(255);

ALTER TABLE consumer_table RENAME COLUMN email_id to consumer_email;

ALTER TABLE consumer_table ALTER COLUMN cust_id set not null;

INSERT INTO consumer_table (first_name,last_name,age,consumer_email) values
('aa','bb','25','ab@xyz.com');

ALTER TABLE consumer_table ALTER COLUMN cust_id drop not null;

ALTER TABLE consumer_table ADD CONSTRAINT cust_id check (cust_id>0);

INSERT INTO consumer_table values (-1,'cc','dd','67','cd@xyz.com');

ALTER TABLE consumer_table add PRIMARY KEY (cust_id);

DELETE from consumer_table;

INSERT INTO consumer_table values (1,'c','dd','67','cd@xyz.com');

SELECT * from consumer_table;
