--Create database ecommerce_db
CREATE DATABASE ecommerce_db;

--Database to be used to store ecommerce entities
USE ecommerce_db;

--Create ecommerce_db tables
-- product_image Table
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id INT, -- Foreign key referencing product_item
    image_url VARCHAR(255),
    alt_text VARCHAR(255),
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id)
);

-- color Table
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) UNIQUE
);

-- product_category Table
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE
);