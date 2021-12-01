--
-- 6. Получить информацию о трех самых дорогих работах, дедлайн для которых наступит на протяжении следующего месяца.


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