with source as (

    select * from {{ source('google_analytics_source', 'traffic_sources') }}

),

renamed as (

    select
        -- dimensions
        to_date(ga_date, 'YYYYMMDD') as report_date,

        substring(ga_date, 1, 4) as report_year,
        substring(ga_date, 5, 2) as report_month,
        substring(ga_date, 7, 2) as report_day,

        ga_source as source,
        ga_medium as medium,
        ga_social_network as social_network,

        -- metrics
        ga_users as users,
        ga_new_users as new_users,

        ga_sessions as sessions,
        round(cast(ga_sessions_per_user as numeric), 2) as sessions_per_user,
        round(cast(ga_avg_session_duration as numeric), 2) as avg_session_duration,

        ga_pageviews as pageviews,
        round(cast(ga_pageviews_per_session as numeric), 2) as pageviews_per_session,
        round(cast(ga_avg_time_on_page as numeric), 2) as avg_time_on_page,

        round(cast(ga_bounce_rate as numeric), 2) as bounce_rate,
        round(cast(ga_exit_rate as numeric), 2) as exit_rate

    from source

)

select * from renamed
