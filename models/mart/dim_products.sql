WITH product AS (
  SELECT
  product_id,
  product_name,
  brand_name,
  category_name,
  model_year,
  price
  FROM {{ ref('int_products') }}
)
SELECT *
FROM product