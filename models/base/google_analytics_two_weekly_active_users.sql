with source as (

    select * from {{ source('google_analytics_source', 'two_weekly_active_users') }}

),

renamed as (

    select
        -- dimensions
        to_date(ga_date, 'YYYYMMDD') as report_date,

        substring(ga_date, 1, 4) as report_year,
        substring(ga_date, 5, 2) as report_month,
        substring(ga_date, 7, 2) as report_day,

        -- metrics
        ga_14day_users as two_weekly_active_users

    from source

)

select * from renamed
