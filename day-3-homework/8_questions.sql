--Question 1
--Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
SELECT customer_id, first_name, last_name, address, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

--Question 2
--Answer: The answer is super long so I'm not going to list them all sorry Terrell (:
SELECT first_name, last_name, amount, payment_id
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
ORDER BY last_name;

--Question 3
--Answer: Rhonda K, Clara S, Eleanor H, Marion S, Tommy C, Karl S
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

--Question 4
--Answer: Kevin Schuler

SELECT customer.first_name, customer.last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--Question 5
--Answer: Mike Hillyer
SELECT first_name, last_name, COUNT(payment_id)
FROM staff
INNER JOIN payment 
ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(payment.payment_id)
LIMIT 1;


--Question 6
--Answer:  R - 195, PG-13 - 223, PG - 194, G - 178, NC-17 - 210
SELECT rating, COUNT(rating) AS num_movies 
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;


--Question 7
--Answer: Another super long answer here, but preeeeeeetty sure this is right
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id, amount
	HAVING amount > 6.99
)
ORDER BY last_name;

--Question 8
--Answer: 24

SELECT COUNT(rental.rental_id) AS num_free_rentals
FROM rental
INNER JOIN payment
ON rental.rental_id = payment.rental_id
WHERE amount = 0;