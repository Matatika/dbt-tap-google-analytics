WITH monthly_stats AS (
     SELECT 
         report_year as year, 
         report_month as month,
         SUM(users) as users,
         SUM(new_users) as new_users,
         SUM(sessions) as sessions,
         round(AVG(bounce_rate), 2) as bounce_rate,
         round(AVG(avg_session_duration), 2) as avg_session_duration
 
     FROM {{ref('google_analytics_website_overview')}}

     GROUP BY report_year, report_month

     ORDER BY report_year ASC, report_month ASC
)

SELECT
    year, 
    month,
 
    users,
    round( (users / lag(users) 
        over (ORDER BY year, month)) * 100 - 100, 1) 
        as users_increase_percent,

    new_users,
    round( (new_users / lag(new_users) 
        over (ORDER BY year, month)) * 100 - 100, 1) 
        as new_users_increase_percent,
 
    sessions,
    round( (sessions / lag(sessions) 
        over (ORDER BY year, month)) * 100 - 100, 1) 
        as sessions_increase_percent,
 
    bounce_rate,
    round( (bounce_rate / lag(bounce_rate) 
        over (ORDER BY year, month)) * 100 - 100, 1) 
        as bounce_rate_increase_percent,
 
    avg_session_duration,
    round( (avg_session_duration / lag(avg_session_duration) 
        over (ORDER BY year, month)) * 100 - 100, 1) 
        as avg_session_duration_increase_percent

FROM monthly_stats