# SQL Practice [Hard]

## Question 1
```
There are two tables. One table is called swipes that holds a row for every Tinder swipe and contains a boolean column that determines if the swipe was a right or left swipe called is_right_swipe. The second is a table named variants that determines which user has which variant of an AB test.

Write a SQL query to output the average number of right swipes for two different variants of a feed ranking algorithm by comparing users that have swiped the first 10, 50, and 100 swipes on their feed.

Note: Users have to have swiped at least 10 times over the course of the experiment to be included in the subset of users to analyze the mean number of right swipes.

variants table
id 	INTEGER
experiment 	VARCHAR
variant 	VARCHAR
user_id 	INTEGER

swipes table
id 	INTEGER
user_id 	INTEGER
swiped_user_id 	INTEGER
created_at 	DATETIME
is_right_swipe 	BOOLEAN

Output:
variant 	VARCHAR
mean_right_swipes 	FLOAT
swipe_threshold 	INTEGER
num_users 	INTEGER
```
