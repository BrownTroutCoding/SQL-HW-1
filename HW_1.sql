-- HW 1 module 4 SQL

-- 1. How many actors are there with last name 'wahlberg'?
select * from actor

select last_name, count(last_name)
from actor 
where last_name = 'Wahlberg'
group by last_name;
-- Answer: 2 actors have the last name 'Wahlberg'.


-- 2. How many payments were made between $3.99 and $5.99?
select * from payment

select count(amount) 
from payment 
where amount between 3.99 and 5.99;
-- Answer: 4,794 payments were made between these two prices.


-- 3. What film does the store have the most of?
select * from inventory

SELECT film_id, count(film_id)
FROM inventory
GROUP BY film_id
order by count desc;
-- Answer: Crossroad Casualties along with 71 other titles have 8 copies.


-- 4. How many customers have the last name 'William'?
select * from customer

SELECT last_name
FROM customer
where last_name = 'William';
-- where last_name like 'William';
-- Answer: There are no customers with the last name 'William', however there is one 'Williams' and one 'Williamson'.


-- 5. what store employee (get the id) sold the most rentals?
select * from rental

select staff_id, count(staff_id)
from rental
group by staff_id;
-- Answer: Staff_id #1 sold the most at 8,040 rentals, a close 1st to staff_id #2 who sold 8,004 rentals.


-- 6. How many different district names are there?
select * from address

select count(distinct district)
from address;
-- Answer: There are 378 distinct districts.


-- 7. what film has the most actors in it? (use film_actor and get film_id)
select * from film_actor

select film_id, count(actor_id)
from film_actor
group by film_id
order by count desc;

-- Answer: Lambs Cincinatti has the most actors, with 15.


-- 8. from store_id 1, how many customers have a last name ending with 'es'? (use customer table)
select * from customer

select count(last_name)
from customer
where store_id = 1 
and last_name like '%es';
-- Answer: 13 customers in store_id 1 have last names that end with 'es'.


-- 9. How many payment amounts (4.99, 5.99, etc) had a # of rentals above 250 for customers with id's between 380 and 430? (use group by and having > 250)
select * from payment

select amount, count(amount)
from payment
where customer_id between 380 and 430
group by amount 
having count(amount) > 250;
-- Answer: There are 3 payment amounts that with the # of rentals above 250 with id's between 380 and 430. We can deduce that these three payment amounts 
-- are the best for these customers ($2.99, $4.99, and $6.99)


-- 10. Within the film table, how many rating catefories are there? and what rating has the most movies total?
select * from film

select rating, count(distinct rating)
from film

select rating, count(rating)
from film
group by rating
order by count(rating) desc
-- Answer: There are 5 categories, and PG-13 is the category with the most titles.