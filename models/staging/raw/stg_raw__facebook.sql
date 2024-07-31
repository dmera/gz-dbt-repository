with 

source as (

    select * from {{ source('raw', 'facebook') }}

),

renamed as (

    select
        date_date,
        case
        when paid_source = 'Facebook' then 'facebook'
        end as paid_source,
        campaign_key,
        campgn_name as campaign_name,
        cast(ads_cost as FLOAT64) as ads_cost,
        impression,
        click

    from source

)

select * from renamed
