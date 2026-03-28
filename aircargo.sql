use aircargo;
select * from passengers_on_flights;
select * from routes;
select * from ticket_details;
select * from customer;

-- routes 01 to 25 --
SELECT *
FROM passengers_on_flights
WHERE route_id BETWEEN '01' AND '25';

-- passengers and total revenue in buisness class --
SELECT 
  SUM(no_of_tickets) AS tatal_buisness_tickets,
  SUM(price_per_ticket * no_of_tickets) AS total_revenue_business
FROM ticket_details
WHERE class_id = 'Business';

-- full name of the customer --
select concat(first_name,last_name) as full_name
from customer;

-- customers who booked and register from customer and ticket details table --
SELECT DISTINCT c.customer_id
FROM customer AS c
inner JOIN ticket_details AS td
  ON c.customer_id = td.customer_id;
  
  -- coustomer name from brand(emirates) --
  select td.customer_id, td.brand, c.first_name, c.last_name
  from ticket_details as td, customer as c
  where td.customer_id = c.customer_id
  having brand = "emirates";

-- identify the customers who have traveled by Economy Plus class using the sub-query on the passengers_on_flights table.--
SELECT *
FROM customer AS c
WHERE c.customer_id IN (
  SELECT p.customer_id
  FROM passengers_on_flights AS p
  WHERE p.class_id = 'Economy Plus'
);

-- revenue threshold 10000 --
SELECT 
  SUM(no_of_tickets * price_per_ticket) AS total_revenue,
  IF(SUM(no_of_tickets * price_per_ticket) > 10000,
    'Yes, revenue crossed 10000',
    'No, revenue did not cross 10000') AS irevenue_threshold
FROM ticket_details;

-- creating & granting access to new user --
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'Your$tr0ngP@ssw0rd';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP
  ON aircargo.* 
  TO 'new_user'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'new_user'@'localhost';

-- maximum ticket price for each class --
select price_per_ticket, class_id,
max(price_per_ticket) over(partition by class_id) as max_price
from ticket_details;

-- to extract the passengers whose route ID is 4 using index --
CREATE INDEX idx_route_id ON passengers_on_flights(route_id);
SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

-- query to view the execution plan for route id 4 --
EXPLAIN SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

-- to calculate the total price of all tickets booked by a customer across different aircraft IDs using the rollup function--
SELECT 
    customer_id,
    aircraft_id,
    SUM(price_per_ticket) AS total_price
FROM 
    ticket_details
GROUP BY 
    customer_id, aircraft_id WITH ROLLUP;
    
    
-- buisness class coustomers seprate view--
CREATE VIEW business_class_customers AS
SELECT 
    customer_id,
    brand
FROM 
    ticket_details
WHERE 
    class_id = 'Business';
    SELECT * FROM business_class_customers;
    
-- create a stored procedure that extracts all the details from the routes table where the traveled distance is more than 2000 miles --
DELIMITER //
CREATE PROCEDURE GetLongRoutes()
BEGIN
    SELECT *
    FROM routes
    WHERE distance_miles > 2000;
END //
DELIMITER ;
CALL GetLongRoutes();

-- Using GROUP BY, determine the total number of tickets purchased by each customer and the total price paid.--
SELECT 
    customer_id,
    COUNT(*) AS total_tickets,
    SUM(price_per_ticket) AS total_amount_paid
FROM 
    ticket_details
GROUP BY 
    customer_id;
    
	-- the average distance and average number of passengers per aircraft, considering only those routes with more than one departure date
    SELECT r.aircraft_id,
    AVG(r.distance_miles) AS avg_distance,
    AVG(pf.passenger_count) AS avg_passengers
FROM (SELECT 
        route_id,
        COUNT(DISTINCT travel_date) AS departure_count,
        COUNT(customer_id) AS passenger_count
    FROM 
        passengers_on_flights
    GROUP BY 
        route_id
    HAVING 
        COUNT(DISTINCT travel_date) > 1) pf
JOIN routes r ON pf.route_id = r.route_id
GROUP BY r.aircraft_id;
  
