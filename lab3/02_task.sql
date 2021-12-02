-- 2. Получить информацию о жалобах определенного типа,
-- поступивших от конкретного заказчика за последнюю неделю.

create or replace function MY_CURR_DATE () returns date
as $$
    begin
        return '2023-01-01 23:59:59-00'::date;
    end;
$$ language plpgsql;


select *
from