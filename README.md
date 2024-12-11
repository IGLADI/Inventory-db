# Inventory Management System

## Overview

This is my implementation of an inventory management system made for my course Data Management.

## ERD

[Miro](https://miro.com/app/board/uXjVL6rirrc=/?share_link_id=399006329441)

## Features

-   **Sequences**: Automatic ID generation for all tables.
-   **Triggers**: Automatically reduces inventory when an order is placed.
-   **Views**: Easy access to recurring queries.
-   **Database Security Access Rights**: (This is just a basic example and extra user roles can be added depending on the business requirements)
    -   Administrators
    -   Employees

## How to use:

1. Connect to your oracle database.
2. Run `tables.sql`.
3. Run `view_customer_order.sql`.
4. Run `view_product_sales.sql`.
5. Run `view_stock.sql`.
6. Run `roles.sql`.
7. Run `trigger.sql`.
8. Use the database (see `tests.sql` for examples).
