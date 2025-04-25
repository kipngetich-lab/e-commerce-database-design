weE-commerce-Database-Design

1.  📘 Project Description
This project involves the creation of a relational database schema for an e-commerce platform. The schema is designed using MySQL and focuses on efficient data organization for products, variations,
inventory, attributes, brands, and categories. It supports scalability, normalization, and complex relationships required for managing diverse product catalogs.

2. 🎯 Objectives
Design a normalized database structure for an e-commerce application.

Implement entity relationships using foreign keys and constraints.

Support flexible product attributes and multiple product variations.

Ensure data integrity and enable efficient queries for operations such as inventory tracking, filtering, and display.

3. 🏗️ Database Overview
Database Name: ecommerce_db

This database includes the following core entities and their relationships:

A. Product Management

Table	Description
product	Base product details (e.g., name, brand, category, base price).
product_item	Represents SKUs or specific versions of a product (e.g., Red T-Shirt, size M).
product_image	Stores URLs and alt text for images related to each product_item.

B. Categorization and Brands

Table	Description
brand	Contains unique brand names.
product_category	Stores categories such as 'Clothing'.

C. Variations and Inventory

Table	Description
product_variation	Types of variations (e.g., Size, Color).
product_item_variation	Junction table linking product items to specific variations and options.
color	Stores color options.
size_category	Categorizes sizes into groups like 'Shoes' or 'Clothing'.
size_option	Defines specific size values like 'M', 'L', or '42'.

D. Product Attributes

Table	Description
attribute_category	Categorizes attribute types (e.g., Technical or Physical).
attribute_type	Types of attributes (Text, Number, Boolean).
product_attribute	Links specific attribute values to a product item.

4. 🗂️ ERD (Entity-Relationship Diagram)
An ER diagram will be included for visual representation of the schema and relationships.

5. 📌 Assumptions
Each product can have multiple variations and attributes.

Variations are pre-defined (e.g., Size, Color) and shared across products.

Attributes are flexible and typed to allow reusability and validation.

👨‍💻 Author

Name: Joyce Nyambura
Email: nyamburanjihia@gmail.com

Name: Monica Mukanda
Email:mukandamonica1@gmail.com

Name:Kipngetich Josphat
Email:joskipngetich07@gmail.com

