-- =====================================================
-- PIZZA SALES DATABASE SCHEMA
-- PostgreSQL
-- =====================================================


-- =====================================================
-- 1. pizza_types TABLE
-- Stores pizza category and ingredients
-- =====================================================

CREATE TABLE pizza_types
(
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name          VARCHAR(100),
    category      VARCHAR(50),
    ingredients   TEXT
);



-- =====================================================
-- 2. pizzas TABLE
-- Stores pizza size and price
-- =====================================================

CREATE TABLE pizzas
(
    pizza_id       VARCHAR(50) PRIMARY KEY,
    pizza_type_id  VARCHAR(50),
    size           VARCHAR(10),
    price          NUMERIC(5,2),

    FOREIGN KEY (pizza_type_id)
    REFERENCES pizza_types(pizza_type_id)
);



-- =====================================================
-- 3. orders TABLE
-- Stores order date and time
-- =====================================================

CREATE TABLE orders
(
    order_id    INT PRIMARY KEY,
    date        DATE,
    time        TIME
);



-- =====================================================
-- 4. order_details TABLE
-- Stores ordered pizzas and quantity
-- =====================================================

CREATE TABLE order_details
(
    order_details_id INT PRIMARY KEY,
    order_id         INT,
    pizza_id         VARCHAR(50),
    quantity         INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (pizza_id)
    REFERENCES pizzas(pizza_id)
);