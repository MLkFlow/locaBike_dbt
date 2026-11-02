WITH stocks AS (
    SELECT * FROM {{ ref('stg_LocaBike__stocks') }}
),

final AS (
    SELECT
        -- Clés étrangères pour joindre vos dimensions Marts
        store_id,
        product_id,

        -- Métrique de stock
        quantity AS stock_quantity
    FROM stocks
)

SELECT * FROM final