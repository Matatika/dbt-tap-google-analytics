with source as (

    select * from {{var('schema')}}.pages

),

renamed as (

    select
        -- dimensions
        ga_date as report_date,

        substring(ga_date from 1 for 4) as report_year,
        substring(ga_date from 5 for 2) as report_month,
        substring(ga_date from 7 for 2) as report_day,

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
