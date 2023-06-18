--Number of payment transactions > $5.00
SELECT * FROM payment;
SELECT COUNT(DISTINCT amount) AS No_of_payment_transcations_greater_than_5 
FROM payment WHERE amount >5;
--11 payment transactions were > $5.00


--Number of actors with first name starting with the letter P.
SELECT * FROM actor;
SELECT COUNT (first_name) 
FROM actor 
WHERE first_name LIKE 'P%';
--5 actors first name start with the letter P


--Customers unique districts.
SELECT * FROM address;
SELECT COUNT (DISTINCT district) 
FROM address;
--378 unique districts

--Names of unique districts.
SELECT DISTINCT (district) FROM address
ORDER BY District ASC;

--Number of Films with the word 'Truman' in their title.
SELECT * FROM film;
SELECT COUNT (title) 
FROM film 
WHERE title LIKE '%Truman%';
--5 films have the word 'Truman' in their title

--Create Table to organize potential leads with the following information; Customer's first name,
--last name, email, sign up date, number of minutes spent on DVD rental site, ID tracker.
SELECT * FROM customer;
SELECT * FROM rental;
SELECT * FROM payment

SELECT cus.customer_id, first_name, last_name, email, create_date, payment_date
FROM CUSTOMER as cus
JOIN PAYMENT as pay
ON cus.customer_id = pay.customer_id;

create table Potential_Leads
(
Customer_id int primary key Not Null, 
Firstname varchar(20) Not Null,
Lastname varchar(20) Not Null,
Email varchar(20) Not Null,
Signupdate date Not Null,
Min_spent int Not Null
);

--Customer with the highest customer ID number whose name start the letter 'E', with an address ID
--lower than 500
SELECT first_name, last_name, address_id, MAX(customer_id) AS highest_customer_id
FROM customer 
WHERE address_id <500  AND first_name LIKE 'E%' 
GROUP BY customer_id ORDER BY customer_id DESC
Limit 1;
--Edward Tomlin, with customer_id 434,and address_id 439.

--Customer_IDs of customers who spent at least $110 with staff member whose staff_id is 2
SELECT * FROM payment;
SELECT customer_id, SUM(amount) AS total_amount, staff_id
FROM payment 
WHERE staff_id = 2 
GROUP BY customer_id, staff_id
HAVING SUM(amount) >= 110;
--Customer_IDs I87 and 148

--Number of films with R rating, and replacement cost between $5 and $15
SELECT * FROM film;
SELECT COUNT (rating) as Count_of_Rating
FROM film 
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15; 
--52 films.

--Maximum payment transaction done by customers
SELECT * FROM payment;
SELECT MAX(amount) AS maximum_payment FROM payment;
SELECT CUSTOMER_ID FROM payment WHERE AMOUNT = 11.99;
--Maximum payment transaction is 11.99
