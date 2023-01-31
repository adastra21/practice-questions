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


-- Question 5
-- get id's sorted by scores
with new_scores as (
    select row_number() over (order by score) as new_id,
           id,
           student,
           score
    from scores
),

-- diffs can be with the row above or the row below
diffs as (
    select s.new_id, 
           s.student, 
           s.score, 
           s.score - s1.score as lag_score_diff,
           s2.score - s.score as lead_score_diff
    from new_scores s
    left join new_scores s1 on s.new_id = s1.new_id + 1
    left join new_scores s2 on s.new_id = s2.new_id - 1
),

-- match id to the row with the smaller diff
matched_ids as (
    select case when lag_score_diff < lead_score_diff then new_id - 1
                when lead_score_diff < lag_score_diff then new_id + 1
                end as matched_id,
            case when lag_score_diff < lead_score_diff then lag_score_diff
                 when lead_score_diff < lag_score_diff then lead_score_diff
                end as score_diff,
            new_id,
            student,
            lag_score_diff,
            lead_score_diff
    from diffs d
    order by 4
    limit 1
)

-- join on matched id
select m.student as one_student, 
       d.student as other_student, 
       m.score_diff
from matched_ids m
inner join diffs d on m.matched_id = d.new_id


-- Question 6
select id,
f.source_location,
f1.source_location
from flights f
inner join flights f1 on f.id >= f1.id
order by 1


-- Question 7
with avg_ct as (
    select avg(date_part('minute',end_dt - start_dt)) as avg_commuter_time,
           commuter_id
    from rides
    where city = 'NY'
    group by 2
),

avg_a as (
    select avg(date_part('minute',end_dt - start_dt)) as avg_time
    from rides
    where city = 'NY'
)

select commuter_id,
       round(avg_commuter_time::numeric,0) as avg_commuter_time,
       round(avg_time::numeric,0) as avg_time
from avg_ct, avg_a


-- Question 8
-- combine the two tables and create pairs
with paired_prods as (
    select p.name as p2,
           lag(p.name) over (partition by user_id order by created_at) as p1
    from transactions t
    left join products p on t.product_id = p.id
),

-- check pair order one way
paired_one_way as (
        select p1, 
               p2
        from paired_prods
        where p1 < p2
        and p2 is not null
),

-- check pair order the other way
paired_other_way as (
    select p2 as p1,
           p1 as p2
    from paired_prods
    where p2 < p1
    and p1 is not null
),

-- combine them into single order
all_pairs as  (
    (select * from paired_one_way)
    union all 
    (select * from paired_other_way)
)

-- count pairs
select p1,
       p2,
       count(*) as qty
from all_pairs
group by 1,2
order by 3 desc


-- Question 9
-- count of all upsell transactions – 
-- count of upsell transactions on same day
with all_upsell as (
    select row_number() over (partition by user_id order by created_at),
    user_id
    from transactions
),

count_all_upsell as (
    select count(distinct user_id) 
    from all_upsell
    where row_number > 1
),

same_day_upsell as (
    select row_number() over (partition by user_id,created_at order by created_at),
    user_id
    from transactions
),

count_same_day_upsell as (
    select count(distinct user_id)
    from same_day_upsell
    where row_number > 1
)

select (select * from count_all_upsell) - (select * from count_same_day_upsell)
as num_of_upsold_customers


-- Question 10
select count(distinct user_id) as num_customers,
       count(t.id) as num_orders,
       sum(t.quantity*p.price) as order_amt,
       date_part('month',t.created_at) as month
from transactions t
left join products p on t.product_id = p.id
left join users u on u.id = t.user_id
where t.created_at >= '2020-01-01'
and t.created_at <= '2020-12-31'
group by 4