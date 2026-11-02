WITH products AS (
    SELECT * FROM {{ ref('stg_LocaBike__products') }}
),

brands AS (
    SELECT * FROM {{ ref('stg_LocaBike__brands') }}
),

categories AS (
    SELECT * FROM {{ ref('stg_LocaBike__categories') }}
),

final_product AS (
    SELECT
        p.product_id,
        p.brand_id,
        p.category_id,
        b.brand_name,
        p.product_name,
        c.category_name,
        p.model_year,
        p.list_price AS price
    FROM products p
    LEFT JOIN brands b ON p.brand_id = b.brand_id
    LEFT JOIN categories c ON p.category_id = c.category_id
)

SELECT * FROM final_product