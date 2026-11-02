WITH orders AS (
  SELECT * FROM {{ ref('stg_LocaBike__orders') }}
),

items AS (
  SELECT * FROM {{ ref('stg_LocaBike__orders_items') }}
),

enriched_items AS (
  SELECT
    -- Clés et contexte de la commande
    o.order_id,
    o.customer_id,
    o.store_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,

    -- Détails spécifiques de l'article (conservation de la granularité)
    i.item_id,
    i.product_id,
    i.quantity,
    i.list_price AS price,
    i.discount,

    -- Calculs intermédiaires au niveau de l'article
    (i.quantity * i.list_price) AS amount,
    (i.quantity * i.list_price * i.discount) AS discount_amount,
    (i.quantity * i.list_price * (1 - i.discount)) AS net_amount

  FROM items i
  LEFT JOIN orders o ON i.order_id = o.order_id
)

SELECT * FROM enriched_items
