--CREATE DATABASE task

------------------ 1 ------------------
CREATE TABLE Customer (
	customer_id VARCHAR(255) PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	birth_date date NOT NULL,
	phone varchar(255) NOT NULL,
	addres VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL,
	state VARCHAR(255) NOT NULL
);

INSERT INTO Customer(customer_id, first_name, last_name, birth_date, phone, addres, city, state)
VALUES
(1, 'Rohit', 'Sharma', '1950/01/01', 8123456789, 'Wastegate LA', 'Mumbai', 'Maharastra'),
(2, 'Rahul', 'Lokesh', '1960/02/15', 9427264254, '2 Northside', 'Lucknow', 'UP'),
(3, 'Virat', 'Kohli', '1952/11/05', 9537415738, 'Church Street', 'Banglore', 'Karnatak'),
(4, 'Shreys', 'Iyyer', '1965/05/03', 8320850099, 'Crockett LA ', 'Mumbai', 'Maharastra'),
(5, 'Rishabh', 'Pant', '1969/07/23', 6355803655, 'Fred Scott Rd', 'Mumbai', 'Maharastra');



------------------ 2 ------------------
CREATE TABLE Product (
	product_id VARCHAR(255),
	product_name VARCHAR(255) NOT NULL,
	unit_price int
	CONSTRAINT PK_Product PRIMARY KEY (product_id)
);

INSERT INTO Product (product_id, product_name, unit_price)
VALUES
(01, 'Cricket Bat', 5999),
(02, 'Lether Ball', 1500),
(03, 'Tennus Ball', 100),
(04, 'Gloves', 850),
(05, 'Shoes', 6999);

------------------ 3 ------------------
CREATE TABLE Shipping (
	shipper_id VARCHAR(255) NOT NULL,
	shipper_name VARCHAR(255) NOT NULL,
	CONSTRAINT PK_Shipping PRIMARY KEY (shipper_id)
);

INSERT INTO Shipping (shipper_id, shipper_name)
VALUES
(11, 'Flash'),
(12, 'Tirupati'),
(13, 'Fastt'),
(14, 'Raftaar'),
(15, 'SpeedU');

------------------ 4 ------------------
CREATE TABLE Orders (
	order_id VARCHAR(255) NOT NULL,
	customer_id VARCHAR(255) NOT NULL FOREIGN KEY REFERENCES Customer(customer_id),
	order_date date NOT NULL,
	status VARCHAR(255) NOT NULL,
	comments VARCHAR(255) NOT NULL,
	shipped_date date NOT NULL,
	shipper_id VARCHAR(255) NOT NULL FOREIGN KEY REFERENCES Shipping(shipper_id)
);
ALTER TABLE Orders
ADD CONSTRAINT PK_Orders PRIMARY KEY (order_id);

INSERT INTO Orders (order_id, customer_id, order_date, status, comments, shipped_date, shipper_id)
VALUES
(21, 1, '2022/07/25', 'pending', 'not done', '2022/07/29', 11),
(22, 2, '2022/07/25', 'pending', 'when to arraive', '2022/07/30', 12),
(23, 1, '2022/07/26', 'inProgress', 'not done', '2022/07/29', 13),
(24, 1, '2022/07/22', 'shipped', 'great', '2022/07/24', 12),
(25, 1, '2022/07/27', 'inProgress', 'not done', '2022/07/31', 14);
UPDATE Orders
SET customer_id = 5
WHERE order_id = 25;
------------------ 5 ------------------
CREATE TABLE Order_items (
	order_item_id VARCHAR(255) NOT NULL,
	order_id VARCHAR(255) FOREIGN KEY REFERENCES Orders(order_id),
	product_id VARCHAR(255) FOREIGN KEY REFERENCES Product(product_id),
	quantity int NOT NULL,
	unit_price int NOT NULL
);
INSERT INTO Order_items
VALUES
(31, 21, 01, 5, 50),
(32, 22, 02, 2, 500),
(33, 23, 03, 5, 499),
(34, 21, 01, 50, 50),
(35, 25, 05, 9, 1000);