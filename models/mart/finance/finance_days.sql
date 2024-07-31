
with
orders_op_int as
(
select *
from {{ ref('int_orders_operational') }}
)

select
date_date,
count(orders_id) as nb_transactions,
round(sum(revenue_total),2) as revenue,
round(sum(revenue_total),2) / count(orders_id) as average_basket,
round(sum(margin),2) as margin,
round(sum(operational_margin),2) as operational_margin
from orders_op_int
group by date_date




{##
comment in Jinja
##}

{##
comment in Jinja
##}