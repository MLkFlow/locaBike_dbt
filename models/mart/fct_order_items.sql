WITH orders AS (
    SELECT * FROM {{ ref('stg_LocaBike__orders') }}
),

order_items AS (
    SELECT * FROM {{ ref('stg_LocaBike__orders_items') }}
),

final AS (
    SELECT
        --  Clé primaire
        oi.order_id,
        oi.item_id,

        --  Clés étrangères pour joindre avec marts
        o.customer_id,
        oi.product_id,
        o.store_id,

        --  dates
        o.order_status,
        o.order_date,
        o.required_date,
        o.shipped_date,

        --  métriques
        oi.quantity,
        oi.list_price AS price,
        oi.discount,

        --  métriques calculées
        (oi.quantity * oi.list_price) AS amount,
        (oi.quantity * oi.list_price * oi.discount) AS discount_amount,
        (oi.quantity * oi.list_price * (1 - oi.discount)) AS net_amount
    FROM order_items oi
    LEFT JOIN orders o ON oi.order_id = o.order_id
)

SELECT * FROM final