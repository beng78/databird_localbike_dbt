{{ config(materialized = "table"  ) }}

/* generating dates using the macro from the dbt-utils package */
with 
    dates_raw as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2016-01-01' as date)",
        end_date="(SELECT CAST(FORMAT_DATE(\"%Y-12-31\" , MAX(order_date)) as DATE)  FROM " + ref('stg_erp_database__sale_order') | string  +  " )"
        )
    }}
)

/* extracting some date information  */
select            
    CAST(date_day as date) AS Date,
	EXTRACT(YEAR FROM date_day) AS Year,
	EXTRACT(WEEK FROM date_day) AS Week,
	EXTRACT(DAY FROM date_day) AS Day,
	FORMAT_DATE('%Q', date_day) as Quarter,
	EXTRACT(MONTH FROM date_day) AS Month,
	FORMAT_DATE('%B', date_day) as Month_Name,
	CAST(FORMAT_DATE('%u', date_day) AS INT64) AS Day_Of_Week,
	FORMAT_DATE('%A', date_day) AS Day_Of_Week_Name,
	IF(FORMAT_DATE('%A', date_day) IN ('Saturday', 'Sunday'), FALSE, TRUE) AS Is_Weekday,
	COUNT(date_day) OVER (PARTITION BY EXTRACT(YEAR FROM date_day), EXTRACT(MONTH FROM date_day)) AS Days_In_Month      
from dates_raw
    