PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS product (
  product_id INTEGER PRIMARY KEY,
  sku TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS lot (
  lot_id INTEGER PRIMARY KEY,
  lot_code TEXT NOT NULL UNIQUE,
  product_id INTEGER NOT NULL REFERENCES product(product_id),
  mfg_date DATE NOT NULL,
  exp_date DATE
);

CREATE TABLE IF NOT EXISTS inventory_mov (
  mov_id INTEGER PRIMARY KEY,
  lot_id INTEGER NOT NULL REFERENCES lot(lot_id),
  mov_type TEXT NOT NULL CHECK (mov_type IN ('IN','OUT','ADJ')),
  qty INTEGER NOT NULL,
  mov_date DATE NOT NULL,
  note TEXT
);

CREATE TABLE IF NOT EXISTS sale (
  sale_id INTEGER PRIMARY KEY,
  lot_id INTEGER NOT NULL REFERENCES lot(lot_id),
  customer TEXT NOT NULL,
  units INTEGER NOT NULL,
  unit_price REAL NOT NULL,
  sale_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS lot_cost (
  lot_id INTEGER PRIMARY KEY REFERENCES lot(lot_id),
  unit_cost REAL NOT NULL
);

/* Índices útiles */
CREATE INDEX IF NOT EXISTS idx_lot_code ON lot(lot_code);
CREATE INDEX IF NOT EXISTS idx_sale_date ON sale(sale_date);
CREATE INDEX IF NOT EXISTS idx_mov_date ON inventory_mov(mov_date);
