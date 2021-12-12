--- Lab | SQL Self and cross join


-- 1 Get all pairs of actors that worked together.
select f1.film_id, a.first_name, a.last_name, a2.first_name, a2.last_name
from film_actor f1
join film_actor f2
on f1.film_id = f2.film_id 
and f1.actor_id > f2.actor_id
join actor a
on f1.actor_id = a.actor_id
join actor a2
on f2.actor_id = a2.actor_id
order by f1.film_id 

--- 2. Get all pairs of customers that have rented the same film more than 3 times.
SELECT
	f.title,
    cust1,
    cust2
FROM
		(
		SELECT
			film_id,
			cust1,
			cust2,
			COUNT(*) OVER (PARTITION BY film_id) ct
		FROM
			(
			SELECT 
				r1.inventory_id film_id,
				r1.customer_id cust1,
				r2.customer_id cust2
			FROM
				rental r1
				JOIN rental r2
					ON r1.inventory_id = r2.inventory_id AND r1.customer_id <> r2.customer_id
			 ) d1 -- First subquery
		WHERE
			cust1 < cust2
		) d2 -- Second subquery
		JOIN film f
			ON d2.film_id = f.film_id
 WHERE 
	ct > 3;
--- 3 Get all possible pairs of actors and films.
select actor_id, film_id
from film_actor fa1
join film_actor fa2
on fa1.actor_id <>fa2.actor_id and fa1.film_id = fa2.film_d
group by actor_id, film_id
