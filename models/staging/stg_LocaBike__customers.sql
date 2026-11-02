select
customer_id,
last_name,
city AS city_customers,
state,
zip_code
FROM {{ source('LocaBike', 'customers') }}
