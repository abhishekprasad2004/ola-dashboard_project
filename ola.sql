create database ola;
use ola;

-- 1. Retrieve all successful bookings:
select * from bookings1
where booking_status = "success";

create view successful_booking as
select * from bookings1
where booking_status = "success";

-- 2. Find the average ride distance for each vehicle type:
select  Vehicle_Type,avg(Ride_Distance) as avg_distance  from bookings1
group by Vehicle_Type;

create view average_ride_distance_for_each_vehicle as
select  Vehicle_Type,avg(Ride_Distance) as avg_distance  from bookings1
group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers
select count(Booking_Status)  from bookings1
where Booking_Status ="Canceled by Customer";

create view total_number_of_cancelled_rides_by_customers as 
select count(Booking_Status)  from bookings1
where Booking_Status ="Canceled by Customer";

-- 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID,count(Booking_ID) as total_rides  from bookings1  -- here customer id is primary and booking will change 
group by Customer_ID
order by total_rides  desc limit 5;

create view maximum_rides_by_top5_customers as
select Customer_ID,count(Booking_ID) as total_rides  from bookings1 
group by Customer_ID
order by total_rides  desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view ride_cancelled_by_drivers_p_c_issue as 
select count(Booking_Status) from bookings1
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
create view max_min_driver_ratings as 
select max(Driver_Ratings),min(Driver_Ratings) from bookings1
where  Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
create view  rides_payment_from_upi as
select *  from bookings1 
where Payment_Method = "upi"; 

-- 8. Find the average customer rating per vehicle type:
create view avg_customer_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings1
group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_successfull_ride_value  as
select sum(booking_value) as total_successfull_ride_value from bookings1
where Booking_Status ="success";


-- 10. List all incomplete rides along with the reason: 
create view imcomplete_ride_with_reason as   
select Customer_ID ,Incomplete_Rides,Incomplete_Rides_Reason from bookings1
where Incomplete_Rides = "yes";





-- 1. Retrieve all successful bookings:
select * from successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
select * from average_ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
select * from total_number_of_cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
select * from maximum_rides_by_top5_customers; 

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select *  from ride_cancelled_by_drivers_p_c_issue;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
 select * from max_min_driver_ratings;
 
-- 7. Retrieve all rides where payment was made using UPI:
select  * from rides_payment_from_upi;

-- 8. Find the average customer rating per vehicle type:
select * from avg_customer_rating;

-- 9. Calculate the total booking value of rides completed successfully:
select * from total_successfull_ride_value ;

-- 10. List all incomplete rides along with the reason:
select * from imcomplete_ride_with_reason;