{{config(materialized = 'table', schema = 'transforming_dev')}}
 
select
 
emp.empid,
emp.first_name,
emp.last_name,
emp.title,
emp.hiredate,
IFF(emp.extension = '-', 'NA', emp.extension) as extension,
emp.year_salary,
IFF(mgr.first_name is null, emp.first_name, mgr.first_name) as managername,
IFF(mgr.title is null, emp.title, mgr.title) as managertitle,
ofc.officeaddress,
ofc.officecity,
ofc.officecountry
 
from
 
{{ref('Stg_employee')}} as emp left join
 
{{ref('Stg_employee')}} as mgr on emp.reports_to = mgr.empid
 
left join {{ref('Stg_office')}} as ofc on emp.office = ofc.office