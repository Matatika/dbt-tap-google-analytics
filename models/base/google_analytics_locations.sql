with source as (

    select * from {{var('schema')}}.locations

),

renamed as (

    select
        -- dimensions
        to_date(ga_date, 'YYYYMMDD') as report_date,

        substring(ga_date, 1, 4) as report_year,
        substring(ga_date, 5, 2) as report_month,
        substring(ga_date, 7, 2) as report_day,

        ga_continent as continent,
        ga_sub_continent as sub_continent,
        ga_country as country,
        ga_region as region,
        ga_metro as metro,
        ga_city as city,

        -- metrics
        ga_users as users,
        ga_new_users as new_users,

        ga_sessions as sessions,
        round(ga_sessions_per_user, 2) as sessions_per_user,
        round(ga_avg_session_duration, 2) as avg_session_duration,

        ga_pageviews as pageviews,
        round(ga_pageviews_per_session, 2) as pageviews_per_session,
        round(ga_avg_time_on_page, 2) as avg_time_on_page,

        round(ga_bounce_rate, 2) as bounce_rate,
        round(ga_exit_rate, 2) as exit_rate

    from source

)

select * from renamed
