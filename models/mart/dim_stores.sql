WITH stores AS (
  SELECT
    store_id,
    store_name,
    email,
    city
  FROM {{ ref('stg_LocaBike__stores') }}
)
SELECT * FROM stores