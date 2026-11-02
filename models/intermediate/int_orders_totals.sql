WITH orders AS (
  SELECT * FROM {{ ref('stg_LocaBike__orders') }}
),

items AS (
  SELECT * FROM {{ ref('stg_LocaBike__orders_items') }}
),

orders_total AS (
  SELECT
    o.order_id,
    o.customer_id,
    o.store_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,
    -- mesures agrégées par commande
    SUM(i.quantity) AS total_items,
    SUM(i.quantity * i.list_price) AS total_amount,
    SUM(i.quantity * i.list_price * i.discount) AS total_discount_amount,
    SUM(i.quantity * i.list_price * (1 - i.discount)) AS total_net_amount
  FROM orders o
  LEFT JOIN items i ON o.order_id = i.order_id
  GROUP BY
    o.order_id,
    o.customer_id,
    o.store_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date
)

SELECT
  *
FROM orders_total