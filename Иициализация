DROP TABLE IF EXISTS Buyer, Buyer_address, Item_info, Warehouse, Item_stock, Bank_info, Payment, Delivery, Order, Order_item;

CREATE TABLE buyer (
    buyer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50),
    email_address VARCHAR(100) NOT NULL,
    mobile_phone VARCHAR(15) NOT NULL
);


CREATE TABLE Item_info (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    item_description VARCHAR(200),
    item_price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Warehouse (
    warehouse_id SERIAL PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    warehouse_address VARCHAR(200) NOT NULL
);


CREATE TABLE Item_stock (
    item_stock_id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item_info(item_id) ON DELETE CASCADE,
    warehouse_id INT REFERENCES Warehouse(warehouse_id) ON DELETE CASCADE,
    item_stock_quantity INT NOT NULL CHECK (item_stock_quantity >= 0)
);

CREATE TABLE Bank_info (
    bank_id SERIAL PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL
);


CREATE TABLE Payment (
    payment_id SERIAL PRIMARY KEY,
    payment_is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    bank_id INT REFERENCES Bank_info(bank_id) ON DELETE SET NULL,
    payment_date DATE NOT NULL
);


CREATE TABLE Delivery (
    delivery_id SERIAL PRIMARY KEY,
    sent_date DATE,
    is_delivered BOOLEAN NOT NULL DEFAULT FALSE,
    delivery_address VARCHAR(200) NOT NULL,
    delivery_cost DECIMAL(10, 2) NOT NULL,
    estimated_delivery_date DATE
);


CREATE TABLE Order (
    order_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES Buyer(buyer_id) ON DELETE CASCADE,
    order_date DATE NOT NULL,
    delivery_id INT REFERENCES Delivery(delivery_id) ON DELETE SET NULL,
    payment_id INT REFERENCES Payment(payment_id) ON DELETE SET NULL,
    order_status VARCHAR(50) NOT NULL,
    total_price DECIMAL(10, 2) DEFAULT 0 
);


CREATE TABLE Order_item (
    order_id INT REFERENCES Order(order_id) ON DELETE CASCADE,
    item_id INT REFERENCES Item_info(item_id) ON DELETE CASCADE,
    order_item_quantity INT NOT NULL CHECK (order_item_quantity > 0),
    PRIMARY KEY (order_id, item_id)  --составной ключ
);


CREATE TABLE Buyer_address (
    address_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES Buyer(buyer_id) ON DELETE CASCADE,
    country_name VARCHAR(50) NOT NULL,
    address_compound VARCHAR(200) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    is_delivery_address BOOLEAN DEFAULT FALSE  
);
