SELECT
category_id,
category_name
FROM {{ source('LocaBike','categories') }}
