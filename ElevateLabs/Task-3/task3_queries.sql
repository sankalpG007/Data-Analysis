-- Create the database
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- 1. Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    registration_date DATE
);

-- 2. Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50),
    stock_quantity INT DEFAULT 0,
    description TEXT
);

-- 3. Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order Items (junction table)
CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data
-- Customers
INSERT INTO customers (name, email, phone, address, registration_date) VALUES
('John Doe', 'john@example.com', '1234567890', '123 Main St, City', '2023-01-15'),
('Jane Smith', 'jane@example.com', '9876543210', '456 Oak Ave, Town', '2023-02-20');

-- Products
INSERT INTO products (name, price, category, stock_quantity, description) VALUES
('Laptop', 999.99, 'Electronics', 50, 'High-performance laptop'),
('Smartphone', 699.99, 'Electronics', 100, 'Latest model'),
('Headphones', 99.99, 'Accessories', 200, 'Noise-cancelling');

-- Orders
INSERT INTO orders (customer_id, total_amount, status) VALUES
(1, 999.99, 'Delivered'),
(2, 799.98, 'Shipped');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(2, 2, 1, 699.99),
(2, 3, 1, 99.99);

-- Sample Queries (Try these after running the script)
-- 1. List all products priced above $500:
-- SELECT * FROM products WHERE price > 500;

-- 2. Find orders with customer details:
-- SELECT o.order_id, c.name, o.total_amount, o.status 
-- FROM orders o JOIN customers c ON o.customer_id = c.customer_id;

-- 3. Total revenue by category:
-- SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
-- FROM order_items oi JOIN products p ON oi.product_id = p.product_id
-- GROUP BY p.category;


SELECT * 
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC;

SELECT 
    MONTH(registration_date) AS reg_month, 
    COUNT(*) AS total_customers
FROM customers
GROUP BY reg_month
ORDER BY reg_month;

SELECT 
    o.order_id, 
    c.name AS customer_name, 
    o.total_amount, 
    o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT 
    c.name AS customer_name, 
    o.order_id, 
    o.status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT 
    o.order_id, 
    o.total_amount, 
    c.name AS customer_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

SELECT name 
FROM customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    WHERE total_amount > (
        SELECT AVG(total_amount) FROM orders
    )
);

SELECT 
    customer_id, 
    AVG(total_amount) AS avg_spending
FROM orders
GROUP BY customer_id;

CREATE VIEW view_order_summary AS
SELECT 
    o.order_id, 
    c.name AS customer_name, 
    o.total_amount, 
    o.status, 
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
SELECT * FROM view_order_summary;

CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_id ON order_items(product_id);
CREATE INDEX idx_category ON products(category);


