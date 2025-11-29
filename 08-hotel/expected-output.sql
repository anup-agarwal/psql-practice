-- =====================================
-- HOTEL DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all guests with their city and country.
-- guest_id | guest_name    | city      | country
-- --------- | ------------- | --------- | -------
-- 1         | Rajesh Kumar  | Delhi     | India
-- 2         | Priya Sharma  | Mumbai    | India
-- 3         | Amit Patel    | Bangalore | India
-- 4         | Sarah Johnson | New York  | USA
-- 5         | Vikram Singh  | Delhi     | India
-- 6         | Anjali Mehta  | Pune      | India


-- Q2. List all rooms with hotel name, room number, and room type.
-- room_id | hotel_name        | room_number | room_type
-- -------- | ----------------- | ----------- | ---------
-- 1        | Grand Plaza       | 101         | single
-- 2        | Grand Plaza       | 102         | double
-- 3        | Grand Plaza       | 201         | suite
-- 4        | Seaside Resort    | 101         | double
-- 5        | Seaside Resort    | 102         | deluxe
-- 6        | City Center Hotel | 201         | single
-- 7        | City Center Hotel | 202         | double
-- 8        | Heritage Inn      | 301         | suite


-- Q3. List all bookings with guest name, hotel name, room number, and status.
-- booking_id | guest_name    | hotel_name        | room_number | status
-- ---------- | ------------- | ----------------- | ----------- | ---------
-- 1          | Rajesh Kumar  | Grand Plaza       | 101         | completed
-- 2          | Priya Sharma  | Seaside Resort    | 101         | confirmed
-- 3          | Amit Patel    | City Center Hotel | 201         | confirmed
-- 4          | Sarah Johnson | Grand Plaza       | 201         | completed
-- 5          | Vikram Singh  | Seaside Resort    | 102         | cancelled
-- 6          | Rajesh Kumar  | Grand Plaza       | 102         | confirmed
-- 7          | Anjali Mehta  | City Center Hotel | 202         | checked_in


-- Q4. For each hotel, show how many rooms it has.
-- hotel_id | hotel_name        | room_count
-- --------- | ----------------- | -----------
-- 1         | Grand Plaza       | 3
-- 2         | Seaside Resort    | 2
-- 3         | City Center Hotel | 2
-- 4         | Heritage Inn      | 1


-- Q5. For each room type, show how many rooms exist.
-- room_type | room_count
-- --------- | -----------
-- single    | 2
-- double    | 3
-- suite     | 2
-- deluxe    | 1


-- Q6. List all rooms that are currently NOT available.
-- room_id | hotel_name        | room_number | room_type
-- -------- | ----------------- | ----------- | ---------
-- 1        | Grand Plaza       | 101         | single
-- 3        | Grand Plaza       | 201         | suite
-- 5        | Seaside Resort    | 102         | deluxe


-- Q7. List all guests who have NEVER made any booking.
-- guest_id | guest_name
-- --------- | ------------
-- (None - all guests have made bookings)


-- Q8. List all bookings that have payment_status = 'unpaid'.
-- booking_id | guest_name | total_amount | status
-- ---------- | ----------- | ------------ | ---------
-- 3          | Amit Patel  | 5000.00      | confirmed


-- Q9. For each guest, show total amount spent (paid bookings only).
-- guest_id | guest_name    | total_spent
-- --------- | ------------- | -----------
-- 1         | Rajesh Kumar  | 16000.00
-- 2         | Priya Sharma  | 13500.00
-- 4         | Sarah Johnson | 16000.00
-- 6         | Anjali Mehta  | 8000.00


-- Q10. Show the TOP 3 most expensive rooms (by price_per_night).
-- room_id | hotel_name        | room_number | price_per_night
-- -------- | ----------------- | ----------- | ---------------
-- 3        | Grand Plaza       | 201         | 8000.00
-- 5        | Seaside Resort    | 102         | 6000.00
-- 8        | Heritage Inn      | 301         | 7000.00


-- Q11. List all bookings with check-in date in March 2024.
-- booking_id | guest_name    | check_in_date | check_out_date
-- ---------- | ------------- | ------------- | --------------
-- 1          | Rajesh Kumar  | 2024-03-10    | 2024-03-12
-- 2          | Priya Sharma  | 2024-03-15    | 2024-03-18
-- 3          | Amit Patel    | 2024-03-20    | 2024-03-22
-- 4          | Sarah Johnson | 2024-03-08    | 2024-03-10
-- 5          | Vikram Singh  | 2024-03-12    | 2024-03-14
-- 6          | Rajesh Kumar  | 2024-03-25    | 2024-03-27
-- 7          | Anjali Mehta  | 2024-03-18    | 2024-03-20


-- Q12. List all rooms with their amenities.
-- room_id | room_number | amenity_name
-- -------- | ----------- | -------------
-- 1        | 101         | WiFi
-- 1        | 101         | AC
-- 2        | 102         | WiFi
-- 2        | 102         | AC
-- 2        | 102         | Room Service
-- (and so on...)


-- Q13. List all hotels that have NO rooms available.
-- hotel_id | hotel_name
-- --------- | ------------
-- (None - all hotels have at least one available room)


-- Q14. For each hotel star rating, show how many hotels have that rating.
-- star_rating | hotel_count
-- ----------- | -----------
-- 3           | 1
-- 4           | 2
-- 5           | 1


-- Q15. List all bookings that are confirmed/checked_in but unpaid.
-- booking_id | guest_name | status     | payment_status
-- ---------- | ----------- | --------- | --------------
-- 3          | Amit Patel  | confirmed | unpaid


-- Q16. Show all hotels with average price_per_night of their rooms.
-- hotel_id | hotel_name        | avg_price
-- --------- | ----------------- | ----------
-- 1         | Grand Plaza       | 5333.33
-- 2         | Seaside Resort    | 5250.00
-- 3         | City Center Hotel | 3250.00
-- 4         | Heritage Inn      | 7000.00


-- Q17. List all rooms that have amenities but have NEVER been booked.
-- room_id | hotel_name        | room_number
-- -------- | ----------------- | -----------
-- 8        | Heritage Inn      | 301


-- Q18. For each guest, show total number of nights stayed (completed bookings).
-- guest_id | guest_name    | total_nights
-- --------- | ------------- | -------------
-- 1         | Rajesh Kumar  | 2
-- 4         | Sarah Johnson | 2


-- Q19. List all guests who have booked rooms in 5-star hotels.
-- guest_id | guest_name
-- --------- | -------------
-- 1         | Rajesh Kumar
-- 4         | Sarah Johnson
-- 5         | Vikram Singh


-- Q20. Guests with more than 1 booking (using CTE).
-- guest_id | guest_name   | booking_count
-- --------- | ------------- | --------------
-- 1         | Rajesh Kumar | 2


-- Q21. List all rooms that have been booked more than once.
-- room_id | hotel_name        | room_number | booking_count
-- -------- | ----------------- | ----------- | --------------
-- (None - no room has been booked more than once in this dataset)


-- Q22. Show the hotel with the highest average room price.
-- hotel_id | hotel_name   | avg_price
-- --------- | ------------ | ----------
-- 4         | Heritage Inn | 7000.00


-- Q23. List all guests who have made bookings but have NEVER completed any.
-- guest_id | guest_name
-- --------- | -------------
-- 2         | Priya Sharma
-- 3         | Amit Patel
-- 5         | Vikram Singh
-- 6         | Anjali Mehta


-- Q24. For each booking status, show how many bookings are in that status.
-- status     | booking_count
-- ---------- | --------------
-- completed  | 2
-- confirmed  | 3
-- cancelled  | 1
-- checked_in | 1


-- Q25. List all rooms that are available but have NEVER been booked.
-- room_id | hotel_name        | room_number | room_type
-- -------- | ----------------- | ----------- | ---------
-- 2        | Grand Plaza       | 102         | double
-- 4        | Seaside Resort    | 101         | double
-- 6        | City Center Hotel | 201         | single
-- 7        | City Center Hotel | 202         | double
-- 8        | Heritage Inn      | 301         | suite

