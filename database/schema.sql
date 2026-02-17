-- Create Database
CREATE DATABASE IF NOT EXISTS dummy_project;
USE dummy_project;

-- Suppliers Table
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50)
);

-- Products Table
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    reorder_level INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Shipments Table
CREATE TABLE IF NOT EXISTS shipments (
    shipment_id INT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    quantity_received INT,
    shipment_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Stock Entries Table
CREATE TABLE IF NOT EXISTS stock_entries (
    entry_id INT PRIMARY KEY,
    product_id INT,
    change_quantity INT,
    change_type VARCHAR(50),
    entry_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Reorders Table
CREATE TABLE IF NOT EXISTS reorders (
    reorder_id INT PRIMARY KEY,
    product_id INT,
    reorder_quantity INT,
    reorder_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
