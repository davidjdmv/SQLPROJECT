-- 02_joins.sql
-- JOINs para combinar tablas

-- Ventas con detalle de producto y lote
SELECT s.sale_id, s.sale_date, p.sku, p.name, l.lot_code,
       s.units, s.unit_price, ROUND(s.units*s.unit_price,2) AS revenue
FROM sale s
JOIN lot l      ON l.lot_id = s.lot_id
JOIN product p  ON p.product_id = l.product_id
ORDER BY s.sale_date;

-- Ingresos por producto
SELECT p.sku, p.name, ROUND(SUM(s.units*s.unit_price),2) AS revenue
FROM sale s
JOIN lot l     ON l.lot_id = s.lot_id
JOIN product p ON p.product_id = l.product_id
GROUP BY p.sku, p.name
ORDER BY revenue DESC;
