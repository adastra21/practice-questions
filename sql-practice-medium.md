# SQL Practice [Medium]

## Question 1
```
Given a table of bank transactions with columns id, transaction_value, and created_at representing the date and time for each transaction, write a query to get the last transaction for each day.

The output should include the id of the transaction, datetime of the transaction, and the transaction amount. Order the transactions by datetime.

bank_transactions table
id 	INTEGER
created_at 	DATETIME
transaction_value 	FLOAT

Output:
created_at 	DATETIME
transaction_value 	FLOAT
id 	INTEGER
```

## Question 2
```
Due to an ETL error, the employees table instead of updating the salaries every year when doing compensation adjustments, did an insert instead. The head of HR still needs the current salary of each employee.

Write a query to get the current salary for each employee.

Note: Assume no duplicate combination of first and last names (i.e. No two John Smiths).

employees table
id 	VARCHAR
first_name 	VARCHAR
last_name 	VARCHAR
salary 	INTEGER
department_id 	INTEGER

Output:
first_name 	VARCHAR
last_name 	VARCHAR
salary 	INTEGER
```

## Question 3
```
Write a query to identify customers who placed more than three transactions each in both 2019 and 2020.

transactions table
id 	INTEGER
user_id 	INTEGER
created_at 	DATETIME
product_id 	INTEGER
quantity 	INTEGER

users table
id 	INTEGER
name 	VARCHAR

Output:
Column 	Type
customer_name 	VARCHAR
```

## Question 4
```
Given the employees and departments table, write a query to get the top 3 highest employee salaries by department. If the department contains less that 3 employees, the top 2 or the top 1 highest salaries should be listed (assume that each department has at least 1 employee).

Note: The output should include the full name of the employee in one column, the department name, and the salary. The output should be sorted by department name in ascending order and salary in descending order.

employees table
id 	INTEGER
first_name 	VARCHAR
last_name 	VARCHAR
salary 	INTEGER
department_id 	INTEGER

departments table
id 	INTEGER
name 	VARCHAR

Output:
employee_name 	VARCHAR
department_name 	VARCHAR
salary 	INTEGER
```


