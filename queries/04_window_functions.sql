-- 04_window_functions.sql
-- Funciones de ventana: rolling 2 ventas por producto y ranking

-- Ventas con ranking por fecha dentro de cada producto
SELECT p.sku, l.lot_code, s.sale_date, s.units,
       ROW_NUMBER() OVER (PARTITION BY p.sku ORDER BY s.sale_date) AS rn
FROM sale s
JOIN lot l ON l.lot_id = s.lot_id
JOIN product p ON p.product_id = l.product_id
ORDER BY p.sku, s.sale_date;

-- Rolling sum de unidades (ventana de 2 filas previas + actual) por producto
SELECT p.sku, s.sale_date, s.units,
       SUM(s.units) OVER (
         PARTITION BY p.sku
         ORDER BY s.sale_date
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS units_rolling3
FROM sale s
JOIN lot l ON l.lot_id = s.lot_id
JOIN product p ON p.product_id = l.product_id
ORDER BY p.sku, s.sale_date;
