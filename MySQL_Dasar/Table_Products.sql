CREATE TABLE products(
	id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT price_check CHECK (price >= 1000),
    FULLTEXT products_search (name, description)
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

INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
	   ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
	   ('P0008', 'Minuman', 'Es Campur', 15000, 500),
	   ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
	   ('P0010', 'Lain-lain', 'Kerupuk', 2500, 1000),
	   ('P0011', 'Lain-lain', 'Kerupuk Udang', 10000, 300),
	   ('P0012', 'Lain-lain', 'Es Krim', 5000, 200),
	   ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
	   ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
	   ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);
       
SELECT * FROM products WHERE quantity > 100;

SELECT * FROM products WHERE quantity >= 100;

SELECT * FROM products WHERE category != 'Makanan';

SELECT * FROM products WHERE category <> 'Minuman';

SELECT id, name, price, quantity FROM products 
WHERE quantity > 100 AND price >10000;

SELECT * FROM products WHERE category = 'Makanan' AND price < 20000;

SELECT * FROM products WHERE quantity > 100 OR price > 20000;

SELECT * FROM products WHERE category = 'makanan' OR (quantity > 500 
AND price  > 20000);

SELECT * FROM products WHERE (category = 'makanan' OR quantity > 500 
)AND price  > 20000;

SELECT * FROM products WHERE name LIKE '%mie%';

SELECT * FROM products WHERE name LIKE '%bakso%';

SELECT * FROM products WHERE name LIKE '%usu%';

SELECT * FROM products WHERE description IS NULl;

SELECT * FROM products WHERE description IS NOT NULl;

SELECT * FROM products WHERE price BETWEEN 10000 AND 20000;

SELECT * FROM products WHERE price NOT BETWEEN 10000 AND 20000;

SELECT * FROM products WHERE category IN ('Makanan', 'Minuman');

SELECT * FROM products WHERE category NOT IN ('Makanan', 'Minuman');

SELECT id, category, name FROM products ORDER BY category;

SELECT id, category, name, price FROM products ORDER BY category ASC, price  DESC;

SELECT * FROM products WHERE price > 0
ORDER BY price LIMIT 2;

SELECT * FROM products ORDER BY id LIMIT 5;

SELECT * FROM products ORDER BY id LIMIT 0, 5;

SELECT * FROM products ORDER BY id LIMIT 5, 5;

SELECT * FROM products ORDER BY id LIMIT 10, 5;

SELECT category FROM products;

SELECT DISTINCT category FROM products;

SELECT 10, 'x', 10, 10 * 10 as 'Hasil';

SELECT id, name, price, price DIV 1000 AS 'Price in K' FROM products;


SELECT POWER (10, 2);

SELECT PI ();

SELECT id, COS(price), SIN(price), TAN(price) FROM products;

SELECT id, name, price FROM products
WHERE price DIV 1000 > 15;

SELECT id,
	LOWER(name) as 'Name Lower',
	Upper(name) as 'Name Upper',
    LENGTH(name) as 'Name Lenght'
FROM products;

SELECT id, create_at,
	   EXTRACT(YEAR FROM create_at) AS 'YEAR',
	   EXTRACT(MONTH FROM create_at) AS 'MONTH'
FROM products;

SELECT id, create_at, YEAR(create_at), MONTH(create_at)
FROM products;

SELECT id,
	   category,
	   CASE category
			WHEN 'Makanan' THEN 'Enak'
            WHEN 'Minuman' THEN 'Segar'
            ELSE 'Apa itu?'
            END AS 'CATEGORY'
FROM products;

SELECT id,
		price,
        IF (price <= 15000, 'Murah',
        IF(price <= 20000, 'Mahal', 'Mahal Banget')
        ) AS 'Mahal?'
FROM products;

SELECT id, name, IFNULL(description,'Kosong') FROM products;

SELECT COUNT(id) AS 'Total Product' FROM products;

SELECT MAX(price) AS 'Harga Termahal' FROM products;

SELECT Min(price) AS 'Harga Termurah' FROM products;

SELECT AVG(price) AS 'Rata-rata Harga' FROM products;

SELECT SUM(quantity) AS 'Total Stock' FROM products;

SELECT category,
COUNT(id) AS 'Total Product' 
FROM products GROUP BY category;

SELECT category, MAX(price) AS 'Harga Termahal'
FROM products GROUP BY category;

SELECT category, MIN(price) AS 'Harga Termurah'
FROM products GROUP BY category;

SELECT category, AVG(price) AS 'Rata-rata Harga' 
FROM products GROUP BY category;

SELECT category, SUM(quantity) AS 'Total Stock' 
FROM products GROUP BY category;

SELECT 
    category, COUNT(id) AS total
FROM
    products
GROUP BY category
HAVING total > 5;

SELECT * FROM products;

INSERT INTO products (id, name, category, price, quantity)
VALUES ('P0016', 'Permen', 'Lain-lain', 500, 1000);

UPDATE products
SET price = 1000
WHERE id = 'P0016';

ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000);

SHOW CREATE TABLE products;

INSERT INTO products (id, name, category, price, quantity)
VALUES ('P0017', 'Permen Lagi', 'Lain-lain', 500, 1000);

UPDATE products 
SET 
    price = 500
WHERE
    id = 'P0016';

ALTER TABLE products
DROP CONSTRAINT price_check;

ALTER TABLE products
ADD FULLTEXT products_search (name, description);

ALTER TABLE products
DROP INDEX products_search;

SHOW CREATE TABLE products;

SELECT * FROM products;

SELECT * FROM products WHERE name LIKE '%ayam%' OR description LIKE '%ayam%';

SELECT * FROM products
WHERE MATCH (name , description) AGAINST ('ayam' IN NATURAL LANGUAGE MODE);

SELECT * FROM products
WHERE MATCH (name , description) AGAINST ('+mie -bakso' IN BOOLEAN MODE);

SELECT * FROM products
WHERE MATCH (name , description) AGAINST ('bakso' WITH QUERY EXPANSION);