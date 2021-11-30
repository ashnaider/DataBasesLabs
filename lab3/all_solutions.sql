-- 1. По заданной (с помощью заголовка) работе получить список сообщений с указанием имен их авторов,
-- отсортированный в хронологическом порядке.

--- Показательные заголовки объявлений:
---     'Сверстать landing page для булочной'
---     'Создать кнопку + прогресс бар(нажал +10% нажал +20% нажал +50% и т.д)'

select  text_message,
		case
			when is_from_customer = True then customer.first_name || ' ' || customer.last_name
			when is_from_customer = False then fr.first_name || ' ' || fr.last_name
		end as author_name,
		header_, specialization

		from message_ mess
	inner join new_job on (mess.job_id = new_job.id
	                and new_job.header_ =  'Создать кнопку + прогресс бар(нажал +10% нажал +20% нажал +50% и т.д)'
                          )
	left join freelancer fr on mess.freelancer_id = fr.id
	left join customer on customer.id = mess.job_id
    order by mess.date_time ASC;



-- 10.  Получить информацию об объявлениях, по которым стоимость выполнения работы,
-- указанная заказчиком, отличается от стоимости выполнения работы, указанной фрилансером,
-- в меньшую сторону более чем на 10%.

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
    left join customer on customer.id = new_job.customer_id
    left join freelancer fr on fr.id = app.freelancer_id
	where (app.price::numeric / new_job.price::numeric > 1.1)
	order by new_job.price asc;