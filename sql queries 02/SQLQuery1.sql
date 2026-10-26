USE IndianEcommerceDB;
GO

SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_order_items FROM order_items;
SELECT COUNT(*) AS total_payments FROM payments;

SELECT 
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_orders,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customers
FROM orders;