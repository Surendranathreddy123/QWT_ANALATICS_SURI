{{config(materialized = 'incremental',unique_key=['orderid','lineno']) }}
 
 select
 od.*,
 o.orderdate
 from
{{source('raw_qwt','orderdetails')}} as od
inner join {{source('raw_qwt','orders')}} as o on o.orderid = od.orderid
 
{% if is_incremental() %}

where o.orderdate > (select max(o.orderdate) from {{this}} )
 
{% endif %}


