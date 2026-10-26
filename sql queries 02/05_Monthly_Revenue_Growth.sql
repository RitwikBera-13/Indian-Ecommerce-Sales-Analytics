USE IndianEcommerceDB;
GO


WITH MonthlyRevenue AS (
    SELECT
        CONVERT(CHAR(7), o.order_date, 120) AS year_month,
        ROUND(
            SUM(o.subtotal + o.shipping_fee),
            2
        ) AS current_month_revenue
    FROM orders o
    WHERE o.order_status = 'Delivered'
    GROUP BY CONVERT(CHAR(7), o.order_date, 120)
),
MoMCalculation AS (
    SELECT
        year_month,
        current_month_revenue,
        LAG(current_month_revenue, 1) OVER (
            ORDER BY year_month
        ) AS previous_month_revenue
    FROM MonthlyRevenue
)
SELECT
    year_month,
    current_month_revenue,
    ISNULL(previous_month_revenue, 0) AS previous_month_revenue,
    ROUND(
        CASE
            WHEN previous_month_revenue IS NULL
                 OR previous_month_revenue = 0
            THEN NULL
            ELSE
                (
                    (current_month_revenue - previous_month_revenue)
                    * 100.0 / previous_month_revenue
                )
        END,
        2
    ) AS mom_growth_pct
FROM MoMCalculation
ORDER BY year_month;