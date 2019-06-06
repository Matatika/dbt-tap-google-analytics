with source as (

    select * from {{var('schema')}}.website_overview

),

renamed as (

    select
        -- dimensions
        ga_date as report_date,

        substring(ga_date from 1 for 4) as report_year,
        substring(ga_date from 5 for 2) as report_month,
        substring(ga_date from 7 for 2) as report_day,

        -- metrics
        ga_users as users,
        ga_new_users as new_users,

        ga_sessions as sessions,
        ga_sessions_per_user as sessions_per_user,
        ga_avg_session_duration as avg_session_duration,

        ga_pageviews as pageviews,
        ga_pageviews_per_session as pageviews_per_session,
        ga_avg_time_on_page as avg_time_on_page,

        ga_bounce_rate as bounce_rate,
        ga_exit_rate as exit_rate

    from source

)

select * from renamed
