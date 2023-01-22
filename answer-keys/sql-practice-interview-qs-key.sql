-- Question 1
select date_trunc('day',download_date) as download_date,
	   case when paying_customer = 'true' then 1 else 0 end as paying_customer,
	   round(sum(downloads)::numeric/count(distinct a.account_id)::numeric,2) as average_downloads
from accounts a
inner join downloads d on a.account_id = d.account_id
group by 1,2


-- Question 2
with cat_counts as (
	select count(category_id) over (partition by category_id order by id) as cat_count,
	name as product_name
	from products
)

select case when cat_count = 1 then 0 else 1 end as category_previously_purchased,
       product_name
from cat_counts


-- Question 3
with total_comments as (
	select count(c.created_at) as comment_count,
		   u.id as user_id
	from users u
	left join (
		select user_id, created_at
		from comments
		where created_at >= '2020-01-01'
		and created_at <= '2020-01-31') c 
	on u.id = c.user_id
	group by 2
)

select comment_count,
	   count(distinct user_id) as frequency
from total_comments
group by 1


-- Question 4
with total_rev as (
	select date_trunc('month',created_at) as dmonth,
	       sum(price * quantity) as rev
	from transactions t
	left join products p on t.product_id = p.id
	group by 1
),

lagged_rev as (
	select lag(rev) over (order by dmonth) as prev_rev,
	row_number() over (order by dmonth) as month
	dmonth,
	rev,
	from total_rev
)

select month,
round(((rev - prev_rev)::numeric/prev_rev::numeric), 2) as month_over_month
from lagged_rev