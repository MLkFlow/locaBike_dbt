select
order_id,
customer_id,
CASE order_status
    WHEN 1 THEN 'En attente'
    WHEN 2 THEN 'En cours de traitement'
    WHEN 3 THEN 'Annulée'
    WHEN 4 THEN 'Terminée'
    ELSE 'Inconnu'
END AS order_status,
order_date,
required_date,
shipped_date,
store_id,
staff_id
FROM {{ source('LocaBike','orders') }}
