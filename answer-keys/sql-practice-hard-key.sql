-- Question 1
-- join the two tables and get cumulative swipes
with joined as (
    select row_number() over (partition by s.user_id order by created_at, swiped_user_id) as cum_swipes,
           s.user_id,
           is_right_swipe,
           variant
    from swipes s
    inner join variants v on v.user_id = s.user_id
    where v.experiment = 'feed_change'
),

-- get max swipes from cumulative swipes
-- filter to users with at least 10 swipes
max_swipes as (
    select user_id,
           max(cum_swipes) as max_swipes
    from joined
    group by 1
    having max(cum_swipes) >= 10
),

-- segment users based on max swipes
-- note: be careful with the case criteria
joined_filtered as (
    select j.*,
           case when max_swipes < 50 then 10
                when max_swipes < 100 then 50
                else 100 end as swipe_threshold
    from joined j
    inner join max_swipes s on j.user_id = s.user_id
)

-- calculate remaining metrics 
-- note: this will be inclusive of users who may not have had 10 swipes to begin with
-- as long as they cumulatively swiped 10 times or more
select variant,
       sum(is_right_swipe)/count(distinct user_id) as mean_right_swipes,
       swipe_threshold,
       count(distinct user_id) as num_users
from joined_filtered
group by 1,3