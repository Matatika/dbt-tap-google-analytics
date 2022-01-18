with source as (

    select * from {{ source('google_analytics_source', 'pages') }}

),

renamed as (

    select
        -- dimensions
        to_date(ga_date, 'YYYYMMDD') as report_date,

        substring(ga_date, 1, 4) as report_year,
        substring(ga_date, 5, 2) as report_month,
        substring(ga_date, 7, 2) as report_day,

        ga_hostname as hostname,
        ga_page_path as page_path,

        -- metrics
        ga_pageviews as pageviews,
        ga_unique_pageviews as unique_pageviews,

        round(ga_avg_time_on_page, 2) as avg_time_on_page,

        ga_entrances as entrances,
        round(ga_entrance_rate, 2) as entrance_rate,

        round(ga_bounce_rate, 2) as bounce_rate,
        
        ga_exits as exits,
        round(ga_exit_rate, 2) as exit_rate

    from source

)

select * from renamed
