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


