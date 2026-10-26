USE IndianEcommerceDB;
GO

WITH CustomerOrderCounts AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders_placed
    FROM orders
    GROUP BY customer_id
),
CustomerTiers AS (
    SELECT 
        customer_id,
        total_orders_placed,
        CASE 
            WHEN total_orders_placed = 1 THEN '1. One-Time Buyer'
            WHEN total_orders_placed BETWEEN 2 AND 4 THEN '2. Repeat Buyer (2-4 Orders)'
            ELSE '3. Power Buyer (5+ Orders)'
        END AS customer_segment
    FROM CustomerOrderCounts
)
SELECT 
    customer_segment,
    COUNT(customer_id) AS total_customers,
    ROUND(CAST(COUNT(customer_id) AS FLOAT) * 100.0 / SUM(COUNT(customer_id)) OVER (), 2) AS pct_of_total_customers
FROM CustomerTiers
GROUP BY customer_segment
ORDER BY customer_segment;