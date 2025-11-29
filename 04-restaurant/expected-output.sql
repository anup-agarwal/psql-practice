-- =====================================
-- RESTAURANT DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all customers with their city and phone number.
-- customer_id | full_name        | phone        | city
-- ----------- | ---------------- | ------------ | ---------
-- 1           | Rajesh Kumar     | 9876543210   | Delhi
-- 2           | Priya Sharma     | 9876543211   | Mumbai
-- 3           | Amit Patel       | 9876543212   | Bangalore
-- 4           | Sneha Reddy      | 9876543213   | Chennai
-- 5           | Vikram Singh     | 9876543214   | Delhi
-- 6           | Walk-in Customer | NULL         | NULL


-- Q2. List all menu items with their category name and price.
-- menu_item_id | item_name          | category_name | price
-- ------------ | ------------------ | ------------- | --------
-- 1            | Spring Rolls       | Appetizers    | 250.00
-- 2            | Chicken Wings      | Appetizers    | 350.00
-- 3            | Caesar Salad       | Appetizers    | 280.00
-- 4            | Butter Chicken     | Main Course   | 450.00
-- 5            | Biryani            | Main Course   | 380.00
-- 6            | Pasta Carbonara    | Main Course   | 420.00
-- 7            | Grilled Fish       | Main Course   | 550.00
-- 8            | Chocolate Cake     | Desserts      | 200.00
-- 9            | Ice Cream Sundae   | Desserts      | 180.00
-- 10           | Fresh Lime Soda    | Beverages     | 80.00
-- 11           | Mango Lassi        | Beverages     | 120.00
-- 12           | Coffee             | Beverages     | 100.00


-- Q3. List all orders with customer name, table number, status, and total amount.
-- order_id | customer_name    | table_number | status    | total_amount
-- --------- | ---------------- | ------------ | --------- | ------------
-- 1         | Rajesh Kumar     | 2            | served    | 700.00
-- 2         | Priya Sharma     | 1            | preparing | 830.00
-- 3         | Amit Patel       | 3            | ready     | 500.00
-- 4         | Rajesh Kumar     | 2            | served    | 680.00
-- 5         | Sneha Reddy      | 4            | pending   | 350.00
-- 6         | Vikram Singh     | 5            | cancelled | 450.00


-- Q4. For each category, show how many menu items belong to it.
-- category_id | category_name | item_count
-- ----------- | ------------- | ----------
-- 1           | Appetizers    | 3
-- 2           | Main Course   | 4
-- 3           | Desserts      | 2
-- 4           | Beverages     | 3


-- Q5. For each order, show the total quantity of items ordered.
-- order_id | total_quantity
-- --------- | --------------
-- 1         | 2
-- 2         | 3
-- 3         | 2
-- 4         | 3
-- 5         | 1
-- 6         | 1


-- Q6. List all menu items that are currently NOT available.
-- menu_item_id | item_name
-- ------------ | -----------
-- 7            | Grilled Fish


-- Q7. List all customers who have NEVER placed any order.
-- customer_id | full_name
-- ----------- | ----------------
-- 6           | Walk-in Customer


-- Q8. List all orders that have NO items with special instructions.
-- order_id | status
-- --------- | --------
-- 2         | preparing
-- 4         | served


-- Q9. For each customer, show the total amount spent (paid orders only).
-- customer_id | customer_name | total_spent
-- ----------- | ------------- | -----------
-- 1           | Rajesh Kumar  | 1380.00
-- 2           | Priya Sharma | 830.00
-- 3           | Amit Patel   | 500.00


-- Q10. Show the TOP 3 most expensive menu items.
-- menu_item_id | item_name      | price
-- ------------ | -------------- | --------
-- 7            | Grilled Fish   | 550.00
-- 4            | Butter Chicken | 450.00
-- 6            | Pasta Carbonara| 420.00


-- Q11. List all tables that are currently occupied or reserved.
-- table_id | table_number | status
-- --------- | ------------ | --------
-- 2         | 2            | occupied
-- 4         | 4            | reserved


-- Q12. List all reservations with customer name, table number, and status.
-- reservation_id | customer_name | table_number | status
-- -------------- | ------------- | ------------ | ---------
-- 1              | Priya Sharma  | 4            | confirmed
-- 2              | Amit Patel    | 1            | confirmed
-- 3              | Sneha Reddy   | 3            | cancelled
-- 4              | Vikram Singh  | 2            | completed


-- Q13. List all customers who have made at least one confirmed reservation.
-- customer_id | customer_name
-- ----------- | -------------
-- 2           | Priya Sharma
-- 3           | Amit Patel


-- Q14. For each table, show how many reservations have been made.
-- table_id | table_number | reservation_count
-- --------- | ------------ | -----------------
-- 1         | 1            | 1
-- 2         | 2            | 1
-- 3         | 3            | 1
-- 4         | 4            | 1
-- 5         | 5            | 0
-- 6         | 6            | 0


-- Q15. List all orders that are preparing/ready but unpaid.
-- order_id | status    | payment_status
-- --------- | --------- | --------------
-- 5         | pending   | unpaid


-- Q16. Show all menu items with how many times they have been ordered.
-- menu_item_id | item_name          | order_count
-- ------------ | ------------------ | -----------
-- 1            | Spring Rolls       | 1
-- 2            | Chicken Wings      | 2
-- 3            | Caesar Salad       | 1
-- 4            | Butter Chicken     | 2
-- 5            | Biryani            | 2
-- 6            | Pasta Carbonara    | 1
-- 7            | Grilled Fish       | 0
-- 8            | Chocolate Cake     | 1
-- 9            | Ice Cream Sundae   | 0
-- 10           | Fresh Lime Soda    | 1
-- 11           | Mango Lassi        | 1
-- 12           | Coffee             | 0


-- Q17. List customers who have placed orders but never made a reservation.
-- customer_id | customer_name
-- ----------- | -------------
-- 1           | Rajesh Kumar
-- 4           | Sneha Reddy
-- 5           | Vikram Singh


-- Q18. For each category, show the average price of menu items.
-- category_id | category_name | avg_price
-- ----------- | ------------- | ---------
-- 1           | Appetizers    | 293.33
-- 2           | Main Course   | 450.00
-- 3           | Desserts      | 190.00
-- 4           | Beverages     | 100.00


-- Q19. List all orders placed on 2024-03-06 with customer name and status.
-- order_id | customer_name | status
-- --------- | ------------- | --------
-- 3         | Amit Patel    | ready
-- 4         | Rajesh Kumar  | served


-- Q20. Customers with total revenue > 1000 (using CTE).
-- customer_id | customer_name | total_revenue
-- ----------- | ------------- | -------------
-- 1           | Rajesh Kumar  | 1380.00


-- Q21. Menu items ordered at least 2 times (considering quantity).
-- menu_item_id | item_name        | total_quantity_ordered
-- ------------ | ----------------- | ---------------------
-- 2            | Chicken Wings     | 2
-- 4            | Butter Chicken    | 2
-- 5            | Biryani           | 2


-- Q22. Table with highest number of confirmed reservations.
-- table_id | table_number | confirmed_reservations
-- --------- | ------------ | ---------------------
-- 4         | 4            | 1
-- (or 1, both have 1 confirmed reservation - either is acceptable)


-- Q23. Customers who ordered Main Course items (non-cancelled orders).
-- customer_id | customer_name
-- ----------- | -------------
-- 1           | Rajesh Kumar
-- 2           | Priya Sharma
-- 3           | Amit Patel
-- 5           | Vikram Singh


-- Q24. For each order status, show how many orders.
-- status    | order_count
-- --------- | -----------
-- served    | 2
-- preparing | 1
-- ready     | 1
-- pending   | 1
-- cancelled | 1


-- Q25. Menu items that are available but never been ordered.
-- menu_item_id | item_name
-- ------------ | ------------------
-- 9            | Ice Cream Sundae
-- 12           | Coffee

