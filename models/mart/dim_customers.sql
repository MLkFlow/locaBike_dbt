WITH customers AS (
  SELECT
    customer_id,
    last_name,
    city_customers AS city,
    zip_code
  FROM {{ ref('stg_LocaBike__customers') }}
)
SELECT
  customer_id,
  last_name,
  city,
  zip_code
FROM customers