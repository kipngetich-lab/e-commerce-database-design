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

-- size_option Table
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    size_value VARCHAR(20) UNIQUE, -- E.g., 'S', 'M', 'L', '42'
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- product_item Table
CREATE TABLE product_item (
  product_item_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  sku VARCHAR(50) UNIQUE, -- Stock Keeping Unit
  price DECIMAL(10, 2),
  quantity_in_stock INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);




-- product_attribute Table
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id INT,
    attribute_type_id INT,
    attribute_value VARCHAR(255), -- Can store different data types as text
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- attribute_category Table
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE -- E.g., 'Physical', 'Technical'
);

-- attribute_type Table
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    attribute_category_id INT,
    type_name VARCHAR(50) UNIQUE, -- E.g., 'Text', 'Number', 'Boolean'
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

--junction table for variations:
--E.g you want to link a product_item to specific size_option and color choices:
CREATE TABLE product_item_variation (
    item_variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id INT,
    variation_id INT, -- Refers to product_variation (e.g., Size or Color variation)
    size_option_id INT DEFAULT NULL,
    color_id INT DEFAULT NULL,
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);