USE IndianEcommerceDB;
GO

-- Query 3: State-Wise Payment Preference Breakdown using CTEs

WITH StatePaymentSummary AS (
    SELECT
        c.state AS customer_state,
        p.payment_method,
        COUNT(DISTINCT o.order_id) AS total_orders,
        ROUND(SUM(p.amount_paid), 2) AS total_payment_value_inr
    FROM orders o
    INNER JOIN customers c
        ON o.customer_id = c.customer_id
    INNER JOIN payments p
        ON o.order_id = p.order_id
    WHERE c.state IN ('Maharashtra', 'Uttar Pradesh', 'Gujarat')
      AND o.order_status = 'Delivered'
      AND p.payment_status = 'Success'
    GROUP BY
        c.state,
        p.payment_method
)
SELECT
    customer_state,
    payment_method,
    total_orders,
    total_payment_value_inr,
    ROUND(
        total_payment_value_inr * 100.0
        / NULLIF(
            SUM(total_payment_value_inr) OVER (
                PARTITION BY customer_state
            ),
            0
        ),
        2
    ) AS pct_share_in_state
FROM StatePaymentSummary
ORDER BY
    customer_state,
    total_payment_value_inr DESC;