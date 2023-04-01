
  
    

    create or replace table `dbt-shop-382022`.`dbt_cassia`.`orders_by_year`
    
    
    OPTIONS()
    as (
      

SELECT 
COUNT(order_approved_at)                            AS `ORDERS BY YEAR`,
SUBSTRING(CAST(order_approved_at AS string), 1, 4)  AS `YEAR`

FROM `dbt-shop-382022.dbt_ecommerce.orders`
GROUP BY SUBSTRING(CAST(order_approved_at AS string), 1, 4)
    );
  