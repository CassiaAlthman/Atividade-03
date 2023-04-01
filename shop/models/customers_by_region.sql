{{ config(materialized = 'view') }}

SELECT 
SUM(`CUSTOMERS BY STATE`) AS `CUSTOMERS BY REGION`,
CASE
    WHEN STATES IN ('PR', 'SC', 'RS') THEN 'SUL'
    WHEN STATES IN ('SP', 'MG', 'RJ', 'ES') THEN 'SUDESTE'
    WHEN STATES IN ('MT', 'GO', 'MS', 'DF') THEN 'CENTRO-OESTE'
    WHEN STATES IN ('BA', 'PI', 'MA', 'CE', 'SE', 'AL', 'PE', 'PB', 'RN') THEN 'NORDESTE'
    WHEN STATES IN ('AM', 'PA', 'TO', 'AP', 'RR', 'RO', 'AC') THEN 'NORTE'
END AS `REGION`

FROM
    (
    SELECT 
    COUNT(customer_state) AS `CUSTOMERS BY STATE`,
    customer_state        AS `STATES` 
    FROM `dbt-shop-382022.dbt_ecommerce.customers`
    GROUP BY customer_state
)
GROUP BY REGION