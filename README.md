
```md
# MedTrace SQL 101 — Trazabilidad & Ventas (SQLite)

Proyecto educativo con **SQLite** para practicar SQL como Analista de Datos/BI:
- Modelo relacional (productos, lotes, inventario, ventas, costos).
- **Consultas**: SELECT/GROUP BY, **JOINs**, **CTE (WITH)** y **funciones de ventana**.
- KPIs: ingresos y **margen por lote**, ranking y acumulados.

```mermaid
erDiagram
  PRODUCT ||--o{ LOT : has
  LOT ||--o{ INVENTORY_MOV : records
  LOT ||--o{ SALE : sold_in
  LOT ||--|| LOT_COST : costed_by

  PRODUCT {
    int product_id PK
    text sku
    text name
  }

  LOT {
    int lot_id PK
    text lot_code
    int product_id FK
    date mfg_date
    date exp_date
  }

  INVENTORY_MOV {
    int mov_id PK
    int lot_id FK
    text mov_type "IN|OUT|ADJ"
    int qty
    date mov_date
    text note
  }

  SALE {
    int sale_id PK
    int lot_id FK
    text customer
    int units
    real unit_price
    date sale_date
  }

  LOT_COST {
    int lot_id PK, FK
    real unit_cost
  }
