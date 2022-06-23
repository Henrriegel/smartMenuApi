DROP DATABASE IF EXISTS cuino;
CREATE DATABASE IF NOT EXISTS cuino;
USE cuino;

CREATE TABLE IF NOT EXISTS tb_user(
    id_user INT PRIMARY KEY AUTO_INCREMENT,  
    nickname_user VARCHAR(100) NOT NULL UNIQUE,
    cellphone_user VARCHAR(20) NOT NULL,
    email_user VARCHAR(50) NOT NULL UNIQUE,
    password_user VARCHAR(50) NOT NULL,
    role_user ENUM('Administrator', 'User'),

    creation_user TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_user TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tb_product(
    id_product INT PRIMARY KEY AUTO_INCREMENT,  
    type_product ENUM('Starter', 'Main dish', 'Dessert', 'Drink') NOT NULL,
    ingredients_product VARCHAR(255) NOT NULL,
    price_product FLOAT(5, 2) NOT NULL
)DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tb_cart(
    id_cart INT PRIMARY KEY AUTO_INCREMENT,
    creation_cart TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tb_product_cart(
    id_product_cart INT PRIMARY KEY AUTO_INCREMENT, 
    fk_product INT NOT NULL,
    fk_cart INT NOT NULL,
    amount_dish_cart INT NOT NULL,

    FOREIGN KEY (fk_product) REFERENCES tb_product(id_product),
    FOREIGN KEY (fk_cart) REFERENCES tb_cart(id_cart)
)DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tb_order(
    id_order INT PRIMARY KEY AUTO_INCREMENT, 
    fk_user INT NOT NULL,
    fk_cart INT NOT NULL,
    total FLOAT(7, 2) NOT NULL,
    creation_order TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_order TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (fk_user) REFERENCES tb_user(id_user),
    FOREIGN KEY (fk_cart) REFERENCES tb_cart(id_cart)
)DEFAULT CHARSET=utf8;