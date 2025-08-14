-- 01_basic_selects.sql
-- Selecciones básicas y agregaciones

-- Ver productos
SELECT * FROM product;

-- Ventas totales por día
SELECT sale_date, SUM(units) AS units_sold, ROUND(SUM(units*unit_price),2) AS revenue
FROM sale
GROUP BY sale_date
ORDER BY sale_date;

-- Inventario acumulado por lote (entradas - salidas - ajustes negativos)
SELECT l.lot_code,
       SUM(CASE WHEN mov_type='IN'  THEN qty
                WHEN mov_type='OUT' THEN -qty
                ELSE 0 END) AS stock_balance
FROM lot l
JOIN inventory_mov m ON m.lot_id = l.lot_id
GROUP BY l.lot_code
ORDER BY l.lot_code;
