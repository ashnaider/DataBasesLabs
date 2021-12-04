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

inner join
    message_
on
    message_.freelancer_id = fr.id

inner join
    new_job
on
    message_.job_id = new_job.id
where
      message_.is_from_customer = false
order by freelancer_id;

