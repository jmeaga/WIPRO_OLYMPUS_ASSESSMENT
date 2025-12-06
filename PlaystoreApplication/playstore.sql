drop database capstone;
create database capstone;
use capstone;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob VARCHAR(20),
    date_of_open VARCHAR(20),
    address1 VARCHAR(100),
    address2 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    country VARCHAR(50),
    user_name VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    mobile_no VARCHAR(20),
    email VARCHAR(100),
    status VARCHAR(20)
);
CREATE TABLE user_apps (
    user_app_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    app_id INT,
    download_date VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_name VARCHAR(50),
    user_name VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    email VARCHAR(100),
    mobile_no VARCHAR(20),
    admin_status VARCHAR(10) -- YES/NO
);

CREATE TABLE app_details (
    app_id INT AUTO_INCREMENT PRIMARY KEY,
    app_name VARCHAR(100),
    description TEXT,
    release_date DATE,
    version VARCHAR(20),
    rating DOUBLE,
    genre VARCHAR(50),
    app_owner_id INT
);


ALTER TABLE app_details
DROP COLUMN app_owner_id;
