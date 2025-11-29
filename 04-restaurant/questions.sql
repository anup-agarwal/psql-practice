-- ============================
-- RESTAURANT DATASET — PRACTICE QUESTIONS
-- ============================

-- Q1. List all customers with their city and phone number.
--     (Include customers with NULL city/phone)


-- Q2. List all menu items with their category name and price.


-- Q3. List all orders with customer name, table number, status, and total amount.


-- Q4. For each category, show how many menu items belong to it.


-- Q5. For each order, show the total quantity of items ordered
--     (sum of quantity from order_items).


-- Q6. List all menu items that are currently NOT available.


-- Q7. List all customers who have NEVER placed any order.


-- Q8. List all orders that have NO items with special instructions
--     (i.e., all order_items have NULL special_instructions).


-- Q9. For each customer, show the total amount spent
--     across all orders with payment_status = 'paid'.


-- Q10. Show the TOP 3 most expensive menu items.


-- Q11. List all tables that are currently occupied or reserved
--      (status IN ('occupied', 'reserved')).


-- Q12. List all reservations with customer name, table number, and status.


-- Q13. List all customers who have made at least one reservation
--      that is confirmed (status = 'confirmed').


-- Q14. For each table, show how many reservations have been made
--      (count all reservations, regardless of status).


-- Q15. List all orders that are in 'preparing' or 'ready' status
--      but have NOT been paid yet (payment_status = 'unpaid').


-- Q16. Show all menu items along with how many times they have been ordered
--      (count from order_items, including items ordered 0 times).


-- Q17. List customers who have placed orders but have NEVER made a reservation.


-- Q18. For each category, show the average price of menu items in that category.


-- Q19. List all orders placed on 2024-03-06
--      with customer name and order status.


-- Q20. Using a CTE:
--      Step 1: Calculate total revenue per customer (sum of total_amount where payment_status = 'paid').
--      Step 2: Show only customers with total revenue > 1000.


-- Q21. List all menu items that have been ordered at least 2 times
--      (considering quantity in order_items).


-- Q22. Show the table with the highest number of confirmed reservations.


-- Q23. List all customers who have ordered items from the 'Main Course' category
--      (ignoring cancelled orders).


-- Q24. For each order status, show how many orders are in that status.


-- Q25. List all menu items that are available but have NEVER been ordered.

