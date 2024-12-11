CREATE DATABASE inventory_db
USE inventory_db

CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    name VARCHAR2(255),
    address VARCHAR2(255),
    contact_info VARCHAR2(255)
);
CREATE SEQUENCE customer_seq START WITH 1 INCREMENT BY 1;

-- order is a reserved keyword so we need to "" it
CREATE TABLE "ORDER" (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    delivery_date DATE,
    status VARCHAR2(255),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE SEQUENCE order_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE SHIPMENT (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipment_date DATE,
    status VARCHAR2(255),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);
CREATE SEQUENCE shipment_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE SUPPLIER (
    supplier_id INT PRIMARY KEY,
    name VARCHAR2(255),
    address VARCHAR2(255),
    contact_info VARCHAR2(255)
);
CREATE SEQUENCE supplier_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE WAREHOUSE (
    warehouse_id INT PRIMARY KEY,
    location VARCHAR2(255),
    -- can be converter to a number if planning to use it as a constraint however as we won't do this I let it as a string so you can type 250m² or smth
    capacity VARCHAR2(255)
);
CREATE SEQUENCE warehouse_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY,
    name VARCHAR2(255),
    description VARCHAR2(255),
    unit_price FLOAT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);
CREATE SEQUENCE product_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE PRODUCT_ORDER (
    product_order_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    -- if working with measurement instead of quantity we should use a float/varchar
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE SEQUENCE product_order_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE INVENTORY (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
);
CREATE SEQUENCE inventory_seq START WITH 1 INCREMENT BY 1;