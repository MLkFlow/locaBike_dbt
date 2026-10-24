select
brand_id,
brand_name
FROM {{ source('LocaBike','brands') }}
