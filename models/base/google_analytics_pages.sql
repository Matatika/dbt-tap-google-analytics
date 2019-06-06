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

        ga_avg_time_on_page as avg_time_on_page,

        ga_entrances as entrances,
        ga_entrance_rate as entrance_rate,

        ga_bounce_rate as bounce_rate,
        
        ga_exits as exits,
        ga_exit_rate as exit_rate

    from source

)

select * from renamed
