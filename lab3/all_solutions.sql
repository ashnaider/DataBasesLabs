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