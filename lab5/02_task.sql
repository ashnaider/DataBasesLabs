-- 2. Составить хранимую процедуру для отображения информации о сообщениях,
-- которые соответствуют заданному фрилансеру (идентификатор фрилансера передавать как параметр).
-- При выводе данных отобразить ФИО фрилансера, ФИО заказчика, описание работы,
-- текст и дату/время написания сообщения.

drop function if exists GetFreelancerMessages(freelancer_id integer);

create or replace function GetFreelancerMessages (freelancer_id_param integer)
    returns table(freelancer_name text,
                  customer_name text,
                  message_text text,
                  date_time timestamp,
                  job_description varchar(650)
                 )
    AS $$
    BEGIN
        return query
            select
                   fr.first_name || ' ' || fr.last_name,
                   cust.first_name || ' ' || cust.last_name,
                   mess.text_message,
                   mess.date_time,
                   nj.description

            from freelancer as fr
            inner join message_ as mess on mess.freelancer_id = fr.id
            inner join new_job as nj on nj.id = mess.job_id
            inner join customer as cust on cust.id = nj.customer_id
            where mess.is_from_customer = false
              and fr.id = freelancer_id_param
            order by mess.date_time
        ;

    END;
    $$ language plpgsql;


select * from GetFreelancerMessages(3);

select * from GetFreelancerMessages(4);

select * from GetFreelancerMessages(7);

select * from GetFreelancerMessages(10);

select * from GetFreelancerMessages(11);