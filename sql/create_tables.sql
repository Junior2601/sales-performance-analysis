CREATE TABLE customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_city VARCHAR,
    customer_state VARCHAR
);

CREATE TABLE orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    order_purchase_timestamp TIMESTAMP,
    order_status VARCHAR,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id VARCHAR,
    product_id VARCHAR,
    price NUMERIC,
    freight_value NUMERIC
);