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
(513, 11, 305, 'Cloud Nine', 'Manali', 4500, 'economy','confirmed','2024-03-17','2024-04-24','2024-04-27'),
(514,20,306,'Lake View Inn','Udaipur',4200,'deluxe','confirmed','2024-03-18','2024-04-01','2024-04-04'),
(515,21,307,'Metro Stay','Mumbai',3800,'economy','cancelled','2024-03-18','2024-04-05','2024-04-07'),
(516,22,308,'Palm Retreat','Goa',7200,'suite','confirmed','2024-03-19','2024-04-06','2024-04-10'),
(517,23,306,'Lake View Inn','Udaipur',4600,'deluxe','confirmed','2024-03-19','2024-04-08','2024-04-11'),
(518,24,309,'Snow Peak','Manali',5400,'suite','no-show','2024-03-20','2024-04-10','2024-04-14'),
(519,25,307,'Metro Stay','Mumbai',4000,'economy','confirmed','2024-03-20','2024-04-12','2024-04-15'),
(520,26,308,'Palm Retreat','Goa',6900,'suite','confirmed','2024-03-21','2024-04-14','2024-04-18'),
(521,27,310,'Urban Nest','Delhi',3100,'economy','confirmed','2024-03-21','2024-04-16','2024-04-18'),
(522,28,306,'Lake View Inn','Udaipur',4800,'deluxe','confirmed','2024-03-22','2024-04-18','2024-04-21'),
(523,29,309,'Snow Peak','Manali',5600,'suite','confirmed','2024-03-22','2024-04-20','2024-04-24'),
(524,20,307,'Metro Stay','Mumbai',3900,'economy','confirmed','2024-03-23','2024-04-22','2024-04-24'),
(525,21,308,'Palm Retreat','Goa',7100,'suite','confirmed','2024-03-23','2024-04-24','2024-04-28'),
(526,22,310,'Urban Nest','Delhi',3300,'deluxe','cancelled','2024-03-24','2024-04-25','2024-04-27'),
(527,23,309,'Snow Peak','Manali',5200,'suite','no-show','2024-03-24','2024-04-26','2024-04-30'),
(528,24,306,'Lake View Inn','Udaipur',4500,'deluxe','confirmed','2024-03-25','2024-04-27','2024-04-30'),
(529,25,307,'Metro Stay','Mumbai',3700,'economy','confirmed','2024-03-25','2024-04-28','2024-05-01'),
(530,26,308,'Palm Retreat','Goa',7400,'suite','confirmed','2024-03-26','2024-04-29','2024-05-03'),
(531,27,309,'Snow Peak','Manali',5900,'suite','confirmed','2024-03-26','2024-05-01','2024-05-05'),
(532,28,310,'Urban Nest','Delhi',3200,'economy','confirmed','2024-03-27','2024-05-02','2024-05-04'),
(533,29,306,'Lake View Inn','Udaipur',4700,'deluxe','confirmed','2024-03-27','2024-05-04','2024-05-07'),
(534,20,307,'Metro Stay','Mumbai',3600,'economy','cancelled','2024-03-28','2024-05-06','2024-05-08'),
(535,21,308,'Palm Retreat','Goa',7800,'suite','confirmed','2024-03-28','2024-05-08','2024-05-12'),
(536,22,309,'Snow Peak','Manali',6100,'suite','confirmed','2024-03-29','2024-05-10','2024-05-14'),
(537,23,310,'Urban Nest','Delhi',3400,'deluxe','confirmed','2024-03-29','2024-05-12','2024-05-15'),
(538,24,306,'Lake View Inn','Udaipur',4900,'deluxe','confirmed','2024-03-30','2024-05-14','2024-05-18'),
(539,25,307,'Metro Stay','Mumbai',4100,'economy','confirmed','2024-03-30','2024-05-16','2024-05-19'),
(540,26,308,'Palm Retreat','Goa',7600,'suite','confirmed','2024-03-31','2024-05-18','2024-05-22'),
(541,27,309,'Snow Peak','Manali',6300,'suite','confirmed','2024-03-31','2024-05-20','2024-05-24'),
(542,28,310,'Urban Nest','Delhi',3500,'deluxe','confirmed','2024-03-31','2024-05-22','2024-05-25'),
(543,29,306,'Lake View Inn','Udaipur',5200,'suite','confirmed','2024-03-31','2024-05-24','2024-05-28');

-- 1. Repeat users (confirmed bookings > 1)
SELECT user_id, status, count(status)
FROM hotel_bookings
WHERE status = "confirmed"
GROUP BY user_id, status
HAVING count(status) > 1;

-- 2. No-show rate per city
SELECT city,
	SUM(CASE WHEN status = "no-show" THEN 1 ELSE 0 END) AS no_show,
    COUNT(*) AS total_booking,
    SUM(CASE WHEN status = "no-show" THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS no_show_rate
FROM hotel_bookings
GROUP BY city;

-- 3. Average stay duration per hotel

-- 4. Top hotel per city by confirmed revenue

-- 5. Users whose latest booking < previous booking

-- 6. Monthly confirmed booking trend
SELECT YEAR(booking_date), MONTH(booking_date), COUNT(*)
FROM hotel_bookings
WHERE status = "confirmed"
GROUP BY YEAR(booking_date), MONTH(booking_date);