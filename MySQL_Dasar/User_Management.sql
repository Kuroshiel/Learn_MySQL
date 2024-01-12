# MEMBUAT & MENGHAPUS USER

CREATE USER 'eko'@'localhost' IDENTIFIED BY 'Kuroshiel123A!';
CREATE USER 'khannedy'@'%' IDENTIFIED BY 'Kuroshiel123A!';

DROP USER 'eko'@'localhost';
DROP USER 'khannedy'@'%';

# MENAMBAH / MENGHAPUS HAK AKSES KE USER

GRANT SELECT ON belajar_mysql.* TO 'eko'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'khannedy'@'%';

SHOW GRANTS FOR 'eko'@'localhost';
SHOW GRANTS FOR 'khannedy'@'%';

REVOKE SELECT ON belajar_mysql.* FROM 'eko'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* FROM 'khannedy'@'%';

# MENGUBAH PASSWORD UNTUk USER

SET PASSWORD FOR 'eko'@'localhost' = 'Kuroshiel123A!';
SET PASSWORD FOR 'khannedy'@'%' = 'Kuroshiel123A!';

INSERT INTO guestbook(email, title, content) VALUES ('contoh@gmail.com', 'Hello', 'Hello');

CREATE TABLE contoh (
	id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;