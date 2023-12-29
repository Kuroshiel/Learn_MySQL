CREATE TABLE products(
	id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) Engine = InnoDB;

SHOW TABLES;

DESC products;

INSERT INTO products(id, name, price, quantity)
Values ('P0001', 'Mie Ayam Original', 15000,100);

SELECT * FROM products;

INSERT INTO products(id, name, description, price, quantity)
Values ('P0002', 'Mie Ayam Bakso Original', 'Mie Ayam Original + Bakso Tahu', 20000,100);

INSERT INTO products(id, name, price, quantity)
Values ('P0003', 'Mie Ayam Ceker', 20000,100),
	   ('P0004', 'Mie Ayam Spesial', 25000,100),
       ('P0005', 'Mie Ayam Yamin', 15000,100); 
       
SELECT * FROM products;

SELECT id, name, price, quantity FROM products;