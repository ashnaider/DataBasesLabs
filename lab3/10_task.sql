-- 10.  Получить информацию об объявлениях, по которым стоимость выполнения работы,
-- указанная заказчиком, отличается от стоимости выполнения работы, указанной фрилансером,
-- в меньшую сторону более чем на 10%.

--- Для начала выведём все заявки на выполнение
select new_job.id,
	   header_,
	   new_job.price as customer_price,
	   app.price as freelancer_price,
	   app.description,
	   fr.first_name as freelancer_name,
	   fr.specialization,
	   fr.id

    from new_job
	inner join application app on new_job.id = app.job_id
    left join customer on customer.id = new_job.customer_id
    left join freelancer fr on fr.id = app.freelancer_id
	order by new_job.price asc;


--- Получим только те, где цена исполнителя больше цены заказчика на 10% и более
select new_job.id,
	   header_,
	   new_job.price as customer_price,
	   app.price as freelancer_price,
	   app.description,
	   fr.first_name as freelancer_name,
	   fr.specialization,
	   fr.id

    from new_job
	inner join application app on new_job.id = app.job_id
    inner join customer on customer.id = new_job.customer_id
    inner join freelancer fr on fr.id = app.freelancer_id
	where (app.price::numeric / new_job.price::numeric > 1.1)
	order by new_job.price asc;



