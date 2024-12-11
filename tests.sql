-- fills the database with test data and runs shows some results

INSERT INTO customer (customer_id, name, address, contact_info)
VALUES (customer_seq.NEXTVAL, 'John Doe', '123 Main St, Anytown, USA', 'john.doe@example.com');
INSERT INTO customer (customer_id, name, address, contact_info)
VALUES (customer_seq.NEXTVAL, 'Jane Smith', '456 Elm St, Anytown, USA', 'jane.smith@example.com');
SELECT * FROM customer;

INSERT INTO "ORDER"(order_id, customer_id, order_date, delivery_date, status)
VALUES (order_seq.NEXTVAL, 1, SYSDATE, SYSDATE + 5, 'Pending');
INSERT INTO "ORDER"(order_id, customer_id, order_date, delivery_date, status)
VALUES (order_seq.NEXTVAL, 2, SYSDATE, SYSDATE + 7, 'Shipped');
SELECT * FROM "ORDER";

INSERT INTO shipment (shipment_id, order_id, shipment_date, status)
VALUES (shipment_seq.NEXTVAL, 1, SYSDATE, 'In Transit');
INSERT INTO shipment (shipment_id, order_id, shipment_date, status)
VALUES (shipment_seq.NEXTVAL, 2, SYSDATE, 'Delivered');
SELECT * FROM shipment;

INSERT INTO supplier (supplier_id, name, address, contact_info)
VALUES (supplier_seq.NEXTVAL, 'Supplier A', '789 Oak St, Anytown, USA', 'supplier.a@example.com');
INSERT INTO supplier (supplier_id, name, address, contact_info)
VALUES (supplier_seq.NEXTVAL, 'Supplier B', '101 Pine St, Anytown, USA', 'supplier.b@example.com');
SELECT * FROM supplier;

INSERT INTO product (product_id, name, description, unit_price, supplier_id)
VALUES (product_seq.NEXTVAL, 'Product 1', 'Description for Product 1', 10.99, 1);
INSERT INTO product (product_id, name, description, unit_price, supplier_id)
VALUES (product_seq.NEXTVAL, 'Product 2', 'Description for Product 2', 15.99, 2);
SELECT * FROM product;

INSERT INTO warehouse (warehouse_id, location, capacity)
VALUES (warehouse_seq.NEXTVAL, 'Warehouse 1', '1000 units');
INSERT INTO warehouse (warehouse_id, location, capacity)
VALUES (warehouse_seq.NEXTVAL, 'Warehouse 2', '2000 units');
SELECT * FROM warehouse;

INSERT INTO inventory (inventory_id, product_id, warehouse_id, quantity)
VALUES (inventory_seq.NEXTVAL, 1, 1, 50);
INSERT INTO inventory (inventory_id, product_id, warehouse_id, quantity)
VALUES (inventory_seq.NEXTVAL, 2, 2, 30);
SELECT * FROM inventory;

INSERT INTO product_ORDER(product_order_id, order_id, product_id, quantity)
VALUES (product_order_seq.NEXTVAL, 1, 1, 5);
INSERT INTO product_ORDER(product_order_id, order_id, product_id, quantity)
VALUES (product_order_seq.NEXTVAL, 2, 2, 10);
SELECT * FROM product_order;
-- inventory should be updated too
SELECT * FROM inventory;

-- views
SELECT * FROM CUSTOMER_ORDERS;
SELECT * FROM PRODUCT_SALES;
SELECT * FROM PRODUCT_STOCK_OVERVIEW;

-- admin user (AI generated and theoretical as we don't have the rights to create users on the school's db)
CREATE USER admin_user IDENTIFIED BY admin_password;
GRANT admin TO admin_user;
CONNECT admin_user/admin_password;

INSERT INTO customer (customer_id, name, address, contact_info)
VALUES (customer_seq.NEXTVAL, 'John Doe', '123 Main St, Anytown, USA', 'john.doe@example.com');
INSERT INTO "ORDER" (order_id, customer_id, order_date, delivery_date, status)
VALUES (order_seq.NEXTVAL, 1, SYSDATE, SYSDATE + 5, 'Pending');
INSERT INTO shipment (shipment_id, order_id, shipment_date, status)
VALUES (shipment_seq.NEXTVAL, 1, SYSDATE, 'In Transit');
INSERT INTO supplier (supplier_id, name, address, contact_info)
VALUES (supplier_seq.NEXTVAL, 'Supplier A', '789 Oak St, Anytown, USA', 'supplier.a@example.com');
INSERT INTO product (product_id, name, description, unit_price, supplier_id)
VALUES (product_seq.NEXTVAL, 'Product 1', 'Description for Product 1', 10.99, 1);
INSERT INTO warehouse (warehouse_id, location, capacity)
VALUES (warehouse_seq.NEXTVAL, 'Warehouse 1', '1000 units');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, quantity)
VALUES (inventory_seq.NEXTVAL, 1, 1, 50);
INSERT INTO product_order (product_order_id, order_id, product_id, quantity)
VALUES (product_order_seq.NEXTVAL, 1, 1, 5);
SELECT * FROM customer;
SELECT * FROM "ORDER";
SELECT * FROM shipment;
SELECT * FROM product_order;
SELECT * FROM product;
SELECT * FROM supplier;
SELECT * FROM inventory;
SELECT * FROM warehouse;
SELECT * FROM CUSTOMER_ORDERS;
SELECT * FROM PRODUCT_SALES;
SELECT * FROM PRODUCT_STOCK_OVERVIEW;

-- employee user
CREATE USER employee_user IDENTIFIED BY employee_password;
GRANT employee TO employee_user;
CONNECT employee_user/employee_password;
BEGIN
    INSERT INTO customer (customer_id, name, address, contact_info)
    VALUES (customer_seq.NEXTVAL, 'Jane Smith', '456 Elm St, Anytown, USA', 'jane.smith@example.com');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Insert failed: ' || SQLERRM);
END;
/
SELECT * FROM customer;
SELECT * FROM "ORDER";
SELECT * FROM shipment;
SELECT * FROM product_order;
SELECT * FROM product;
SELECT * FROM supplier;
SELECT * FROM inventory;
SELECT * FROM warehouse;
SELECT * FROM CUSTOMER_ORDERS;
SELECT * FROM PRODUCT_SALES;
SELECT * FROM PRODUCT_STOCK_OVERVIEW;