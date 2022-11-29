select * from address a 

-- 1. all customers from texas 
select customer_id, first_name, last_name, district
from customer 
full join address
on customer.address_id = address.address_id 
where district like 'Texas';

--2. payments above 6.99 with full name
select amount, first_name, last_name
from customer 
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;


--3. customers paying over $175

select *
from customer
where customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175)
	
--4. all customers living in Nepal

select customer_shay.city, city.city, first_name, last_name
from customer_shay
full join city
on customer_shay.city = city.city
where city.city like 'nepal';

--5. which staff member had the most transactions

select count(staff.staff_id), payment.staff_id, staff.first_name, staff.last_name 
from staff 
full join payment 
on staff.staff_id = payment.staff_id
group by payment.staff_id, staff.first_name, staff.last_name 

--ans: Jon Stephens

--6. How many movies of each rating are there

select count(rating), rating
from film 
group by rating 

--ans: R = 195, NC-17 = 209, G = 178, PG-13 = 223, PG = 194

--7. All customers who have made a single payment

select * from customer
where customer_id in (
	select customer_id 
	from payment
	where amount > 6.99
)

--8.free rentals

select amount, rental_id, count(amount)
from payment
where amount = 0.00
group by amount, rental_id 

ans: 0 free rentals






