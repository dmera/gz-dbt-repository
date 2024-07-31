with
product as
(
select *
from {{ ref('stg_raw__product') }}
),

sales as
(
select *
from {{ ref('stg_raw__sales') }}
)

select
*,
round(cast(revenue as FLOAT64) - cast(quantity as INT64) * cast(purchase_price as FLOAT64),2) as margin,
round(cast(quantity as INT64) * cast(purchase_price as FLOAT64),2) as purchase_cost
from product
join sales
using(products_id)