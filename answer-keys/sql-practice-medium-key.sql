-- Question 1
with max_dates as (
    select max(created_at) as max_date,
           date_trunc('day',created_at) as created_at
    from bank_transactions
    group by 2
)


select m.max_date as created_at,
       b.transaction_value,
       b.id
from bank_transactions b
inner join max_dates m on b.created_at = m.max_date


-- Question 2
with one_salary as (
    select max(id) as id,
    first_name,
    last_name
    from employees
    group by 2,3
)

select first_name,
       last_name,
       e.salary
from employees e
inner join one_salary s on e.id = s.id


-- Question 3
with combined as (
    select sum(case when date_part('year',created_at) = '2019' then 1 else 0 end) as y2019,
           sum(case when date_part('year',created_at) = '2020' then 1 else 0 end) as y2020,
           user_id
    from transactions
    group by 3
    having sum(case when date_part('year',created_at) = '2019' then 1 else 0 end) > 3
    and sum(case when date_part('year',created_at) = '2020' then 1 else 0 end) > 3
)

select name as customer_name 
from users  u
inner join combined c on u.id = c.user_id


-- Question 4
with ranked_sals as (
    select rank() over (partition by department_id order by salary desc) as salary_rank,
    department_id, id
    from employees
),

top_sals as (
    select department_id, id
    from ranked_sals
    where salary_rank <= 3
)

select first_name || ' ' || last_name as employee_name,
       name as department_name,
       salary
from employees e
inner join top_sals on e.id = top_sals.id
left join departments d on d.id = top_sals.department_id
order by 2 asc,
         3 desc