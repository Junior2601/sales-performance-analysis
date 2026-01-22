#Chiffre d’affaires total
SELECT ROUND(SUM(price), 2) AS total_revenue
FROM order_items;

#chiffre d’affaires mensuel
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(oi.price), 2) AS monthly_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY month
    ORDER BY month;

#Top 10 des ventes les plus rentables
SELECT 
    oi.product_id,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_revenue DESC
LIMIT 10;

#Clients à plus forte valeur
SELECT 
    o.customer_id,
    ROUND(SUM(oi.price), 2) AS total_spent
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;