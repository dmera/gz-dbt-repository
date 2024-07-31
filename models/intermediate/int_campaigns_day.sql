with
int_campaign as
(
select *
from {{ ref('int_campaigns') }}
)

select
date_date,
round(sum(ads_cost),2) as ads_cost,
round(sum(impression),2) as ads_impression,
round(sum(click),2) as ads_clicks
from int_campaign
group by date_date