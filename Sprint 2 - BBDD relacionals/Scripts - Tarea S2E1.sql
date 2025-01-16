USE transactions;


-- NIVEL 1 --

-- Ejercicio 1: A partir dels documents adjunts (estructura_dades i dades_introduir), importa les dues taules. Mostra les característiques principals de l'esquema creat i explica les diferents taules i variables que existeixen. Assegura't d'incloure un diagrama que il·lustri la relació entre les diferents taules i variables.
	-- Comprobar total transacciones
SELECT 
    COUNT(*)
FROM
    transaction;-- 587 transactions

	-- Comprobar total empresas
SELECT 
    COUNT(*)
FROM
    company;-- 100 companies
    
    
-- Ejercicio 2: Utilitzant JOIN realitzaràs les següents consultes:

	-- Llistat dels països que estan fent compres.
		-- Países únicos: select distinct
        -- ambas tablas JOIN
		-- Están haciendo compras, no importa si son aceptadas o rechazadas: ambas.
SELECT DISTINCT
    c.country AS Countries
FROM
    transaction AS t
        JOIN
    company AS c ON c.id = t.company_id
ORDER BY c.country; -- LISTA de 15 países

	-- Des de quants països es realitzen les compres.
		-- Al igual que el anterior, países desde donde se realizan las compras, sean luego rechazadas o no.
SELECT 
    COUNT(DISTINCT c.country) AS Total
FROM
    company AS c
        RIGHT JOIN
    transaction AS t ON c.id = t.company_id
WHERE t.declined = 0
ORDER BY c.country; -- Total = 15

	-- Identifica la companyia amb la mitjana més gran de vendes.
SELECT 
    c.company_name AS Company, ROUND(AVG(t.amount),2) AS Average_Sales
FROM
    company AS c
        JOIN
    transaction AS t ON c.id = t.company_id
WHERE t.declined = 0
GROUP BY c.company_name
ORDER BY Average_Sales DESC
LIMIT 1; 
-- La empresa "Eget Ipsum Ltd" es la que mayor media de ventas tiene con un total de 481.86


-- Ejercicio 3. Usando subqueries:

	-- Mostra totes les transaccions realitzades per empreses d'Alemanya.
		-- Q: select * de t where ..
		-- SubQ: c.country in Germany --> La subQ en el where
SELECT 
    *
FROM
    transaction AS t
WHERE
    t.declined = 0
    AND t.company_id IN (SELECT 
            c.id
        FROM
            company AS c
        WHERE
            c.country = 'Germany'); -- 111 transacciones
    
    -- Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.
		-- Calcular la media de las transacciones
        -- Buscar los id de las empresas con ttransacciones mayor a las de la media
        -- Relacionar los id de las empresas con los company_name (DISTINCT!!)
SELECT DISTINCT
    c.company_name
FROM
    company AS c
WHERE
    c.id IN (SELECT 
            t.company_id
        FROM
            transaction AS t
        WHERE
            t.declined = 0
            AND t.amount > (SELECT 
                    AVG(t2.amount)
                FROM
                    transaction AS t2
				WHERE
					t2.declined = 0))
ORDER BY c.company_name; -- 49 empresas

SELECT DISTINCT
	t.company_id, (
				SELECT c.company_name
                FROM company AS c
                WHERE c.id = t.company_id
                ) AS company_name
FROM
	transaction AS t
WHERE
	declined = 0
	AND amount > (
				SELECT 
						AVG(amount)
                FROM
                    transaction
				WHERE declined = 0)
ORDER BY company_id; -- 49 empresas

    -- Cálculo de la media de transacciones aceptadas.
    SELECT 
			ROUND(AVG(amount),2)
	FROM
			transaction
	WHERE declined = 0; -- 259.01
    
    
    -- Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.
		-- Empresas que no tienen ventas: aquellas que están en la tabla company pero NO ESTÁn en la tabla transaction
        -- Mostrar en company id y company_name (o todas las columnas)
        -- SubQ en WHERE: c.id NOT IN t.company_id
SELECT *
FROM company AS c
WHERE c.id NOT IN (
	SELECT t.company_id
    FROM transaction AS t
    WHERE t.declined = 0);		-- 0 rows

			-- Alternativa con Not exists
SELECT *
FROM company AS c
WHERE NOT EXISTS (
	SELECT t.company_id
	FROM transaction AS t
	WHERE t.company_id = c.id
	  AND t.declined = 0
);					-- 0 rows
 

			-- Compruebo:
SELECT DISTINCT c.id, c.company_name
FROM company AS c
LEFT JOIN transaction AS t
  ON c.id = t.company_id
WHERE t.declined = 1; -- 87 empresas con transacciones rechazadas

SELECT c.*
FROM company AS c
LEFT JOIN transaction AS t
  ON c.id = t.company_id 
WHERE t.company_id IS NULL AND t.declined = 0;


    
-- NIVEL 2

-- Ejercicio 1: Identifica els cinc dies que es va generar la quantitat més gran d'ingressos a l'empresa per vendes. Mostra la data de cada transacció juntament amb el total de les vendes.
		-- Mostrar: t.timestamp + sum(t.amount) --> agrupar las sumas en función del día (group by)
        -- Solo tabla transactions
        -- ojo columna timestamp! contiene días y horas, sólo queremos tomar los días!
        -- declined = 0 (solo transfers aprobadas)
        -- ordenar sumas en DESC
        -- limit 5
					SELECT *
					FROM transaction
					ORDER BY timestamp DESC;

SELECT 
    DATE(timestamp) AS transaction_date,
    SUM(amount) AS total_amount
FROM
    transaction
WHERE declined = 0
GROUP BY transaction_date
ORDER BY total_amount DESC
LIMIT 5;

-- Ejercicio 2: Quina és la mitjana de vendes per país? Presenta els resultats ordenats de major a menor mitjà.
		-- Mostrar c.country + AVG(t.amount) --> agrupar por país
        -- Ambas tablas --> JOIN
        -- ordenar avg desc
        -- No hay top, todos los resultados
SELECT 
    c.country, ROUND(AVG(t.amount),2) AS average_transactions
FROM
    transaction AS t
        JOIN
    company AS c ON c.id = t.company_id
WHERE declined = 0
GROUP BY Country
ORDER BY average_transactions DESC;

-- Ejercicio 3: En la teva empresa, es planteja un nou projecte per a llançar algunes campanyes publicitàries per a fer competència a la companyia "Non Institute". Per a això, et demanen la llista de totes les transaccions realitzades per empreses que estan situades en el mateix país que aquesta companyia.

	-- Mostra el llistat aplicant JOIN i subconsultes.
		-- company_name = "Non Institute" --> buscar país correspondiente
        -- Mostrar: t.id, c.country, c.company_name
        -- JOIN c + t
        -- SubQ en el filtro
        -- entendiendo como transacciones realizadas TODAS las de la tabla (aceptadas y rechazadas)
            
            -- Excluyendo Non Institute
SELECT 
    c.country, c.company_name, t.id AS transaction_id, t.amount
FROM
    transaction AS t
        JOIN
    company AS c ON t.company_id = c.id
WHERE
    t.declined = 0
        AND c.country = (SELECT 
            c.country
        FROM
            company AS c
        WHERE
            c.company_name = 'Non Institute')
	AND c.company_name != 'Non Institute'
ORDER BY c.company_name;

	-- Mostra el llistat aplicant solament subconsultes.
		-- Q: mostrar t.id, c.country, c.company_name
        -- subQ: en select para filtrar país
        -- SubQ 2: en el from para filtrar país?
	-- Excluyendo NI
SELECT 
    t.id AS transaction_id,
    t.amount,
    (SELECT c.country
        FROM company AS c
        WHERE c.id = t.company_id) AS country,
	(SELECT c.company_name
		FROM company AS c
        WHERE c.id = t.company_id) AS company_name
FROM
    transaction t
WHERE
    t.declined = 0
        AND t.company_id IN (SELECT 
            c.id
        FROM
            company c
        WHERE
            c.country = (SELECT country
                FROM company
                WHERE company_name = 'Non Institute')
			AND c.company_name != 'Non Institute')
ORDER BY (SELECT c.company_name
		FROM company AS c
        WHERE c.id = t.company_id);
        

        
-- Nivel 3

-- Ejercicio 1: Presenta el nom, telèfon, país, data i amount, d'aquelles empreses que van realitzar transaccions amb un valor comprès entre 100 i 200 euros i en alguna d'aquestes dates: 29 d'abril del 2021, 20 de juliol del 2021 i 13 de març del 2022. Ordena els resultats de major a menor quantitat.
		-- Mostrar: c.company_name, c.phone, c.country, t.timestamp en formato "%Y-%m-%d", t.amount
        -- JOIN t + c
        -- Filtro: t.amount between 100 and 200, y t.timestamp in ('2021-04-29', '2021-07-20', '2022-03-13')

SELECT 
    c.company_name,
    c.phone,
    c.country,
    DATE(t.timestamp) AS transaction_date, 
    t.amount
FROM
    transaction AS t
JOIN
    company AS c ON t.company_id = c.id
WHERE
    t.declined = 0
    AND t.amount BETWEEN 100 AND 200
    AND DATE(t.timestamp) IN ('2021-04-29', '2021-07-20', '2022-03-13')
ORDER BY t.amount DESC;

    
	/* SELECT STR_TO_DATE(timestamp, '%Y-%m-%d') AS Date, t.amount
    FROM transaction AS t
    JOIN company AS c
    ON t.company_id = c.id
    ORDER BY t.amount desc, Date; */
    

-- Ejercicio 2: Necessitem optimitzar l'assignació dels recursos i dependrà de la capacitat operativa que es requereixi, per la qual cosa et demanen la informació sobre la quantitat de transaccions que realitzen les empreses, però el departament de recursos humans és exigent i vol un llistat de les empreses on especifiquis si tenen més de 4 transaccions o menys.
		-- Mostrar: c.id, c.company_name, sum(t.id) AS Total, "nueva columna"
        -- Crear nueva columna "Transaction state": '>4' o '<4' --> CASE
        -- JOIN c + t
        -- Agrupar sum(t.id) en función del t.company_id
SELECT 
    c.id,
    c.company_name,
    COUNT(t.id) AS 'transaction_count',
    CASE
        WHEN COUNT(t.id) > 4 THEN 'Greater than 4'
        WHEN COUNT(t.id) = 4 THEN 'Equal to 4'
        ELSE 'Lower than 4'
    END AS 'transaction_state'
FROM
    transaction AS t
        JOIN
    company AS c ON t.company_id = c.id
WHERE t.declined = 0
GROUP BY c.id , c.company_name
ORDER BY COUNT(t.id) desc;
 -- 100 resultados. 7 son mayores de 4 y el resto son menores.
