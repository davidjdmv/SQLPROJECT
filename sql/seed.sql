/* Productos */
INSERT INTO product (product_id, sku, name) VALUES
(1, 'ELB-S', 'Elastic Band - Small'),
(2, 'ELB-M', 'Elastic Band - Medium'),
(3, 'ELB-L', 'Elastic Band - Large');

/* Lotes */
INSERT INTO lot (lot_id, lot_code, product_id, mfg_date, exp_date) VALUES
(1, 'L001', 1, '2025-06-01', '2027-06-01'),
(2, 'L002', 2, '2025-06-10', '2027-06-10'),
(3, 'L003', 3, '2025-06-15', '2027-06-15'),
(4, 'L004', 1, '2025-07-01', '2027-07-01');

/* Costos por lote (unitarios) */
INSERT INTO lot_cost (lot_id, unit_cost) VALUES
(1, 0.45),
(2, 0.55),
(3, 0.70),
(4, 0.48);

/* Movimientos de inventario (IN = producción, OUT = consumo/ajuste) */
INSERT INTO inventory_mov (mov_id, lot_id, mov_type, qty, mov_date, note) VALUES
(1, 1, 'IN',  1000, '2025-06-05', 'Producción inicial L001'),
(2, 2, 'IN',  800,  '2025-06-12', 'Producción inicial L002'),
(3, 3, 'IN',  600,  '2025-06-18', 'Producción inicial L003'),
(4, 1, 'OUT', 50,   '2025-06-20', 'Ajuste calidad'),
(5, 4, 'IN',  1200, '2025-07-05', 'Producción inicial L004');

/* Ventas */
INSERT INTO sale (sale_id, lot_id, customer, units, unit_price, sale_date) VALUES
(1, 1, 'Clinica Norte',   200, 1.20, '2025-06-21'),
(2, 1, 'Hospital Centro', 150, 1.25, '2025-06-25'),
(3, 2, 'IPS Salud',       300, 1.40, '2025-06-26'),
(4, 3, 'Clínica Sur',     180, 1.60, '2025-06-30'),
(5, 4, 'Hospital Centro', 220, 1.22, '2025-07-10'),
(6, 2, 'Distribuidor X',  250, 1.38, '2025-07-12'),
(7, 4, 'IPS Salud',       400, 1.18, '2025-07-15');
