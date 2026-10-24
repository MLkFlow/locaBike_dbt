select
customer_id,
last_name,
city,
state,
zip_code
FROM {{ source('LocaBike', 'customers') }}
