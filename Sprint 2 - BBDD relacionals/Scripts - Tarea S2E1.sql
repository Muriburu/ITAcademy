USE transactions;

-- NIVEL 1

-- Ejercicio 1

SELECT 
    COUNT(*)
FROM
    transaction;-- 587 transactions

SELECT 
    COUNT(*)
FROM
    company; -- 100 companies
    
    
-- Ejercicio 2. Usando JOIN:

	-- Llistat dels països que estan fent compres
SELECT DISTINCT c.country AS Countries
FROM company AS c
JOIN transaction AS t
ON c.id = t.company_id
ORDER BY c.country; -- LISTA

	-- Des de quants països es realitzen les compres.
SELECT COUNT(DISTINCT c.country) AS Total
FROM company AS c
JOIN transaction AS t
ON c.id = t.company_id
ORDER BY c.country; -- Total = 15

	-- Identifica la companyia amb la mitjana més gran de vendes.
		-- 1º ordenar las empresas según ventas, de mayor a menor
		-- 2º buscar el nombre de la empresa con más ventas
SELECT c.company_name AS Company, AVG(t.amount) AS Average_Sales
FROM company AS c
JOIN transaction AS t
ON c.id = t.company_id
GROUP BY c.company_name
ORDER BY Average_Sales desc
LIMIT 1; -- La empresa "Eget Ipsum Ltd" es la que mayor media de ventas tiene con un total de 473.075


-- Ejercicio 3. Usando subqueries:

	-- Mostra totes les transaccions realitzades per empreses d'Alemanya.
		-- Q: select * de t where ..
		-- SubQ: c.country in Germany --> La subQ en el where
SELECT *
FROM transaction AS t
WHERE t.company_id IN (
	SELECT c.id	-- SubQ
    FROM company as c
    WHERE c.country = "Germany"
); -- 118 transacciones
    
    -- Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.
		-- Calcular la media de las transacciones
        -- Buscar los id de las empresas con ttransacciones mayor a las de la media
        -- Relacionar los id de las empresas con los company_name (DISTINCT!!)
SELECT DISTINCT c.company_name	-- Q principal
FROM company AS c
WHERE c.id IN (
    SELECT t.company_id			-- SubQ 1
    FROM transaction AS t
    WHERE t.amount > (
		SELECT AVG(t2.amount) 	-- SubQ 2 -- Ver si hay alguna forma de hacerlo sin esta subQ
        FROM transaction AS t2)
)
ORDER BY c.company_name; -- 70 empresas
    
    -- Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.
		-- Empresas que no tienen ventas: aquellas que están en la tabla company pero NO ESTÁn en la tabla transaction
        -- Mostrar en company id y company_name (o todas las columnas)
        -- SubQ en WHERE: c.id NOT IN t.company_id
SELECT *
FROM company AS c
WHERE c.id NOT IN (
	SELECT t.company_id
    FROM transaction AS t);		-- sin resultados
			-- Compruebo:
            SELECT DISTINCT company_id
			FROM transaction; -- 100 resultados. Todas las empresas tienen transacciones.