with
orders_margin_int as
(
select *
from {{ ref('int_orders_margin') }}
),

ship as
(
select *
from {{ ref('stg_raw__ship') }}
)

select
orders_id,
--date_date,
round(cast(margin as FLOAT64) + cast(shipping_fee as FLOAT64) - cast(log_cost as FLOAT64) - cast(ship_cost as FLOAT64),2) as operational_margin
from orders_margin_int
join ship
using(orders_id)