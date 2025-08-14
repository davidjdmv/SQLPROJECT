-- cheatsheet.sql - Mini chuleta SQL

-- Filtrar y ordenar
SELECT * FROM sale
WHERE sale_date >= '2025-06-20'
ORDER BY sale_date DESC;

-- Agregar por día
SELECT sale_date, COUNT(*) n, SUM(units) units, ROUND(SUM(units*unit_price),2) revenue
FROM sale
GROUP BY sale_date
HAVING SUM(units) > 100;

-- JOIN básico
SELECT s.sale_id, p.sku, l.lot_code, s.units
FROM sale s
JOIN lot l ON l.lot_id = s.lot_id
JOIN product p ON p.product_id = l.product_id;

-- Subconsulta + CTE
WITH high_rev AS (
  SELECT sale_id FROM sale WHERE units*unit_price > 200
)
SELECT * FROM sale WHERE sale_id IN (SELECT sale_id FROM high_rev);

-- Ventana
SELECT s.*, 
       ROW_NUMBER() OVER (PARTITION BY l.lot_id ORDER BY s.sale_date) rn
FROM sale s
JOIN lot l ON l.lot_id = s.lot_id;
