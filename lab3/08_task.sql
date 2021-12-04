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




-- 8. Получить информацию об объявлениях,
-- размещенных в течение последней недели одним и тем же заказчиком,
-- и имеющих стоимость, не превышающую заданную.

-- optimal price = 400


-- select header_, price, description from new_job where price::numeric < 400;



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

inner JOIN (
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

