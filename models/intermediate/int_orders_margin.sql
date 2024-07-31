with
sales_margin_int as
(
select *
from {{ ref('int_sales_margin') }}
)

select
orders_id,
date_date,
round(sum(revenue),2) as revenue_total,
round(sum(quantity),2) as qty_total,
round(sum(cast(revenue as FLOAT64) - cast(quantity as INT64) * cast(purchase_price as FLOAT64)),2) as margin,
round(sum(cast(quantity as INT64) * cast(purchase_price as FLOAT64)),2) as purchase_cost
from sales_margin_int
group by orders_id, date_date
