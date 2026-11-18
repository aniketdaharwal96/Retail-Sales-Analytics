-- Project: Retail Sales Analytics (RSA)
-- File: schema.sql
-- Description: Creates relational tables with Primary and Foreign Keys


-- 1. Create Customers Table
CREATE TABLE RSA_CUSTOMERS (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    city VARCHAR2(50),
    region VARCHAR2(20)
);

-- 2. Create Products Table
CREATE TABLE RSA_PRODUCTS (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER
);

-- 3. Create Orders Table
CREATE TABLE RSA_ORDERS (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE,
    payment_method VARCHAR2(20),
    FOREIGN KEY (customer_id) REFERENCES RSA_CUSTOMERS(customer_id)
);

-- 4. Create Order Items Table
CREATE TABLE RSA_ORDER_ITEMS (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    FOREIGN KEY (order_id) REFERENCES RSA_ORDERS(order_id),
    FOREIGN KEY (product_id) REFERENCES RSA_PRODUCTS(product_id)
);