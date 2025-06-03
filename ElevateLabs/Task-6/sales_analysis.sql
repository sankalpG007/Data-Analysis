CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-15', 250.50, 101),
(2, '2023-01-17', 100.00, 102),
(3, '2023-02-02', 500.00, 103),
(4, '2023-03-05', 130.00, 101),
(5, '2023-03-10', 120.00, 104),
(6, '2023-04-12', 210.00, 105),
(7, '2023-04-15', 305.00, 101),
(8, '2023-05-20', 400.00, 106),
(9, '2023-05-25', 125.00, 102),
(10, '2023-06-01', 275.00, 104),
(11, '2023-07-14', 500.00, 107),
(12, '2023-07-30', 650.00, 108),
(13, '2023-08-12', 700.00, 103),
(14, '2023-08-15', 800.00, 109),
(15, '2023-09-05', 950.00, 110),
(16, '2023-09-22', 200.00, 111),
(17, '2023-10-02', 150.00, 112),
(18, '2023-11-01', 300.00, 113),
(19, '2023-12-15', 420.00, 114),
(20, '2024-01-20', 330.00, 115);

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    total_revenue DESC
LIMIT 3;
