with source as (

    select * from {{var('schema')}}.website_overview

),

renamed as (

    select
        -- dimensions
        ga_date::date as report_date,

        substring(ga_date from 1 for 4) as report_year,
        substring(ga_date from 5 for 2) as report_month,
        substring(ga_date from 7 for 2) as report_day,

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
