#SQL BASICS ASSIGNMENT QUESTION

'''1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints.'''

CREATE TABLE employee (
    emp_id INTEGER,
    emp_name VARCHAR(100) NOT NULL,
    age INTEGER CHECK (age >= 18),
    email VARCHAR(255) UNIQUE,
    salary DECIMAL DEFAULT 30000
);

'''7. You have two tables:
Write a query to fetch the student_name and class_name for each student using an INNER JOIN.'''

SELECT Students.student_name, Classes.class_name
FROM Students
INNER JOIN Classes ON Students.class_id = Classes.class_id;

'''8. Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order
Hint: (use INNER JOIN and LEFT JOIN)5'''

SELECT
    o.order_id,
    c.customer_name,
    p.product_name
FROM products p
LEFT JOIN order_details od ON p.product_id = od.product_id
LEFT JOIN orders o ON od.order_id = o.order_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;

#9-Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

SELECT
    p.product_name,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM order_details od
INNER JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

#10- Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

SELECT
    o.order_id,
    c.customer_name,
    SUM(od.quantity) AS total_quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id, c.customer_name
ORDER BY c.customer_name, o.order_id;

#2-List all details of actors'''
Select * from actor;

#3-List all customer information from DB.'''
Select * from actor;

#4- List different countries.
Select Country From Country;

#5- Display all active customers.
select first_name, last_name from customer where active = 1;

#6- -List of all rental IDs for customer with ID 1
select rental_id from rental where customer_id =1;

#7- Display all the films whose rental duration is greater than 5
select film_id, title from film where rental_duration >5;

#8- List the total number of films whose replacement cost is greater than $15 and less than $20.
select film_id, title from film where replacement_cost > 15 and replacement_cost < 20;

#9- Display the count of unique first names of actors.
Select count(distinct first_name) from actor;

#10 - Display the first 10 records from the customer table'''
select * from customer limit 10;

#11- Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer where first_name like 'b%' limit 3;

#12- Display the names of the first 5 movies which are rated as ‘G’.
select  film_id, title from film  where rating = 'G'  limit 5;

#13- Find all customers whose first name starts with "a".
select first_name, last_name from customer where first_name like 'a%';

#14- Find all customers whose first name ends with "a".
select first_name, last_name from customer where first_name like '%a';

#15- Display the list of first 4 cities which start and end with ‘a’ .
select first_name, last_name from customer where first_name like '%a' and first_name like 'a%';

#16-  Find all customers whose first name have "NI" in any position.
select first_name from customer where first_name like '%ni%';

#17- Find all customers whose first name have "r" in the second position .
select first_name from customer where first_name like '_r%';

#18- Find all customers whose first name starts with "a" and are at least 5 characters in length.
select first_name from customer where first_name like '%a_____';

#19- Find all customers whose first name starts with "a" and ends with "o".
select first_name from customer where first_name like 'a%' and first_name like '%o';

#20- Get the films with pg and pg-13 rating using IN operator.'''
select * from film where rating in('pg','pg-13');

#21- Get the films with length between 50 to 100 using between operator
select * from film where length between 5 and 100;

#22- Get the top 50 actors using limit operator.
select * from actor limit 50;

#23-- Get the distinct film ids from inventory table.
select distinct film_id from inventory;

## Functions
#. Basic Aggregate Functions:

#1- Retrieve the total number of rentals made in the Sakila database.Hint: Use the COUNT() function.
select Count(rental_id) from rental;

#2- Find the average rental duration (in days) of movies rented from the Sakila database.Hint: Utilize the AVG() function.
select avg(rental_duration) from film; 

#3- Display the first name and last name of customers in uppercase.Hint: Use the UPPER () function.
select upper(concat(first_name,last_name)) as name from customer;

#4- Extract the month from the rental date and display it alongside the rental ID.Hint: Employ the MONTH() function.
select rental_id, extract(month from rental_date) from rental;

#5- Retrieve the count of rentals for each customer (display customer ID and the count of rentals).Hint: Use COUNT () in conjunction with GROUP BY.'''
select count(rental_id), customer_id from rental group by customer_id;

#6- Find the total revenue generated by each store.Hint: Combine SUM() and GROUP BY.
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;

#7- Determine the total number of rentals for each category of movies.Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
SELECT c.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_rentals DESC;

#8- Find the average rental rate of movies in each language.Hint: JOIN film and language tables, then use AVG () and GROUP BY.

SELECT l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name
ORDER BY average_rental_rate DESC;

# Joins

#9- Display the title of the movie, customer s first name, and last name who rented it.Hint: Use JOIN between the film, inventory, rental, and customer tables.
SELECT
    f.title AS movie_title,
    c.first_name,
    c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

#10- Retrieve the names of all actors who have appeared in the film "Gone with the Wind."Hint: Use JOIN between the film actor, film, and actor tables.
SELECT
    a.first_name,
    a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'Gone with the Wind';

#11- Retrieve the customer names along with the total amount they've spent on rentals.Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
 SELECT
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_amount_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_amount_spent DESC;

#12- List the titles of movies rented by each customer in a particular city (e.g., 'London').Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
SELECT
    c.first_name,
    c.last_name,
    ci.city,
    f.title AS movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.last_name, c.first_name, f.title;

#13- Display the top 5 rented movies along with the number of times they've been rented.JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
SELECT
    f.title AS movie_title,
    COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 5;

#14- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT
    c.first_name,
    c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

#Windows Function:
#1. Rank the customers based on the total amount they've spent on rentals.
WITH CustomerSpending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM CustomerSpending
ORDER BY spending_rank;

#2.Calculate the cumulative revenue generated by each film over time.
WITH FilmRevenue AS (
    SELECT
        f.film_id,
        f.title,
        r.rental_date,
        p.amount
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN payment p ON r.rental_id = p.rental_id
)
SELECT
    film_id,
    title,
    rental_date,
    amount,
    SUM(amount) OVER (PARTITION BY film_id ORDER BY rental_date) AS cumulative_revenue
FROM FilmRevenue
ORDER BY film_id, rental_date;

#3- Determine the average rental duration for each film, considering films with similar lengths.
WITH RentalDuration AS (
    SELECT
        f.film_id,
        f.title,
        f.length,  -- Length of the film (in minutes)
        DATEDIFF(r.return_date, r.rental_date) AS rental_duration
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE r.return_date IS NOT NULL  -- Ensures that rentals have been returned
)
SELECT
    length,
    AVG(rental_duration) AS avg_rental_duration
FROM RentalDuration
GROUP BY length
ORDER BY length;

#4-Identify the top 3 films in each category based on their rental counts.
WITH FilmRentalCounts AS (
    SELECT
        f.film_id,
        f.title,
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, c.name
)
SELECT
    film_id,
    title,
    category_name,
    rental_count,
    ROW_NUMBER() OVER (PARTITION BY category_name ORDER BY rental_count DESC) AS rank
FROM FilmRentalCounts
WHERE rank <= 3
ORDER BY category_name, rank;

#5-Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.

WITH CustomerRentals AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(r.rental_id) AS total_rentals
    FROM customer c
    LEFT JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
AverageRentals AS (
    SELECT AVG(total_rentals) AS avg_rentals
    FROM CustomerRentals
)
SELECT
    cr.customer_id,
    cr.first_name,
    cr.last_name,
    cr.total_rentals,
    ar.avg_rentals,
    (cr.total_rentals - ar.avg_rentals) AS rental_difference
FROM CustomerRentals cr, AverageRentals ar
ORDER BY rental_difference DESC;

#6-Find the monthly revenue trend for the entire rental store over time.
SELECT
    DATE_FORMAT(r.rental_date, '%Y-%m') AS month,
    SUM(p.amount) AS total_revenue
FROM rental r
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY month
ORDER BY month;

#7-  Identify the customers whose total spending on rentals falls within the top 20% of all customers.
WITH TotalSpending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spending
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
SpendingPercentile AS (
    SELECT
        PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY total_spending DESC) AS top_20_percent_threshold
    FROM TotalSpending
)
SELECT
    ts.customer_id,
    ts.first_name,
    ts.last_name,
    ts.total_spending
FROM TotalSpending ts, SpendingPercentile sp
WHERE ts.total_spending >= sp.top_20_percent_threshold
ORDER BY ts.total_spending DESC;

#8-Calculate the running total of rentals per category, ordered by rental count.

WITH CategoryRentalCount AS (
    SELECT
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film_category fc ON i.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name
),
RunningTotal AS (
    SELECT
        category_name,
        rental_count,
        SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
    FROM CategoryRentalCount
)
SELECT
    category_name,
    rental_count,
    running_total
FROM RunningTotal
ORDER BY rental_count DESC;

#9-Find the films that have been rented less than the average rental count for their respective categories
WITH FilmRentalCount AS (
    SELECT
        f.film_id,
        f.title,
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film_category fc ON i.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN film f ON f.film_id = i.film_id
    GROUP BY f.film_id, f.title, c.name
),
CategoryAvgRentalCount AS (
    SELECT
        c.name AS category_name,
        AVG(COUNT(r.rental_id)) OVER (PARTITION BY c.name) AS avg_rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film_category fc ON i.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name
)
SELECT
    frc.film_id,
    frc.title,
    frc.category_name,
    frc.rental_count,
    car.avg_rental_count
FROM FilmRentalCount frc
JOIN CategoryAvgRentalCount car ON frc.category_name = car.category_name
WHERE frc.rental_count < car.avg_rental_count
ORDER BY frc.category_name, frc.rental_count;

#10- Identify the top 5 months with the highest revenue and display the revenue generated in each month.

WITH MonthlyRevenue AS (
    SELECT
        DATE_FORMAT(r.rental_date, '%Y-%m') AS month_year,
        SUM(p.amount) AS total_revenue
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
    GROUP BY month_year
)
SELECT
    month_year,
    total_revenue
FROM MonthlyRevenue
ORDER BY total_revenue DESC
LIMIT 5;

'''5-CTE Basics:

 a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they

 have acted in from the actor and film_actor tables'''
 
 WITH ActorFilmCount AS (
    SELECT
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT
    first_name,
    last_name,
    film_count
FROM ActorFilmCount;

'''6- CTE with Joins:

 a. Create a CTE that combines information from the film and language tables to display the film title,

 language name, and rental rate.'''
 
 WITH FilmLanguage AS (
    SELECT
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT
    film_title,
    language_name,
    rental_rate
FROM FilmLanguage;

'''7-CTE for Aggregation:

 a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments)

 from the customer and payment tables.'''
 
 WITH CustomerRevenue AS (
    SELECT
        p.customer_id,
        SUM(p.amount) AS total_revenue
    FROM payment p
    GROUP BY p.customer_id
)
SELECT
    c.first_name,
    c.last_name,
    cr.total_revenue
FROM CustomerRevenue cr
JOIN customer c ON cr.customer_id = c.customer_id
ORDER BY cr.total_revenue DESC;

'''8-  CTE with Window Functions:

 a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.'''
 
 WITH RankedFilms AS (
    SELECT
        f.film_id,
        f.title,
        f.rental_duration,
        RANK() OVER (ORDER BY f.rental_duration DESC) AS rental_rank
    FROM film f
)
SELECT
    film_id,
    title,
    rental_duration,
    rental_rank
FROM RankedFilms
ORDER BY rental_rank;

'''9- CTE and Filtering:

 a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the

 customer table to retrieve additional customer details.'''
 
 WITH CustomerRentalCount AS (
    SELECT
        r.customer_id,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    GROUP BY r.customer_id
    HAVING COUNT(r.rental_id) > 2
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    crc.rental_count
FROM CustomerRentalCount crc
JOIN customer c ON crc.customer_id = c.customer_id;

'''10-a. Write a query using a CTE to find the total number of rentals made each month, considering the

 rental_date from the rental table
'''

WITH MonthlyRentals AS (
    SELECT
        YEAR(r.rental_date) AS rental_year,
        MONTH(r.rental_date) AS rental_month,
        COUNT(r.rental_id) AS total_rentals
    FROM rental r
    GROUP BY YEAR(r.rental_date), MONTH(r.rental_date)
)
SELECT
    rental_year,
    rental_month,
    total_rentals
FROM MonthlyRentals
ORDER BY rental_year DESC, rental_month DESC;

'''11-CTE and Self-Join:

 a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film

 together, using the film_actor table.'''
 
 pWITH ActorPairs AS (
    SELECT
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id  -- To avoid duplicate pairs
)
SELECT
    a1.first_name AS actor1_first_name,
    a1.last_name AS actor1_last_name,
    a2.first_name AS actor2_first_name,
    a2.last_name AS actor2_last_name,
    ap.film_id
FROM ActorPairs ap
JOIN actor a1 ON ap.actor1_id = a1.actor_id
JOIN actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY ap.film_id;

'''CTE for Recursive Search:

 a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager,

 considering the reports_to column'''
 
 WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: select the manager
    SELECT
        s.employee_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM staff s
    WHERE s.employee_id = <specific_manager_id>  -- Replace with the manager's ID (e.g., 1)

    UNION ALL

    -- Recursive case: find employees who report to the selected employees
    SELECT
        s.employee_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM staff s
    INNER JOIN EmployeeHierarchy eh ON s.reports_to = eh.employee_id
)
-- Final selection: retrieve the employees in the hierarchy
SELECT
    employee_id,
    first_name,
    last_name,
    reports_to
FROM EmployeeHierarchy
ORDER BY employee_id;