-- 05_explain_indexes.sql
-- Índices y plan de ejecución en SQLite

EXPLAIN QUERY PLAN
SELECT p.sku, SUM(s.units) AS total_units
FROM sale s
JOIN lot l ON l.lot_id = s.lot_id
JOIN product p ON p.product_id = l.product_id
WHERE s.sale_date BETWEEN '2025-06-20' AND '2025-07-20'
GROUP BY p.sku;

-- Tip: observa el uso de los índices idx_sale_date y JOIN by primary keys.
