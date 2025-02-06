{{config(materialized = 'table')}}
 
select * from
{{source('raw_qwt','office')}}