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

