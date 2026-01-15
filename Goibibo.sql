-- Create a brand new schema
CREATE DATABASE IF NOT EXISTS Goibibo;

-- Switch to it
USE Goibibo;

CREATE TABLE hotel_bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    hotel_id INT,
    hotel_name VARCHAR(100),
    city VARCHAR(100),
    booking_amount DECIMAL(10,2),
    room_type VARCHAR(50),    -- deluxe/suite/economy
    status VARCHAR(50),       -- confirmed/cancelled/no-show
    booking_date DATE,
    stay_start DATE,
    stay_end DATE
);

INSERT INTO hotel_bookings VALUES
(501, 11, 301, 'Sea View Resort', 'Goa', 5500, 'suite', 'confirmed', '2024-03-10','2024-04-01','2024-04-05'),
(502, 12, 302, 'Sunset Hotel', 'Delhi', 3200, 'deluxe', 'cancelled', '2024-03-11','2024-04-02','2024-04-04'),
(503, 11, 301, 'Sea View Resort', 'Goa', 6000, 'suite', 'confirmed', '2024-03-12','2024-04-10','2024-04-14'),
(504, 13, 303, 'Hilltop Stay', 'Manali', 4100, 'economy', 'no-show', '2024-03-12','2024-04-08','2024-04-10'),
(505, 14, 302, 'Sunset Hotel', 'Delhi', 3500, 'deluxe', 'confirmed', '2024-03-13','2024-04-03','2024-04-06'),
(506, 11, 301, 'Sea View Resort', 'Goa', 7000, 'suite', 'confirmed','2024-03-14','2024-04-20','2024-04-25'),
(507, 15, 304, 'City Inn', 'Delhi', 2900, 'economy', 'confirmed','2024-03-14','2024-04-12','2024-04-14'),
(508, 11, 302, 'Sunset Hotel', 'Delhi', 3300, 'deluxe', 'cancelled','2024-03-14','2024-04-15','2024-04-18'),
(509, 16, 304, 'City Inn', 'Delhi', 3100, 'economy', 'confirmed','2024-03-15','2024-04-16','2024-04-20'),
(510, 17, 305, 'Cloud Nine', 'Manali', 4800, 'suite', 'no-show','2024-03-15','2024-04-19','2024-04-22'),
(511, 18, 305, 'Cloud Nine', 'Manali', 5200, 'suite', 'confirmed','2024-03-16','2024-04-21','2024-04-25'),
(512, 19, 301, 'Sea View Resort', 'Goa', 5900, 'suite', 'confirmed','2024-03-17','2024-04-23','2024-04-28'),
(513, 11, 305, 'Cloud Nine', 'Manali', 4500, 'economy','confirmed','2024-03-17','2024-04-24','2024-04-27');