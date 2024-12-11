CREATE VIEW CUSTOMER_ORDERS AS
SELECT c.customer_id, c.name, c.address, c.contact_info, o.order_id, o.order_date, o.delivery_date, o.status
FROM Customer c
JOIN "ORDER" o ON c.customer_id = o.customer_id;
