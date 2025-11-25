-- Q1. List all customers with their city.
select * from customers;

-- Q2. List all orders with customer name, status, and total amount.
select full_name, status, total_amount from customers join orders as o on customers.id=o.customer_id;

-- Q3. For each order, show the total quantity of items
--     (sum of quantity from order_items).
select o.*,  sum(oi.quantity) from order_items as oi join orders as o on oi.order_id=o.id join products as p on oi.product_id=p.id
group by o.id
order by o.id;


-- Q4. Show the TOP 3 products by total quantity sold,
--     considering only non-cancelled orders.
select p.*,  sum(oi.quantity) from order_items as oi join orders as o on oi.order_id=o.id join products as p on oi.product_id=p.id
where status <> 'cancelled'
group by p.id
order by sum(oi.quantity) desc
limit 3;


-- Q5. List all customers who have NEVER placed any order.
select c.* from customers as c where not exists (select * from orders where orders.customer_id=c.id);

-- Q6. List all orders that have NO successful payment
--     (i.e., there is no row in payments with status = 'success' for that order).
select id, status from orders where not exists (select * from payments where orders.id=payments.order_id and payments.status='success');

-- Q7. List all orders that HAVE a shipment,
--     but the shipment is NOT yet delivered
--     (shipment.status = 'shipped').
select o.* from orders as o join shipments as s on s.order_id=o.id where o.status='shipped';

-- Q8. For each customer, show the total amount spent
--     across all NON-cancelled orders.
select c.*, sum(total_amount) from customers as c join orders as o on o.customer_id=c.id where o.status<>'cancelled'
group by c.id
order by c.id;

-- Q9. List all categories along with how many products
--     belong to each category.
select c.*, count(p.id) from categories as c join products as p on p.category_id=c.id
group by c.id;

-- Q10. List all customers who have bought at least one
--      ELECTRONICS product (category = 'Electronics'),
--      ignoring cancelled orders.
select distinct customers.* from customers where exists (
  select p.* from (((orders as o join order_items as oi on oi.order_id=o.id)
  join products as p on p.id=oi.product_id) join categories as c on p.category_id=c.id
  and c.name='Electronics' and o.status<>'cancelled' and o.customer_id=customers.id)
);

-- TODO: Review this
-- Q11. List all products that were ordered but NEVER shipped
--      (i.e., none of their orders have a shipment row).
select products.* from products where not exists (
  (select * from (shipments as s join orders on s.order_id=orders.id) 
    join order_items on orders.id=order_items.order_id and order_items.product_id=products.id)
);

-- Q12. List all orders that HAVE a shipment
--      BUT do NOT have any successful payment.
select orders.* from orders
where exists (select * from shipments where orders.id=shipments.order_id) and 
not exists (
  select * from payments where payments.status='success' and orders.id=payments.order_id
);