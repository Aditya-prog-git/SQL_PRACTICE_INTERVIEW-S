-- Create a brand new schema
CREATE DATABASE IF NOT EXISTS Uber;

-- Switch to it
USE Uber;

CREATE TABLE ride_trips (
    trip_id INT PRIMARY KEY,
    driver_id INT,
    driver_name VARCHAR(100),
    passenger_id INT,
    city VARCHAR(100),
    fare DECIMAL(10,2),
    payment_type VARCHAR(50),
    trip_status VARCHAR(50),   -- completed/cancelled/driver_cancelled
    trip_date DATE
);

INSERT INTO ride_trips VALUES
(801, 91, 'Arjun', 501, 'Delhi', 250, 'upi', 'completed', '2024-06-01'),
(802, 92, 'Kabir', 502, 'Mumbai', 190, 'cash', 'driver_cancelled', '2024-06-01'),
(803, 91, 'Arjun', 503, 'Delhi', 340, 'upi', 'completed', '2024-06-02'),
(804, 93, 'Meera', 504, 'Bangalore', 420, 'upi', 'completed', '2024-06-02'),
(805, 92, 'Kabir', 502, 'Mumbai', 150, 'cash', 'completed', '2024-06-02'),
(806, 94, 'Rita', 505, 'Delhi', 310, 'upi', 'completed', '2024-06-03'),
(807, 95, 'Samar', 506, 'Mumbai', 200, 'upi', 'completed', '2024-06-03'),
(808, 91, 'Arjun', 507, 'Delhi', 270, 'cash', 'completed', '2024-06-03'),
(809, 92, 'Kabir', 508, 'Mumbai', 300, 'upi', 'cancelled', '2024-06-03'),
(810, 93, 'Meera', 509, 'Bangalore', 390, 'upi', 'completed', '2024-06-03'),
(811, 91, 'Arjun', 501, 'Delhi', 280, 'upi', 'completed', '2024-06-04'),
(812, 94, 'Rita', 505, 'Delhi', 350, 'wallet', 'completed', '2024-06-04'),
(813, 92, 'Kabir', 502, 'Mumbai', 100, 'cash', 'driver_cancelled', '2024-06-04'),
(814, 95, 'Samar', 506, 'Mumbai', 250, 'upi', 'completed', '2024-06-04'),
(815, 91, 'Arjun', 501, 'Delhi', 260, 'upi', 'completed', '2024-06-05');
