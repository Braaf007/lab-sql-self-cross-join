--- Lab | SQL Join

--- 1.List number of films per category.
select category, count(category) as counts
from film_list
group by category
order by count(category)

--- 2 Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address
from staff s
inner join staff_list ss on s.staff_id = ss.ID

--- 3 Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, r.staff_id, count(rental_id) 
from staff s
inner join rental r on s.staff_id = r.staff_id
where rental_date between '2005-08-01' and '2005-08-30'
group by staff_id, first_name, last_name
order by count(rental_id)

--- List each film and the number of actors who are listed for that film.
select film_id, count(a.actor_id) as counts
from actor a
inner join film_actor f on a.actor_id = f.actor_id
group by film_id
order by counts

---- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name

select first_name, last_name, c.customer_id, sum(amount) as total_amount
from payment p
inner join customer c on p.customer_id = c.customer_id
group by customer_id

