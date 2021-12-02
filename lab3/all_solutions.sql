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



-- 2. Получить информацию о жалобах определенного типа,
-- поступивших от конкретного заказчика за последнюю неделю.

create or replace function MY_CURR_DATE () returns date
as $$
    begin
        return '2023-01-08 23:59:59-00'::date;
    end;
$$ language plpgsql;


select *
from customer
left join user_complaint uc on customer.id = uc.customer_id
where age(MY_CURR_DATE(), uc.date_time) < '7 day'::interval
    and MY_CURR_DATE() > uc.date_time
    and uc.is_from_customer = true
    and uc.complaint_type in (
                              'spam',
--                               'fraud',
                             'inappropriate_content'
                             )
;




--
-- 3. Получить информацию о фрилансерах (расположив их имена в алфавитном порядке),
-- которые владеют двумя указанными (по усмотрению студента) технологиями и успешно выполнили от 3 до 10 работ.

select distinct
    fr.first_name || ' ' || fr.last_name as full_name,
    fr.id,
    fr.email,
    fr.specialization,
    job_done
    ,
    tech_t_first.t_name,
    tech_t_second.t_name
from freelancer as fr
right join
(
        select count(*) as job_done, freelancer_id
        from project_done
        group by project_done.freelancer_id
        having count(freelancer_id) between 3 and 10
) as jobs_done on freelancer_id = fr.id

inner join
(
    select freelancer_id as fr_id, tech.tech_name as t_name from technology_stack as t_st
    left join technology as tech on tech.id = t_st.technology_id
    where tech.tech_name = 'HTML'
) as tech_t_first on tech_t_first.fr_id = fr.id

inner join
(
    select freelancer_id as fr_id, tech.tech_name as t_name from technology_stack as t_st
    left join technology as tech on tech.id = t_st.technology_id
    where tech.tech_name = 'CSS'
) as tech_t_second on tech_t_second.fr_id = fr.id
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
       b.freelancer_id,
       fr.specialization,
       fr_messages_count,
       message_.date_time,
       message_.text_message,
       new_job.description
from
     freelancer as fr
right join
(
    select count(*) as fr_messages_count, freelancer_id
    from message_
    where age(MY_CURR_DATE(), message_.date_time)::interval < '3 month'::interval
      and  MY_CURR_DATE() > message_.date_time
      and  message_.is_from_customer = false
    group by message_.freelancer_id

) as b on b.freelancer_id = fr.id

left join
    message_
on
    message_.freelancer_id = fr.id

left join
    new_job
on
    message_.job_id = new_job.id
where
      message_.is_from_customer = false
order by freelancer_id;



--
-- 5. По каждому заказчику получить информацию о средней стоимости успешно выполненных для него работ.
--

select
    customer.first_name,
    customer.id,
    customer.organisation_name,
    avg_price,
    jobs_done

from customer
         right join (
    select count(*) as jobs_done, avg(new_job.price::numeric)::money as avg_price, customer_id as cust_id
    from project_done
    left join new_job
        on project_done.job_id = new_job.id
    group by new_job.customer_id
) as avg_prices on customer.id = avg_prices.cust_id
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
       app.description
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


SELECT
       customer_id,
       first_name,
       count_cust_jobs,
       DENSE_RANK() OVER (ORDER BY nj.customer_id),
       posted::TIMESTAMP::DATE,
       MY_CURR_DATE() AS curr_date,
       age( MY_CURR_DATE(), posted) AS date_diff,
       header_,
       price,
       deadline

FROM new_job nj

RIGHT JOIN (
    SELECT
           c_2.id AS cust_id,
           count(*) AS count_cust_jobs

    FROM customer c_2
        INNER JOIN new_job nj_2
            ON c_2.id = nj_2.customer_id

    WHERE age(MY_CURR_DATE(), posted)::INTERVAL  < '1 month'::INTERVAL
      AND posted < MY_CURR_DATE()
      AND price::NUMERIC < 400

    GROUP BY c_2.id
) AS b
    ON nj.customer_id = b.cust_id

LEFT JOIN customer ON customer.id = nj.customer_id

WHERE age(MY_CURR_DATE(), posted)::INTERVAL  < '1 month'::INTERVAL
  AND posted < MY_CURR_DATE()
  AND price::NUMERIC < 400
  AND count_cust_jobs > 1
;



-- 9. Получить список фрилансеров, имеющих одинаковые специализации,
-- в описании которых присутствуют слова «облачн(ый|ых|ое)» и «сервис(ы|ов)».

SELECT fr_1.first_name,
       fr_1.specialization,
       DENSE_RANK() OVER (ORDER BY fr_1.specialization) AS dense_rank,
       fr_2.spec_count,
       app.description

FROM freelancer AS fr_1
INNER JOIN
(
    SELECT specialization, COUNT(*) AS spec_count
    FROM freelancer
	RIGHT JOIN application AS app ON app.freelancer_id = freelancer.id
          WHERE (app.description SIMILAR TO '%облачн(ый|ых|ое)%') AND
			  	(app.description SIMILAR TO '%сервис(ы|ов|ах)%')
    GROUP BY specialization
) fr_2
ON fr_1.specialization = fr_2.specialization

    RIGHT JOIN application AS app ON app.freelancer_id = fr_1.id
	WHERE (app.description SIMILAR TO '%облачн(ый|ых|ое)%') AND
	      (app.description SIMILAR TO '%сервис(ы|ов|ах)%') AND
	      spec_count > 1

ORDER BY dense_rank;





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