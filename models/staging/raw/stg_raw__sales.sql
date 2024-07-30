with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id as product_id,
        concatinate(orders_id, "-",product_id) as key,
        revenue,
        quantity

    from source

)

select * from renamed
