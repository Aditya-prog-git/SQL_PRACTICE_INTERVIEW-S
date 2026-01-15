-- Create a brand new schema
CREATE DATABASE IF NOT EXISTS zomato;

-- Switch to it
USE zomato;

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    restaurant_name VARCHAR(100),
    city VARCHAR(100),
    delivery_partner VARCHAR(100),
    order_amount DECIMAL(10,2),
    order_status VARCHAR(50),     -- completed/cancelled/rejected/returned
    payment_method VARCHAR(50),   -- upi/card/cash/wallet
    order_date DATE
);

INSERT INTO food_orders VALUES
(101, 1, 201, 'Spice Hub', 'Delhi', 'Ravi', 500, 'completed', 'upi', '2024-04-10'),
(102, 2, 202, 'Tandoor Palace', 'Mumbai', 'Anita', 380, 'cancelled', 'cash', '2024-04-10'),
(103, 1, 201, 'Spice Hub', 'Delhi', 'Ravi', 620, 'completed', 'card', '2024-04-11'),
(104, 3, 203, 'Urban Pizza', 'Bangalore', 'Manoj', 850, 'rejected', 'upi', '2024-04-11'),
(105, 4, 204, 'Green Bowl', 'Delhi', 'Anita', 450, 'completed', 'wallet', '2024-04-12'),
(106, 2, 202, 'Tandoor Palace', 'Mumbai', 'Farhan', 700, 'completed', 'upi', '2024-04-12'),
(107, 5, 204, 'Green Bowl', 'Delhi', 'Ravi', 300,  'completed', 'upi',   '2024-04-12'),
(108, 6, 201, 'Spice Hub', 'Delhi', 'Anita', 750, 'completed', 'cash',  '2024-04-13'),
(109, 1, 203, 'Urban Pizza', 'Bangalore', 'Manoj', 920, 'completed', 'upi', '2024-04-13'),
(110, 7, 202, 'Tandoor Palace', 'Mumbai', 'Farhan', 600, 'cancelled', 'wallet','2024-04-13'),
(111, 2, 201, 'Spice Hub', 'Delhi', 'Ravi', 450,  'completed', 'upi',   '2024-04-14'),
(112, 8, 205, 'Wrap Factory', 'Hyderabad', 'Meera', 550, 'completed', 'card', '2024-04-14'),
(113, 9, 205, 'Wrap Factory', 'Hyderabad', 'Meera', 650, 'completed', 'cash', '2024-04-14'),
(114, 5, 202, 'Tandoor Palace', 'Mumbai', 'Anita', 500, 'rejected', 'upi','2024-04-15'),
(115, 6, 204, 'Green Bowl', 'Delhi', 'Farhan', 820, 'completed', 'upi', '2024-04-15'),
(116,10, 201, 'Spice Hub', 'Delhi', 'Ravi', 1000,'completed', 'upi', '2024-04-16'),
(117, 1, 201, 'Spice Hub', 'Delhi', 'Ravi', 750, 'returned', 'upi', '2024-04-16'),
(118,11,206,'Burger Barn','Delhi','Ravi',420,'completed','upi','2024-04-17'),
(119,12,207,'Sushi Zen','Mumbai','Anita',980,'completed','card','2024-04-17'),
(120,13,208,'Pasta Point','Bangalore','Manoj',610,'cancelled','upi','2024-04-18'),
(121,14,201,'Spice Hub','Delhi','Farhan',530,'completed','cash','2024-04-18'),
(122,15,204,'Green Bowl','Delhi','Ravi',390,'returned','upi','2024-04-18'),
(123,16,202,'Tandoor Palace','Mumbai','Meera',860,'completed','upi','2024-04-19'),
(124,17,205,'Wrap Factory','Hyderabad','Meera',720,'completed','wallet','2024-04-19'),
(125,18,209,'Noodle Box','Pune','Anita',450,'rejected','card','2024-04-19'),
(126,19,207,'Sushi Zen','Mumbai','Farhan',1100,'completed','upi','2024-04-20'),
(127,20,210,'Curry Leaf','Chennai','Ravi',640,'completed','upi','2024-04-20'),
(128,11,206,'Burger Barn','Delhi','Ravi',560,'completed','upi','2024-04-20'),
(129,12,207,'Sushi Zen','Mumbai','Anita',870,'cancelled','upi','2024-04-21'),
(130,13,208,'Pasta Point','Bangalore','Manoj',690,'completed','card','2024-04-21'),
(131,14,209,'Noodle Box','Pune','Farhan',510,'completed','upi','2024-04-21'),
(132,15,210,'Curry Leaf','Chennai','Meera',780,'completed','wallet','2024-04-22'),
(133,16,201,'Spice Hub','Delhi','Ravi',930,'completed','upi','2024-04-22'),
(134,17,204,'Green Bowl','Delhi','Anita',410,'cancelled','cash','2024-04-22'),
(135,18,205,'Wrap Factory','Hyderabad','Meera',600,'completed','upi','2024-04-23'),
(136,19,206,'Burger Barn','Delhi','Farhan',520,'completed','upi','2024-04-23'),
(137,20,207,'Sushi Zen','Mumbai','Ravi',990,'completed','card','2024-04-23'),
(138,11,208,'Pasta Point','Bangalore','Manoj',640,'completed','upi','2024-04-24'),
(139,12,209,'Noodle Box','Pune','Anita',480,'completed','upi','2024-04-24'),
(140,13,210,'Curry Leaf','Chennai','Meera',720,'completed','upi','2024-04-24'),
(141,14,201,'Spice Hub','Delhi','Farhan',860,'completed','wallet','2024-04-25'),
(142,15,202,'Tandoor Palace','Mumbai','Ravi',910,'completed','upi','2024-04-25'),
(143,16,203,'Urban Pizza','Bangalore','Manoj',830,'completed','card','2024-04-25'),
(144,17,204,'Green Bowl','Delhi','Anita',390,'rejected','upi','2024-04-26'),
(145,18,205,'Wrap Factory','Hyderabad','Meera',670,'completed','upi','2024-04-26'),
(146,19,206,'Burger Barn','Delhi','Farhan',550,'completed','upi','2024-04-26'),
(147,20,207,'Sushi Zen','Mumbai','Ravi',1200,'completed','upi','2024-04-27');


-- ###################################################
-- ------------------- QUESTIONS ---------------------
-- ###################################################
-- 1. Latest completed order per customer.
SELECT * FROM (
	SELECT * ,
		ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rnk
	FROM food_orders
	WHERE order_status = "completed"
)t WHERE t.rnk = 1;

-- 2. Customers whose 2nd completed order value > 1st.
WITH completed_orders AS (
	SELECT * 
    FROM food_orders
    WHERE order_status = "completed"
),
ranked_completed_orders AS (
	SELECT * ,
		ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rnk
	FROM completed_orders
)
SELECT o.customer_id, o.order_amount, o.rnk, t.order_amount, t. rnk
FROM ranked_completed_orders o
INNER JOIN ranked_completed_orders t
	ON o.customer_id = t.customer_id AND o.rnk = 1 AND t.rnk = 2 AND t.order_amount > o.order_amount;
    
-- 3. Customers inactive in the last 30 days.
SELECT *
FROM food_orders
WHERE DATEDIFF(CURDATE(), order_date) > 30;

-- *4. Cancellation rate per restaurant.
	-- SUBQUERY WAY
SELECT
    t.restaurant_id,
    t.total_order,
    COALESCE(c.cancelled_order, 0) AS cancelled_order,
    COALESCE(c.cancelled_order, 0) * 1.0 / t.total_order AS cancellation_rate
FROM (
    SELECT restaurant_id, COUNT(*) AS total_order
    FROM food_orders
    GROUP BY restaurant_id
) t
LEFT JOIN (
    SELECT restaurant_id, COUNT(*) AS cancelled_order
    FROM food_orders
    WHERE order_status = 'cancelled'
    GROUP BY restaurant_id
) c
ON t.restaurant_id = c.restaurant_id;

	-- CTE's WAY
WITH cancelled_orders AS (
    SELECT restaurant_id,
           COUNT(*) AS cancelled_order
    FROM food_orders
    WHERE order_status = 'cancelled'
    GROUP BY restaurant_id
),
total_orders AS (
    SELECT restaurant_id,
           COUNT(*) AS total_order
    FROM food_orders
    GROUP BY restaurant_id
)
SELECT
    t.restaurant_id,
    COALESCE(c.cancelled_order, 0) AS cancelled_order,
    t.total_order,
    COALESCE(c.cancelled_order, 0) * 1.0 / t.total_order AS cancellation_rate
FROM total_orders t
LEFT JOIN cancelled_orders c
    ON t.restaurant_id = c.restaurant_id;

-- CASE WHEN
SELECT restaurant_id, 
	COUNT(*) AS total_order,
    SUM(CASE WHEN order_status="cancelled" THEN 1 ELSE 0 END) AS cancelled_order,
    SUM(CASE WHEN order_status="cancelled" THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS cancelled_rate
FROM food_orders
GROUP BY restaurant_id;
    
-- 5. Average order value per city (completed only).
SELECT city, AVG(order_amount)
FROM food_orders
WHERE order_status =  "completed"
GROUP BY city;

-- *6. Top 2 restaurants per city by revenue (no LIMIT).
	--    Notes if not able to solve this, learning from this.
-- ########################################################
	-- Question 1: What is ONE row supposed to represent?

	-- Question 2: Does my raw table already have that?
	-- → ❌ No (it has orders)

	-- Question 3: How do I create that row?
-- ########################################################











-- 7. Customers who ordered 3+ times in a month.
SELECT customer_id , COUNT(*) AS order_count
FROM food_orders
GROUP BY customer_id, MONTH(order_date)
HAVING order_count > 3;

-- 8. Restaurants where cancellations > completions.
SELECT restaurant_id, 
	SUM(CASE WHEN order_status = "cancelled" THEN 1 ELSE 0 END) AS cancellations,
    SUM(CASE WHEN order_status = "completed" THEN 1 ELSE 0 END) AS completions
FROM food_orders
GROUP BY restaurant_id
HAVING cancellations > completions;

-- 9. Month-over-month completed order count.
SELECT MONTH(order_date),
	SUM(CASE WHEN order_status = "completed" THEN 1 ELSE 0 END) AS completed_order_count
FROM food_orders
GROUP BY MONTH(order_date);

-- 10. Use LAG to compare a customer’s current vs previous order amount.
select * from(
	SELECT * ,
		LAG(order_amount, 1) over(partition by customer_id order by order_date) as prev_amount,
		row_number() over(partition by customer_id order by order_date desc) as rnk
	FROM food_orders
)t where rnk = 1;

SELECT * FROM(
	SELECT * ,
		FIRST_VALUE(order_amount) OVER(PARTITION BY customer_id ORDER BY order_date desc rows between unbounded preceding and unbounded following) AS first_order_value,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rnk
	FROM food_orders
)t;