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