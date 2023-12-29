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

ALTER TABLE products
	ADD PRIMARY KEY (id);
    
DESC products;

SELECT * FROM products WHERE quantity = 100;

SELECT * FROM products WHERE price = 15000;

SELECT * FROM products WHERE id = 'P0001';

SELECT * FROM products WHERE name = 'Mie Ayam Bakso Original';

DESCRIBE products;

ALTER TABLE products
	ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-lain') 
    AFTER name;
    
SELECT * FROM products;

UPDATE products
SET category = 'Makanan'
WHERE id = "P0001";

UPDATE products
SET category = 'Makanan',
	description = 'Mie Ayam + Ceker'
WHERE id = "P0003";

UPDATE products
SET category = 'Makanan'
WHERE id = "P0002";

UPDATE products
SET category = 'Makanan',
	description = 'Mie Ayam Tanpa Kuah'
WHERE id = "P0005";

UPDATE products
SET price = price + 5000
WHERE id = "P0005";

DELETE FROM products
WHERE id = 'P0009';

SELECT  id AS 'Kode',
		name AS 'Nama',
        category AS 'Kategori',
        price AS 'Harga',
        quantity AS 'Stok'
FROM products;

SELECT  p.id AS 'Kode',
		p.name AS 'Nama',
        p.category AS 'Kategori',
        p.price AS 'Harga',
        p.quantity AS 'Stok'
FROM products AS p;