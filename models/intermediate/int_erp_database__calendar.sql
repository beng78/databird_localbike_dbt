{{ config(materialized='table') }}

WITH parameters AS (
	SELECT CAST(FORMAT_DATE("%Y-01-01" , MIN(order_date)) as DATE) as start_date, 
		   CAST(FORMAT_DATE("%Y-12-31" , MAX(order_date)) as DATE) as finish_date
	FROM  {{ ref('stg_erp_database__sale_order')}}
)
SELECT
	Date,
	EXTRACT(YEAR FROM Date) AS Year,
	EXTRACT(WEEK FROM Date) AS Week,
	EXTRACT(DAY FROM Date) AS Day,
	FORMAT_DATE('%Q', Date) as Quarter,
	EXTRACT(MONTH FROM Date) AS Month,
	FORMAT_DATE('%B', Date) as Month_Name,
	CAST(FORMAT_DATE('%u', Date) AS INT64) AS Day_Of_Week,
	FORMAT_DATE('%A', Date) AS Day_Of_Week_Name,
	IF(FORMAT_DATE('%A', Date) IN ('Saturday', 'Sunday'), FALSE, TRUE) AS Is_Weekday,
	COUNT(Date) OVER (PARTITION BY EXTRACT(YEAR FROM Date), EXTRACT(MONTH FROM Date)) AS Days_In_Month
FROM parameters, 
UNNEST(  
  GENERATE_DATE_ARRAY(start_date, finish_date, INTERVAL 1 DAY)
  ) AS Date