

  create or replace view `dbt-shop-382022`.`dbt_cassia`.`items_costs`
  OPTIONS()
  as SELECT 
product_id  AS `PRODUCT ID`, 
price       AS `PRICE`

FROM `dbt-shop-382022.dbt_ecommerce.order_itens` 
GROUP BY product_id, price;

