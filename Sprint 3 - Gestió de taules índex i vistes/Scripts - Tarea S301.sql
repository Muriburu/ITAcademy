 /* Tarea S3.01 - Gestió de taules, índex i vistes */
USE transactions;
 
 -- Nivel 1
 
 /* Ejercicio 1:
 La teva tasca és dissenyar i crear una taula anomenada "credit_card" que emmagatzemi detalls crucials 
 sobre les targetes de crèdit. La nova taula ha de ser capaç d'identificar de manera única cada targeta i 
 establir una relació adequada amb les altres dues taules ("transaction" i "company"). Després de crear la 
 taula serà necessari que ingressis la informació del document denominat "dades_introduir_credit". Recorda 
 mostrar el diagrama i realitzar una breu descripció d'aquest. */
	-- Tabla: credit_card 
		-- Campos: id (pk --> fk: t.credit_card_id), iban, pan, pin, cvv, expiring_date
        -- Se relaciona directamente con la tabla transaction pk-fk 1 a n
        -- Con la tabla company se relaciona a través de transaction

	-- Crear tabla "credit_card"
CREATE TABLE IF NOT EXISTS credit_card (
        id VARCHAR(20) NOT NULL,
        iban VARCHAR(50),
        pan VARCHAR(20),
        pin VARCHAR(4),
        cvv VARCHAR(3),
        expiring_date VARCHAR(20), -- DATE('%d/%m/%Y')
        PRIMARY KEY (id)       
    );
    -- Añadimos FK en tabla transaction
	-- Añadimos los datos: datos_introducir_credit.sql --> 275 filas
ALTER TABLE transaction
ADD FOREIGN KEY (credit_card_id) REFERENCES credit_card(id);

	-- Una vez cargados los datos, modifico el tipo de dato de expiring_date
UPDATE credit_card
SET expiring_date = STR_TO_DATE(expiring_date, '%m/%d/%y');
ALTER TABLE credit_card
MODIFY COLUMN expiring_date DATE;

-- Compruebo:
SELECT * FROM transactions.credit_card;


/* Ejercicio 2:
El departament de Recursos Humans ha identificat un error en el número de compte de l'usuari amb ID CcU-2938.
La informació que ha de mostrar-se per a aquest registre és: R323456312213576817699999.
Recorda mostrar que el canvi es va realitzar. */
	-- tabla credit card id = 'CcU-2938'
    -- update credit_card set iban = nuevovalor* where condición id = 'CcU...'
    
	-- Compruebo previamente si existe el registro:
SELECT *
FROM credit_card
WHERE id = 'CcU-2938'; -- Sí existe
    -- Actualizo el registro:
UPDATE credit_card
SET iban = 'R323456312213576817699999'
WHERE id = 'CcU-2938'; 
	-- Compruebo:
SELECT *
FROM credit_card
WHERE id = 'CcU-2938';
	-- El IBAN cambió de 'TR301950312213576817638661' a 'R323456312213576817699999'


/* Ejercicio 3:
En la taula "transaction" ingressa un nou usuari amb la següent informació:
		Id	108B1D1D-5B23-A76C-55EF-C568E49A99DD
		credit_card_id	CcU-9999
		company_id	b-9999
		user_id	9999
		lat	829.999
		longitude	-117.999
		amount	111.11
		declined	0	*/
	-- igual que en el documento "dades_introduir":
		-- INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, timestamp, amount, declined) VALUES ( *datos indicados* )
	-- Nota: En caso de obtener error código 1042 por "constraint", se deberían crear los registros correspondientes en las tablas company y credit_card, ya que están relacionadas por PK-FK.

	-- Registros antes de la adición:
SELECT COUNT(*)
FROM transaction; -- 587 registros
	-- Adición:
SET foreign_key_checks = 0;
INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, timestamp, amount, declined) VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', '9999', '829.999', '-117.999', '2021-04-19 21:33:41', '111.11', '0');
SET foreign_key_checks = 1;
    -- Compruebo:
SELECT COUNT(*)
FROM transaction; -- 588 registros

/* Ejercicio 4:
Des de recursos humans et sol·liciten eliminar la columna "pan" de la taula credit_*card.
Recorda mostrar el canvi realitzat. */

	-- Antes del cambio:
DESCRIBE credit_card; -- 6 filas de resultados corresponden a 6 columnas de la tabla
    -- Elimino columna pan:
ALTER TABLE credit_card
DROP COLUMN pan;
	-- Compruebo:
DESCRIBE credit_card; -- 5 filas, una columna menos
SELECT *
FROM credit_card; -- muestro la tabla entera



 -- Nivel 2
 
 /* Ejercicio 1:
Elimina de la taula transaction el registre amb ID 02C6201E-D90A-1859-B4EE-88D2986D3B02 de la base de dades. */

	-- Antes del cambio:
SELECT *
FROM transaction; -- 588 registros
SELECT *
FROM transaction
WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02'; -- compruebo que el registro existe
    -- Elimino el registro indicado
DELETE FROM transaction
WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02';
	-- Compruebo:
SELECT *
FROM transaction; -- 587 registros
SELECT *
FROM transaction
WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02'; -- 0 rows porque el registro ya no existe


/* Ejercicio 2:
La secció de màrqueting desitja tenir accés a informació específica per a realitzar anàlisi i estratègies efectives.
S'ha sol·licitat crear una vista que proporcioni detalls clau sobre les companyies i les seves transaccions.
Serà necessària que creïs una vista anomenada VistaMarketing que contingui la següent informació: Nom de la companyia.
Telèfon de contacte. País de residència. Mitjana de compra realitzat per cada companyia.
Presenta la vista creada, ordenant les dades de major a menor mitjana de compra. */
	-- Crear "VistaMarketing"
		-- company_name, phone, country, transaction_average (solo aceptadas)
CREATE VIEW VistaMarketing AS
SELECT c.company_name, c.phone, c.country, ROUND(AVG(t.amount), 2) AS transaction_average
FROM company AS c
JOIN transaction AS t
ON c.id = t.company_id
WHERE t.declined = 0
GROUP BY c.company_name, c.phone, c.country
ORDER BY transaction_average DESC;
	-- Compruebo:
SELECT * FROM transactions.vistamarketing;


/* Ejercicio 3:
Filtra la vista VistaMarketing per a mostrar només les companyies que tenen el seu país de residència en "Germany". */
SELECT *
FROM vistamarketing
WHERE country = 'Germany'; -- 8 empresas



 -- Nivel 3
 
 /* Ejercicio 1:
 La setmana vinent tindràs una nova reunió amb els gerents de màrqueting. Un company del teu equip 
 va realitzar modificacions en la base de dades, però no recorda com les va realitzar.
 Et demana que l'ajudis a deixar els comandos executats per a obtenir el següent diagrama: */
	-- cargar estructura_datos_user.sql
    -- cargar datos_introducir_user (1)
 -- consultar si se refiere a añadir tablas + reverse engineering
 
 
 /* Ejercicio 2:
 L'empresa també et sol·licita crear una vista anomenada "InformeTecnico" que contingui la següent informació:
	ID de la transacció
	Nom de l'usuari/ària
	Cognom de l'usuari/ària
	IBAN de la targeta de crèdit usada.
	Nom de la companyia de la transacció realitzada.
	Assegura't d'incloure informació rellevant de totes dues taules i utilitza àlies per a canviar de nom columnes segons sigui necessari.
Mostra els resultats de la vista, ordena els resultats de manera descendent en funció de la variable ID de transaction. */
	-- Crear "InformeTecnico"
		-- Solo con transacciones aceptadas:
			-- t.id, u.name, u.surname, cc.iban, c.company_name
CREATE VIEW InformeTecnico AS
SELECT t.id AS transaction_id, u.name AS user_name, u.surname AS user_surname, cc.iban, c.company_name
FROM transaction AS t
JOIN user AS u
ON u.id = t.user_id
JOIN company AS c
ON c.id = t.company_id
JOIN credit_card AS cc
ON cc.id = t.credit_card_id
WHERE t.declined = 0
ORDER BY transaction_id ASC;
	-- Compruebo:
SELECT * FROM transactions.informetecnico;