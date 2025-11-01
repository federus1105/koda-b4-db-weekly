--- TABLE ENUM ---
CREATE TYPE role AS ENUM ('admin', 'user');
CREATE TYPE size AS ENUM ('regular', 'medium', 'large');
CREATE TYPE variant AS ENUM ('ice', 'hot');
CREATE TYPE delivery AS ENUM ('dineIn','doorDelivery', 'pickUp');

--- TABLE ----
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(100),
    role role
 );

CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    id_users INT NOT NULL,
    fullname VARCHAR(50) DEFAULT 'user',
    phoneNumber VARCHAR(12) DEFAULT '+62812342',
    address VARCHAR(100) NOT NULL,
    photos VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_users) REFERENCES users (id)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    id_account INT NOT NULL,
    id_paymentMethod INT NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(100) NOT NULL,
    delivery delivery NOT NULL,
    total FLOAT NOT NULL,
    status BOOLEAN NOT NULL,
    variant variant,
    size size,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_account) REFERENCES account(id),
    FOREIGN KEY (id_paymentMethod) REFERENCES payment_method(id)
);

CREATE TABLE payment_method (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    photos VARCHAR(100) NOT NULL
);

CREATE TABLE product_orders (
    id_product INT NOT NULL,
    id_order INT NOT NULL,
    quantity FLOAT NOT NULL,
    FOREIGN KEY (id_product) REFERENCES product(id),
    FOREIGN KEY (id_order) REFERENCES orders(id)
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    id_product_images INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    RATING FLOAT NOT NULL,
    priceOriginal FLOAT NOT NULL,
    priceDiscount FLOAT,
    flash_sale BOOLEAN,
    stock INT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(id_product_images) REFERENCES product_images(id)
);

CREATE TABLE product_images(
    id SERIAL PRIMARY KEY,
    photos_one VARCHAR(255) NOT NULL,
    photos_two VARCHAR(255),
    photos_three VARCHAR(255),
    photos_four VARCHAR(255)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE product_categories (
    id_product INT NOT NULL,
    id_categories INT NOT NULL,
    FOREIGN KEY (id_product) REFERENCES product(id),
    FOREIGN KEY (id_categories) REFERENCES categories(id)
);