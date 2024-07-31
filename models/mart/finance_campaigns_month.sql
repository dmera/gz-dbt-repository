with
finance_campaign_day as
(
select *
from {{ ref('finance_campaigns_day') }}
)

select
--month(date_date) as month_date,
DATE_TRUNC(date_date, month) as month_,
round(sum(ads_margin),2) as ads_margin,
round(sum(average_basket),2) as average_basket,
round(sum(operational_margin),2) as operational_margin,
round(sum(ads_cost),2) as ads_cost
from finance_campaign_day
group by DATE_TRUNC(date_date, month)