# SQL Practice [Easy]

## Question 1
Write a query to report the distance traveled by each user in descending order.

```
-- users table
id INTEGER
name INTEGER
```

```
-- rides table
id INTEGER
passenger_user_id INTEGER
distance FLOAT
```

```
-- Expected output
name VARCHAR
distance_traveled FLOAT
```

## Question 2
Write a query that returns all neighborhoods that have 0 users.

```
-- users table
id INTEGER
name VARCHAR
neighborhood_id INTEGER
created_at DATETIME
```

```
-- neighborhoods table
id INTEGER
name VARCHAR
city_id  INTEGER
```

```
-- Expected output:
name VARCHAR
```

## Question 3
Write a SQL query to select the 2nd highest salary in the engineering
department. If more than one person shares the highest salary, the query
should select the next highest salary.

```
-- employees table
id INTEGER
first_name VARCHAR
last_name VARCHAR
salary INTEGER
department_id INTEGER
```

```
-- departments table
id INTEGER
name VARCHAR
```

```
-- Expected output:
salary INTEGER
```

## Question 4
Find the average number of downloads for free vs paying accounts, broken down by day.

```
-- accounts table
account_id INTEGER
paying_customer BOOLEAN
```
```
-- downloads table
account_id INTEGER
download_date DATETIME
downloads INTEGER
```
```
-- Expected output:
download_date DATETIME
paying_customer BOOLEAN
average_downloads FLOAT
```

## Question 5
Select the top 3 departments with at least ten employees and rank them according to the percentage of their employees making over 100K in salary.

```
-- employees table
id INTEGER
first_name VARCHAR
last_name VARCHAR
salary INTEGER
department_id INTEGER
```
```
-- departments table
id INTEGER
name VARCHAR
```
```
-- Expected output:
percentage_over_100k FLOAT
department_name VARCHAR
number_of_employees INTEGER
```

## Question 6
Given below are search results from searches on Facebook. The query column is the search term, the position column represents each position the search result came in, and the rating column represents the human rating of the search result from 1 to 5 where 5 is high relevance and 1 is low relevance.

```
search_results table
query VARCHAR
result_id INTEGER
position INTEGER
rating INTEGER
```

Write a query to compute a metric to measure the quality of the search results for each query.

Hint: You want to be able to compute a metric that measures the precision of the ranking system based on position. For example, if the results for dog and cat are:

```
query   result_id   position    rating  notes
dog     1000        1               2   picture of hotdog
dog     998         2               4   dog walking
dog     342         3               1   zebra
cat     123         1               4   picture of cat
cat     435         2               2   cat memes
cat     545         3               1   pizza shops
```
We would rank ‘cat’ as having a better search result ranking precision than ‘dog’ based on the correct sorting by rating.

Create a metric that can validate and rank the queries by their search result precision. Round the metric (avg_rating column) to 2 decimal places.

```
Expected output:
query VARCHAR
avg_rating FLOAT
```

## Question 7
Write a query to identify the manager with the biggest team size. You may assume there is only one manager with the largest team size.
```
employees table
id INTEGER
name VARCHAR
manager_id INTEGER
```
```
managers table
id INTEGER
name VARCHAR
team VARCHAR
```
```
Expected output:
manager VARCHAR
team_size INTEGER
```