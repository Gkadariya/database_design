-- Lets create a database from scratch

-- Create database "sample_database"
DROP DATABASE IF EXISTS sample_database;
CREATE DATABASE IF NOT EXISTS sample_database;

-- Lets create tables for the database
-- create employees table
DROP TABLE IF EXISTS sample_database.employees;

CREATE TABLE IF NOT EXISTS sample_database.employees 
(
employee_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
employee_first_name VARCHAR(55) NOT NULL,
employee_last_name VARCHAR(55) NOT NULL, 
employee_email VARCHAR(55),
employee_phone INT(10),
job_title VARCHAR(55),
reports_to VARCHAR(55) 		
) ;

-- create customers table 
DROP TABLE IF EXISTS sample_database.customers;

CREATE TABLE IF NOT EXISTS sample_database.customers(
customer_id INT PRIMARY KEY	NOT NULL UNIQUE AUTO_INCREMENT,
employee_id INT NOT NULL,
customer_name VARCHAR(55) NOT NULL,
contact_first_name VARCHAR(55) NOT NULL,
contact_last_name VARCHAR(55) NOT NULL,
customer_phone INT(10),
customer_address_line VARCHAR(55),
customer_city VARCHAR(55),
customer_state VARCHAR(55),
customer_postal_code INT(5),
customer_country VARCHAR(55),
credit_limit FLOAT,
CONSTRAINT customers_fk_employees 
FOREIGN KEY (employee_id) REFERENCES sample_database.employees(employee_id)
);

-- create products table
DROP TABLE IF EXISTS sample_database.products;

CREATE TABLE IF NOT EXISTS sample_database.products(
product_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
product_name VARCHAR(55) NOT NULL,
product_description VARCHAR(55),
quantity_in_stock INT,
unit_price FLOAT NOT NULL
);

-- create orders table
DROP TABLE IF EXISTS sample_database.orders;

CREATE TABLE IF NOT EXISTS sample_database.orders(
order_number INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
shipped_date DATE NOT NULL,
order_status VARCHAR(55),
required_date DATE,
CONSTRAINT orders_fk_customers
FOREIGN KEY(customer_id) REFERENCES sample_database.customers(customer_id)
);

-- Create Order_details table 
DROP TABLE IF EXISTS sample_database.order_details;

CREATE TABLE IF NOT EXISTS sample_database.order_details(
order_detail_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
order_number INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
total_price FLOAT NOT NULL,
CONSTRAINT order_details_fk_orders
FOREIGN KEY(order_number) REFERENCES sample_database.orders(order_number),
CONSTRAINT order_details_fk_products
FOREIGN KEY(product_id) REFERENCES sample_database.products(product_id)
);

-- create payments table 
DROP TABLE IF EXISTS sample_database.payments;

CREATE TABLE IF NOT EXISTS sample_database.payments(
payment_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
customer_id INT NOT NULL,
payment_date DATE NOT NULL,
amount_due FLOAT,
CONSTRAINT payments_fk_customers
FOREIGN KEY(customer_id) REFERENCES sample_database.customers(customer_id)
);

-- Create warehouse table
DROP TABLE IF EXISTS sample_database.warehouse;

CREATE TABLE IF NOT EXISTS sample_database.warehouse(
warehouse_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
warehouse_name VARCHAR(55),
total_employees INT
);

-- Create locations table 
DROP TABLE IF EXISTS sample_database.locations;

CREATE TABLE IF NOT EXISTS sample_database.locations(
location_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
warehouse_id INT NOT NULL,
address_line VARCHAR(55) NOT NULL,
city VARCHAR(55) NOT NULL,
state VARCHAR(30) NOT NULL,
postal_code INT(5),
location_description VARCHAR(55) NOT NULL,
CONSTRAINT locations_fk_warehouse
FOREIGN KEY(warehouse_id) REFERENCES sample_database.warehouse(warehouse_id)
);






