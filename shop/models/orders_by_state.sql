{{ config(materialized = 'view') }}

SELECT 
B.customer_state         AS `STATES`,
COUNT(B.customer_state)  AS `ORDERS BY STATE`

FROM `dbt-shop-382022.dbt_ecommerce.orders` A
INNER JOIN `dbt-shop-382022.dbt_ecommerce.customers` B
ON A.customer_id = B.customer_id
GROUP BY B.customer_state