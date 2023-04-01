SELECT 
A.order_id                      AS `ORDER ID`,
SUM(B.price)                    AS `TOTAL PRICE`,
SUM(B.freight_value)            AS `TOTAL FREIGHT`,
SUM(B.price + B.freight_value)  AS `TOTAL ORDER`

FROM `dbt-shop-382022.dbt_ecommerce.orders` AS `A`
INNER JOIN `dbt-shop-382022.dbt_ecommerce.order_itens` `B` 
ON A.order_id = B.order_id
GROUP BY A.order_id