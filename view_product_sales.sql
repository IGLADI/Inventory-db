CREATE VIEW PRODUCT_SALES AS
SELECT p.product_id, p.name, p.unit_price, SUM(po.quantity) AS total_quantity, SUM(po.quantity * p.unit_price) AS total_revenue
FROM Product p
JOIN Product_Order po ON p.product_id = po.product_id
GROUP BY p.product_id, p.name, p.unit_price;