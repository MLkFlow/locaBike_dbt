WITH intermediate_data AS (
    SELECT * FROM {{ ref('int_orders_totals') }}
)

SELECT
    order_id,
    item_id,
    customer_id,
    product_id,
    store_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    quantity,
    price,
    discount,
    amount,
    discount_amount,
    net_amount
FROM intermediate_data
