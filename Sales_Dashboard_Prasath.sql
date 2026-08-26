/* SQL SALES DASHBOARD PROJECT */

DROP DATABASE IF EXISTS sales_dashboard;
CREATE DATABASE sales_dashboard;
USE sales_dashboard;


/* Create Customers table */

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(20)
);


/* Create Products table */

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2)
);


/* Create Orders table */

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_method VARCHAR(30),
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);


/* Create Order Details table */

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);


/* Insert Customers */

INSERT INTO Customers
(customer_id, customer_name, gender, city, state, region)
VALUES
(1,'Arun Kumar','Male','Chennai','Tamil Nadu','South'),
(2,'Priya Sharma','Female','Mumbai','Maharashtra','West'),
(3,'Rahul Das','Male','Kolkata','West Bengal','East'),
(4,'Sneha Reddy','Female','Hyderabad','Telangana','South'),
(5,'Vikram Singh','Male','Delhi','Delhi','North'),
(6,'Anjali Mehta','Female','Ahmedabad','Gujarat','West'),
(7,'Karthik Raj','Male','Bengaluru','Karnataka','South'),
(8,'Neha Verma','Female','Pune','Maharashtra','West'),
(9,'Amit Patel','Male','Jaipur','Rajasthan','North'),
(10,'Divya Nair','Female','Kochi','Kerala','South');


/* Insert Products */

INSERT INTO Products
(product_id, product_name, category, price, cost_price)
VALUES
(101,'Laptop','Electronics',60000,45000),
(102,'Smartphone','Electronics',30000,22000),
(103,'Headphones','Electronics',3000,1800),
(104,'Office Chair','Furniture',8000,5500),
(105,'Office Table','Furniture',12000,8500),
(106,'Bookshelf','Furniture',7000,4800),
(107,'Keyboard','Accessories',2000,1200),
(108,'Mouse','Accessories',1200,700),
(109,'Backpack','Accessories',2500,1500),
(110,'Monitor','Electronics',18000,13000);


/* Insert Orders */

INSERT INTO Orders
(order_id, customer_id, order_date, payment_method, order_status)
VALUES
(1001,1,'2026-01-05','UPI','Completed'),
(1002,2,'2026-01-08','Credit Card','Completed'),
(1003,3,'2026-01-12','Debit Card','Completed'),
(1004,4,'2026-01-18','UPI','Completed'),
(1005,5,'2026-01-25','Cash','Cancelled'),
(1006,1,'2026-02-03','Credit Card','Completed'),
(1007,6,'2026-02-10','UPI','Completed'),
(1008,7,'2026-02-15','Debit Card','Completed'),
(1009,8,'2026-02-21','UPI','Completed'),
(1010,9,'2026-02-27','Cash','Completed'),
(1011,10,'2026-03-04','Credit Card','Completed'),
(1012,2,'2026-03-11','UPI','Completed'),
(1013,3,'2026-03-17','Debit Card','Cancelled'),
(1014,4,'2026-03-23','Credit Card','Completed'),
(1015,5,'2026-03-29','UPI','Completed'),
(1016,1,'2026-04-05','Debit Card','Completed'),
(1017,6,'2026-04-12','UPI','Completed'),
(1018,7,'2026-04-18','Credit Card','Completed'),
(1019,8,'2026-04-24','Cash','Cancelled'),
(1020,9,'2026-04-28','UPI','Completed'),
(1021,10,'2026-05-03','Credit Card','Completed'),
(1022,2,'2026-05-09','UPI','Completed'),
(1023,3,'2026-05-15','Debit Card','Completed'),
(1024,4,'2026-05-20','UPI','Completed'),
(1025,5,'2026-05-25','Cash','Completed');


/* Insert Order Details */

INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity)
VALUES
(1,1001,101,1),
(2,1001,107,2),
(3,1002,102,1),
(4,1002,103,2),
(5,1003,104,2),
(6,1003,108,1),
(7,1004,105,1),
(8,1004,109,2),
(9,1005,106,1),
(10,1006,101,1),
(11,1006,110,1),
(12,1007,102,2),
(13,1007,108,2),
(14,1008,103,3),
(15,1008,107,2),
(16,1009,104,1),
(17,1009,109,1),
(18,1010,105,2),
(19,1010,106,1),
(20,1011,110,2),
(21,1011,103,1),
(22,1012,101,1),
(23,1012,108,3),
(24,1013,102,1),
(25,1014,104,2),
(26,1014,107,1),
(27,1015,105,1),
(28,1015,109,2),
(29,1016,101,1),
(30,1016,110,2),
(31,1017,102,1),
(32,1017,103,2),
(33,1018,104,1),
(34,1018,106,2),
(35,1019,108,2),
(36,1020,105,1),
(37,1020,107,3),
(38,1021,101,1),
(39,1021,109,1),
(40,1022,110,1),
(41,1022,103,2),
(42,1023,102,2),
(43,1023,108,1),
(44,1024,104,2),
(45,1024,107,2),
(46,1025,105,1),
(47,1025,106,1);


/* Verify Data */

SELECT 'Customers' AS table_name, COUNT(*) AS row_count
FROM Customers
UNION ALL
SELECT 'Products', COUNT(*)
FROM Products
UNION ALL
SELECT 'Orders', COUNT(*)
FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*)
FROM Order_Details;


/* KPI Dashboard */

SELECT
    ROUND(SUM(od.quantity * p.price),2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity) AS total_quantity,
    ROUND(SUM(od.quantity * (p.price - p.cost_price)),2) AS total_profit,
    ROUND(
        SUM(od.quantity * p.price) /
        COUNT(DISTINCT o.order_id),2
    ) AS average_order_value,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)) /
        SUM(od.quantity * p.price) * 100,2
    ) AS profit_margin
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed';


/* Product Analysis */

SELECT
    p.product_name,
    p.category,
    SUM(od.quantity) AS quantity_sold,
    ROUND(SUM(od.quantity * p.price),2) AS revenue,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS profit
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC;


/* Top 5 Products */

SELECT
    p.product_name,
    p.category,
    SUM(od.quantity) AS quantity_sold,
    ROUND(SUM(od.quantity * p.price),2) AS revenue,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS profit
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC
LIMIT 5;


/* Category Analysis */

SELECT
    p.category,
    SUM(od.quantity) AS quantity_sold,
    ROUND(SUM(od.quantity * p.price),2) AS total_sales,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS total_profit
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_sales DESC;


/* Region Analysis */

SELECT
    c.region,
    ROUND(SUM(od.quantity * p.price),2) AS total_sales,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS total_profit,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.region
ORDER BY total_sales DESC;


/* City Analysis */

SELECT
    c.city,
    c.region,
    ROUND(SUM(od.quantity * p.price),2) AS total_sales,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS total_profit
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.city, c.region
ORDER BY total_sales DESC;


/* Customer Analysis */

SELECT
    c.customer_name,
    c.region,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(od.quantity * p.price),2) AS revenue,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS profit
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name, c.region
ORDER BY revenue DESC
LIMIT 5;


/* Monthly Sales */

SELECT
    DATE_FORMAT(o.order_date,'%Y-%m') AS month,
    ROUND(SUM(od.quantity * p.price),2) AS total_sales,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS total_profit,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity) AS quantity_sold
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date,'%Y-%m')
ORDER BY month;


/* Payment Analysis */

SELECT
    o.payment_method,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(od.quantity * p.price),2) AS total_sales
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY o.payment_method
ORDER BY total_orders DESC;


/* Order Status Analysis */

SELECT
    order_status,
    COUNT(*) AS number_of_orders
FROM Orders
GROUP BY order_status;


/* Cancellation Rate */

SELECT
    COUNT(*) AS total_orders,
    SUM(order_status = 'Completed') AS completed_orders,
    SUM(order_status = 'Cancelled') AS cancelled_orders,
    ROUND(
        SUM(order_status = 'Cancelled') /
        COUNT(*) * 100,2
    ) AS cancellation_rate
FROM Orders;


/* Customers With Multiple Orders */

SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;


/* Profit Analysis */

SELECT
    p.product_name,
    p.category,
    ROUND(
        SUM(od.quantity * (p.price - p.cost_price)),2
    ) AS total_profit
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_profit DESC;


/* Most Used Payment Method */

SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM Orders
WHERE order_status = 'Completed'
GROUP BY payment_method
ORDER BY total_orders DESC
LIMIT 1;
/* Verify Data */

SELECT 'Customers' AS table_name, COUNT(*) AS row_count
FROM Customers
UNION ALL
SELECT 'Products', COUNT(*)
FROM Products
UNION ALL
SELECT 'Orders', COUNT(*)
FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*)
FROM Order_Details;
USE sales_dashboard;

SELECT DATABASE();
SELECT
    order_status,
    COUNT(*) AS number_of_orders
FROM Orders
GROUP BY order_status;