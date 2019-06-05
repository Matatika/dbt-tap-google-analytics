WITH daily_active_users AS (

     SELECT 
        report_date,
        report_year,
        report_month,
        report_day,
        daily_active_users
     FROM {{ref('google_analytics_daily_active_users')}}

),

weekly_active_users AS (

     SELECT 
        report_date,
        weekly_active_users
     FROM {{ref('google_analytics_weekly_active_users')}}

),

monthly_active_users AS (

     SELECT 
        report_date,
        monthly_active_users
     FROM {{ref('google_analytics_monthly_active_users')}}

)

SELECT
    daily_active_users.report_date as report_date,
    daily_active_users.report_year as report_year,
    daily_active_users.report_month as report_month,
    daily_active_users.report_day as report_day,
    daily_active_users.daily_active_users as daily_active_users,
    weekly_active_users.weekly_active_users as weekly_active_users,
    monthly_active_users.monthly_active_users as monthly_active_users
FROM daily_active_users
  LEFT JOIN weekly_active_users  
    ON weekly_active_users.report_date = daily_active_users.report_date
  LEFT JOIN monthly_active_users  
    ON monthly_active_users.report_date = daily_active_users.report_date
