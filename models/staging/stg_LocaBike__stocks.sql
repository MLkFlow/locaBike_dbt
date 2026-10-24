select
store_id,
product_id,
quantity
FROM {{ source('LocaBike','stocks') }}