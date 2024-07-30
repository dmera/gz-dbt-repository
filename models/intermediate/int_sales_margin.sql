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
*
from product
join sales
using(products_id)
