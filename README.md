TechShop Database Design
This project focuses on the database design for TechShop, an electronic gadgets store. The database schema has been designed to efficiently manage information about customers, products, orders, inventory, and product categories. The database consists of several key tables, each with a well-defined structure to handle the necessary data for the business processes.

Features:
TechShop Database: Created a database named TechShop to store all relevant data.
Tables: Designed tables for Customers, Products, Orders, OrderDetails, Inventory, and Categories, ensuring data integrity with appropriate primary and foreign key constraints.
Sample Data: Inserted sample records into each table to simulate real-world business operations.
ERD: Created an Entity Relationship Diagram (ERD) to visualize the relationships between tables.

Database Tables:
'Customers': (Contains customer information such as name, email, and address).
'Products': (Stores details about the electronic gadgets, including product name, description, price, and a reference to the category).
'Orders': (Holds information about customer orders, such as order date and total amount).
'OrderDetails': (Links orders to products, storing the quantity of each item in the order).
'Inventory': (Tracks product stock levels and updates when items are sold or restocked).
'Categories': (Defines different product categories, such as 'Laptops', 'Smartphones', etc., with a unique category ID and category type (e.g., 'Electronics')).
The addition of the Categories table helps to categorize products, enabling better organization and searchability of products within the store. This structure ensures that TechShop can efficiently manage customer orders, product details, inventory, and product categories, providing a solid foundation for further development of the application.
