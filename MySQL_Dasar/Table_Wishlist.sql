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