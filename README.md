# SQL Practice [difficulty: easy]

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
