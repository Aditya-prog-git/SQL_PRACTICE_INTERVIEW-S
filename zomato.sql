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
(117, 1, 201, 'Spice Hub', 'Delhi', 'Ravi', 750, 'returned', 'upi', '2024-04-16');
