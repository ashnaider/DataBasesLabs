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

