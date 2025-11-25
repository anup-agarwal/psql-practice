-- Q1. List all customers with their city.

-- customer_id | full_name      | city
-- ----------- | -------------- |-----------
-- 1           | Rahul Sharma   | Delhi
-- 2           | Priya Verma    | Mumbai
-- 3           | Amit Patel     | Bangalore
-- 4           | Sara Khan      | Delhi
-- 5           | Vikram Singh   | Chennai
-- 6           | Guest User     | NULL


-- Q2. List all orders with customer name, status, total amount.

-- order_id | customer_name | status    | total_amount
-- -------- | ------------- | --------- | ------------
-- 1        | Rahul Sharma  | placed    | 35000.00
-- 2        | Priya Verma   | shipped   |  4100.00
-- 3        | Amit Patel    | placed    | 60000.00
-- 4        | Rahul Sharma  | delivered |  1500.00
-- 5        | Sara Khan     | shipped   |  8000.00
-- 6        | Vikram Singh  | cancelled |   800.00


-- Q3. For each order, show total quantity of items.

-- order_id | total_quantity
-- -------- | --------------
-- 1        | 2
-- 2        | 5
-- 3        | 1
-- 4        | 3
-- 5        | 3
-- 6        | 1


-- Q4. Top 3 products by total quantity sold
--     (exclude cancelled orders).

-- product_id | product_name       | total_quantity_sold
-- ---------- | ------------------ | --------------------
-- 5          | T-Shirt - Plain    | 5
-- 6          | Jeans - Slim Fit   | 3
-- 2          | Wireless Earbuds   | 2


-- Q5. Customers who have NEVER placed any order.

-- customer_id | full_name
-- ----------- | ----------
-- 6           | Guest User


-- Q6. Orders that have NO successful payment
--     (no payment with status = 'success').

-- order_id | status
-- -------- | ---------
-- 3        | placed
-- 5        | shipped
-- 6        | cancelled


-- Q7. Orders that have a shipment,
--     but are NOT yet delivered (status = 'shipped').

-- order_id | shipment_status
-- -------- | ----------------
-- 2        | shipped
-- 5        | shipped


-- Q8. For each customer, show total amount of all
--     NON-cancelled orders.

-- customer_id | customer_name | total_spent
-- ----------- | ------------- | -----------
-- 1           | Rahul Sharma  | 36500.00
-- 2           | Priya Verma   |  4100.00
-- 3           | Amit Patel    | 60000.00
-- 4           | Sara Khan     |  8000.00


-- Q9. List all categories with how many products they have.

-- category_id | category_name | product_count
-- ----------- | ------------- | -------------
-- 1           | Electronics   | 3
-- 2           | Books         | 1
-- 3           | Fashion       | 2


-- Q10. List customers who bought at least one
--      ELECTRONICS product (non-cancelled orders).

-- customer_id | full_name
-- ----------- | --------------
-- 1           | Rahul Sharma
-- 3           | Amit Patel
-- 4           | Sara Khan


-- Q11. Products that were ordered but NEVER shipped
--      (i.e., all their orders have no shipment record).

-- product_id | product_name
-- ---------- | ------------------------
-- 3          | Laptop Air
-- 4          | Novel - The Journey


-- Q12. Orders that HAVE a shipment
--      BUT do NOT have a successful payment.

-- order_id | status
-- -------- | --------
-- 5        | shipped
