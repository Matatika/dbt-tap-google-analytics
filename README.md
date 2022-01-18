<a href="https://github.com/Matatika/dbt-tap-google-analytics/blob/master/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/Matatika/dbt-tap-google-analytics"></a>![dbt logo and version](https://img.shields.io/static/v1?logo=dbt&label=dbt-version&message=[%3E=0.20.x;%3C=1.0.0]&color=orange)


# dbt-tap-google-analytics
This dbt package contains models for Matatika's [tap-google-analytics](https://github.com/Matatika/tap-google-analytics).

The main focus of the package is to transform and clean up the Google Analytics data into usable analytics models.

This package along with the [Analyze Bundle](https://github.com/Matatika/analyze-google-analytics) are designed intended to work together to provide instant insights on the [Matatika Platform](https://www.matatika.com).

| **model**              | **description** |
| ---------------------- | ------------------------------------------------------------- |
| [google_analytics_active_user_stats](models/base/google_analytics_active_user_stats.sql) | Active user stats for the day, week, two week, four week and monthly time frames. |
| [google_analytics_daily_active_users](models/base/google_analytics_daily_active_users.sql) | Daily total active users. |
| [google_analytics_devices](models/base/google_analytics_devices.sql) | Daily user stats by user devices. |
| [google_analytics_four_weekly_active_users](models/base/google_analytics_four_weekly_active_users.sql) | Four weekly total active users. |
| [google_analytics_locations](models/base/google_analytics_locations.sql) | Daily user stats by user location. |
| [google_analytics_monthly_active_users](models/base/google_analytics_monthly_active_users.sql) | Monthly total active users. |
| [google_analytics_monthly_comparison_stats](models/base/google_analytics_monthly_comparison_stats.sql) | Monthly user stats. |
| [google_analytics_pages](models/base/google_analytics_pages.sql) | Daily page stats. |
| [google_analytics_traffic_sources](models/base/google_analytics_traffic_sources.sql) | Daily traffic sources stats. |
| [google_analytics_two_weekly_active_users](models/base/google_analytics_two_weekly_active_users.sql) | Two weekly total active users. |
| [google_analytics_website_overview](models/base/google_analytics_website_overview.sql) | Daily website overview stats. |
| [google_analytics_weekly_active_users](models/base/google_analytics_weekly_active_users.sql) | Weekly total active users. |


## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

Include in your `packages.yml`
```yaml
packages:
  - package: Matatika/dbt-tap-google-analytics
    version: [">=0.1.0", "<1.0.0"]
```
or
```yaml
packages:
  - git: https://github.com/Matatika/dbt-tap-google-analytics.git
```

### One time setup (after creating a python virtual environment)

    ```
    pip install dbt
    dbt deps
    ```

### development

    ```
    dbt test
    ```

## Database Support
This package has been tested on Postgres and Snowflake.

## Cloud hosting and SaaS
Deploy on the Matatika Platform within minutes. [www.matatika.com](https://www.matatika.com)

## Contributions

Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

## Resources:
- Have questions, feedback, or need help? Please email us at support@matatika.com
- Find all of Matatika's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/Matatika/)
- Learn how to orchestrate [dbt transformations with Matatika](https://www.matatika.com/docs/getting-started/)
- Learn more about Matatika [in our docs](https://www.matatika.com/docs/introduction)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)

## Original Project

This dbt project was originally created by [Meltano](https://meltano.com/) and their repository for the project can be found on gitlab: [dbt-tap-google-analytics](https://gitlab.com/meltano/dbt-tap-google-analytics)

---

