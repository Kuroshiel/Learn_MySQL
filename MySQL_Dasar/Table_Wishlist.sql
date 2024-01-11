CREATE TABLE wishlist (
    id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product)
        REFERENCES products (id)
)  ENGINE=INNODB;

DESCRIBE wishlist;

SHOW CREATE TABLE wishlist;

ALTER TABLE wishlist
	DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
	ADD CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products(id);
        
INSERT INTO wishlist(id_product, description)
VALUES ('P0001', 'Makanan Kesukaan');

INSERT INTO wishlist(id_product, description)
VALUES ('SALAH', 'Makanan Kesukaan');

SELECT * FROM wishlist;

DELETE FROM products
WHERE id = 'Pxxxx';

ALTER TABLE wishlist
	ADD CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products(id)
			ON DELETE CASCADE ON UPDATE CASCADE;
            
INSERT INTO wishlist(id_product, description)
VALUES ('Pxxxx', 'Makanan Kesukaan');

SELECT * FROM wishlist
JOIN products ON (wishlist.id_product = products.id);

SELECT products.id, products.name, wishlist.description
FROM wishlist
JOIN products ON (products.id = wishlist.id_product);

SELECT 
    w.id AS id_wishlist,
    p.id AS id_product,
    p.name AS product_name,
    w.description AS wishlist_description
FROM wishlist AS w
JOIN products AS p ON (p.id = w.id_product); 

DESC customers;

ALTER TABLE wishlist
	ADD COLUMN id_customer INT;
    
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer 
FOREIGN KEY (id_customer) REFERENCES customers (id);

SELECT * FROM customers;

UPDATE wishlist
SET id_customer = 1
WHERE id = 2;

SELECT customers.email, products.id, products.name, wishlist.description
FROM wishlist
JOIN products ON (products.id = wishlist.id_product)
JOIN customers ON (customers.id = wishlist.id_customer);

SELECT c.email, p.id, p.name, w.description
FROM wishlist AS w
JOIN products AS p ON (p.id = w.id_product)
JOIN customers AS c ON (c.id = w.id_customer);