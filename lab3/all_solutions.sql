-- 1. По заданной (с помощью заголовка) работе получить список сообщений с указанием имен их авторов,
-- отсортированный в хронологическом порядке.

--- Показательные заголовки объявлений:
---     'Сверстать landing page для булочной'
---     'Создать кнопку + прогресс бар(нажал +10% нажал +20% нажал +50% и т.д)'

select  text_message,
		case
			when is_from_customer = True then customer.first_name
			when is_from_customer = False then fr.first_name
		end as author_name,
		header_, specialization

		from message_ mess
	inner join new_job on (mess.job_id = new_job.id and new_job.header_ = 'Создать кнопку + прогресс бар(нажал +10% нажал +20% нажал +50% и т.д)')
	inner join freelancer fr on mess.freelancer_id = fr.id
	inner join customer on customer.id = new_job.customer_id
    order by mess.date_time ASC;




-- 2. Получить информацию о жалобах определенного типа,
-- поступивших от конкретного заказчика за последнюю неделю.

create or replace function MY_CURR_DATE () returns date
as $$
    begin
        return '2023-01-08 23:59:59-00'::date;
    end;
$$ language plpgsql;


select
    cust.first_name || ' ' || cust.last_name,
    cust.id,
    cust.email,
    uc.is_from_customer,
    uc.complaint_type,
    uc.date_time,
    uc.description
from customer as cust
left join user_complaint uc on cust.id = uc.customer_id
where age(MY_CURR_DATE(), uc.date_time) < '7 day'::interval
    and MY_CURR_DATE() > uc.date_time
    and uc.is_from_customer = true
    and uc.complaint_type in (
                              'spam',
--                               'fraud',
                             'inappropriate_content'
                             )
order by customer_id
;




--
-- 3. Получить информацию о фрилансерах (расположив их имена в алфавитном порядке),
-- которые владеют двумя указанными (по усмотрению студента) технологиями и успешно выполнили от 3 до 10 работ.

select
fr.id,
fr.first_name || ' ' || fr.last_name as full_name,
fr.specialization,
fr.email,
tech.tech_name as first_tech,
tech_2.tech_name as second_tech

from freelancer as fr

inner join technology_stack as t_st_l on fr.id = t_st_l.freelancer_id

inner join technology_stack as t_st_r on fr.id = t_st_r.freelancer_id

inner join technology as tech on t_st_l.technology_id = tech.id

inner join technology as tech_2 on t_st_r.technology_id = tech_2.id

inner join project_done as pd on fr.id = pd.freelancer_id

where tech.tech_name = 'HTML' and tech_2.tech_name = 'CSS'

group by (  fr.id,
		    fr.first_name || ' ' || fr.last_name,
			fr.specialization,
		  	fr.email,
			tech.tech_name,
			tech_2.tech_name)

having (count(pd.id) >= 3)
order by full_name
;



-- 4. Получить информацию обо всех фрилансерах и количестве сообщений, отправленных ими на протяжении
-- последних трех месяцев (даты должны определяться автоматически, в зависимости от момента выполнения запроса).
--

create or replace function MY_CURR_DATE () returns date
as $$
    begin
        return '2023-03-01 23:59:59-00'::date;
    end;
$$ language plpgsql;



select
	fr.first_name || ' ' || fr.last_name as full_name,
	count(fr.id) as messages_sent,
	fr.email,
	fr.specialization,
	mess.date_time as when_sent,
	mess.text_message

from freelancer as fr
inner join message_ mess on fr.id = mess.freelancer_id
inner join message_ mess_2 on fr.id = mess_2.freelancer_id

    where age(MY_CURR_DATE(), mess.date_time)::interval < '3 month'::interval
      and  MY_CURR_DATE() > mess.date_time
	  and  mess.is_from_customer = false
	  and  mess_2.is_from_customer = false

group by (fr.id,
		  fr.first_name || ' ' || fr.last_name,
		  fr.email,
		  fr.specialization,
		  mess.date_time,
		  mess.text_message
		 )
order by fr.id, when_sent;




--
-- 5. По каждому заказчику получить информацию о средней стоимости успешно выполненных для него работ.
--

select
	c1.first_name || ' ' || c1.last_name as customer_name,
	c1.organisation_name,
	avg(price::numeric)::money,
	count(c1.id) as projects_done

from customer as c1
inner join new_job as nj_1 on nj_1.customer_id = c1.id
inner join project_done as pd on pd.job_id = nj_1.id

group by (c1.id,
		  c1.first_name || ' ' || c1.last_name,
		  c1.organisation_name
		 )
order by projects_done desc
;





--
-- 6. Получить информацию о трех самых дорогих работах, дедлайн для которых наступит на протяжении следующего месяца.
--

create or replace function MY_CURR_DATE () returns date
as $$
    begin
        return '2023-01-01 23:59:59-00'::date;
    end;
$$ language plpgsql;


SELECT
       posted,
       deadline,
       price,
       customer_id,
       header_

FROM new_job
WHERE
    age(deadline, MY_CURR_DATE()) < '1 month'::INTERVAL
  AND
    deadline > MY_CURR_DATE()
ORDER BY price DESC
LIMIT 3;




-- 7.  Получить информацию об объявлениях, для которых дедлайн, установленный заказчиком,
-- наступает позже, чем дедлайн, установленный фрилансером.


select app.id, nj.deadline as customer_deadline,
       app.deadline as freelancer_deadline,
       nj.price as customer_price,
       app.price as freelancer_price,
       app.description,
       nj.header_ as job_header
from application as app
left join new_job as nj on nj.id = app.job_id
where app.deadline < nj.deadline;




-- 8. Получить информацию об объявлениях,
-- размещенных в течение последней недели одним и тем же заказчиком,
-- и имеющих стоимость, не превышающую заданную.

create or replace function MY_CURR_DATE () returns date
as $$
    begin
        return '2023-01-01 23:59:59-00'::date;
    end;
$$ language plpgsql;


select
	c1.first_name || ' ' || c1.last_name,
	count(nj_2.id) as jobs_posted,
	nj.posted,
	age( MY_CURR_DATE(), nj.posted) AS date_diff,
	nj.price,
	nj.header_

from new_job as nj
inner join customer as c1 on c1.id = nj.customer_id

inner join customer as c2 on c2.id = nj.customer_id
inner join new_job as nj_2 on nj_2.customer_id = c2.id

where nj.id <> nj_2.id
      and age(MY_CURR_DATE(), nj.posted)::INTERVAL  < '1 week'::INTERVAL
      AND nj.posted < MY_CURR_DATE()
      AND nj.price::NUMERIC < 400

group by (	c1.first_name || ' ' || c1.last_name,
	nj.posted,
	age( MY_CURR_DATE(), nj.posted),
	nj.price,
	nj.header_) having (count(c1.id) > 1)
;




-- 9. Получить список фрилансеров, имеющих одинаковые специализации,
-- в описании которых присутствуют слова «облачн(ый|ых|ое)» и «сервис(ы|ов)».

select
	fr.first_name || ' ' || fr.last_name,
	fr.specialization,
	count(fr.specialization) as same_specs,
	app.deadline,
	app.price,
	app.description

from freelancer as fr
inner join application as app on app.freelancer_id = fr.id

cross join freelancer as fr_2

where

	((app.description similar to '%облачн(ый|ых|ое)%')
	and (app.description similar to '%сервис(ы|ов|ах)%'))

	and fr_2.id <> fr.id and fr_2.specialization = fr.specialization

group by (
	fr.first_name || ' ' || fr.last_name,
	fr.specialization,
	app.deadline,
	app.price,
	app.description
)
order by fr.specialization
;




-- 10.  Получить информацию об объявлениях, по которым стоимость выполнения работы,
-- указанная заказчиком, отличается от стоимости выполнения работы, указанной фрилансером,
-- в меньшую сторону более чем на 10%.

--- Получим только те, где цена исполнителя больше цены заказчика на 10% и более
select new_job.id,
	   header_ as job_header,
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