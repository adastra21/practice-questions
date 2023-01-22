# Interview Questions [Marketing]

## Question 1
```
Given two tables: accounts, and downloads, find the average number of downloads for free vs paying accounts, broken down by day. Round average_downloads to 2 decimal places.

Note: You only need to consider accounts that have had at least one download before when calculating the average. 

accounts table
account_id 	INTEGER
paying_customer 	BOOLEAN

downloads table
account_id 	INTEGER
download_date 	DATETIME
downloads 	INTEGER

Output:
download_date 	DATETIME
paying_customer 	BOOLEAN
average_downloads 	FLOAT
```

## Question 2
```
The table products contains data about products that a user purchased. Products are divided into categories. The column id is the primary key of table products and represents the order in which the products are purchased.

Write a query to output a table that includes every product name a user has ever purchased. Additionally, the table should have a boolean column with a value of 1 if the user has previously purchased that product category and 0 if it’s their first time buying a product from that category.

Note: Sort the results by the time purchased ascending.

Display results like:
product_name 	category_previously_purchased
toy car 	0
toy plane 	1
basketball 	0
football 	1
baseball 	1

products table
id 	INTEGER
name 	VARCHAR
category_id 	INTEGER

Output:
product_name 	VARCHAR
category_previously_purchased 	BOOLEAN
```

## Question 3
```
Write a SQL query to create a histogram of the number of comments per user in the month of January 2020.

Note: Assume bin buckets class intervals of one. Comments by users that were not created in January 2020 should be counted in a “0” bucket

users table
id 	INTEGER
name 	VARCHAR
created_at 	DATETIME
neighborhood_id 	INTEGER
mail 	VARCHAR

comments table
user_id 	INTEGER
body 	VARCHAR
created_at 	DATETIME

Output:
comment_count 	INTEGER
frequency 	INTEGER
```

## Question 4
```
Given a table of transactions and products, write a function to get the month_over_month change in revenue for the year 2019. Make sure to round month_over_month to 2 decimal places.

transactions table
id 	INTEGER
user_id 	INTEGER
created_at 	DATETIME
product_id 	INTEGER
quantity 	INTEGER

products table
id 	INTEGER
name 	VARCHAR
price 	FLOAT

Output:
month 	INTEGER
month_over_month 	FLOAT
```