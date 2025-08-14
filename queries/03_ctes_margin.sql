-- 03_ctes_margin.sql
-- CTE para calcular margen por lote y por producto

WITH revenue_by_lot AS (
  SELECT l.lot_id, l.lot_code, p.product_id,
         SUM(s.units*s.unit_price) AS revenue,
         SUM(s.units) AS units_sold
  FROM sale s
  JOIN lot l     ON l.lot_id = s.lot_id
  JOIN product p ON p.product_id = l.product_id
  GROUP BY l.lot_id, l.lot_code, p.product_id
),
cost_by_lot AS (
  SELECT lc.lot_id, lc.unit_cost,
         COALESCE((SELECT SUM(units) FROM sale WHERE lot_id = lc.lot_id),0) AS units_sold
  FROM lot_cost lc
)
SELECT p.sku, p.name, r.lot_code,
       ROUND(r.revenue,2) AS revenue,
       cb.unit_cost,
       r.units_sold,
       ROUND(r.revenue - (cb.unit_cost * r.units_sold),2) AS gross_margin
FROM revenue_by_lot r
JOIN cost_by_lot cb ON cb.lot_id = r.lot_id
JOIN product p ON p.product_id = r.product_id
ORDER BY gross_margin DESC;
