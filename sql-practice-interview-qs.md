# Interview Questions [Interview Qs]

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

## Question 5
```
Given a table of students and their SAT test scores, write a query to return the two students with the closest test scores with the score difference.

If there are multiple students with the same minimum score difference, select the student name combination that is higher in the alphabet.

scores table
id 	INTEGER
student 	VARCHAR
score 	INTEGER

Output:
one_student 	VARCHAR
other_student 	VARCHAR
score_diff 	INTEGER
```

## Question 6
```
Write a query to create a new table, named flight routes, that displays unique pairs of two locations.

Example:

Note: Duplicate pairs from the flights table, such as Dallas to Seattle and Seattle to Dallas, should have one entry in the flight routes table.

flights table
id 	INTEGER
source_location 	VARCHAR
destination_location 	VARCHAR

Output:
destination_one 	VARCHAR
destination_two 	VARCHAR
```

## Question 7
```
The rides table contains information about the trips of Uber users across America

Write a query to get the average commute time (in minutes) for each commuter in New York and the average commute time (in minutes) across all commuters in New York.

rides table
id 	INTEGER
commuter_id 	INTEGER
start_dt 	DATETIME
end_dt 	DATETIME
city 	VARCHAR

Output:
commuter_id 	INTEGER
avg_commuter_time 	FLOAT
avg_time 	FLOAT

Display results like:
commuter_id avg_commuter_time avg_time
11 	        27 	              45
22 	        97 	              45
33 	        11 	              45
```


## Question 8
```
Let’s say we have two tables, transactions and products. Hypothetically the transactions table consists of over a billion rows of purchases bought by users.

We are trying to find paired products that are often purchased together by the same user, such as wine and bottle openers, chips and beer, etc..

Write a query to find the top five paired products and their names.

Notes: For the purposes of satisfying the test case, p2 should be the item that comes first in the alphabet. The qty column represents paired products count

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
p1 	VARCHAR
p2 	VARCHAR
qty 	INTEGER
```


## Question 9
```
We’re given a table of product purchases. Each row in the table represents an individual user product purchase.

Write a query to get the number of customers that were upsold by purchasing additional products.

Note: If the customer purchased two things on the same day that does not count as an upsell as they were purchased within a similar timeframe.

transactions table
id 	INTEGER
user_id 	INTEGER
created_at 	DATETIME
product_id 	INTEGER
quantity 	INTEGER

Output:
Column 	Type
num_of_upsold_customers 	INTEGER
```


## Question 10
```
Write a query to show the number of users, number of transactions placed, and total order amount per month in the year 2020. Assume that we are only interested in the monthly reports for a single year (January-December).

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

users table
id 	INTEGER
name 	VARCHAR
sex 	VARCHAR

Output:
month 	INTEGER
num_customers 	INTEGER
num_orders 	INTEGER
order_amt 	INTEGER
```


## Question 11

```
You’re given two tables, payments and users. The payments table holds all payments between users with the payment_state column consisting of either "success" or "failed". 

How many customers that signed up in January 2020 had a combined (successful) sending and receiving volume greater than $100 in their first 30 days?

Note: The sender_id and recipient_id both represent the user_id.

payments table
payment_id 	INTEGER
sender_id 	INTEGER
recipient_id 	INTEGER
created_at 	DATETIME
payment_state 	VARCHAR
amount_cents 	INTEGER

users table
id 	INTEGER
created_at 	DATETIME

Output:
Column 	Type
num_customers 	INTEGER
```


## Question 12
```
The schema below is for a retail online shopping company consisting of two tables, attribution and user_sessions.

* The attribution table logs a session visit for each row.

* If conversion is true, then the user converted to buying on that session.

* The channel column represents which advertising platform the user was attributed to for that specific session.

* Lastly the user_sessions table maps many to one session visits back to one user.

First touch attribution is defined as the channel with which the converted user was associated when they first discovered the website.

Calculate the first touch attribution for each user_id that converted.

attribution table
session_id 	INTEGER
channel 	VARCHAR
conversion 	BOOLEAN

user_sessions table
session_id 	INTEGER
created_at 	DATETIME
user_id 	INTEGER

Output:
user_id channel
123 	facebook
145 	google
153 	facebook
172 	organic
173 	email
```