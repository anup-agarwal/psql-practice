-- =====================================
-- EVENTS DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all attendees with their city and registration date.
-- attendee_id | attendee_name | city      | registration_date
-- ------------ | ------------- | --------- | -----------------
-- 1            | Vikram Singh  | Delhi     | 2024-01-05
-- 2            | Anjali Mehta  | Mumbai    | 2024-01-10
-- 3            | Rohit Jain    | Bangalore | 2024-02-01
-- 4            | Kavita Iyer   | Chennai   | 2024-02-15
-- 5            | Sunil Nair    | Pune      | 2024-03-01
-- 6            | Meera Desai   | Delhi     | 2024-03-05


-- Q2. List all events with organizer name, venue name, and event type.
-- event_id | event_title              | organizer_name | venue_name            | event_type
-- --------- | ------------------------ | -------------- | --------------------- | -----------
-- 1         | Tech Summit 2024        | Rajesh Kumar   | Convention Center     | conference
-- 2         | UI/UX Design Workshop   | Priya Sharma   | Tech Park Auditorium  | workshop
-- 3         | Summer Music Festival   | Amit Patel     | Beach Resort          | concert
-- 4         | Developer Meetup        | Rajesh Kumar   | Tech Park Auditorium  | meetup
-- 5         | Art Exhibition         | Sneha Reddy    | Exhibition Hall       | exhibition
-- 6         | Data Science Conference | Rajesh Kumar   | Convention Center     | conference
-- 7         | Photography Workshop   | Sneha Reddy    | Exhibition Hall       | workshop


-- Q3. List all event registrations with attendee name, event title, and payment status.
-- registration_id | attendee_name | event_title              | payment_status
-- --------------- | ------------- | ------------------------ | --------------
-- 1               | Vikram Singh  | Tech Summit 2024         | paid
-- 2               | Anjali Mehta  | Tech Summit 2024         | paid
-- 3               | Rohit Jain    | Tech Summit 2024         | paid
-- 4               | Anjali Mehta  | UI/UX Design Workshop   | paid
-- 5               | Kavita Iyer   | UI/UX Design Workshop   | paid
-- 6               | Vikram Singh  | Summer Music Festival   | paid
-- 7               | Sunil Nair    | Summer Music Festival   | unpaid
-- 8               | Vikram Singh  | Developer Meetup        | paid
-- 9               | Rohit Jain    | Developer Meetup        | paid
-- 10              | Sunil Nair    | Developer Meetup        | paid
-- 11              | Kavita Iyer   | Art Exhibition         | paid
-- 12              | Vikram Singh  | Data Science Conference | paid
-- 13              | Anjali Mehta  | Data Science Conference | paid
-- 14              | Rohit Jain    | Data Science Conference | paid
-- 15              | Kavita Iyer   | Data Science Conference | refunded
-- 16              | Meera Desai   | Photography Workshop   | paid


-- Q4. For each organizer, show how many events they have organized.
-- organizer_id | organizer_name | event_count
-- ------------- | -------------- | -----------
-- 1             | Rajesh Kumar   | 3
-- 2             | Priya Sharma   | 1
-- 3             | Amit Patel     | 1
-- 4             | Sneha Reddy    | 2


-- Q5. For each event type, show how many events exist.
-- event_type | event_count
-- ---------- | -----------
-- conference | 2
-- workshop   | 2
-- concert    | 1
-- meetup     | 1
-- exhibition | 1


-- Q6. List all events that are NOT scheduled.
-- event_id | event_title              | status
-- --------- | ------------------------ | ---------
-- 4         | Developer Meetup        | completed
-- 6         | Data Science Conference | completed


-- Q7. List all attendees who have NEVER registered for any event.
-- attendee_id | attendee_name
-- ------------ | -------------
-- (None - all attendees have registered for at least one event)


-- Q8. List all event registrations with payment_status = 'unpaid'.
-- registration_id | attendee_name | event_title            | payment_status
-- --------------- | ------------- | ---------------------- | --------------
-- 7               | Sunil Nair    | Summer Music Festival | unpaid


-- Q9. For each event, show the total number of registered attendees.
-- event_id | event_title              | registered_count
-- --------- | ------------------------ | ----------------
-- 1         | Tech Summit 2024        | 3
-- 2         | UI/UX Design Workshop   | 2
-- 3         | Summer Music Festival   | 2
-- 4         | Developer Meetup        | 3
-- 5         | Art Exhibition         | 1
-- 6         | Data Science Conference | 4
-- 7         | Photography Workshop   | 1


-- Q10. Show the TOP 3 most expensive events (by ticket_price).
-- event_id | event_title              | ticket_price
-- --------- | ------------------------ | -------------
-- 6         | Data Science Conference | 2500.00
-- 3         | Summer Music Festival   | 3000.00
-- 1         | Tech Summit 2024        | 2000.00


-- Q11. List all events scheduled for April 2024.
-- event_id | event_title            | event_date
-- --------- | ---------------------- | -----------
-- 1         | Tech Summit 2024      | 2024-04-15
-- 2         | UI/UX Design Workshop | 2024-04-10
-- 5         | Art Exhibition        | 2024-04-05
-- 7         | Photography Workshop  | 2024-04-20


-- Q12. List all venues with their city and capacity.
-- venue_id | venue_name            | city      | capacity
-- --------- | --------------------- | --------- | ---------
-- 1         | Convention Center    | Delhi     | 500
-- 2         | Beach Resort         | Mumbai    | 300
-- 3         | Tech Park Auditorium | Bangalore | 200
-- 4         | Exhibition Hall      | Chennai   | 400
-- 5         | Stadium              | Delhi     | 1000


-- Q13. List all organizers who have NO events.
-- organizer_id | organizer_name
-- ------------- | -------------
-- (None - all organizers have events)


-- Q14. For each event type, show the average ticket price.
-- event_type | avg_ticket_price
-- ---------- | ----------------
-- conference | 2250.00
-- workshop   | 1350.00
-- concert    | 3000.00
-- meetup     | 500.00
-- exhibition | 800.00


-- Q15. List all events that have registrations but all have payment_status = 'unpaid'.
-- event_id | event_title
-- --------- | ------------
-- (None - no event has all unpaid registrations)


-- Q16. Show all organizers with total number of attendees across all their events.
-- organizer_id | organizer_name | total_attendees
-- ------------- | -------------- | ---------------
-- 1             | Rajesh Kumar   | 10
-- 2             | Priya Sharma   | 2
-- 3             | Amit Patel     | 2
-- 4             | Sneha Reddy    | 2


-- Q17. List all venues that have been used but have NEVER been booked.
-- venue_id | venue_name
-- --------- | ------------
-- 5         | Stadium


-- Q18. For each attendee, show the total number of events they have registered for.
-- attendee_id | attendee_name | event_count
-- ------------ | ------------- | ------------
-- 1            | Vikram Singh  | 4
-- 2            | Anjali Mehta  | 3
-- 3            | Rohit Jain    | 3
-- 4            | Kavita Iyer   | 3
-- 5            | Sunil Nair    | 2
-- 6            | Meera Desai   | 1


-- Q19. List all attendees who have registered for events organized by 'Tech Events India'.
-- attendee_id | attendee_name
-- ------------ | -------------
-- 1            | Vikram Singh
-- 2            | Anjali Mehta
-- 3            | Rohit Jain
-- 5            | Sunil Nair


-- Q20. Events with more than 2 registrations (using CTE).
-- event_id | event_title              | registration_count
-- --------- | ------------------------ | ------------------
-- 1         | Tech Summit 2024        | 3
-- 4         | Developer Meetup        | 3
-- 6         | Data Science Conference | 4


-- Q21. List all events that have been registered by more than 2 attendees.
-- event_id | event_title              | attendee_count
-- --------- | ------------------------ | --------------
-- 1         | Tech Summit 2024        | 3
-- 4         | Developer Meetup        | 3
-- 6         | Data Science Conference | 4


-- Q22. Show the organizer with the most events.
-- organizer_id | organizer_name | event_count
-- ------------- | -------------- | -----------
-- 1             | Rajesh Kumar   | 3


-- Q23. List all attendees who have registered but have NEVER paid.
-- attendee_id | attendee_name
-- ------------ | -------------
-- (None - all attendees have at least one paid registration)


-- Q24. For each event status, show how many events are in that status.
-- status     | event_count
-- ---------- | -----------
-- scheduled  | 5
-- completed  | 2


-- Q25. List all events that are scheduled but have NO registrations yet.
-- event_id | event_title
-- --------- | ------------
-- (None - all scheduled events have registrations)

