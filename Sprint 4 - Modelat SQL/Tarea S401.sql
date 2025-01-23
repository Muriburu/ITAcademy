-- Nivel 1 --

/* Descàrrega els arxius CSV, estudia'ls i dissenya una base de dades amb un esquema d'estrella que contingui,
almenys 4 taules de les quals puguis realitzar les següents consultes: */

	-- Creo la nueva base de datos
CREATE DATABASE IF NOT EXISTS new_transactions; -- para no borrar la bbdd anterior y trabajar sobre una nueva
USE new_transactions;

	-- Creo las 5 tablas:

CREATE TABLE IF NOT EXISTS transactions(
	id VARCHAR(255) NOT NULL,		-- Cambiar nombre
    card_id VARCHAR(15),			-- Cambiar nombre
    business_id VARCHAR(20),		-- Cambiar nombre
    timestamp TIMESTAMP,
    amount DECIMAL(10,2),
    declined BOOLEAN,
    product_ids VARCHAR(100),
    user_id INT,
    lat FLOAT,						-- Cambiar nombre
    longitude FLOAT,
    PRIMARY KEY (id)				-- Falta añadir las FK
);

CREATE TABLE IF NOT EXISTS companies(
	company_id VARCHAR(15),
    company_name VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100),
    country VARCHAR(100),
    website VARCHAR(100),
    PRIMARY KEY (company_id)		-- Falta añadir las FK
);
CREATE TABLE IF NOT EXISTS credit_cards(
	id VARCHAR(20),
    user_id INT,
    iban VARCHAR(150),
    pan VARCHAR(100),
    pin VARCHAR(4),
    cvv VARCHAR(3),
    track1 VARCHAR(200),
    track2 VARCHAR(200),
    expiring_date VARCHAR(50),		-- convertir a date
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS products(
	id INT,
    product_name VARCHAR(100),
    price VARCHAR(10),				-- porque están guardados con el símbolo $ --> luego se tendrá que convertir a decimal
    colour VARCHAR(10),
    weight DECIMAL(10,2),
    warehouse_id VARCHAR(10),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS data_users(
	id INT,
    name VARCHAR(100),
    surname VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(150),
    birth_date VARCHAR(20),			-- convertir a date
    country VARCHAR(50),
    city VARCHAR(100),
    postal_code VARCHAR(10),
    address VARCHAR (150),
    PRIMARY KEY (id)
);


	-- Cargo los datos correspondientes en cada tabla
			-- Import records from an external file -- hecho
            
	-- Modificaciones
ALTER TABLE credit_cards
RENAME COLUMN id TO credit_card_id;
UPDATE credit_cards
SET expiring_date = STR_TO_DATE(expiring_date, '%m/%d/%y');
ALTER TABLE credit_cards
MODIFY COLUMN expiring_date DATE;

ALTER TABLE products
RENAME COLUMN id TO product_id;

ALTER TABLE data_users
RENAME COLUMN id TO user_id;
UPDATE data_users
SET birth_date = STR_TO_DATE(birth_date, '%b %d, %Y');
ALTER TABLE data_users
MODIFY COLUMN birth_date DATE;
    
ALTER TABLE transactions
RENAME COLUMN id TO transaction_id,
RENAME COLUMN business_id TO company_id,
RENAME COLUMN card_id TO credit_card_id,
RENAME COLUMN product_ids TO product_list;

	-- Añadir FKs --> relaciones 1 a n entre tablas
SET foreign_key_checks = 0;			-- Desactivar primero los fk-checks y volver a activarlos después de las modificaciones. Por defecto vienen ya activadas.
ALTER TABLE transactions
ADD CONSTRAINT fk_credit_cards_transactions
FOREIGN KEY (credit_card_id) REFERENCES credit_cards(credit_card_id),
ADD CONSTRAINT fk_companies_transactions
FOREIGN KEY (company_id) REFERENCES companies(company_id),
ADD CONSTRAINT fk_data_users_transactions
FOREIGN KEY (user_id) REFERENCES data_users(user_id);
SET foreign_key_checks = 1;

	-- Crear tabla intermedia trans_prod
CREATE TABLE trans_prod(
	transaction_id VARCHAR(255),
    product_id INT,
    PRIMARY KEY (transaction_id, product_id),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
    );
    
    -- Para poder rellenar esta tabla, es necesario descomponer la columna product_list (strings functions) y crear compinaciones únicas transaction_id - product_id
		-- Funciones SUBSTRING_INDEX(string, delimiter, number) y CHARACTER_LENGTH(string)
INSERT INTO trans_prod (transaction_id, product_id)
SELECT
    t.transaction_id,
    SUBSTRING_INDEX(SUBSTRING_INDEX(t.product_list, ',', n), ',', -1) AS product_id
FROM
    transactions AS t
JOIN
    (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) n  -- Máximo 4 productos en las listas, los concateno uno en cada fila
    ON CHARACTER_LENGTH(t.product_list) - CHARACTER_LENGTH(REPLACE(t.product_list, ',', '')) >= n - 1;	-- filtro que conecta cada conjunto n con el valor de la lista de productos
											-- índice de n = número de comas + 1. Así incluye una nueva fila por cada producto en la lista
    
    -- Eliminar símbolo $ de products.price y convertir datos a decimal(10,2)
UPDATE products
SET price = REPLACE(price, '$', '');
ALTER TABLE products
MODIFY price DECIMAL(10,2);


/* Ejercicio 1:
Realitza una subconsulta que mostri tots els usuaris amb més de 30 transaccions utilitzant almenys 2 taules. */
	SELECT t.user_id,
		(SELECT name
        FROM data_users AS du
        WHERE du.user_id = t.user_id) AS name,
        (SELECT surname
        FROM data_users AS du
        WHERE du.user_id = t.user_id) AS surname,
        COUNT(t.transaction_id) AS total_transactions
	FROM transactions AS t
    WHERE t.declined = 0
    GROUP BY t.user_id,
		(SELECT name
        FROM data_users AS du
        WHERE du.user_id = t.user_id),
        (SELECT surname
        FROM data_users AS du
        WHERE du.user_id = t.user_id)
    HAVING COUNT(t.transaction_id) > 30; -- 3 usuarios


/* Ejercicio 2:
Mostra la mitjana d'amount per IBAN de les targetes de crèdit a la companyia Donec Ltd, utilitza almenys 2 taules. */
		-- avg(t.amount)
        -- tablas transactions, credit_cards y companies
SELECT cc.iban, ROUND(AVG(t.amount),2) AS average_amount
FROM transactions AS t
JOIN credit_cards AS cc
ON t.credit_card_id = cc.credit_card_id
JOIN companies AS c
ON t.company_id = c.company_id
WHERE c.company_name = 'Donec Ltd' AND t.declined = 0
GROUP BY cc.iban;


-- Nivel 2 --

/* Crea una nova taula que reflecteixi l'estat de les targetes de crèdit basat en si les últimes tres transaccions van ser declinades i genera la següent consulta: */
		-- nueva tabla con 2 columnas. una de ellas ya existe en tabla cc, la otra es nueva y generada a partir de otras tablas --> CASE WHEN
        -- 3 transacciones rechazaadas: active = false = 0.
        -- ordenarlas por timestamp desc para tener las 3 últimas.
        -- con la función ventana determino solo esas 3 últimas (ordenadas time desc)
CREATE TABLE card_status(
	credit_card_id VARCHAR(20),
    active BOOLEAN,
    PRIMARY KEY (credit_card_id),
    FOREIGN KEY (credit_card_id) REFERENCES credit_cards(credit_card_id)
    );
    
INSERT INTO card_status(credit_card_id, active)
SELECT
    t2.credit_card_id,
    CASE
        WHEN SUM(t2.declined) = 3 THEN 0
        ELSE 1
    END AS status
FROM (
    SELECT
        credit_card_id,
        declined,
        ROW_NUMBER() OVER (PARTITION BY credit_card_id ORDER BY timestamp DESC) AS row_num	-- función ventana ROW_NUMBER
    FROM transactions
) t2
WHERE t2.row_num <= 3
GROUP BY t2.credit_card_id;
 
/* INSERT INTO card_status(credit_card_id, active)
	SELECT credit_card_id,
			(CASE 
				WHEN (CASE
						WHEN declined = 1 THEN 0
						ELSE 1
					END) >= 3 THEN True		-- tienen que sumar 3 transacciones aceptadas para ser activas
					ELSE False
				END) AS active
	FROM transactions
	ORDER BY timestamp DESC; */


/* Ejercicio 1:
Quantes targetes estan actives? */
SELECT COUNT(active) AS active_cards
FROM card_status
WHERE active = 1;	-- No hay 


-- Nivel 3 --

/* Crea una taula amb la qual puguem unir les dades del nou arxiu products.csv amb la base de dades creada, tenint en compte que des de transaction tens product_ids. Genera la següent consulta: */

/* Ejercicio 1:
Necessitem conèixer el nombre de vegades que s'ha venut cada producte. */
SELECT 
    p.product_name, 
    COUNT(tp.product_id) AS total_sales
FROM products AS p
JOIN trans_prod AS tp
ON p.product_id = tp.product_id
JOIN transactions AS t
ON tp.transaction_id = t.transaction_id
WHERE t.declined = 0
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;

