


{{ config(materialized='table') }}

select * from ANALYTICS.RAW_DEV.orders
