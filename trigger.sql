CREATE TRIGGER reduce_inventory_trigger
AFTER INSERT ON Product_Order
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET quantity = quantity - :NEW.quantity
    WHERE product_id = :NEW.product_id;
END;
/
