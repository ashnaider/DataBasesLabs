--
-- 5. По каждому заказчику получить информацию о средней стоимости успешно выполненных для него работ.
--


select
    customer.first_name,
    customer.id,
    customer.organisation_name,
    avg_price
from customer
         right join (
    select avg(new_job.price::numeric)::money as avg_price, customer_id as cust_id
    from project_done
    left join new_job
        on project_done.job_id = new_job.id
    group by new_job.customer_id
) as avg_prices on customer.id = avg_prices.cust_id
;



--- Список заказчиков, их объявлений и фрилансеров, откликнувшихся на эти объявления
select
	customer.first_name as cust_name,
	customer.id as cust_id,
	new_job.id as job_id,
	substring(new_job.header_	, 0, 50) as job_description,
	new_job.price,
	new_job.posted,
	new_job.deadline,
	fr.first_name as freel_name,
	fr.id as freel_id,
	app.date_time as appl_posted,
	substring(app.description, 0, 50) as application_description
from new_job
left join customer on customer.id = new_job.customer_id
left join application as app on app.job_id = new_job.id
left join freelancer as fr on fr.id = app.freelancer_id
order by customer.id, job_id
;
