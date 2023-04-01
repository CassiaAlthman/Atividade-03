

SELECT
customer_id                AS `CUSTOMER ID`,
customer_unique_id         AS `CUSTOMER UNIQUE ID`,
customer_zip_code_prefix   AS `CUSTOMER ZIP CODE PREFIX`,
customer_city              AS `CUSTOMER CITY`,
customer_state             AS `CUSTOMER STATE`,
CASE
    WHEN customer_state IN ('PR', 'SC', 'RS') THEN 'SUL'
    WHEN customer_state IN ('SP', 'MG', 'RJ', 'ES') THEN 'SUDESTE'
    WHEN customer_state IN ('MT', 'GO', 'MS', 'DF') THEN 'CENTRO-OESTE'
    WHEN customer_state IN ('BA', 'PI', 'MA', 'CE', 'SE', 'AL', 'PE', 'PB', 'RN') THEN 'NORDESTE'
    WHEN customer_state IN ('AM', 'PA', 'TO', 'AP', 'RR', 'RO', 'AC') THEN 'NORTE'
END AS `REGION`

FROM `dbt-shop-382022.dbt_ecommerce.customers`