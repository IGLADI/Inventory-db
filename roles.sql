CREATE ROLE admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON "ORDER" TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shipment TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON product_order TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON product TO admin_role;
GRANT SELECT, insert, update, delete on supplier TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON inventory TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON warehouse TO admin_role;

CREATE ROLE employee_role;
GRANT SELECT ON customer TO employee_role;
GRANT SELECT ON "ORDER" TO employee_role;
GRANT SELECT ON shipment TO employee_role;
GRANT SELECT ON product_order TO employee_role;
GRANT SELECT ON product TO employee_role;
GRANT SELECT ON supplier TO employee_role;
GRANT SELECT ON inventory TO employee_role;
GRANT SELECT ON warehouse TO employee_role;
