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

-- brand Table
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50) UNIQUE
);


-- product Table
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_id INT,
    category_id INT,
    product_name VARCHAR(255),
    base_price DECIMAL(10, 2),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);


-- product_variation Table
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    variation_name VARCHAR(50), -- E.g., 'Size', 'Color'
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- size_category Table
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE -- E.g., 'Clothing', 'Shoes'
);