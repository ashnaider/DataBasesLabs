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



select
       customer.id as customer_id,
       first_name,
       posted::timestamp::date,
       MY_CURR_DATE() as curr_date,
       age( MY_CURR_DATE(), posted) as date_diff,
       header_,
       price,
       deadline
from
customer inner join new_job on customer.id = new_job.customer_id
where age(MY_CURR_DATE(), posted)::interval  < '1 month'::interval
  and posted < MY_CURR_DATE()
  and price::numeric < 400
;
