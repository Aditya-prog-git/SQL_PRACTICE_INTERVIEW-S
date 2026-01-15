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
(815, 91, 'Arjun', 501, 'Delhi', 260, 'upi', 'completed', '2024-06-05'),
(816,96,'Amit',510,'Delhi',290,'upi','completed','2024-06-06'),
(817,97,'Neha',511,'Mumbai',220,'cash','completed','2024-06-06'),
(818,98,'Vikas',512,'Pune',310,'upi','completed','2024-06-06'),
(819,96,'Amit',513,'Delhi',340,'upi','completed','2024-06-07'),
(820,97,'Neha',514,'Mumbai',180,'cash','cancelled','2024-06-07'),
(821,98,'Vikas',515,'Pune',260,'upi','completed','2024-06-07'),
(822,99,'Rohit',516,'Bangalore',420,'upi','completed','2024-06-07'),
(823,100,'Sneha',517,'Hyderabad',360,'upi','completed','2024-06-08'),
(824,96,'Amit',518,'Delhi',300,'wallet','completed','2024-06-08'),
(825,97,'Neha',519,'Mumbai',240,'upi','completed','2024-06-08'),
(826,98,'Vikas',520,'Pune',330,'upi','completed','2024-06-08'),
(827,99,'Rohit',521,'Bangalore',410,'upi','completed','2024-06-09'),
(828,100,'Sneha',522,'Hyderabad',380,'upi','completed','2024-06-09'),
(829,96,'Amit',523,'Delhi',270,'cash','completed','2024-06-09'),
(830,97,'Neha',524,'Mumbai',200,'cash','driver_cancelled','2024-06-09'),
(831,98,'Vikas',525,'Pune',290,'upi','completed','2024-06-09'),
(832,99,'Rohit',526,'Bangalore',450,'upi','completed','2024-06-10'),
(833,100,'Sneha',527,'Hyderabad',340,'wallet','completed','2024-06-10'),
(834,96,'Amit',528,'Delhi',310,'upi','completed','2024-06-10'),
(835,97,'Neha',529,'Mumbai',260,'upi','completed','2024-06-10'),
(836,98,'Vikas',530,'Pune',350,'upi','completed','2024-06-11'),
(837,99,'Rohit',531,'Bangalore',430,'upi','completed','2024-06-11'),
(838,100,'Sneha',532,'Hyderabad',390,'upi','completed','2024-06-11'),
(839,96,'Amit',533,'Delhi',280,'cash','completed','2024-06-11'),
(840,97,'Neha',534,'Mumbai',210,'upi','completed','2024-06-11'),
(841,98,'Vikas',535,'Pune',320,'upi','completed','2024-06-12'),
(842,99,'Rohit',536,'Bangalore',460,'upi','completed','2024-06-12'),
(843,100,'Sneha',537,'Hyderabad',370,'upi','completed','2024-06-12'),
(844,96,'Amit',538,'Delhi',300,'upi','completed','2024-06-12'),
(845,97,'Neha',539,'Mumbai',230,'cash','completed','2024-06-12');

-- 1. Driver-wise total completed revenue.
SELECT driver_id, SUM(fare) as revenue
FROM ride_trips
WHERE trip_status = "completed"
GROUP BY driver_id;

-- 2. Drivers with cancellation rate > city average.
WITH cancellations_table AS (
    SELECT
        driver_id,
        city,
        SUM(CASE WHEN trip_status = 'cancelled' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS cancellation_rate
    FROM ride_trips
    GROUP BY city, driver_id
)
SELECT driver_id, city
FROM (
    SELECT *,
           AVG(cancellation_rate) OVER (PARTITION BY city) AS city_avg
    FROM cancellations_table
) t
WHERE cancellation_rate > city_avg;

-- 3. Passengers who took rides on 3 consecutive days.
WITH distincts AS (
    SELECT DISTINCT passenger_id, DATE(trip_date) AS trip_date
    FROM ride_trips
)
SELECT *
FROM (
    SELECT passenger_id, trip_date,
        LAG(trip_date, 1) OVER(PARTITION BY passenger_id ORDER BY trip_date) AS prev1,
        LAG(trip_date, 2) OVER(PARTITION BY passenger_id ORDER BY trip_date) AS prev2
    FROM distincts
) t
WHERE t.trip_date = DATE_ADD(prev1, INTERVAL 1 DAY)
  AND t.trip_date = DATE_ADD(prev2, INTERVAL 2 DAY);

-- 4. For each city, top driver by completed fare (no LIMIT).
SELECT * FROM (
	SELECT * ,
			DENSE_RANK() OVER(PARTITION BY city ORDER BY total_fare DESC) AS rnk
	FROM(
		SELECT city, driver_id, SUM(fare) AS total_fare
		FROM ride_trips
		GROUP BY city, driver_id
	)t 
)d WHERE d.rnk = 1;

-- 5. Drivers whose latest trip fare < their average fare.
SELECT *
FROM(
	SELECT *, 
		AVG(fare) OVER(PARTITION BY driver_id) AS average_fare,
		ROW_NUMBER() OVER(PARTITION BY driver_id ORDER BY trip_date DESC) AS rnk
	FROM ride_trips
)t WHERE t.fare < t.average_fare AND t.rnk = 1; 

-- 6. City-wise share of completed vs cancelled trips.
SELECT city ,
	SUM(CASE WHEN trip_status = "completed" THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS completed_share,
    SUM(CASE WHEN trip_status = "cancelled" THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS cancelled_share,
    SUM(CASE WHEN trip_status = "driver_cancelled" THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS rider_cancelled_share
FROM ride_trips
GROUP BY city;

-- 7. Use ROW_NUMBER to find each driver’s first ever trip.
SELECT t.*
FROM (
	SELECT * ,
		ROW_NUMBER() OVER(PARTITION BY driver_id ORDER BY trip_date) AS rnk
	FROM ride_trips
)t WHERE t.rnk = 1;