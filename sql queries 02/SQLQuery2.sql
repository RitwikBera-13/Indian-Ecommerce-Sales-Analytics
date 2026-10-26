USE IndianEcommerceDB;
GO


SELECT
    c.state AS customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS unique_customers,
    ROUND(SUM(o.subtotal + o.shipping_fee), 2) AS total_revenue_inr,
    ROUND(
        SUM(o.subtotal + o.shipping_fee)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS average_order_value_inr
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.state
ORDER BY total_revenue_inr DESC;