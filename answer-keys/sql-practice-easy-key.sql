-- Question 1
select coalesce(sum(distance),0) as distance_traveled,
	   u.name as name
from users u
left join riders r on u.id = r.passenger_user_id
group by 2
order by 1 desc


-- Question 2
select name
from neighboorhoods n
left join users u on n.id = u.neighborhood_id
group by 1
having count(u.id) = 0


-- Question 3
select salary
from (
	   select sum(salary) as salary,
	    	  e.id
	   from departments d
	   left join employees e on d.id = e.department_id
	   where d.name = 'engineering'
	   group by 2
	   order by 1 desc
	   limit 2) high_sal
order by 1
limit 1


-- Question 4
select date_trunc('hour',download_date) as download_date,
	   case when paying_customer = true then 1 else 0 end as paying_customer,
	   avg(downloads) as average_downloads
from downloads d
left join accounts a on d.account_id = a.account_id
where d.downloads >= 1
group by 1,2
order by 1,2


-- Question 5
select sum(case when salary > 1e5 then 1.0 end)::float/count(e1.id)::float as percentage_over_100k,
       d1.name as department_name,
       count(e1.id) as number_of_employees
from employees e1
left join departments d1 on e1.department_id = d1.id
where d1.name in (
				  select d.name 
				  from employees e
				  left join departments d on e.department_id = d.id
				  group by 1
				  having count(e.id) >= 10)
group by 2
order by 1 desc
limit 3