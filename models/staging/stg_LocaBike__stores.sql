select
store_id,
store_name,
city,
state,
email
FROM {{ source('LocaBike','stores') }}

