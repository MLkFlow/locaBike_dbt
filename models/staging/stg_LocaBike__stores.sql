select
store_id,
store_name,
city,
state
FROM {{ source('LocaBike','stores') }}

