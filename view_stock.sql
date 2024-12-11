CREATE VIEW PRODUCT_STOCK_OVERVIEW AS
SELECT p.product_id, p.name, p.description, p.unit_price, SUM(i.quantity) AS total_stock
FROM Product p
JOIN Inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.name, p.description, p.unit_price;
