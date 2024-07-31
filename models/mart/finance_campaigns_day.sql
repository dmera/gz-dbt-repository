with
campaign_day as
(
select *
from {{ ref('int_campaigns_day') }}
)
,
finance_day as
(
select *
from {{ ref('finance_days') }}
)

select
date_date,
round(sum(operational_margin) - sum(ads_cost),2) as ads_margin,
round(sum(average_basket),2) as average_basket,
round(sum(operational_margin),2) as operational_margin,
sum(ads_cost) as ads_cost
from campaign_day
join finance_day
using(date_date)
group by date_date